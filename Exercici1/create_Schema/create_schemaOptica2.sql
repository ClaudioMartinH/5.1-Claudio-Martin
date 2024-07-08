CREATE TABLE IF NOT EXISTS `OpticaCulAmpolla`.`supplier` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `phone` INT(9) NOT NULL,
  `fax` INT(9) NOT NULL,
  `nif` VARCHAR(45) NOT NULL,
  `brand` VARCHAR(45) NOT NULL,
  `address_Id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `address_id`
    FOREIGN KEY (`id`)
    REFERENCES `OpticaCulAmpolla`.`address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `OpticaCulAmpolla`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `phone` INT(9) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `registerDate` DATE NOT NULL,
  `customerSentBy` INT NULL,
  `addressId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `addresId_idx` (`addressId` ASC) VISIBLE,
  INDEX `customerSentBy_idx` (`customerSentBy` ASC) VISIBLE,
  CONSTRAINT `addresId`
    FOREIGN KEY (`addressId`)
    REFERENCES `OpticaCulAmpolla`.`address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `customerSentBy`
    FOREIGN KEY (`customerSentBy`)
    REFERENCES `OpticaCulAmpolla`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;