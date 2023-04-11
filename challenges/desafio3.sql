SELECT
  users.nome_pessoa_usuaria AS pessoa_usuaria,
  COUNT(historico.cancoes_id) AS musicas_ouvidas,
  ROUND(SUM(cancoes.duracao_segundos) / 60, 2) AS total_minutos
FROM
  users
  JOIN historico ON users.pessoa_usuaria_id = historico.pessoa_usuaria_id
  JOIN cancoes ON historico.cancoes_id = cancoes.cancoes_id
GROUP BY
  pessoa_usuaria
ORDER BY
  pessoa_usuaria ASC