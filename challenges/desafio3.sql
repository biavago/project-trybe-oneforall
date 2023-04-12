
SELECT
  pessoas_usuarias.nome_pessoa_usuaria AS pessoa_usuaria,
  COUNT(historico.cancao_id) AS musicas_ouvidas,
  ROUND(SUM(cancoes.duracao_segundos)/60, 2) AS total_minutos
FROM
  pessoas_usuarias
    JOIN historico ON pessoas_usuarias.pessoa_usuaria_id = historico.pessoa_usuaria_id
    JOIN cancoes ON historico.cancao_id = cancoes.cancao_id
GROUP BY
  pessoa_usuaria
ORDER BY
  pessoa_usuaria ASC;