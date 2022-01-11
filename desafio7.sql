SELECT 
    artists.`name` AS artista,
    albums.title AS album,
    COUNT(`follows`.`user`) AS seguidores
FROM
    SpotifyClone.artists AS artists
        INNER JOIN
    SpotifyClone.albums AS albums ON albums.artist = artists.id
        INNER JOIN
    SpotifyClone.`follows` AS `follows` ON `follows`.artist = artists.id
GROUP BY artista , album
ORDER BY seguidores DESC , artista ASC , album ASC;