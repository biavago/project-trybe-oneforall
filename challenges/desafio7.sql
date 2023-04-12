SELECT 
    ar.artista AS artista,
    al.album AS album,
    COUNT(s.artista_id) AS pessoas_seguidoras
FROM
    artistas AS ar
    INNER JOIN albuns AS al ON al.artista_id = ar.artista_id
    INNER JOIN seguindo AS s ON ar.artista_id = s.artista_id
GROUP BY 
    artista, album
ORDER BY 
    pessoas_seguidoras DESC,
    artista ASC,
    album ASC;