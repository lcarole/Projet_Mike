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
-- -----------------------------------------------------
-- Schema projet
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `projet` ;

-- -----------------------------------------------------
-- Schema projet
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projet` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Conversation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Conversation` (
  `idConversation` INT NOT NULL AUTO_INCREMENT,
  `Conversation` VARCHAR(45) NULL,
  PRIMARY KEY (`idConversation`))
ENGINE = InnoDB;

USE `projet` ;

-- -----------------------------------------------------
-- Table `projet`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projet`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `nom_user` VARCHAR(45) NOT NULL,
  `prenom_user` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projet`.`Groupe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projet`.`Groupe` (
  `idGroupe` INT NOT NULL AUTO_INCREMENT,
  `nom_groupe` VARCHAR(45) NOT NULL,
  `idCreateur` INT NOT NULL,
  PRIMARY KEY (`idGroupe`),
  INDEX `fk_groupe_uitlisateurs1_idx` (`idCreateur` ASC) VISIBLE,
  CONSTRAINT `fk_groupe_uitlisateurs1`
    FOREIGN KEY (`idCreateur`)
    REFERENCES `projet`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projet`.`Asset`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projet`.`Asset` (
  `idAsset` INT NOT NULL AUTO_INCREMENT,
  `nom_asset` VARCHAR(45) NOT NULL,
  `url` VARCHAR(45) NOT NULL,
  `groupe_idGroupe` INT NOT NULL,
  PRIMARY KEY (`idAsset`),
  INDEX `fk_asset_groupe1_idx` (`groupe_idGroupe` ASC) VISIBLE,
  CONSTRAINT `fk_asset_groupe1`
    FOREIGN KEY (`groupe_idGroupe`)
    REFERENCES `projet`.`Groupe` (`idGroupe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projet`.`Image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projet`.`Image` (
  `idImage` INT NOT NULL,
  PRIMARY KEY (`idImage`),
  CONSTRAINT `idAssetI`
    FOREIGN KEY (`idImage`)
    REFERENCES `projet`.`Asset` (`idAsset`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projet`.`Video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projet`.`Video` (
  `idVideo` INT NOT NULL,
  `Videocol` VARCHAR(45) NULL,
  PRIMARY KEY (`idVideo`),
  CONSTRAINT `idAssetV`
    FOREIGN KEY (`idVideo`)
    REFERENCES `projet`.`Asset` (`idAsset`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projet`.`Message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projet`.`Message` (
  `idEmetteur` INT NOT NULL,
  `idRecepteur` INT NOT NULL,
  `Contenu` VARCHAR(45) NULL,
  `dateEnvoi` DATETIME NULL,
  `Messagecol` VARCHAR(45) NULL,
  `Messagecol1` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmetteur`, `idRecepteur`),
  INDEX `fk_uitlisateurs_has_uitlisateurs_uitlisateurs2_idx` (`idRecepteur` ASC) VISIBLE,
  INDEX `fk_uitlisateurs_has_uitlisateurs_uitlisateurs1_idx` (`idEmetteur` ASC) VISIBLE,
  CONSTRAINT `fk_uitlisateurs_has_uitlisateurs_uitlisateurs1`
    FOREIGN KEY (`idEmetteur`)
    REFERENCES `projet`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_uitlisateurs_has_uitlisateurs_uitlisateurs2`
    FOREIGN KEY (`idRecepteur`)
    REFERENCES `projet`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projet`.`Membre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projet`.`Membre` (
  `User_idUser` INT NOT NULL,
  `Groupe_idGroupe` INT NOT NULL,
  PRIMARY KEY (`User_idUser`, `Groupe_idGroupe`),
  INDEX `fk_uitlisateurs_has_groupe_groupe1_idx` (`Groupe_idGroupe` ASC) VISIBLE,
  INDEX `fk_uitlisateurs_has_groupe_uitlisateurs1_idx` (`User_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_uitlisateurs_has_groupe_uitlisateurs1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `projet`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_uitlisateurs_has_groupe_groupe1`
    FOREIGN KEY (`Groupe_idGroupe`)
    REFERENCES `projet`.`Groupe` (`idGroupe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
