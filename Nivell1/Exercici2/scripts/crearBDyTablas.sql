USE pizzeria;

CREATE TABLE IF NOT EXISTS `pizzeria`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `postalCode` INT(5) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `province` VARCHAR(45) NOT NULL,
  `phone` INT(9) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria`.`shop` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria`.`productCategory` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `typeOfProduct` VARCHAR(45) NOT NULL,
  `unitPrize` FLOAT NOT NULL,
  `id_productCategory` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_productCategory_idx` (`id_productCategory` ASC) VISIBLE,
  CONSTRAINT `id_productCategory`
    FOREIGN KEY (`id_productCategory`)
    REFERENCES `pizzeria`.`productCategory` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria`.`employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fullName` VARCHAR(45) NOT NULL,
  `nif` VARCHAR(45) NOT NULL,
  `phoneNumber` INT(9) NOT NULL,
  `duty` VARCHAR(45) NOT NULL,
  `id_shop` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_shop_idx` (`id_shop` ASC) VISIBLE,
  CONSTRAINT `id_shop`
    FOREIGN KEY (`id_shop`)
    REFERENCES `pizzeria`.`shop` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria`.`delivery` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date_time` DATETIME NOT NULL,
  `id_employee` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_employee_idx` (`id_employee` ASC) VISIBLE,
  CONSTRAINT `id_employee`
    FOREIGN KEY (`id_employee`)
    REFERENCES `pizzeria`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date_time` DATETIME NOT NULL,
  `orderType` VARCHAR(45) NOT NULL,
  `shop_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  `id_delivery` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_shop_idx` (`shop_id` ASC) VISIBLE,
  INDEX `id_employee_idx` (`employee_id` ASC) VISIBLE,
  INDEX `id_delivery_idx` (`id_delivery` ASC) VISIBLE,
  CONSTRAINT `shop_id`
    FOREIGN KEY (`shop_id`)
    REFERENCES `pizzeria`.`shop` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `employee_id`
    FOREIGN KEY (`employee_id`)
    REFERENCES `pizzeria`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_delivery`
    FOREIGN KEY (`id_delivery`)
    REFERENCES `pizzeria`.`delivery` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria`.`orderDetails` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `subtotal` FLOAT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `order_id_idx` (`order_id` ASC) VISIBLE,
  INDEX `product_id_idx` (`product_id` ASC) VISIBLE,
  INDEX `customer_id_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `pizzeria`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `pizzeria`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `pizzeria`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;