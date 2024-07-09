CREATE DATABASE IF NOT EXISTS OpticaCulAmpolla;

USE OpticaCulAmpolla;

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
  `type` ENUM("Pasta", "Metalica", "Flotant") NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `OpticaCulAmpolla`.`employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `OpticaCulAmpolla`.`supplier` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `phone` INT(9) NOT NULL,
  `fax` INT(9) NOT NULL,
  `nif` VARCHAR(45) NOT NULL,
  `brand` VARCHAR(45) NOT NULL,
  `address_id` INT NOT NULL,
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
  CONSTRAINT `addressId`
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

CREATE TABLE IF NOT EXISTS `OpticaCulAmpolla`.`brand` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `supplierId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `supplier_id_idx` (`supplierId` ASC) VISIBLE,
  CONSTRAINT `supplier_id`
    FOREIGN KEY (`supplierId`)
    REFERENCES `OpticaCulAmpolla`.`supplier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `OpticaCulAmpolla`.`glasses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `prize` FLOAT NOT NULL,
  `glassesColor` VARCHAR(45) NOT NULL,
  `prescriptionL` FLOAT NOT NULL,
  `prescriptionR` FLOAT NOT NULL,
  `supplierId` INT NOT NULL,
  `frameId` INT NOT NULL,
  `brandId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `supplierId_idx` (`supplierId` ASC) VISIBLE,
  INDEX `frameId_idx` (`frameId` ASC) VISIBLE,
  INDEX `brandId_idx` (`brandId` ASC) VISIBLE,
  CONSTRAINT `supplierId`
    FOREIGN KEY (`supplierId`)
    REFERENCES `OpticaCulAmpolla`.`supplier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `frameId`
    FOREIGN KEY (`frameId`)
    REFERENCES `OpticaCulAmpolla`.`frame` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `brandId`
    FOREIGN KEY (`brandId`)
    REFERENCES `OpticaCulAmpolla`.`brand` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `OpticaCulAmpolla`.`transaction` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `prize` FLOAT NOT NULL,
  `glassesId` INT NOT NULL,
  `customerId` INT NOT NULL,
  `employeeId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `glassesId_idx` (`glassesId` ASC) VISIBLE,
  INDEX `customerId_idx` (`customerId` ASC) VISIBLE,
  INDEX `employeeId_idx` (`employeeId` ASC) VISIBLE,
  CONSTRAINT `glassesId`
    FOREIGN KEY (`glassesId`)
    REFERENCES `OpticaCulAmpolla`.`glasses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `customerId`
    FOREIGN KEY (`customerId`)
    REFERENCES `OpticaCulAmpolla`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `employeeId`
    FOREIGN KEY (`employeeId`)
    REFERENCES `OpticaCulAmpolla`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;