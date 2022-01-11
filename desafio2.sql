SELECT 
    COUNT(tra.id) AS cancoes,
    COUNT(DISTINCT art.id) AS artistas,
    COUNT(DISTINCT alb.id) AS albuns
FROM
    SpotifyClone.tracks AS tra
        INNER JOIN
    SpotifyClone.albums AS alb ON tra.album = alb.id
        INNER JOIN
    SpotifyClone.artists AS art ON alb.artist = art.id;
