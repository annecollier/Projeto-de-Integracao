SELECT
    t.dia_semana, -- Dia da semana em que ocorreu o acidente e se foi em um fim de semana ou não
    t.fim_de_semana,
    COUNT(*) AS qtd_acidentes, -- Quantidade total de acidentes
    SUM(f.quantidade_vitimas) AS total_vitimas, -- Total de vítimas envolvidas nos acidentes
    ROUND(AVG(f.quantidade_vitimas), 2) AS media_vitimas_por_acidente -- Média de vítimas por acidente, arredondada para 2 casas decimais
FROM fato_acidente f
JOIN dim_tempo t USING(sk_tempo) -- Junção com a dimensão de tempo para obter o dia da semana e se foi em um fim de semana ou não
GROUP BY    --agrupamento por dia da semana e se foi em um fim de semana ou não
    t.dia_semana,
    t.fim_de_semana
ORDER BY
    qtd_acidentes DESC; -- ordenação por quantidade de acidentes em ordem decrescente

--consulta para obter a quantidade de acidentes, total de vítimas e média de vítimas por acidente, agrupados por dia da semana e se foi em um fim de semana ou não. O resultado é ordenado por quantidade de acidentes em ordem decrescente.