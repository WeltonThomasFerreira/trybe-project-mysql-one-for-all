SELECT 
    `name` AS usuario,
    IF(MAX(YEAR(`history`.`date`) = 2021),
        'Usuário ativo',
        'Usuário inativo') AS condicao_usuario
FROM
    SpotifyClone.users AS users
        INNER JOIN
    SpotifyClone.history AS history ON history.user = users.id
GROUP BY usuario
ORDER BY usuario;