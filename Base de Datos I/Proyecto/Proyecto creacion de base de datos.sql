-- MySQL Script generated by MySQL Workbench
-- Sat Dec  7 18:07:45 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`tbl_Domicilio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbl_Domicilio` (
  `id_Domicilio` INT NOT NULL AUTO_INCREMENT,
  `Departamento` VARCHAR(45) NULL,
  `Municipio` VARCHAR(45) NULL,
  `Barrio_Col` VARCHAR(45) NULL,
  `Num_Casa` VARCHAR(45) NULL,
  `Calle` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Domicilio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbl_Persona` (
  `id_Persona` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `DNI` VARCHAR(45) NULL,
  `No_Telefono` VARCHAR(45) NULL,
  `Correo_electronico` VARCHAR(45) NULL,
  `id_Domicilio` INT NOT NULL,
  PRIMARY KEY (`id_Persona`),
  CONSTRAINT `fk_tbl_Persona_tbl_Domicilio1`
    FOREIGN KEY (`id_Domicilio`)
    REFERENCES `mydb`.`tbl_Domicilio` (`id_Domicilio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_tbl_Persona_tbl_Domicilio1_idx` ON `mydb`.`tbl_Persona` (`id_Domicilio` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_TipoPersona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbl_TipoPersona` (
  `id_TipoPersona` INT NOT NULL AUTO_INCREMENT,
  `Tradente` VARCHAR(45) NULL,
  `Adquiriente` VARCHAR(45) NULL,
  `Rep_Legal_Adquiriente` VARCHAR(45) NULL,
  `Rep_Legal_Tradente` VARCHAR(45) NULL,
  `Gestor` VARCHAR(45) NULL,
  PRIMARY KEY (`id_TipoPersona`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`tbl_Marcas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbl_Marcas` (
  `id_Marcas` INT NOT NULL,
  `Marca` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Marcas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_modelos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbl_modelos` (
  `id_modelos` INT NOT NULL AUTO_INCREMENT,
  `Modelo` VARCHAR(45) NULL,
  `Tipo` VARCHAR(45) NULL,
  `Cilindraje` VARCHAR(45) NULL,
  `Combustible` VARCHAR(45) NULL,
  `id_Marcas` INT NOT NULL,
  PRIMARY KEY (`id_modelos`),
  CONSTRAINT `fk_tbl_modelos_tbl_Marcas1`
    FOREIGN KEY (`id_Marcas`)
    REFERENCES `mydb`.`tbl_Marcas` (`id_Marcas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_tbl_modelos_tbl_Marcas1_idx` ON `mydb`.`tbl_modelos` (`id_Marcas` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_Vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbl_Vehiculo` (
  `id_Vehiculo` INT NOT NULL AUTO_INCREMENT,
  `No_Placa` VARCHAR(45) NULL,
  `Anio` DATE NULL,
  `Color` VARCHAR(45) NULL,
  `No_VIN` VARCHAR(45) NULL,
  `No_Motor` VARCHAR(45) NULL,
  `Valor_Vehiculo` VARCHAR(45) NULL,
  `tbl_modelos_id_modelos` INT NOT NULL,
  PRIMARY KEY (`id_Vehiculo`),
  CONSTRAINT `fk_tbl_Vehiculo_tbl_modelos1`
    FOREIGN KEY (`tbl_modelos_id_modelos`)
    REFERENCES `mydb`.`tbl_modelos` (`id_modelos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_tbl_Vehiculo_tbl_modelos1_idx` ON `mydb`.`tbl_Vehiculo` (`tbl_modelos_id_modelos` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_Notario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbl_Notario` (
  `id_Notario` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `No_Exequatur` VARCHAR(45) NULL,
  `No_Certificado_autenticidad` VARCHAR(45) NULL,
  `No_Telefono` VARCHAR(45) NULL,
  `Correo_electronico` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Notario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_Anotaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbl_Anotaciones` (
  `id_Anotaciones` INT NOT NULL AUTO_INCREMENT,
  `Condiciones_especiales` VARCHAR(45) NULL,
  `Ciudad` VARCHAR(45) NULL,
  `Fecha` DATETIME NULL,
  PRIMARY KEY (`id_Anotaciones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_Solicitud`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbl_Solicitud` (
  `id_Solicitud` INT NOT NULL AUTO_INCREMENT,
  `Estado` VARCHAR(45) NULL,
  `Fecha` DATETIME NULL,
  `id_Vehiculo` INT NOT NULL,
  `id_Notario` INT NOT NULL,
  `id_Anotaciones` INT NOT NULL,
  PRIMARY KEY (`id_Solicitud`),
  CONSTRAINT `fk_tbl_Solicitud_tbl_Vehiculo1`
    FOREIGN KEY (`id_Vehiculo`)
    REFERENCES `mydb`.`tbl_Vehiculo` (`id_Vehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_Solicitud_tbl_Notario1`
    FOREIGN KEY (`id_Notario`)
    REFERENCES `mydb`.`tbl_Notario` (`id_Notario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_Solicitud_tbl_Anotaciones1`
    FOREIGN KEY (`id_Anotaciones`)
    REFERENCES `mydb`.`tbl_Anotaciones` (`id_Anotaciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_tbl_Solicitud_tbl_Vehiculo1_idx` ON `mydb`.`tbl_Solicitud` (`id_Vehiculo` ASC) VISIBLE;

CREATE INDEX `fk_tbl_Solicitud_tbl_Notario1_idx` ON `mydb`.`tbl_Solicitud` (`id_Notario` ASC) VISIBLE;

CREATE INDEX `fk_tbl_Solicitud_tbl_Anotaciones1_idx` ON `mydb`.`tbl_Solicitud` (`id_Anotaciones` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_Proceso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tbl_Proceso` (
  `id_Proceso` INT NOT NULL AUTO_INCREMENT,
  `id_Persona` INT NOT NULL,
  `id_TipoPersona` INT NOT NULL,
  `id_Solicitud` INT NOT NULL,
  PRIMARY KEY (`id_Proceso`),
  CONSTRAINT `fk_tbl_Proceso_tbl_Persona1`
    FOREIGN KEY (`id_Persona`)
    REFERENCES `mydb`.`tbl_Persona` (`id_Persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_Proceso_tbl_TipoPersona1`
    FOREIGN KEY (`id_TipoPersona`)
    REFERENCES `mydb`.`tbl_TipoPersona` (`id_TipoPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_Proceso_tbl_Solicitud1`
    FOREIGN KEY (`id_Solicitud`)
    REFERENCES `mydb`.`tbl_Solicitud` (`id_Solicitud`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_tbl_Proceso_tbl_Persona1_idx` ON `mydb`.`tbl_Proceso` (`id_Persona` ASC) VISIBLE;

CREATE INDEX `fk_tbl_Proceso_tbl_TipoPersona1_idx` ON `mydb`.`tbl_Proceso` (`id_TipoPersona` ASC) VISIBLE;

CREATE INDEX `fk_tbl_Proceso_tbl_Solicitud1_idx` ON `mydb`.`tbl_Proceso` (`id_Solicitud` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
