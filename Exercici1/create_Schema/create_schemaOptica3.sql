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