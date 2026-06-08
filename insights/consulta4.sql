SELECT
    t.ano,
    o.classificacao_ocorrencia,
    COUNT(*) AS qtd_acidentes,
    SUM(f.quantidade_vitimas) AS total_vitimas
FROM fato_acidente f
JOIN dim_tempo t USING(sk_tempo)
JOIN dim_ocorrencia o USING(sk_ocorrencia)
GROUP BY
    t.ano,
    o.classificacao_ocorrencia
ORDER BY
    t.ano,
    qtd_acidentes DESC;