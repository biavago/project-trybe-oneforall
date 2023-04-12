SELECT 
    pessoas_usuarias.nome_pessoa_usuaria AS pessoa_usuaria,
    IF(
        MAX(YEAR(historico.data_reproducao)) >= 2021,
        'Ativa', 
        'Inativa'
    ) AS status_pessoa_usuaria
FROM
  pessoas_usuarias
    JOIN historico ON pessoas_usuarias.pessoa_usuaria_id = historico.pessoa_usuaria_id
GROUP BY
  pessoa_usuaria
ORDER BY
  pessoa_usuaria;