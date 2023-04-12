SELECT 
	COUNT(*) AS musicas_no_historico
FROM 
	pessoas_usuarias AS users
    JOIN historico AS h ON users.pessoa_usuaria_id = h.pessoa_usuaria_id
        WHERE users.nome_pessoa_usuaria = "Barbara Liskov";