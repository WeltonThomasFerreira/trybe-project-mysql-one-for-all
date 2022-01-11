SELECT 
    `name` AS usuario,
    COUNT(DISTINCT h.track) AS qtde_musicas_ouvidas,
    ROUND(SUM(t.duration / 60), 2) AS total_minutos
FROM
    SpotifyClone.users AS u
        INNER JOIN
    SpotifyClone.`history` AS h ON h.`user` = u.id
        INNER JOIN
    SpotifyClone.tracks AS t ON h.track = t.id
GROUP BY usuario
ORDER BY usuario ASC;