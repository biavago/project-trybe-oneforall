SELECT 
    ar.artista AS artista,
    al.album AS album
FROM
    artistas AS ar
    INNER JOIN albuns AS al ON al.artista_id = ar.artista_id 
        WHERE ar.artista = "Elis Regina"
GROUP BY 
    artista,
    album;