SELECT
	a.artist AS artistas,
    album,
    COUNT(follow.artista_id) AS pessoas_seguidoras
FROM 
	albuns AS alb
    JOIN artistas AS a ON alb.artist_id = a.artista_id
    JOIN seguindo AS follow ON follow.artista_id = art.artista_id
GROUP BY 
  a.artista_id,
  albuns
ORDER BY
  albuns ASC,
  artistas ASC,
  pessoas_seguidoras DESC;