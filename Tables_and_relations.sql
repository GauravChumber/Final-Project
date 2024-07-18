-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb3 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`customer_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customer_table` (
  `cus_id` INT NOT NULL,
  `cus_name` VARCHAR(45) NULL DEFAULT NULL,
  `visit_date` DATE NULL DEFAULT NULL,
  `ordered_pets` INT NULL DEFAULT NULL,
  PRIMARY KEY (`cus_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`trainer_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`trainer_table` (
  `trainer_id` INT NOT NULL,
  `trainer_name` VARCHAR(45) NULL DEFAULT NULL,
  `trainer_age` VARCHAR(45) NULL DEFAULT NULL,
  `trainer_joining_date` DATE NULL DEFAULT NULL,
  `trainer_fees` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`trainer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`pet_breed`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pet_breed` (
  `info_id` INT NOT NULL,
  `species` VARCHAR(40) NULL,
  `breed` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`info_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`product_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`product_table` (
  `product_id` INT NOT NULL,
  `product_name` VARCHAR(45) NULL DEFAULT NULL,
  `product_price` DECIMAL(20,0) NULL DEFAULT NULL,
  `product_stock` INT NULL DEFAULT NULL,
  `expire_date` DATE NULL DEFAULT NULL,
  `manufacture_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`pet_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pet_table` (
  `pet_id` INT NOT NULL,
  `pet_name` VARCHAR(45) NULL DEFAULT NULL,
  `age` INT NULL DEFAULT NULL,
  `stock` INT NULL DEFAULT NULL,
  `selling_price` DECIMAL(10,0) NULL DEFAULT NULL,
  `date_of_purchase` DATE NULL DEFAULT NULL,
  `trainer_table_trainer_id` INT NOT NULL,
  `pet_breed_info_id` INT NOT NULL,
  `product_table_product_id` INT NOT NULL,
  PRIMARY KEY (`pet_id`, `trainer_table_trainer_id`, `pet_breed_info_id`, `product_table_product_id`),
  INDEX `fk_pet_table_trainer_table_idx` (`trainer_table_trainer_id` ASC) VISIBLE,
  INDEX `fk_pet_table_pet_breed1_idx` (`pet_breed_info_id` ASC) VISIBLE,
  INDEX `fk_pet_table_product_table1_idx` (`product_table_product_id` ASC) VISIBLE,
  CONSTRAINT `fk_pet_table_trainer_table`
    FOREIGN KEY (`trainer_table_trainer_id`)
    REFERENCES `mydb`.`trainer_table` (`trainer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pet_table_pet_breed1`
    FOREIGN KEY (`pet_breed_info_id`)
    REFERENCES `mydb`.`pet_breed` (`info_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pet_table_product_table1`
    FOREIGN KEY (`product_table_product_id`)
    REFERENCES `mydb`.`product_table` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`health_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`health_table` (
  `report_id` INT NOT NULL,
  `health_report` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`report_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`doctor_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`doctor_table` (
  `doctor_id` INT NOT NULL,
  `doctor_name` VARCHAR(45) NULL DEFAULT NULL,
  `primary_contact` VARCHAR(20) NULL DEFAULT NULL,
  `secondary_contact` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `pet_table_pet_id` INT NOT NULL,
  `pet_table_trainer_table_trainer_id` INT NOT NULL,
  `pet_table_pet_breed_info_id` INT NOT NULL,
  `health_table_report_id` INT NOT NULL,
  PRIMARY KEY (`doctor_id`, `pet_table_pet_id`, `pet_table_trainer_table_trainer_id`, `pet_table_pet_breed_info_id`, `health_table_report_id`),
  INDEX `fk_doctor_table_pet_table1_idx` (`pet_table_pet_id` ASC, `pet_table_trainer_table_trainer_id` ASC, `pet_table_pet_breed_info_id` ASC) VISIBLE,
  INDEX `fk_doctor_table_health_table1_idx` (`health_table_report_id` ASC) VISIBLE,
  CONSTRAINT `fk_doctor_table_pet_table1`
    FOREIGN KEY (`pet_table_pet_id` , `pet_table_trainer_table_trainer_id` , `pet_table_pet_breed_info_id`)
    REFERENCES `mydb`.`pet_table` (`pet_id` , `trainer_table_trainer_id` , `pet_breed_info_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_doctor_table_health_table1`
    FOREIGN KEY (`health_table_report_id`)
    REFERENCES `mydb`.`health_table` (`report_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`location_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`location_table` (
  `city` VARCHAR(19) NOT NULL,
  `state` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`city`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`supplier_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`supplier_table` (
  `supplier_id` INT NOT NULL,
  `supplier_name` VARCHAR(45) NULL DEFAULT NULL,
  `received_pets` INT NULL DEFAULT NULL,
  `reviews` DECIMAL(5) NULL DEFAULT NULL,
  `sup_secondary_phone` VARCHAR(30) NULL DEFAULT NULL,
  `sup_primary_phone` VARCHAR(30) NULL DEFAULT NULL,
  `supplier_address` VARCHAR(45) NULL DEFAULT NULL,
  `location_table_city` VARCHAR(19) NOT NULL,
  PRIMARY KEY (`supplier_id`, `location_table_city`),
  INDEX `fk_supplier_table_location_table1_idx` (`location_table_city` ASC) VISIBLE,
  CONSTRAINT `fk_supplier_table_location_table1`
    FOREIGN KEY (`location_table_city`)
    REFERENCES `mydb`.`location_table` (`city`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`supplier_table_has_pet_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`supplier_table_has_pet_table` (
  `supplier_table_supplier_id` INT NOT NULL,
  `pet_table_pet_id` INT NOT NULL,
  `pet_table_trainer_table_trainer_id` INT NOT NULL,
  `pet_table_pet_breed_info_id` INT NOT NULL,
  PRIMARY KEY (`supplier_table_supplier_id`, `pet_table_pet_id`, `pet_table_trainer_table_trainer_id`, `pet_table_pet_breed_info_id`),
  INDEX `fk_supplier_table_has_pet_table_pet_table1_idx` (`pet_table_pet_id` ASC, `pet_table_trainer_table_trainer_id` ASC, `pet_table_pet_breed_info_id` ASC) VISIBLE,
  INDEX `fk_supplier_table_has_pet_table_supplier_table1_idx` (`supplier_table_supplier_id` ASC) VISIBLE,
  CONSTRAINT `fk_supplier_table_has_pet_table_supplier_table1`
    FOREIGN KEY (`supplier_table_supplier_id`)
    REFERENCES `mydb`.`supplier_table` (`supplier_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_supplier_table_has_pet_table_pet_table1`
    FOREIGN KEY (`pet_table_pet_id` , `pet_table_trainer_table_trainer_id` , `pet_table_pet_breed_info_id`)
    REFERENCES `mydb`.`pet_table` (`pet_id` , `trainer_table_trainer_id` , `pet_breed_info_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`customer_table_has_pet_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customer_table_has_pet_table` (
  `customer_table_cus_id` INT NOT NULL,
  `pet_table_pet_id` INT NOT NULL,
  `pet_table_trainer_table_trainer_id` INT NOT NULL,
  `pet_table_pet_breed_info_id` INT NOT NULL,
  `pet_table_product_table_product_id` INT NOT NULL,
  PRIMARY KEY (`customer_table_cus_id`, `pet_table_pet_id`, `pet_table_trainer_table_trainer_id`, `pet_table_pet_breed_info_id`, `pet_table_product_table_product_id`),
  INDEX `fk_customer_table_has_pet_table_pet_table1_idx` (`pet_table_pet_id` ASC, `pet_table_trainer_table_trainer_id` ASC, `pet_table_pet_breed_info_id` ASC, `pet_table_product_table_product_id` ASC) VISIBLE,
  INDEX `fk_customer_table_has_pet_table_customer_table1_idx` (`customer_table_cus_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_table_has_pet_table_customer_table1`
    FOREIGN KEY (`customer_table_cus_id`)
    REFERENCES `mydb`.`customer_table` (`cus_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_table_has_pet_table_pet_table1`
    FOREIGN KEY (`pet_table_pet_id` , `pet_table_trainer_table_trainer_id` , `pet_table_pet_breed_info_id` , `pet_table_product_table_product_id`)
    REFERENCES `mydb`.`pet_table` (`pet_id` , `trainer_table_trainer_id` , `pet_breed_info_id` , `product_table_product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
