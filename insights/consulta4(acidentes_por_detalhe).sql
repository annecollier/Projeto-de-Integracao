SELECT
    t.ano, -- Ano do acidente, classificação da ocorrência, quantidade de acidentes e total de vítimas
    o.classificacao_ocorrencia,
    COUNT(*) AS qtd_acidentes,
    SUM(f.quantidade_vitimas) AS total_vitimas
FROM fato_acidente f
JOIN dim_tempo t USING(sk_tempo) -- Junção com a dimensão de tempo para obter o ano do acidente
JOIN dim_ocorrencia o USING(sk_ocorrencia) -- Junção com a dimensão de ocorrência para obter a classificação
GROUP BY --agrupamento por ano e classificação da ocorrência
    t.ano,
    o.classificacao_ocorrencia
ORDER BY
    t.ano,
    qtd_acidentes DESC;

--consulta para obter a quantidade de acidentes e total de vítimas por ano e classificação da ocorrência. O resultado é ordenado por ano e quantidade de acidentes em ordem decrescente.