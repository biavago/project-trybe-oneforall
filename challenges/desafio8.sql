SELECT
  "Elis Regina" AS artista,
  albuns
FROM
  albuns AS alb
  JOIN artista AS a ON a.artista_id = alb.artista_id
WHERE
  a.artista = "Elis Regina"
ORDER BY
  albuns ASC
LIMIT
  2;