SELECT 
    track.title AS cancao,
    COUNT(`history`.`track`) AS reproducoes
FROM
    SpotifyClone.`history` AS `history`
        INNER JOIN
    SpotifyClone.tracks AS track ON `history`.track = track.id
GROUP BY cancao
ORDER BY reproducoes DESC , cancao ASC
LIMIT 2;