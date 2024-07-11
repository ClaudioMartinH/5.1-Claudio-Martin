CREATE DATABASE IF NOT EXISTS spotify;
USE spotify;
CREATE TABLE IF NOT EXISTS `spotify`.`creditCard` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `number` VARCHAR(16) NOT NULL,
  `expireDate` VARCHAR(5) NOT NULL,
  `securityCode` INT(3) NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `spotify`.`paypal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `spotify`.`subscription` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `memberSince` DATE NOT NULL,
  `renewalDate` DATE NOT NULL,
  `payment` ENUM("Credit Card", "Paypal") NOT NULL,
  `card_id` INT NOT NULL,
  `paypal_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `card_id_idx` (`card_id` ASC) VISIBLE,
  INDEX `paypal_id_idx` (`paypal_id` ASC) VISIBLE,
  CONSTRAINT `card_id`
    FOREIGN KEY (`card_id`)
    REFERENCES `spotify`.`creditCard` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `paypal_id`
    FOREIGN KEY (`paypal_id`)
    REFERENCES `spotify`.`paypal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `spotify`.`playlist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `CreateDate` DATE NOT NULL,
  `song_count` INT NOT NULL DEFAULT 0,
  `playlist_song_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `spotify`.`genreMusic` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` ENUM("Pop", "Rock", "Classic", "Metal", "Salsa") NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `spotify`.`artist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `img` VARCHAR(45) NOT NULL,
  `genre_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `genre_id_idx` (`genre_id` ASC) VISIBLE,
  CONSTRAINT `genre_id`
    FOREIGN KEY (`genre_id`)
    REFERENCES `spotify`.`genreMusic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `spotify`.`album` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `year` YEAR NOT NULL,
  `coverImage` VARCHAR(45) NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `artist_id_idx` (`artist_id` ASC) VISIBLE,
  CONSTRAINT `artist_id`
    FOREIGN KEY (`artist_id`)
    REFERENCES `spotify`.`artist` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `spotify`.`song` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `length` TIME NOT NULL,
  `album_id` INT NOT NULL,
  `timesPlayed` INT(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `album_id_idx` (`album_id` ASC) VISIBLE,
  CONSTRAINT `album_id`
    FOREIGN KEY (`album_id`)
    REFERENCES `spotify`.`album` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `spotify`.`playlistSongs` (
  `playlist_id` INT NOT NULL,
  `song_id` INT NOT NULL,
  INDEX `playlist_id_idx` (`playlist_id` ASC) VISIBLE,
  INDEX `song_id_idx` (`song_id` ASC) VISIBLE,
  CONSTRAINT `playlist_id`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `spotify`.`playlist` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `song_id`
    FOREIGN KEY (`song_id`)
    REFERENCES `spotify`.`song` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `spotify`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `birthdate` DATE NOT NULL,
  `genre` ENUM("Female", "Male", "Other") NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `postalCode` INT(10) NOT NULL,
  `typeUser` ENUM("Free", "Premium") NOT NULL DEFAULT 'Free',
  `subscription_id` INT NULL,
  `playlist_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `subscription_id_idx` (`subscription_id` ASC) VISIBLE,
  CONSTRAINT `subscription_id`
    FOREIGN KEY (`subscription_id`)
    REFERENCES `spotify`.`subscription` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `spotify`.`favorites` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fav_song` INT NOT NULL,
  `fav_album` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fav_songs_idx` (`fav_song` ASC) VISIBLE,
  INDEX `fav_album_idx` (`fav_album` ASC) VISIBLE,
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fav_song`
    FOREIGN KEY (`fav_song`)
    REFERENCES `spotify`.`song` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fav_album`
    FOREIGN KEY (`fav_album`)
    REFERENCES `spotify`.`album` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `spotify`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;