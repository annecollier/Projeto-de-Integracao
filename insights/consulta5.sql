SELECT
    o.classificacao_ocorrencia,
    v.tipo_veiculo,
    COUNT(*) AS qtd_acidentes,
    SUM(f.quantidade_vitimas) AS total_vitimas,
    ROUND(AVG(f.quantidade_vitimas), 2) AS media_vitimas_por_acidente
FROM fato_acidente f
JOIN dim_ocorrencia o USING(sk_ocorrencia)
JOIN dim_veiculo v USING(sk_veiculo)
GROUP BY
    o.classificacao_ocorrencia,
    v.tipo_veiculo
ORDER BY
    qtd_acidentes DESC;