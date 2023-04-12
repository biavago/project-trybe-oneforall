SELECT
	MIN(plano_valor) AS faturamento_minimo,
	MAX(plano_valor) AS faturamento_maximo,
	ROUND(AVG(plano_valor), 2) AS faturamento_medio,
	SUM(p.plano_valor) AS faturamento_total 
FROM 
	planos AS p
		INNER JOIN pessoas_usuarias AS users ON users.plano_id = p.plano_id;