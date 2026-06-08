SELECT
    t.dia_semana,
    t.fim_de_semana,
    COUNT(*) AS qtd_acidentes,
    SUM(f.quantidade_vitimas) AS total_vitimas,
    ROUND(AVG(f.quantidade_vitimas), 2) AS media_vitimas_por_acidente
FROM fato_acidente f
JOIN dim_tempo t USING(sk_tempo)
GROUP BY
    t.dia_semana,
    t.fim_de_semana
ORDER BY
    qtd_acidentes DESC;