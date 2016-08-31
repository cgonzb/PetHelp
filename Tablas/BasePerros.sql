-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema netbau_perros
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `netbau_perros` ;

-- -----------------------------------------------------
-- Schema netbau_perros
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `netbau_perros` DEFAULT CHARACTER SET utf8 ;
USE `netbau_perros` ;

-- -----------------------------------------------------
-- Table `netbau_perros`.`Tamanio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `netbau_perros`.`Tamanio` ;

CREATE TABLE IF NOT EXISTS `netbau_perros`.`Tamanio` (
  `idTamanio` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  `Ultima_Mod` DATETIME NULL,
  PRIMARY KEY (`idTamanio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `netbau_perros`.`Color`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `netbau_perros`.`Color` ;

CREATE TABLE IF NOT EXISTS `netbau_perros`.`Color` (
  `idColor` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Ultima_Mod` DATETIME NULL,
  PRIMARY KEY (`idColor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `netbau_perros`.`Largo_Pelo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `netbau_perros`.`Largo_Pelo` ;

CREATE TABLE IF NOT EXISTS `netbau_perros`.`Largo_Pelo` (
  `idLargo_Pelo` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Ultima_Mod` DATETIME NULL,
  PRIMARY KEY (`idLargo_Pelo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `netbau_perros`.`Ubicacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `netbau_perros`.`Ubicacion` ;

CREATE TABLE IF NOT EXISTS `netbau_perros`.`Ubicacion` (
  `idUbicacion` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Descripcion` VARCHAR(45) NULL,
  `Lat` DOUBLE NULL,
  `Long` DOUBLE NULL,
  `Ultima_Mod` DATETIME NULL,
  PRIMARY KEY (`idUbicacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `netbau_perros`.`Estado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `netbau_perros`.`Estado` ;

CREATE TABLE IF NOT EXISTS `netbau_perros`.`Estado` (
  `idEstado` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Descripcion` VARCHAR(45) NULL,
  `Ultima_Mod` DATETIME NULL,
  PRIMARY KEY (`idEstado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `netbau_perros`.`Perro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `netbau_perros`.`Perro` ;

CREATE TABLE IF NOT EXISTS `netbau_perros`.`Perro` (
  `idPerro` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Fecha_Nacimiento` DATETIME NOT NULL,
  `Peso` INT NOT NULL,
  `Tamanio_idTamanio` INT NOT NULL,
  `Fecha_Ultima_Desparacitacion` DATETIME NULL,
  `Color_idColor` INT NOT NULL,
  `Largo_Pelo_idLargo_Pelo` INT NOT NULL,
  `Ubicacion_idUbicacion` INT NOT NULL,
  `Est_Perros` INT NOT NULL,
  `Est_Ninios` INT NOT NULL,
  `Est_Personas` INT NOT NULL,
  `Est_Ener` INT NOT NULL,
  `Estado_idEstado` INT NOT NULL,
  `id_Foto_Principal` INT NULL,
  `Ultima_Mod` DATETIME NULL,
  PRIMARY KEY (`idPerro`),
  INDEX `fk_Perro_Tamanio1_idx` (`Tamanio_idTamanio` ASC),
  INDEX `fk_Perro_Color1_idx` (`Color_idColor` ASC),
  INDEX `fk_Perro_LargoPelo1_idx` (`Largo_Pelo_idLargo_Pelo` ASC),
  INDEX `fk_Perro_Ubicacion1_idx` (`Ubicacion_idUbicacion` ASC),
  INDEX `fk_Perro_Estado1_idx` (`Estado_idEstado` ASC),
  CONSTRAINT `fk_Perro_Tamanio1`
    FOREIGN KEY (`Tamanio_idTamanio`)
    REFERENCES `netbau_perros`.`Tamanio` (`idTamanio`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Perro_Color1`
    FOREIGN KEY (`Color_idColor`)
    REFERENCES `netbau_perros`.`Color` (`idColor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Perro_LargoPelo1`
    FOREIGN KEY (`Largo_Pelo_idLargo_Pelo`)
    REFERENCES `netbau_perros`.`Largo_Pelo` (`idLargo_Pelo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Perro_Ubicacion1`
    FOREIGN KEY (`Ubicacion_idUbicacion`)
    REFERENCES `netbau_perros`.`Ubicacion` (`idUbicacion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Perro_Estado1`
    FOREIGN KEY (`Estado_idEstado`)
    REFERENCES `netbau_perros`.`Estado` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `netbau_perros`.`Vacunas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `netbau_perros`.`Vacunas` ;

CREATE TABLE IF NOT EXISTS `netbau_perros`.`Vacunas` (
  `idVacunas` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NULL,
  `Ultima_Mod` DATETIME NULL,
  PRIMARY KEY (`idVacunas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `netbau_perros`.`Operaciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `netbau_perros`.`Operaciones` ;

CREATE TABLE IF NOT EXISTS `netbau_perros`.`Operaciones` (
  `idOperaciones` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NULL,
  `Ultima_Mod` DATETIME NULL,
  PRIMARY KEY (`idOperaciones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `netbau_perros`.`Operaciones_has_Perro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `netbau_perros`.`Operaciones_has_Perro` ;

CREATE TABLE IF NOT EXISTS `netbau_perros`.`Operaciones_has_Perro` (
  `Operaciones_idOperaciones` INT NOT NULL,
  `Perro_idPerro` INT NULL,
  `Fecha` DATETIME NULL,
  `Observaciones` VARCHAR(45) NULL,
  `Ultima_Mod` DATETIME NULL,
  INDEX `fk_Operaciones_has_Perro_Perro1_idx` (`Perro_idPerro` ASC),
  INDEX `fk_Operaciones_has_Perro_Operaciones1_idx` (`Operaciones_idOperaciones` ASC),
  CONSTRAINT `fk_Operaciones_has_Perro_Operaciones1`
    FOREIGN KEY (`Operaciones_idOperaciones`)
    REFERENCES `netbau_perros`.`Operaciones` (`idOperaciones`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Operaciones_has_Perro_Perro1`
    FOREIGN KEY (`Perro_idPerro`)
    REFERENCES `netbau_perros`.`Perro` (`idPerro`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `netbau_perros`.`Perro_has_Vacunas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `netbau_perros`.`Perro_has_Vacunas` ;

CREATE TABLE IF NOT EXISTS `netbau_perros`.`Perro_has_Vacunas` (
  `Perro_idPerro` INT NOT NULL,
  `Vacunas_idVacunas` INT NOT NULL,
  `Fecha` DATETIME NULL,
  `Ultima_Mod` DATETIME NULL,
  INDEX `fk_Perro_has_Vacunas_Vacunas1_idx` (`Vacunas_idVacunas` ASC),
  INDEX `fk_Perro_has_Vacunas_Perro1_idx` (`Perro_idPerro` ASC),
  CONSTRAINT `fk_Perro_has_Vacunas_Perro1`
    FOREIGN KEY (`Perro_idPerro`)
    REFERENCES `netbau_perros`.`Perro` (`idPerro`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Perro_has_Vacunas_Vacunas1`
    FOREIGN KEY (`Vacunas_idVacunas`)
    REFERENCES `netbau_perros`.`Vacunas` (`idVacunas`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `netbau_perros`.`Enfermedad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `netbau_perros`.`Enfermedad` ;

CREATE TABLE IF NOT EXISTS `netbau_perros`.`Enfermedad` (
  `idEnfermedad` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Descripicion` VARCHAR(45) NULL,
  `Ultima_Mod` DATETIME NULL,
  PRIMARY KEY (`idEnfermedad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `netbau_perros`.`Perro_has_Enfermedad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `netbau_perros`.`Perro_has_Enfermedad` ;

CREATE TABLE IF NOT EXISTS `netbau_perros`.`Perro_has_Enfermedad` (
  `Perro_idPerro` INT NOT NULL,
  `Enfermedad_idEnfermedad` INT NOT NULL,
  `Fecha_Inicio` DATETIME NULL,
  `Fecha_Fin` DATETIME NULL,
  `Solucionado` INT NULL,
  `Ultima_Mod` DATETIME NULL,
  INDEX `fk_Perro_has_Enfermedad_Enfermedad1_idx` (`Enfermedad_idEnfermedad` ASC),
  INDEX `fk_Perro_has_Enfermedad_Perro1_idx` (`Perro_idPerro` ASC),
  CONSTRAINT `fk_Perro_has_Enfermedad_Perro1`
    FOREIGN KEY (`Perro_idPerro`)
    REFERENCES `netbau_perros`.`Perro` (`idPerro`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Perro_has_Enfermedad_Enfermedad1`
    FOREIGN KEY (`Enfermedad_idEnfermedad`)
    REFERENCES `netbau_perros`.`Enfermedad` (`idEnfermedad`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `netbau_perros`.`Persona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `netbau_perros`.`Persona` ;

CREATE TABLE IF NOT EXISTS `netbau_perros`.`Persona` (
  `idPersona` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Telefono` INT NULL,
  `Mail` VARCHAR(45) NULL,
  `Usuario` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  `Nivel_Acceso` INT NULL,
  `Ultima_Mod` DATETIME NULL,
  PRIMARY KEY (`idPersona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `netbau_perros`.`Apadrina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `netbau_perros`.`Apadrina` ;

CREATE TABLE IF NOT EXISTS `netbau_perros`.`Apadrina` (
  `Persona_idPersona` INT NOT NULL,
  `Perro_idPerro` INT NOT NULL,
  `Fecha_Inicio` DATETIME NULL,
  `Fecha_Fin` DATETIME NULL,
  `Ultima_Mod` DATETIME NULL,
  INDEX `fk_Persona_has_Perro_Perro1_idx` (`Perro_idPerro` ASC),
  INDEX `fk_Persona_has_Perro_Persona1_idx` (`Persona_idPersona` ASC),
  CONSTRAINT `fk_Persona_has_Perro_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `netbau_perros`.`Persona` (`idPersona`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Persona_has_Perro_Perro1`
    FOREIGN KEY (`Perro_idPerro`)
    REFERENCES `netbau_perros`.`Perro` (`idPerro`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `netbau_perros`.`Tipo_Aporte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `netbau_perros`.`Tipo_Aporte` ;

CREATE TABLE IF NOT EXISTS `netbau_perros`.`Tipo_Aporte` (
  `idTipo_Aporte` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Unidad` VARCHAR(45) NULL,
  `Ultima_Mod` DATETIME NULL,
  PRIMARY KEY (`idTipo_Aporte`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `netbau_perros`.`Aporte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `netbau_perros`.`Aporte` ;

CREATE TABLE IF NOT EXISTS `netbau_perros`.`Aporte` (
  `idAporte` INT NOT NULL AUTO_INCREMENT,
  `Cantidad` VARCHAR(45) NULL,
  `Tipo_Aporte_idTipo_Aporte` INT NOT NULL,
  `Persona_idPersona` INT NOT NULL,
  `Periodicidad` BINARY(1) NULL,
  `Fecha` DATETIME NULL,
  `Ultima_Mod` DATETIME NULL,
  PRIMARY KEY (`idAporte`),
  INDEX `fk_Aporte_Tipo_Aporte1_idx` (`Tipo_Aporte_idTipo_Aporte` ASC),
  INDEX `fk_Aporte_Persona1_idx` (`Persona_idPersona` ASC),
  CONSTRAINT `fk_Aporte_Tipo_Aporte1`
    FOREIGN KEY (`Tipo_Aporte_idTipo_Aporte`)
    REFERENCES `netbau_perros`.`Tipo_Aporte` (`idTipo_Aporte`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Aporte_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `netbau_perros`.`Persona` (`idPersona`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `netbau_perros`.`Frecuencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `netbau_perros`.`Frecuencia` ;

CREATE TABLE IF NOT EXISTS `netbau_perros`.`Frecuencia` (
  `idFrecuencia` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idFrecuencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `netbau_perros`.`Persona_has_Aporte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `netbau_perros`.`Persona_has_Aporte` ;

CREATE TABLE IF NOT EXISTS `netbau_perros`.`Persona_has_Aporte` (
  `Persona_idPersona` INT NOT NULL,
  `Aporte_idAporte` INT NOT NULL,
  `Ultima_Mod` DATETIME NULL,
  INDEX `fk_Persona_has_Aporte_Persona1_idx` (`Persona_idPersona` ASC),
  INDEX `fk_Persona_has_Aporte_Aporte1_idx` (`Aporte_idAporte` ASC),
  CONSTRAINT `fk_Persona_has_Aporte_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `netbau_perros`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_has_Aporte_Aporte1`
    FOREIGN KEY (`Aporte_idAporte`)
    REFERENCES `netbau_perros`.`Aporte` (`idAporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `netbau_perros`.`Apadrina_has_Aporte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `netbau_perros`.`Apadrina_has_Aporte` ;

CREATE TABLE IF NOT EXISTS `netbau_perros`.`Apadrina_has_Aporte` (
  `Apadrina_Perro_idPerro` INT NOT NULL,
  `Aporte_idAporte` INT NOT NULL,
  `Ultima_Mod` DATETIME NULL,
  INDEX `fk_Apadrina_has_Aporte_Apadrina1_idx` (`Apadrina_Perro_idPerro` ASC),
  INDEX `fk_Apadrina_has_Aporte_Aporte1_idx` (`Aporte_idAporte` ASC),
  CONSTRAINT `fk_Apadrina_has_Aporte_Apadrina1`
    FOREIGN KEY (`Apadrina_Perro_idPerro`)
    REFERENCES `netbau_perros`.`Apadrina` (`Perro_idPerro`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Apadrina_has_Aporte_Aporte1`
    FOREIGN KEY (`Aporte_idAporte`)
    REFERENCES `netbau_perros`.`Aporte` (`idAporte`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `netbau_perros`.`Foto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `netbau_perros`.`Foto` ;

CREATE TABLE IF NOT EXISTS `netbau_perros`.`Foto` (
  `idFoto` INT NOT NULL,
  `Perro_idPerro` INT NOT NULL,
  `Fecha` DATETIME NULL,
  `Ultima_Mod` VARCHAR(45) NULL,
  PRIMARY KEY (`idFoto`),
  INDEX `fk_Foto_Perro1_idx` (`Perro_idPerro` ASC),
  CONSTRAINT `fk_Foto_Perro1`
    FOREIGN KEY (`Perro_idPerro`)
    REFERENCES `netbau_perros`.`Perro` (`idPerro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
