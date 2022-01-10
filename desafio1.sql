DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plans` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  `price` DECIMAL(3,2) NOT NULL,
  PRIMARY KEY (`id`))
  ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`plans`
  (`id`, `type`, `price`)
VALUES
  (DEFAULT, 'gratuito', '0'),
  (DEFAULT, 'pessoal', '6.99'),
  (DEFAULT, 'familiar', '7.99'),
  (DEFAULT, 'universitario', '5.99');

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `age` TINYINT UNSIGNED NOT NULL,
  `plan` INT NOT NULL,
  `accession-date` DATE NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user_plan`
    FOREIGN KEY (`plan`)
    REFERENCES `SpotifyClone`.`plans` (`id`))
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`users`
  (`id`, `name`, `age`, `plan`, `accession-date`)
VALUES
  (DEFAULT, 'Thati', '23', '1', '2019-10-20'),
  (DEFAULT, 'Cintia', '35', '2', '2017-12-30'),
  (DEFAULT, 'Bill', '20', '3', '2019-06-05'),
  (DEFAULT, 'Roger', '45', '4', '2020-05-13'),
  (DEFAULT, 'Norman', '58', '5', '2017-02-17'),
  (DEFAULT, 'Patrick', '33', '6', '2017-01-06'),
  (DEFAULT, 'Vivian', '26', '7', '2018-01-05'),
  (DEFAULT, 'Carol', '19', '8', '2018-02-14'),
  (DEFAULT, 'Angelina', '42', '9', '2018-04-29'),
  (DEFAULT, 'Paul', '46', '10', '2017-01-17');
  
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artists` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`artists`
  (`id`, `name`)
VALUES
  (DEFAULT, 'Walter Phoenix'),
  (DEFAULT, 'Peter Strong'),
  (DEFAULT, 'Lance Day'),
  (DEFAULT, 'Freedie Shannon'),
  (DEFAULT, 'Tyler Isle'),
  (DEFAULT, 'Fog');

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albums` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `release-year` YEAR NOT NULL,
  `artist` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_album_artist`
    FOREIGN KEY (`artist`)
    REFERENCES `SpotifyClone`.`artists` (`id`))
ENGINE = InnoDB;

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

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`tracks` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `duration` SMALLINT UNSIGNED NOT NULL,
  `album` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_track_album`
    FOREIGN KEY (`album`)
    REFERENCES `SpotifyClone`.`albums` (`id`))
ENGINE = InnoDB;

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

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`follows` (
  `artist` INT NOT NULL,
  `user` INT NOT NULL,
  PRIMARY KEY (`user`, `artist`),
  CONSTRAINT `fk_follow_artist`
    FOREIGN KEY (`user`)
    REFERENCES `SpotifyClone`.`artists` (`id`),
  CONSTRAINT `fk_follow_user`
    FOREIGN KEY (`artist`)
    REFERENCES `SpotifyClone`.`users` (`id`))
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`follows`
  (`artist`, `user`)
VALUES
  ('1', '1'),
  ('3', '1'),
  ('4', '1'),
  ('1', '2'),
  ('3', '2'),
  ('1', '3'),
  ('2', '3'),
  ('4', '4'),
  ('5', '5'),
  ('6', '5'),
  ('1', '6'),
  ('3', '6'),
  ('6', '6'),
  ('2', '7'),
  ('6', '7'),
  ('1', '8'),
  ('5', '8'),
  ('3', '9'),
  ('4', '9'),
  ('6', '9'),
  ('2', '10'),
  ('6', '10');

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`history` (
  `track` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `user` INT NOT NULL,
  PRIMARY KEY (`track`, `user`),
  CONSTRAINT `fk_listening-history_track`
    FOREIGN KEY (`track`)
    REFERENCES `SpotifyClone`.`tracks` (`id`),
  CONSTRAINT `fk_listening-history_user`
    FOREIGN KEY (`user`)
    REFERENCES `SpotifyClone`.`users` (`id`))
ENGINE = InnoDB;
  
INSERT INTO `SpotifyClone`.`listening-history`
  (`track`, `date`, `user`)
VALUES
  ('36', '2020-02-28 10:45:55', '1'),
  ('25', '2020-05-02 05:30:35', '1'),
  ('23', '2020-03-06 11:22:33', '1'),
  ('14', '2020-08-05 08:05:17', '1'),
  ('15', '2020-09-14 16:32:22', '1'),
  ('34', '2020-01-02 07:40:33', '2'),
  ('24', '2020-05-16 06:16:22', '2'),
  ('21', '2020-10-09 12:27:48', '2'),
  ('39', '2020-09-21 13:14:46', '2'),
  ('6', '2020-11-13 16:55:13', '3'),
  ('3', '2020-12-05 18:38:30', '3'),
  ('26', '2020-07-30 10:00:00', '3'),
  ('2', '2021-08-15 17:10:10', '4'),
  ('35', '2021-07-10 15:20:30', '4'),
  ('27', '2021-01-09 01:44:33', '4'),
  ('7', '2020-07-03 19:33:28', '5'),
  ('12', '2017-02-24 21:14:22', '5'),
  ('21', '2020-08-06 15:23:43', '5'),
  ('14', '2020-11-10 13:52:27', '5'),
  ('5', '2019-02-07 20:33:48', '6'),
  ('4', '2017-01-24 00:31:17', '6'),
  ('11', '2017-10-12 12:35:20', '6'),
  ('39', '2018-03-21 16:56:40', '7'),
  ('40', '2020-10-18 13:38:05', '7'),
  ('32', '2019-05-25 08:14:03', '7'),
  ('33', '2021-08-15 21:37:09', '7'),
  ('7', '2020-07-03 19:33:28', '8'),
  ('12', '2017-02-24 21:14:22', '8'),
  ('21', '2020-08-06 15:23:43', '8'),
  ('14', '2020-11-10 13:52:27', '8'),
  ('16', '2021-05-24 17:23:45', '9'),
  ('17', '2018-12-07 22:48:52', '9'),
  ('8', '2021-03-14 06:14:26', '9'),
  ('9', '2020-04-01 03:36:00', '9'),
  ('20', '2017-02-06 08:21:34', '10'),
  ('21', '2017-12-04 05:33:43', '10'),
  ('12', '2017-07-27 05:24:49', '10'),
  ('13', '2017-12-25 01:03:57', '10');
  