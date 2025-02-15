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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Autor` (
  `Cod_Autor` INT NOT NULL AUTO_INCREMENT,
  `Nome_Autor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cod_Autor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Editora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Editora` (
  `Cod_Editora` INT NOT NULL,
  `Desc_Editora` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cod_Editora`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Livro` (
  `Cod_Livro` INT NOT NULL AUTO_INCREMENT,
  `Desc_Livro` VARCHAR(45) NOT NULL,
  `Autor_Cod_Autor` INT NOT NULL,
  `Editora_Cod_Editora` INT NOT NULL,
  PRIMARY KEY (`Cod_Livro`),
  INDEX `fk_Livro_Autor_idx` (`Autor_Cod_Autor` ASC) VISIBLE,
  INDEX `fk_Livro_Editora1_idx` (`Editora_Cod_Editora` ASC) VISIBLE,
  CONSTRAINT `fk_Livro_Autor`
    FOREIGN KEY (`Autor_Cod_Autor`)
    REFERENCES `mydb`.`Autor` (`Cod_Autor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Livro_Editora1`
    FOREIGN KEY (`Editora_Cod_Editora`)
    REFERENCES `mydb`.`Editora` (`Cod_Editora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
