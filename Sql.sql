-- MySQL Script generated by MySQL Workbench
-- Mon Sep  6 04:45:53 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MyMuebleria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MyMuebleria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MyMuebleria` DEFAULT CHARACTER SET utf8 ;
USE `MyMuebleria` ;

-- -----------------------------------------------------
-- Table `MyMuebleria`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiMuebleria`.`Clientes` (
  `NIT` BIGINT(13) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Departamento` VARCHAR(20) NULL,
  `Municipio` VARCHAR(30) NULL,
  PRIMARY KEY (`NIT`),
  UNIQUE INDEX `NIT_UNIQUE` (`NIT` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MyMuebleria`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiMuebleria`.`Usuario` (
  `Nombre` VARCHAR(30) NOT NULL,
  `Contraseña` VARCHAR(15) NOT NULL,
  `Tipo` INT NOT NULL,
  PRIMARY KEY (`Nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MyMuebleria`.`Mueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiMuebleria`.`Mueble` (
  `Nombre` VARCHAR(30) NOT NULL,
  `Precio` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`Nombre`),
  UNIQUE INDEX `Nombre_UNIQUE` (`Nombre` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MyMuebleria`.`MuebleEnsamblado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiMuebleria`.`MuebleEnsamblado` (
  `idMuebleEnsamblado` INT NOT NULL AUTO_INCREMENT,
  `Costo` DECIMAL(10,2) NOT NULL,
  `Usuario_Nombre` VARCHAR(30) NOT NULL,
  `Mueble_Nombre` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idMuebleEnsamblado`),
  UNIQUE INDEX `idMuebleEnsamblado_UNIQUE` (`idMuebleEnsamblado` ASC) VISIBLE,
  INDEX `fk_MuebleEnsamblado_Usuario1_idx` (`Usuario_Nombre` ASC) VISIBLE,
  INDEX `fk_MuebleEnsamblado_Mueble1_idx` (`Mueble_Nombre` ASC) VISIBLE,
  CONSTRAINT `fk_MuebleEnsamblado_Usuario1`
    FOREIGN KEY (`Usuario_Nombre`)
    REFERENCES `MiMuebleria`.`Usuario` (`Nombre`),
  CONSTRAINT `fk_MuebleEnsamblado_Mueble1`
    FOREIGN KEY (`Mueble_Nombre`)
    REFERENCES `MiMuebleria`.`Mueble` (`Nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MyMuebleria`.`MuebleVenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiMuebleria`.`MuebleVenta` (
  `Tipo` VARCHAR(45) NOT NULL,
  `MuebleEnsamblado_idMuebleEnsamblado` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_MuebleVenta_MuebleEnsamblado1_idx` (`MuebleEnsamblado_idMuebleEnsamblado` ASC) VISIBLE,
  PRIMARY KEY (`MuebleEnsamblado_idMuebleEnsamblado`),
  UNIQUE INDEX `MuebleEnsamblado_idMuebleEnsamblado_UNIQUE` (`MuebleEnsamblado_idMuebleEnsamblado` ASC) VISIBLE,
  CONSTRAINT `fk_MuebleVenta_MuebleEnsamblado1`
    FOREIGN KEY (`MuebleEnsamblado_idMuebleEnsamblado`)
    REFERENCES `MiMuebleria`.`MuebleEnsamblado` (`idMuebleEnsamblado`)E)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MyMuebleria`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiMuebleria`.`Factura` (
  `idFactura` INT NOT NULL AUTO_INCREMENT,
  `Clientes_NIT` INT NOT NULL,
  `Fecha` DATE NOT NULL,
  `Usuario_Nombre` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idFactura`),
  UNIQUE INDEX `idFactura_UNIQUE` (`idFactura` ASC) VISIBLE,
  INDEX `fk_Factura_Clientes_idx` (`Clientes_NIT` ASC) VISIBLE,
  INDEX `fk_Factura_Usuario1_idx` (`Usuario_Nombre` ASC) VISIBLE,
  CONSTRAINT `fk_Factura_Clientes`
    FOREIGN KEY (`Clientes_NIT`)
    REFERENCES `MiMuebleria`.`Clientes` (`NIT`),
  CONSTRAINT `fk_Factura_Usuario1`
    FOREIGN KEY (`Usuario_Nombre`)
    REFERENCES `MiMuebleria`.`Usuario` (`Nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MyMuebleria`.`DetallesFactura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MyMuebleria`.`DetallesFactura` (
  `idDetallesFactura` INT NOT NULL AUTO_INCREMENT,
  `Factura_idFactura` INT NOT NULL,
  `MuebleVenta_MuebleEnsamblado_idMuebleEnsamblado` INT NOT NULL,
  PRIMARY KEY (`idDetallesFactura`),
  UNIQUE INDEX `idDetallesFactura_UNIQUE` (`idDetallesFactura` ASC) VISIBLE,
  INDEX `fk_DetallesFactura_Factura1_idx` (`Factura_idFactura` ASC) VISIBLE,
  INDEX `fk_DetallesFactura_MuebleVenta1_idx` (`MuebleVenta_MuebleEnsamblado_idMuebleEnsamblado` ASC) VISIBLE,
  CONSTRAINT `fk_DetallesFactura_Factura1`
    FOREIGN KEY (`Factura_idFactura`)
    REFERENCES `MyMuebleria`.`Factura` (`idFactura`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_DetallesFactura_MuebleVenta1`
    FOREIGN KEY (`MuebleVenta_MuebleEnsamblado_idMuebleEnsamblado`)
    REFERENCES `MyMuebleria`.`MuebleVenta` (`MuebleEnsamblado_idMuebleEnsamblado`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MyMuebleria`.`MateriaPrima`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiMuebleria`.`MateriaPrima` (
  `Tipo` VARCHAR(30) NOT NULL,
  `Precio` DECIMAL(7,2) NOT NULL,
  `Cantidad` INT NOT NULL,
  PRIMARY KEY (`Tipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MyMuebleria`.`EnsamblePiezas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MyMuebleria`.`EnsamblePiezas` (
  `Mueble_Nombre` VARCHAR(30) NOT NULL,
  `MateriaPrima_Tipo` VARCHAR(30) NOT NULL,
  INDEX `fk_EnsamblePiezas_Mueble1_idx` (`Mueble_Nombre` ASC) VISIBLE,
  INDEX `fk_EnsamblePiezas_MateriaPrima1_idx` (`MateriaPrima_Tipo` ASC) VISIBLE,
  CONSTRAINT `fk_EnsamblePiezas_Mueble1`
    FOREIGN KEY (`Mueble_Nombre`)
    REFERENCES `MyMuebleria`.`Mueble` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EnsamblePiezas_MateriaPrima1`
    FOREIGN KEY (`MateriaPrima_Tipo`)
    REFERENCES `MyMuebleria`.`MateriaPrima` (`Tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
