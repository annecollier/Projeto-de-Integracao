import glob
import os
import geopandas as gpd
import pandas as pd

PASTA_GEOJSON = "./dados_geojson"
CAMINHO_CSV = "./Acidentes-2014.csv"

# Carrega e unifica os GeoJSONs
padrao_busca = os.path.join(PASTA_GEOJSON, "*.geojson")
arquivos_geojson = glob.glob(padrao_busca)

lista_gdfs = []
for arquivo in arquivos_geojson:
    gdf_temp = gpd.read_file(arquivo)
    lista_gdfs.append(gdf_temp)

gdf_geo = pd.concat(lista_gdfs, ignore_index=True)

# Carrega o CSV
df_csv = pd.read_csv(CAMINHO_CSV, sep=";")

gdf_geo["data_ajustada"] = pd.to_datetime(gdf_geo["data"], dayfirst=True, errors="coerce")
df_csv["data_ajustada"] = pd.to_datetime(df_csv["data"], errors="coerce")

gdf_geo["lon_check"] = pd.to_numeric(gdf_geo["longitude"]).round(4)
gdf_geo["lat_check"] = pd.to_numeric(gdf_geo["latitude"]).round(4)

df_csv["lon_check"] = pd.to_numeric(df_csv["longitude"]).round(4)
df_csv["lat_check"] = pd.to_numeric(df_csv["latitude"]).round(4)

print("Iniciando Auditoria (Data + Posição Geográfica)")

# Unimos as duas tabelas usando como chave de identificação: DATA + LON + LAT
validador = pd.merge(
    gdf_geo[["data_ajustada", "lon_check", "lat_check", "tipo"]],
    df_csv[["data_ajustada", "lon_check", "lat_check"]],
    on=["data_ajustada", "lon_check", "lat_check"],
    how="left",
    indicator=True
)

# Se o '_merge' der 'left_only', significa que o dado está no GeoJSON mas não está no CSV
dados_exclusivos_geojson = validador[validador["_merge"] == "left_only"]

print("-" * 60)
print(f"Total de registros nos arquivos GeoJSON: {len(gdf_geo)}")
print(f"Total de registros no arquivo CSV      : {len(df_csv)}")
print("-" * 60)

if dados_exclusivos_geojson.empty and len(gdf_geo) == len(df_csv):
    print("SUCESSO: Todos os dados e datas do GeoJSON estão no CSV")
    print("As duas bases são idênticas em volume, datas e locais")
else:
    print(f"Alerta: Existem {len(dados_exclusivos_geojson)} registros no GeoJSON que não foram achados no CSV nesta data/local.")
    if not dados_exclusivos_geojson.empty:
        dados_exclusivos_geojson.to_csv("conflitos_data_local.csv", index=False)
        print("Detalhes dos erros salvos em: 'conflitos_data_local.csv'")
