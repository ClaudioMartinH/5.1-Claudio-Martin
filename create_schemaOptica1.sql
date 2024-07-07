CREATE SCHEMA opticaCulAmpolla;

CREATE TABLE IF NOT EXISTS `OpticaCulAmpolla`.`address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NOT NULL,
  `number` INT NOT NULL,
  `floor` INT NOT NULL,
  `door` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `postalCode` INT(10) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `OpticaCulAmpolla`.`frame` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;