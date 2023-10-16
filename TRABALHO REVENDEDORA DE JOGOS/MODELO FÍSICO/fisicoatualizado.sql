-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema revendedora_jogos
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `revendedora_jogos`;
-- -----------------------------------------------------
-- Schema revendedora_jogos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `revendedora_jogos` DEFAULT CHARACTER SET utf8 ;
USE `revendedora_jogos` ;

-- -----------------------------------------------------
-- Table `revendedora_jogos`.`site`
-- -----------------------------------------------------
DROP TABLE IF EXISTS revendedora_jogos.site;
CREATE TABLE IF NOT EXISTS `revendedora_jogos`.`site` (
  `CNPJ` MEDIUMINT(14) UNSIGNED NOT NULL,
  `address` VARCHAR(50) NOT NULL,
  `trading_name` VARCHAR(30) NOT NULL,
  `company_name` VARCHAR(45) NOT NULL,
  `phone_number` MEDIUMINT(15) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CNPJ`),
  UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC) VISIBLE)
;


-- -----------------------------------------------------
-- Table `revendedora_jogos`.`person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS revendedora_jogos.person;
CREATE TABLE IF NOT EXISTS `revendedora_jogos`.`person` (
  `id_person` INT NOT NULL AUTO_INCREMENT,
  `phone_number` VARCHAR(15) NOT NULL,
  `name` VARCHAR(60) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `birth_date` DATE NOT NULL,
  `CNPJ` MEDIUMINT(14) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_person`),
  INDEX `fk_person_site_idx` (`CNPJ` ASC) VISIBLE,
  UNIQUE INDEX `id_person_UNIQUE` (`id_person` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  CONSTRAINT `fk_person_site`
    FOREIGN KEY (`CNPJ`)
    REFERENCES `revendedora_jogos`.`site` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `revendedora_jogos`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `revendedora_jogos`.`employee` (
  `id_employee` INT NOT NULL AUTO_INCREMENT,
  `salary` DECIMAL(8,2) NOT NULL,
  `role` VARCHAR(20) NOT NULL,
  `id_person` INT NOT NULL,
  PRIMARY KEY (`id_employee`),
  INDEX `fk_employee_person1_idx` (`id_person` ASC) VISIBLE,
  CONSTRAINT `fk_employee_person1`
    FOREIGN KEY (`id_person`)
    REFERENCES `revendedora_jogos`.`person` (`id_person`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `revendedora_jogos`.`game_genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `revendedora_jogos`.`game_genre` (
  `id_genre` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_genre`))
;


-- -----------------------------------------------------
-- Table `revendedora_jogos`.`midia`
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Table `revendedora_jogos`.`midia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `revendedora_jogos`.`midia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `audiovisual` BLOB NOT NULL,
  `product_id_product` INT NOT NULL,
  `site_CNPJ` MEDIUMINT(14) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `product_id_product`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_midia_product1_idx` (`product_id_product` ASC) VISIBLE,
  INDEX `fk_midia_site1_idx` (`site_CNPJ` ASC) VISIBLE,
  CONSTRAINT `fk_midia_product1`
    FOREIGN KEY (`product_id_product`)
    REFERENCES `revendedora_jogos`.`product` (`id_product`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_midia_site1`
    FOREIGN KEY (`site_CNPJ`)
    REFERENCES `revendedora_jogos`.`site` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `revendedora_jogos`.`product`
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Table `revendedora_jogos`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `revendedora_jogos`.`product` (
  `id_product` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `id_genre` INT NOT NULL,
  PRIMARY KEY (`id_product`),
  INDEX `fk_product_game_genre1_idx` (`id_genre` ASC) VISIBLE,
  CONSTRAINT `fk_product_game_genre1`
    FOREIGN KEY (`id_genre`)
    REFERENCES `revendedora_jogos`.`game_genre` (`id_genre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
;


-- -----------------------------------------------------
-- Table `revendedora_jogos`.`items_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `revendedora_jogos`.`items_order` (
  `id_order` INT NOT NULL,
  `id_items_order` INT NOT NULL,
  `product_value` DECIMAL(8,2) NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`id_items_order`, `id_order`),
  INDEX `id_order_idx` (`id_order` ASC) VISIBLE,
  INDEX `fk_items_order_product1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `id_order`
    FOREIGN KEY (`id_order`)
    REFERENCES `revendedora_jogos`.`order` (`id_order`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_items_order_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `revendedora_jogos`.`product` (`id_product`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `revendedora_jogos`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `revendedora_jogos`.`order` (
  `id_order` INT NOT NULL AUTO_INCREMENT,
  `date_order` DATETIME NOT NULL,
  `value` VARCHAR(45) NOT NULL,
  `id_client` INT NOT NULL,
  PRIMARY KEY (`id_order`),
  INDEX `fk_shopping_cart_order1_idx` (`id_client` ASC) VISIBLE,
  CONSTRAINT `fk_shopping_cart_order1`
    FOREIGN KEY (`id_client`)
    REFERENCES `revendedora_jogos`.`items_order` (`id_order`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `revendedora_jogos`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `revendedora_jogos`.`client` (
  `id_client` MEDIUMINT UNSIGNED NOT NULL,
  `username` VARCHAR(20) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `id_person` INT NOT NULL,
  `id_order` INT NOT NULL,
  PRIMARY KEY (`id_client`),
  INDEX `fk_client_person1_idx` (`id_person` ASC) VISIBLE,
  INDEX `fk_client_shopping_cart1_idx` (`id_order` ASC) VISIBLE,
  UNIQUE INDEX `id_client_UNIQUE` (`id_client` ASC) VISIBLE,
  CONSTRAINT `fk_client_person1`
    FOREIGN KEY (`id_person`)
    REFERENCES `revendedora_jogos`.`person` (`id_person`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shopping_cart1`
    FOREIGN KEY (`id_order`)
    REFERENCES `revendedora_jogos`.`order` (`id_order`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;



-- -----------------------------------------------------
-- Table `revendedora_jogos`.`bank_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `revendedora_jogos`.`bank_details` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `agency` INT NOT NULL,
  `account_num` INT NOT NULL,
  `payment_type` INT NOT NULL,
  `bank_name` VARCHAR(45) NOT NULL,
  `person_id_person` INT NOT NULL,
  UNIQUE INDEX `agency_UNIQUE` (`agency` ASC) VISIBLE,
  UNIQUE INDEX `account_num_UNIQUE` (`account_num` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_bank_details_person1_idx` (`person_id_person` ASC) VISIBLE,
  CONSTRAINT `fk_bank_details_person1`
    FOREIGN KEY (`person_id_person`)
    REFERENCES `revendedora_jogos`.`person` (`id_person`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `revendedora_jogos`.`payment_method`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `revendedora_jogos`.`payment_method` (
  `code` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `id_order` INT NOT NULL,
  INDEX `fk_payment_method_shopping_cart1_idx` (`id_order` ASC) VISIBLE,
  PRIMARY KEY (`code`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC) VISIBLE,
  CONSTRAINT `fk_payment_method_shopping_cart1`
    FOREIGN KEY (`id_order`)
    REFERENCES `revendedora_jogos`.`order` (`id_order`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `revendedora_jogos`.`payment_employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `revendedora_jogos`.`payment_employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `amount` DECIMAL(8,2) NOT NULL,
  `discount` DECIMAL(8,2) NOT NULL,
  `payday` DATE NOT NULL,
  `id_employee` INT NOT NULL,
  INDEX `fk_payment_employee_employee1_idx` (`id_employee` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_payment_employee_employee1`
    FOREIGN KEY (`id_employee`)
    REFERENCES `revendedora_jogos`.`employee` (`id_employee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;