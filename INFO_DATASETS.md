# Arquivos presentes no Portal

---

### **Comparação Geral dos Formatos**

| Tipo de Arquivo | Estrutura de Dados | Principal Objetivo | Ferramentas Ideais para Abrir | 
| --- | --- | --- | --- | 
| **CSV** | Tabular (Linhas e Colunas) | Análise estatística, gráficos e consolidação de dados. | Excel, Google Sheets, Python (Pandas), R. |
| **GeoJSON** | Objeto/Texto (Pares e Chaves) | Representação de dados geográficos e mapeamento. | QGIS, ArcGIS, Google Earth, bibliotecas web (Leaflet). |
| **JSON** | Objeto/Texto (Pares e Chaves) | Armazenar metadados e comunicação entre sistemas web. | Editores de código (VS Code), Navegadores web. |
| **PDF** | Documento Estático | Leitura humana, preservação da formatação visual. | Adobe Acrobat, Navegadores web. |

Observação:
No contexto dos datasets os arquivos JSON foram usados para armazenar metadados de colunas utilizadas nos arquivos CSV e em "properties" nos GeoJSON. Informações de coordenadas aparecem tanto em "properties" quanto em "geometry" nos GeoJSON.

### **Acidentes de Trânsito com Vítimas 2014**

**Arquivos Gerais / Anuais:**

* **CSV** - Acidentes - 2014
* *Descrição:* Acidentes com Vítimas ocorridos no ano de 2014 a partir de março


* **PDF** - Dicionário de Dados dos Acidentes de Trânsito
* *Descrição:* Dicionário de Dados dos Acidentes de Trânsito


* **JSON** - Dicionário de Dados dos Acidentes de Trânsito
* *Descrição:* Dicionário de Dados dos Acidentes de Trânsito



**Arquivos por Mês:**

* **Março:** GeoJSON - Acidentes Março-2014
* **Abril:** GeoJSON - Acidentes Abril-2014
* **Maio:** GeoJSON - Acidentes Maio-2014
* **Junho:** GeoJSON - Acidentes Junho-2014
* **Julho:** GeoJSON - Acidentes Julho-2014
* **Agosto:** GeoJSON - Acidentes Agosto-2014
* **Setembro:** GeoJSON - Acidentes Setembro-2014
* **Outubro:** GeoJSON - Acidentes Outubro-2014
* **Novembro:** GeoJSON - Acidentes Novembro-2014 
* **Dezembro:** GeoJSON - Acidentes Dezembro-2014 
---

### **Acidentes de Trânsito com Vítimas 2015**

**Arquivos Gerais / Anuais:**

* **JSON** - Dicionário de Dados dos Acidentes de Trânsito
* *Descrição:* Dicionário de Dados dos Acidentes de Trânsito


* **CSV** - Acidentes com Vítimas ocorridos no ano de 2015
* *Descrição:* Acidentes com Vítimas ocorridos no ano de 2015. A partir do mês de junho...



**Arquivos por Mês:**

* **Janeiro:** GeoJSON - Acidentes Janeiro-2015
* **Fevereiro:** GeoJSON - Acidentes Fevereiro-2015
* **Março:** GeoJSON - Acidentes Março-2015
* **Abril:** CSV - Acidentes Abril -2015
* **Maio:** CSV - Acidentes Maio-2015 (**Nota:** a descrição deste arquivo repete "abril", provável erro de digitação no portal).

---

### **Acidentes de Trânsito com Vítimas 2016**

**Arquivos Gerais / Anuais:**

* **CSV** - Acidentes de Trânsito com Vítimas 2016
* *Descrição:* Registro contendo apenas os os acidentes que houve vítimas, ocorridos no ano...


* **JSON** - Metadados de Acidente de Trânsito com Vítimas
* *Descrição:* Metadados de Acidente de Trânsito com Vítimas


# Dicionário de Dados: Acidentes de Trânsito com Vítimas (Organizado por Ano)

---

## 📅 Ano de 2014 até maio de 2015

As colunas a seguir compõem exclusivamente ou em conjunto o banco de dados do ano de 2014.

### “tipo_acidente” ou “tipo”:
Descrição do “Metadados de Acidente de Trânsito com Vítimas”:
"Descritivo do Tipo de Acidente".

Tipo: “Char”. Tamanho: 250.

### “data_acidente” ou “data”:
Descrição do “Metadados de Acidente de Trânsito com Vítimas”:
"Data do Acidente".

Tipo: “Date”. Tamanho: 10. (Pode aceitar valores como "1/4/2014" com menos de 10 caracteres)

Formato: “DD/MM/YYYY” ou “MM/DD/YYYY” ou “YYYY-MM-DD” (string de tamanho 10 mas observar se o arquivo respeita isso) dependendo do arquivo.

###  “envolvido” ou “detalhes”:
Descrição do “Metadados de Acidente de Trânsito com Vítimas”:
"Descrição do tipo de envolvimento no acidente".

Tipo: “Char”. Tamanho: 250.

### “latitude”:
Descrição do “Metadados de Acidente de Trânsito com Vítimas”:
"Coordenadas geográfias em graus decimais - Latitude".

Tipo: “Num”. Tamanho: 20.

### “longitude”:
Descrição do “Metadados de Acidente de Trânsito com Vítimas”:
"Coordenadas geográfias em graus decimais - Longitude".

Tipo: “Num”. Tamanho: 20.

---

## 📆 Junho de 2015 a 2016

As colunas a seguir foram introduzidas e padronizadas para os registros dos anos de 2015 e 2016.

### “data_abertura”:
Descrição do “Metadados de Acidente de Trânsito com Vítimas”:
"Data do Acidente”.

Tipo: “Date”. Tamanho: 10.

Formato: “DD/MM/YYYY” ou “MM/DD/YYYY” ou “YYYY-MM-DD” (string de tamanho 10 mas observar se o arquivo respeita isso) dependendo do arquivo.

Observação:
Possivelmente representa uma estimativa de quando ocorreu o acidente e mais precisamente seja a data do registro oficial do acidente ou abertura da ocorrência.

### “hora_abertura”:
Descrição do “Metadados de Acidente de Trânsito com Vítimas”:
"Hora do Acidente".

Tipo: “Char”. Tamanho: 5.

Formato: “HH:MM” (string de tamanho 5).

Observação:
Possivelmente representa uma estimativa de quando ocorreu o acidente e mais precisamente seja a hora do registro oficial do acidente ou abertura da ocorrência.

### “bairro”:
Descrição do “Metadados de Acidente de Trânsito com Vítimas”:
"Bairro do acidente".

Tipo: “Char”. Tamanho: 50.

### “endereco”:
Descrição do “Metadados de Acidente de Trânsito com Vítimas”:
"Endereço do acidente".

Tipo: “Char”. Tamanho: 50.

### “complemento”:
Descrição do “Metadados de Acidente de Trânsito com Vítimas”:
"Complemento do acidente".

Tipo: “Char”. Tamanho: 50.

### “tipo_ocorrencia”:
Descrição do “Metadados de Acidente de Trânsito com Vítimas”:
"Tipo de Ocorrencia".

Tipo: “Char”. Tamanho: 50.

### “quantidade_vitimas”:
Descrição do “Metadados de Acidente de Trânsito com Vítimas”:
"Quantidade de vitimas".

Tipo: “Num”. Tamanho: 10.

Observação: contém os caracteres inválidos como F, f, -, e '''.

### “descricao”:
Descrição do “Metadados de Acidente de Trânsito com Vítimas”:
"Descrição do acidente".

Tipo: “Char”. Tamanho: 250.

### “tipo”:
Descrição do “Metadados de Acidente de Trânsito com Vítimas”:
"Tipo do acidente".

Tipo: “Char”. Tamanho: 20.

### “latitude”:
Descrição do “Metadados de Acidente de Trânsito com Vítimas”:
"Coordenadas geográfias em graus decimais - Latitude".

Tipo: “Num”. Tamanho: 20.

### “longitude”:
Descrição do “Metadados de Acidente de Trânsito com Vítimas”:
"Coordenadas geográfias em graus decimais - Longitude".

Tipo: “Num”. Tamanho: 20.

# Abordagem de desenvolvimento
O desenvolvidor deve identificar o mês e ano dos dados do arquivo, com essa base separar quais as colunas utilizadas e extrair os dados (seja o formato CSV ou GeoJSON). Após isso, tratar os dados: formatação, valores null, tipos incompatíveis, etc. Por fim, integrar esses dados em um Data Warehouse que padronize esses dados.