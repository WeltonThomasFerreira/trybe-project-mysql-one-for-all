SELECT 
    COUNT(`history`.track) AS quantidade_musicas_no_historico
FROM
    SpotifyClone.`history` AS `history`
        INNER JOIN
    SpotifyClone.users AS users ON users.id = `history`.`user`
WHERE
    users.`name` LIKE 'Bill';