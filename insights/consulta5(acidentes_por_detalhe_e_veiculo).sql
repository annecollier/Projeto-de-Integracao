SELECT -- Classificação da ocorrência, tipo de veículo envolvido, quantidade de acidentes, total de vítimas e média de vítimas por acidente
    o.classificacao_ocorrencia,
    v.tipo_veiculo,
    COUNT(*) AS qtd_acidentes,
    SUM(f.quantidade_vitimas) AS total_vitimas,
    ROUND(AVG(f.quantidade_vitimas), 2) AS media_vitimas_por_acidente
FROM fato_acidente f
JOIN dim_ocorrencia o USING(sk_ocorrencia) -- Junção com a dimensão de ocorrência para obter a classificação
JOIN dim_veiculo v USING(sk_veiculo) -- Junção com a dimensão de veículo para obter o tipo de veículo
GROUP BY --agrupamento por classificação da ocorrência e tipo de veículo
    o.classificacao_ocorrencia, 
    v.tipo_veiculo
ORDER BY
    qtd_acidentes DESC;
--consulta para obter a quantidade de acidentes, total de vítimas e média de vítimas por acidente, agrupados por classificação da ocorrência e tipo de veículo. O resultado é ordenado por quantidade de acidentes em ordem decrescente.