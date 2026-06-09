SELECT
    t.ano, -- Ano do acidente
    v.tipo_veiculo, -- Tipo de veículo envolvido no acidente
    COUNT(*) AS qtd_acidentes, -- Quantidade total de acidentes
    SUM(f.quantidade_vitimas) AS total_vitimas, -- Total de vítimas envolvidas nos acidentes
    ROUND(AVG(f.quantidade_vitimas), 2) AS media_vitimas_por_acidente -- Média de vítimas por acidente, arredondada para 2 casas decimais
FROM fato_acidente f
JOIN dim_tempo t USING(sk_tempo) -- Junção com a dimensão de tempo para obter o ano do acidente
JOIN dim_veiculo v USING(sk_veiculo) -- Junção com a dimensão de veículo para obter o tipo de veículo
GROUP BY --agrupamento por ano e tipo de veículo
    t.ano,
    v.tipo_veiculo
ORDER BY -- ordenação por ano e quantidade de acidentes em ordem decrescente
    t.ano,
    qtd_acidentes DESC;

--consulta para obter a quantidade de acidentes, total de vítimas e média de vítimas por acidente, agrupados por ano e tipo de veículo. O resultado é ordenado por ano e quantidade de acidentes em ordem decrescente.
--o nome do arquivo deve resumir