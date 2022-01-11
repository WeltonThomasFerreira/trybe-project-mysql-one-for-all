SELECT 
    artists.`name` AS artista, albums.title AS album
FROM
    SpotifyClone.albums AS albums
        INNER JOIN
    SpotifyClone.artists AS artists ON artists.id = albums.artist
WHERE
    artists.`name` LIKE 'Walter Phoenix';