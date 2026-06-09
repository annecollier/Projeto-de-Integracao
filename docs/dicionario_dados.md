## 📚 Dicionário de Dados

O modelo dimensional foi construído utilizando a abordagem *Star Schema* (Esquema Estrela), visando facilitar consultas analíticas, agregações e geração de indicadores relacionados aos acidentes de trânsito. O Data Warehouse é composto por uma tabela fato central e cinco tabelas dimensão.

---

### 1. Tabela Fato: `fato_acidente`
**Descrição:** Tabela central responsável por armazenar os registros consolidados dos acidentes de trânsito com vítimas e suas métricas quantitativas.
**Granularidade:** Cada registro representa uma ocorrência de acidente registrada nas bases integradas.

| Campo | Tipo | Chave | Descrição |
| :--- | :--- | :--- | :--- |
| `sk_acidente` | INT | **PK** | Identificador único da ocorrência. |
| `sk_tempo` | INT | **FK** | Referência à dimensão tempo. |
| `sk_local` | INT | **FK** | Referência à dimensão local. |
| `sk_tipo_acidente` | INT | **FK** | Referência à dimensão tipo de acidente. |
| `sk_ocorrencia` | INT | **FK** | Referência à dimensão ocorrência. |
| `sk_veiculo` | INT | **FK** | Referência à dimensão veículo. |
| `quantidade_vitimas` | INT | - | Quantidade de vítimas registradas na ocorrência. |
| `quantidade_veiculos` | INT | - | Quantidade de veículos envolvidos na ocorrência. |

---

### 2. Tabelas Dimensão

#### ⏳ `dim_tempo`
**Descrição:** Armazena atributos temporais relacionados ao momento em que o acidente ocorreu.

| Campo | Tipo | Chave | Descrição |
| :--- | :--- | :--- | :--- |
| `sk_tempo` | INT | **PK** | Identificador da dimensão tempo. |
| `data_acidente` | DATE | - | Data do acidente. |
| `ano` | INT | - | Ano da ocorrência (Ex: 2016). |
| `mes` | INT | - | Mês da ocorrência (Ex: 8). |
| `dia` | INT | - | Dia do mês (Ex: 20). |
| `hora_acidente` | TIME | - | Horário do acidente (Ex: 18:30). |
| `dia_semana` | VARCHAR | - | Dia da semana correspondente. |
| `fim_de_semana` | VARCHAR | - | Indicador de ocorrência em fim de semana (SIM/NAO). |

#### 📍 `dim_local`
**Descrição:** Armazena informações geográficas relacionadas ao local da ocorrência.

| Campo | Tipo | Chave | Descrição |
| :--- | :--- | :--- | :--- |
| `sk_local` | INT | **PK** | Identificador da localização. |
| `bairro` | VARCHAR | - | Bairro onde ocorreu o acidente (Ex: Boa Viagem). |
| `endereco` | VARCHAR | - | Endereço ou logradouro da ocorrência. |
| `latitude` | DECIMAL | - | Latitude geográfica. |
| `longitude` | DECIMAL | - | Longitude geográfica. |

#### 💥 `dim_tipo_acidente`
**Descrição:** Armazena informações relacionadas às causas e características específicas dos acidentes.

| Campo | Tipo | Chave | Descrição |
| :--- | :--- | :--- | :--- |
| `sk_tipo_acidente` | INT | **PK** | Identificador do tipo de acidente. |
| `causa_acidente` | VARCHAR | - | Causa principal associada ao acidente (Ex: Excesso de velocidade, Conversão irregular). |
| `descricao_detalhada` | VARCHAR | - | Descrição detalhada da ocorrência. |

#### 🚨 `dim_ocorrencia`
**Descrição:** Responsável pela classificação geral das ocorrências registradas.

| Campo | Tipo | Chave | Descrição |
| :--- | :--- | :--- | :--- |
| `sk_ocorrencia` | INT | **PK** | Identificador da ocorrência. |
| `tipo_ocorrencia` | VARCHAR | - | Tipo da ocorrência registrada (Ex: Colisão, Atropelamento). |
| `classificacao_ocorrencia` | VARCHAR | - | Categoria da ocorrência (Ex: Veicular, Pedestre). |

#### 🚗 `dim_veiculo`
**Descrição:** Armazena informações sobre os veículos envolvidos nos acidentes.

| Campo | Tipo | Chave | Descrição |
| :--- | :--- | :--- | :--- |
| `sk_veiculo` | INT | **PK** | Identificador do veículo. |
| `tipo_veiculo` | VARCHAR | - | Tipo de veículo envolvido (Ex: Automóvel, Motocicleta, Ônibus). |
| `categoria_veiculo` | VARCHAR | - | Categoria do veículo (Ex: Leve, Duas Rodas, Transporte Coletivo). |

---

### 🔗 Relacionamentos e Cardinalidade

O modelo dimensional segue a estrutura *Star Schema*, onde a tabela fato se relaciona diretamente com todas as dimensões. 

Todos os relacionamentos seguem a cardinalidade de **1:N** (1 registro na dimensão para N registros na tabela fato).

| Tabela Fato | Chave Estrangeira | Dimensão Relacionada |
| :--- | :--- | :--- |
| `fato_acidente` | `sk_tempo` | `dim_tempo` |
| `fato_acidente` | `sk_local` | `dim_local` |
| `fato_acidente` | `sk_tipo_acidente` | `dim_tipo_acidente` |
| `fato_acidente` | `sk_ocorrencia` | `dim_ocorrencia` |
| `fato_acidente` | `sk_veiculo` | `dim_veiculo` |

---

### 📝 Observações sobre a Integração dos Dados
Durante a análise dos datasets originais (2014, 2015 e 2016), foram identificadas diferenças estruturais severas. Informações presentes nas bases de 2015 e 2016 não estavam disponíveis em 2014. As etapas de pipeline foram responsáveis por:
* Padronização de nomes de colunas e conversão de tipos de dados.
* Tratamento de valores nulos e normalização de textos.
* Integração das bases históricas e geração das chaves substitutas (*Surrogate Keys*).
