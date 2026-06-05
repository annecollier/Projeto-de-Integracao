# Conclusão
 > Output
 ```
 Iniciando Auditoria (Data + Posição Geográfica)
 ------------------------------------------------------------
 Total de registros nos arquivos GeoJSON: 1739
 Total de registros no arquivo CSV      : 1734
 ------------------------------------------------------------
 Alerta: Existem 14 registros no GeoJSON que não foram achados no CSV nesta data/local.
 Detalhes dos erros salvos em: 'conflitos_data_local.csv'
 ```

Nove dos conflitos possuem correspondentes com ortografia corrigida no "Acidentes-2014.csv" como mostrado no "conflitos_data_local_analisado.csv".

A combinação dos GeoJSON possui 5 registros a mais que o CSV. Esses cinco sem correspondentes são anomalias em "dados_geojson/Acidentes Dezembro-2014.geojson" que aparecem como janeiro de 2014. Não está claro se esses dados são de fato de janeiro de 2014 ou janeiro de 2015, visto que não há outros registros de janeiro em 2014 e registros correspondentes de 2015 não foram encontrados.

Portanto, os únicos dados ausentes (não foram simplismente erro de digitação) do "Acidentes-2014.csv" são 5 anomalias ambíguas a respeito da data em que ocorreram.
