DROP DATABASE IF EXISTS revendedora_jogos;
CREATE DATABASE IF NOT EXISTS revendedora_jogos;
USE revendedora_jogos;

CREATE TABLE IF NOT EXISTS `revendedora_jogos`.`site` (
  `address` VARCHAR(50) NOT NULL,
  `CNPJ` VARCHAR(14) NOT NULL,
  `trading_name` VARCHAR(30) NOT NULL,
  `company_name` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`address`, `CNPJ`),
  UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC) VISIBLE);

CREATE TABLE IF NOT EXISTS `revendedora_jogos`.`person` (
  `phone_number` VARCHAR(11) NOT NULL,
  `id_person` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `site_address` VARCHAR(50) NOT NULL,
  `site_CNPJ` VARCHAR(14) NOT NULL,
  UNIQUE INDEX `phone_number_UNIQUE` (`phone_number` ASC) VISIBLE,
  PRIMARY KEY (`id_person`),
  INDEX `fk_person_site_idx` (`site_address` ASC, `site_CNPJ` ASC) VISIBLE,
  CONSTRAINT `fk_person_site`
    FOREIGN KEY (`site_address` , `site_CNPJ`)
    REFERENCES `revendedora_jogos`.`site` (`address` , `CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    CREATE TABLE IF NOT EXISTS `revendedora_jogos`.`product` (
  `name` VARCHAR(50) NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(200) NOT NULL,
  `genre` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
  );
  
CREATE TABLE IF NOT EXISTS `revendedora_jogos`.`order` (
  `idorder` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idorder`));
    
 CREATE TABLE IF NOT EXISTS `revendedora_jogos`.`shopping_cart` (
  `date_time` DATETIME NOT NULL,
  `id_cart` INT NOT NULL AUTO_INCREMENT,
  `value` VARCHAR(45) NOT NULL,
  `product_id` INT NOT NULL,
  `order_idorder` INT NOT NULL,
  PRIMARY KEY (`id_cart`),
  INDEX `fk_shopping_cart_product1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_shopping_cart_order1_idx` (`order_idorder` ASC) VISIBLE,
  CONSTRAINT `fk_shopping_cart_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `revendedora_jogos`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shopping_cart_order1`
    FOREIGN KEY (`order_idorder`)
    REFERENCES `revendedora_jogos`.`order` (`idorder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
     CREATE TABLE IF NOT EXISTS `revendedora_jogos`.`payment_method` (
  `code` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `shopping_cart_id_cart` INT NOT NULL,
  INDEX `fk_payment_method_shopping_cart1_idx` (`shopping_cart_id_cart` ASC) VISIBLE,
  CONSTRAINT `fk_payment_method_shopping_cart1`
    FOREIGN KEY (`shopping_cart_id_cart`)
    REFERENCES `revendedora_jogos`.`shopping_cart` (`id_cart`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
CREATE TABLE IF NOT EXISTS `revendedora_jogos`.`client` (
  `username` VARCHAR(20) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `id_client` INT NOT NULL AUTO_INCREMENT,
  `person_id_person` INT NOT NULL,
  `shopping_cart_id_cart` INT NOT NULL,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  PRIMARY KEY (`id_client`),
  UNIQUE INDEX `id_client_UNIQUE` (`id_client` ASC) VISIBLE,
  INDEX `fk_client_person1_idx` (`person_id_person` ASC) VISIBLE,
  INDEX `fk_client_shopping_cart1_idx` (`shopping_cart_id_cart` ASC) VISIBLE,
  CONSTRAINT `fk_client_person1`
    FOREIGN KEY (`person_id_person`)
    REFERENCES `revendedora_jogos`.`person` (`id_person`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_shopping_cart1`
    FOREIGN KEY (`shopping_cart_id_cart`)
    REFERENCES `revendedora_jogos`.`shopping_cart` (`id_cart`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    

CREATE TABLE IF NOT EXISTS `revendedora_jogos`.`midia` (
  `image` VARCHAR(150) NOT NULL,
  `videos` varchar(150) NOT NULL,
  `documents` varchar(150) NOT NULL,
  `site_address` VARCHAR(50) NOT NULL,
  `site_CNPJ` VARCHAR(14) NOT NULL,
  `product_id` INT NOT NULL,
  UNIQUE INDEX `documents_UNIQUE` (`documents` ASC) VISIBLE,
  INDEX `fk_midia_site1_idx` (`site_address` ASC, `site_CNPJ` ASC) VISIBLE,
  INDEX `fk_midia_product1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_midia_site1`
    FOREIGN KEY (`site_address` , `site_CNPJ`)
    REFERENCES `revendedora_jogos`.`site` (`address` , `CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_midia_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `revendedora_jogos`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );
    
    CREATE TABLE IF NOT EXISTS `revendedora_jogos`.`employee` (
  `salary` VARCHAR(10) NOT NULL,
  `id_employee` INT NOT NULL AUTO_INCREMENT,
  `person_id_person` INT NOT NULL,
  PRIMARY KEY (`id_employee`),
  INDEX `fk_employee_person1_idx` (`person_id_person` ASC) VISIBLE,
  CONSTRAINT `fk_employee_person1`
    FOREIGN KEY (`person_id_person`)
    REFERENCES `revendedora_jogos`.`person` (`id_person`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );
    
    CREATE TABLE IF NOT EXISTS `revendedora_jogos`.`payment_employee` (
  `date` DATETIME NOT NULL,
  `amount` VARCHAR(15) NOT NULL,
  `discount` VARCHAR(15) NOT NULL,
  `payday` DATE NOT NULL,
  `employee_id_employee` INT NOT NULL,
  INDEX `fk_payment_employee_employee1_idx` (`employee_id_employee` ASC) VISIBLE,
  CONSTRAINT `fk_payment_employee_employee1`
    FOREIGN KEY (`employee_id_employee`)
    REFERENCES `revendedora_jogos`.`employee` (`id_employee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );
    
    CREATE TABLE IF NOT EXISTS `revendedora_jogos`.`bank_details` (
  `agency` INT NOT NULL,
  `account_num` VARCHAR(15) NOT NULL,
  `payment_type` INT NOT NULL,
  `bank_name` VARCHAR(45) NOT NULL,
  `employee_id_employee` INT NOT NULL,
  UNIQUE INDEX `agency_UNIQUE` (`agency` ASC) VISIBLE,
  UNIQUE INDEX `account_num_UNIQUE` (`account_num` ASC) VISIBLE,
  INDEX `fk_bank_details_employee1_idx` (`employee_id_employee` ASC) VISIBLE,
  CONSTRAINT `fk_bank_details_employee1`
    FOREIGN KEY (`employee_id_employee`)
    REFERENCES `revendedora_jogos`.`employee` (`id_employee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );
    
    
    

    
    
    
    
    

