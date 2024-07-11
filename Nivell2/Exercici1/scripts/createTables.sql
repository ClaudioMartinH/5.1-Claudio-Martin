CREATE SCHEMA youtube;
use youtube;
CREATE TABLE IF NOT EXISTS `youtube`.`channel` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `datetimeCreated` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `youtube`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `birthdate` DATE NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `postalCode` INT(9) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube`.`video` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `sizeMB` INT(9) NOT NULL,
  `filename` VARCHAR(45) NOT NULL,
  `videolength` TIME NOT NULL,
  `thumbnail` VARCHAR(45) NOT NULL,
  `timesReproduced` INT NOT NULL DEFAULT 0,
  `videoState` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube`.`layers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `layername` VARCHAR(45) NOT NULL,
  `datetime` DATETIME NOT NULL,
  `userId` INT NOT NULL,
  `videoId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `userId_idx` (`userId` ASC) VISIBLE,
  INDEX `videoId_idx` (`videoId` ASC) VISIBLE,
  CONSTRAINT `userId`
    FOREIGN KEY (`userId`)
    REFERENCES `youtube`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `videoId`
    FOREIGN KEY (`videoId`)
    REFERENCES `youtube`.`video` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `youtube`.`playlist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `datetime` DATETIME NOT NULL,
  `playlistState` VARCHAR(45) NOT NULL,
  `idVideo` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `idVideo_idx` (`idVideo` ASC) VISIBLE,
  CONSTRAINT `idVideo`
    FOREIGN KEY (`idVideo`)
    REFERENCES `youtube`.`video` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `youtube`.`comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(255) NOT NULL,
  `datetime` DATETIME NOT NULL,
  `video_ID` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `videoID_idx` (`video_ID` ASC) VISIBLE,
  CONSTRAINT `video_ID`
    FOREIGN KEY (`video_ID`)
    REFERENCES `youtube`.`video` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube`.`reactions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `datetime` DATETIME NOT NULL,
  `idvideo` INT NULL,
  `comment_Id` INT NULL,
  `channel_Id` INT NULL,
  `user_Id` INT NOT NULL,
  `typeOfReaction` ENUM('Like', 'Dislike') NULL,
  PRIMARY KEY (`id`),
  INDEX `video_Id_idx` (`idvideo` ASC) VISIBLE,
  INDEX `comment_Id_idx` (`comment_Id` ASC) VISIBLE,
  INDEX `channel_Id_idx` (`channel_Id` ASC) VISIBLE,
  INDEX `user_Id_idx` (`user_Id` ASC) VISIBLE,
  CONSTRAINT `idvideo`
    FOREIGN KEY (`idvideo`)
    REFERENCES `youtube`.`video` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `comment_Id`
    FOREIGN KEY (`comment_Id`)
    REFERENCES `youtube`.`comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `channel_Id`
    FOREIGN KEY (`channel_Id`)
    REFERENCES `youtube`.`channel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_Id`
    FOREIGN KEY (`user_Id`)
    REFERENCES `youtube`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `youtube`.`user_has` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `video` INT NULL,
  `channel` INT NULL,
  `playlist` INT NULL,
  `comment` INT NULL,
  `reactions_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `video_idx` (`video` ASC) VISIBLE,
  INDEX `channel_idx` (`channel` ASC) VISIBLE,
  INDEX `playlist_idx` (`playlist` ASC) VISIBLE,
  INDEX `comment_idx` (`comment` ASC) VISIBLE,
  INDEX `reactions_idx` (`reactions_id` ASC) VISIBLE,
  CONSTRAINT `video`
    FOREIGN KEY (`video`)
    REFERENCES `youtube`.`video` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `channel`
    FOREIGN KEY (`channel`)
    REFERENCES `youtube`.`channel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `playlist`
    FOREIGN KEY (`playlist`)
    REFERENCES `youtube`.`playlist` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `comment`
    FOREIGN KEY (`comment`)
    REFERENCES `youtube`.`comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `reactions_id`
    FOREIGN KEY (`reactions_id`)
    REFERENCES `youtube`.`reactions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
