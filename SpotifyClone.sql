-- CRIAÇÃO DO SCHEMA
-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS SpotifyClone;

-- Criação da tabela de planos
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plans` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` ENUM('gratuito', 'pessoal', 'familiar', 'universitario') NOT NULL,
  `value` DECIMAL(3,2) NOT NULL,
  PRIMARY KEY (`id`))
  ENGINE = InnoDB;

-- Criação da tabela de assinaturas
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`subscriptions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `plan` INT NOT NULL,
  `accession-date` DATE NOT NULL,
  PRIMARY KEY (`id`, `plan`),
  CONSTRAINT `fk_subscriptions_plans`
    FOREIGN KEY (`plan`)
	REFERENCES `SpotifyClone`.`plans` (`id`))
ENGINE = InnoDB;

-- Criação da tabela de usuários
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `age` TINYINT UNSIGNED NOT NULL,
  `subscription` INT NOT NULL,
  `following` INT NULL,
  PRIMARY KEY (`id`, `subscription`),
  CONSTRAINT `fk_users_subscriptions`
    FOREIGN KEY (`subscription`)
    REFERENCES `SpotifyClone`.`subscriptions` (`id`))
ENGINE = InnoDB;
  
-- Criação da tabela de artistas
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artists` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `followers` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- Criação da tabela de álbuns
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albums` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `release-year` YEAR NOT NULL,
  `artist` INT NOT NULL,
  PRIMARY KEY (`id`, `artist`),
  CONSTRAINT `fk_albums_artists`
    FOREIGN KEY (`artist`)
    REFERENCES `SpotifyClone`.`artists` (`id`))
ENGINE = InnoDB;

-- Criação da tabela de músicas
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`tracks` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `duration` SMALLINT UNSIGNED NOT NULL,
  `album` INT NOT NULL,
  PRIMARY KEY (`id`, `album`),
  CONSTRAINT `fk_tracks_albums`
    FOREIGN KEY (`album`)
    REFERENCES `SpotifyClone`.`albums` (`id`))
ENGINE = InnoDB;

-- Criação da tabela de seguidores
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`follows` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `following` INT NOT NULL,
  `followers` INT NOT NULL,
  PRIMARY KEY (`id`, `followers`, `following`),
  CONSTRAINT `fk_follows_artists`
    FOREIGN KEY (`followers`)
    REFERENCES `SpotifyClone`.`artists` (`id`),
  CONSTRAINT `fk_follows_users`
    FOREIGN KEY (`following`)
    REFERENCES `SpotifyClone`.`users` (`id`))
ENGINE = InnoDB;

-- Criação da tabela de histórico de reporudções
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`listening-history` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `track` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `listener` INT NOT NULL,
  PRIMARY KEY (`id`, `track`, `listener`),
  CONSTRAINT `fk_listening-history_tracks`
    FOREIGN KEY (`track`)
    REFERENCES `SpotifyClone`.`tracks` (`id`),
  CONSTRAINT `fk_listening-history_users`
    FOREIGN KEY (`listener`)
    REFERENCES `SpotifyClone`.`users` (`id`))
ENGINE = InnoDB;

-- INSERÇÃO DE DADOS
-- Inserção de planos
INSERT INTO `SpotifyClone`.`plans`
  (`id`, `type`, `value`)
VALUES
  (DEFAULT, 'gratuito', '0'),
  (DEFAULT, 'pessoal', '6.99'),
  (DEFAULT, 'familiar', '7.99'),
  (DEFAULT, 'universitario', '5.99');
  
-- Inserção de assinaturas
INSERT INTO `SpotifyClone`.`subscriptions`
  (`id`, `plan`, `accession-date`)
VALUES
  (DEFAULT, '1', '2019-10-20'),
  (DEFAULT, '3', '2017-12-30'),
  (DEFAULT, '4', '2019-06-05'),
  (DEFAULT, '2', '2020-05-13'),
  (DEFAULT, '2', '2017-02-17'),
  (DEFAULT, '3', '2017-01-06'),
  (DEFAULT, '4', '2018-01-05'),
  (DEFAULT, '4', '2018-02-14'),
  (DEFAULT, '3', '2018-04-29'),
  (DEFAULT, '3', '2017-01-17');
  
  -- Inserção de usuários
INSERT INTO `SpotifyClone`.`users`
  (`id`, `name`, `age`, `subscription`, `following`)
VALUES
  (DEFAULT, 'Thati', '23', '1', '1'),
  (DEFAULT, 'Cintia', '35', '2', '2'),
  (DEFAULT, 'Bill', '20', '3', '3'),
  (DEFAULT, 'Roger', '45', '4', '4'),
  (DEFAULT, 'Norman', '58', '5', '5'),
  (DEFAULT, 'Patrick', '33', '6', '6'),
  (DEFAULT, 'Vivian', '26', '7', '7'),
  (DEFAULT, 'Carol', '19', '8', '8'),
  (DEFAULT, 'Angelina', '42', '9', '9'),
  (DEFAULT, 'Paul', '46', '10', '10');
  
-- Inserção de artistas
INSERT INTO `SpotifyClone`.`artists`
  (`id`, `name`, `followers`)
VALUES
  (DEFAULT, 'Walter Phoenix', '1'),
  (DEFAULT, 'Peter Strong', '2'),
  (DEFAULT, 'Lance Day', '3'),
  (DEFAULT, 'Freedie Shannon', '4'),
  (DEFAULT, 'Tyler Isle', '5'),
  (DEFAULT, 'Fog', '6');
  
  -- Inserção de álbuns
INSERT INTO `SpotifyClone`.`albums`
  (`id`, `title`, `release-year`, `artist`)
VALUES
  (DEFAULT, 'Envious', '1990', '1'),
  (DEFAULT, 'Exuberant', '1993', '1'),
  (DEFAULT, 'Hallowed Steam', '1995', '2'),
  (DEFAULT, 'Incadescent', '1998', '3'),
  (DEFAULT, 'Temporary Culture', '2001', '4'),
  (DEFAULT, 'Library of liberty', '2003', '4'),
  (DEFAULT, 'Chained Down', '2007', '5'),
  (DEFAULT, 'Cabinet of fools', '2012', '5'),
  (DEFAULT, 'No guarantees', '2015', '5'),
  (DEFAULT, 'Apparatus', '2015', '6');
  
    -- Inserção de músicas
INSERT INTO `SpotifyClone`.`tracks`
  (`id`, `title`, `duration`, `album`)
VALUES
 (DEFAULT, 'Soul For Us', '200', '1'),
 (DEFAULT, 'Reflections Of Magic', '163', '1'),
 (DEFAULT, 'Dance With Her Own', '116', '1'),
 (DEFAULT, 'Troubles Of My Inner Fire', '203', '2'),
 (DEFAULT, 'Time Fireworks', '152', '2'),
 (DEFAULT, 'Magic Circus', '105', '3'),
 (DEFAULT, 'Honey, So Do I', '207', '3'),
 (DEFAULT, "Sweetie, Let's Go wild", '139', '3'),
 (DEFAULT, 'She Knows', '244', '3'),
 (DEFAULT, 'Fantasy For Me', '100', '4'),
 (DEFAULT, 'Celebration Of More', '146', '4'),
 (DEFAULT, 'Rock His Everything', '223', '4'),
 (DEFAULT, 'Home Forever', '231', '4'),
 (DEFAULT, 'Diamond Power', '241', '4'),
 (DEFAULT, "Let's Be Silly", '132', '4'),
 (DEFAULT, 'Thang Of Thunder', '240', '5'),
 (DEFAULT, 'Words Of Her Life', '185', '5'),
 (DEFAULT, 'Without My Streets', '176', '5'),
 (DEFAULT, 'Need Of The Evening', '190', '6'),
 (DEFAULT, 'History Of My Roses', '222', '6'),
 (DEFAULT, 'Without My Love', '111', '6'),
 (DEFAULT, 'Walking And Game', '123', '6'),
 (DEFAULT, 'Young And Father', '197', '6'),
 (DEFAULT, 'Finding My Traditions', '179', '7'),
 (DEFAULT, 'Walking And Man', '229', '7'),
 (DEFAULT, 'Hard And Time', '135', '7'),
 (DEFAULT, "Honey, I'm A Lone Wolf", '150', '7'),
 (DEFAULT, "She Thinks I Won't Stay Tonight", '166', '8'),
 (DEFAULT, "He Heard You're Bad For Me", '154', '8'),
 (DEFAULT, "He Hopes We Can't Stay", '210', '8'),
 (DEFAULT, 'I Know I Know', '117', '8'),
 (DEFAULT, "He's Walking Away", '159', '9'),
 (DEFAULT, "He's Trouble", '138', '9'),
 (DEFAULT, 'I Heard I Want Toplans Bo Alone', '120', '9'),
 (DEFAULT, 'I Ride Alone', '151', '9'),
 (DEFAULT, 'Honey', '79', '10'),
 (DEFAULT, 'You Cheated On Me', '95', '10'),
 (DEFAULT, "Wouldn't It Be Nice", '213', '10'),
 (DEFAULT, 'Baby', '136', '10'),
 (DEFAULT, 'You Make Me Feel So..', '83', '10');
  
  -- Inserção de seguidores
-- INSERT INTO `SpotifyClone`.`follows`
--   (`id`, `following`, `followers`)
-- VALUES
--   (DEFAULT, '1', '1'),
--   (DEFAULT, '3', '1'),
--   (DEFAULT, '4', '1'),
--   (DEFAULT, '1', '2'),
--   (DEFAULT, '3', '2'),
--   (DEFAULT, '1', '3'),
--   (DEFAULT, '2', '3'),
--   (DEFAULT, '4', '4'),
--   (DEFAULT, '5', '5'),
--   (DEFAULT, '6', '5'),
--   (DEFAULT, '1', '6'),
--   (DEFAULT, '3', '6'),
--   (DEFAULT, '6', '6'),
--   (DEFAULT, '2', '7'),
--   (DEFAULT, '6', '7'),
--   (DEFAULT, '1', '8'),
--   (DEFAULT, '5', '8'),
--   (DEFAULT, '3', '9'),
--   (DEFAULT, '4', '9'),
--   (DEFAULT, '6', '9'),
--   (DEFAULT, '2', '10'),
--   (DEFAULT, '6', '10');
  
-- Inserção de histórico
INSERT INTO `SpotifyClone`.`listening-history`
  (`id`, `track`, `date`, `listener`)
VALUES
  (DEFAULT, '36', '2020-02-28 10:45:55', '1'),
  (DEFAULT, '25', '2020-05-02 05:30:35', '1'),
  (DEFAULT, '23', '2020-03-06 11:22:33', '1'),
  (DEFAULT, '14', '2020-08-05 08:05:17', '1'),
  (DEFAULT, '15', '2020-09-14 16:32:22', '1'),
  (DEFAULT, '34', '2020-01-02 07:40:33', '2'),
  (DEFAULT, '24', '2020-05-16 06:16:22', '2'),
  (DEFAULT, '21', '2020-10-09 12:27:48', '2'),
  (DEFAULT, '39', '2020-09-21 13:14:46', '2'),
  (DEFAULT, '6', '2020-11-13 16:55:13', '3'),
  (DEFAULT, '3', '2020-12-05 18:38:30', '3'),
  (DEFAULT, '26', '2020-07-30 10:00:00', '3'),
  (DEFAULT, '2', '2021-08-15 17:10:10', '4'),
  (DEFAULT, '35', '2021-07-10 15:20:30', '4'),
  (DEFAULT, '27', '2021-01-09 01:44:33', '4'),
  (DEFAULT, '7', '2020-07-03 19:33:28', '5'),
  (DEFAULT, '12', '2017-02-24 21:14:22', '5'),
  (DEFAULT, '21', '2020-08-06 15:23:43', '5'),
  (DEFAULT, '14', '2020-11-10 13:52:27', '5'),
  (DEFAULT, '5', '2019-02-07 20:33:48', '6'),
  (DEFAULT, '4', '2017-01-24 00:31:17', '6'),
  (DEFAULT, '11', '2017-10-12 12:35:20', '6'),
  (DEFAULT, '39', '2018-03-21 16:56:40', '7'),
  (DEFAULT, '40', '2020-10-18 13:38:05', '7'),
  (DEFAULT, '32', '2019-05-25 08:14:03', '7'),
  (DEFAULT, '33', '2021-08-15 21:37:09', '7'),
  (DEFAULT, '7', '2020-07-03 19:33:28', '8'),
  (DEFAULT, '12', '2017-02-24 21:14:22', '8'),
  (DEFAULT, '21', '2020-08-06 15:23:43', '8'),
  (DEFAULT, '14', '2020-11-10 13:52:27', '8'),
  (DEFAULT, '16', '2021-05-24 17:23:45', '9'),
  (DEFAULT, '17', '2018-12-07 22:48:52', '9'),
  (DEFAULT, '8', '2021-03-14 06:14:26', '9'),
  (DEFAULT, '9', '2020-04-01 03:36:00', '9'),
  (DEFAULT, '20', '2017-02-06 08:21:34', '10'),
  (DEFAULT, '21', '2017-12-04 05:33:43', '10'),
  (DEFAULT, '12', '2017-07-27 05:24:49', '10'),
  (DEFAULT, '13', '2017-12-25 01:03:57', '10');
  