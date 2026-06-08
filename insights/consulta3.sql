SELECT
    l.bairro,
    COUNT(*) AS qtd_acidentes,
    SUM(f.quantidade_vitimas) AS total_vitimas,
    ROUND(AVG(f.quantidade_vitimas), 2) AS media_vitimas_por_acidente
FROM fato_acidente f
JOIN dim_local l USING(sk_local)
WHERE l.bairro IS NOT NULL
  AND l.bairro <> 'NÃO INFORMADO'
GROUP BY
    l.bairro
ORDER BY
    qtd_acidentes DESC
LIMIT 15;