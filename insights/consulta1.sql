SELECT
    t.ano,
    v.tipo_veiculo,
    COUNT(*) AS qtd_acidentes,
    SUM(f.quantidade_vitimas) AS total_vitimas,
    ROUND(AVG(f.quantidade_vitimas), 2) AS media_vitimas_por_acidente
FROM fato_acidente f
JOIN dim_tempo t USING(sk_tempo)
JOIN dim_veiculo v USING(sk_veiculo)
GROUP BY
    t.ano,
    v.tipo_veiculo
ORDER BY
    t.ano,
    qtd_acidentes DESC;