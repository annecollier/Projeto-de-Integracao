# Projeto de Integração
# Tema: Acidentes de trânsito com vítima em Recife (2014-2016)
# Disciplina: Banco de Dados - CIN UFPE

-----

## 📂 Estrutura do Repositório

```
.
├── insights/                     # Arquivos SQL com as insights finais
├── pipelns/                      # Pipelines de ETL e ELT
│   └── data/                     # Dados brutos
│       ├── 2014/
|       ├── 2015/                
│       └── 2016/
├── transf_acidentes/             # Pipeline: Transformação
│   ├── models/
│   │   ├── base/                 # Integração dos dados brutos
│   │   └── core/                 # Dimensões e Fato
│   └── dbt_project.yml
├── CONTRIBUTING.md               # Padronização de contribuições e commits
├── INFO_DATASETS.md              # Estrutura dos datasets
└── README.md
```