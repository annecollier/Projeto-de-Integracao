SELECT
    l.bairro, -- Bairro onde ocorreu o acidente, quantidade de acidentes, total de vítimas e média de vitimas por acidete
    COUNT(*) AS qtd_acidentes,
    SUM(f.quantidade_vitimas) AS total_vitimas,
    ROUND(AVG(f.quantidade_vitimas), 2) AS media_vitimas_por_acidente
FROM fato_acidente f
JOIN dim_local l USING(sk_local) -- Junção com a dimensão de local para obter o bairro onde ocorreu o acidente
WHERE l.bairro IS NOT NULL -- Filtra para excluir registros onde o bairro é nulo/não informado
  AND l.bairro <> 'NÃO INFORMADO'
GROUP BY
    l.bairro -- Agrupamento por bairro
ORDER BY
    qtd_acidentes DESC;
LIMIT 15; --mostra os 15 primeiros

--consulta para obter a quantidade de acidentes, total de vítimas e média de vítimas por acidente, agrupados por bairro onde ocorreu o acidente. O resultado é ordenado por quantidade de acidentes em ordem decrescente e mostra os 15 primeiros bairros.