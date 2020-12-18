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
-- Table `projet`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projet`.`user` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `nom_user` VARCHAR(45) NOT NULL,
  `prenom_user` VARCHAR(45) NOT NULL,
  `Conversation_idConversation` INT NOT NULL,
  PRIMARY KEY (`idUser`),
  INDEX `fk_user_Conversation1_idx` (`Conversation_idConversation` ASC) VISIBLE,
  CONSTRAINT `fk_user_Conversation1`
    FOREIGN KEY (`Conversation_idConversation`)
    REFERENCES `mydb`.`conversation` (`idConversation`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`conversation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`conversation` (
  `idConversation` INT NOT NULL AUTO_INCREMENT,
  `historique` TEXT NULL DEFAULT NULL,
  `user_idUser` INT NOT NULL,
  PRIMARY KEY (`idConversation`),
  INDEX `fk_Conversation_user_idx` (`user_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_Conversation_user`
    FOREIGN KEY (`user_idUser`)
    REFERENCES `projet`.`user` (`idUser`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `projet` ;

-- -----------------------------------------------------
-- Table `projet`.`groupe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projet`.`groupe` (
  `idGroupe` INT NOT NULL AUTO_INCREMENT,
  `nom_groupe` VARCHAR(45) NOT NULL,
  `idCreateur` INT NOT NULL,
  PRIMARY KEY (`idGroupe`),
  INDEX `fk_groupe_uitlisateurs1_idx` (`idCreateur` ASC) VISIBLE,
  CONSTRAINT `fk_groupe_uitlisateurs1`
    FOREIGN KEY (`idCreateur`)
    REFERENCES `projet`.`user` (`idUser`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projet`.`asset`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projet`.`asset` (
  `idAsset` INT NOT NULL AUTO_INCREMENT,
  `nom_asset` VARCHAR(45) NOT NULL,
  `url` VARCHAR(45) NOT NULL,
  `groupe_idGroupe` INT NOT NULL,
  `taille` DECIMAL(10,0) NULL DEFAULT NULL,
  PRIMARY KEY (`idAsset`),
  INDEX `fk_asset_groupe1_idx` (`groupe_idGroupe` ASC) VISIBLE,
  CONSTRAINT `fk_asset_groupe1`
    FOREIGN KEY (`groupe_idGroupe`)
    REFERENCES `projet`.`groupe` (`idGroupe`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projet`.`image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projet`.`image` (
  `idImage` INT NOT NULL,
  PRIMARY KEY (`idImage`),
  CONSTRAINT `idAssetI`
    FOREIGN KEY (`idImage`)
    REFERENCES `projet`.`asset` (`idAsset`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projet`.`membre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projet`.`membre` (
  `User_idUser` INT NOT NULL,
  `Groupe_idGroupe` INT NOT NULL,
  PRIMARY KEY (`User_idUser`, `Groupe_idGroupe`),
  INDEX `fk_uitlisateurs_has_groupe_groupe1_idx` (`Groupe_idGroupe` ASC) VISIBLE,
  INDEX `fk_uitlisateurs_has_groupe_uitlisateurs1_idx` (`User_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_uitlisateurs_has_groupe_groupe1`
    FOREIGN KEY (`Groupe_idGroupe`)
    REFERENCES `projet`.`groupe` (`idGroupe`),
  CONSTRAINT `fk_uitlisateurs_has_groupe_uitlisateurs1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `projet`.`user` (`idUser`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projet`.`message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projet`.`message` (
  `Contenu` VARCHAR(45) NULL DEFAULT NULL,
  `dateEnvoi` DATETIME NULL DEFAULT NULL,
  `Messagecol` VARCHAR(45) NULL DEFAULT NULL,
  `Messagecol1` VARCHAR(45) NULL DEFAULT NULL,
  `Conversation_idConversation` INT NOT NULL,
  `user_idUser` INT NOT NULL,
  INDEX `fk_message_Conversation1_idx` (`Conversation_idConversation` ASC) VISIBLE,
  INDEX `fk_message_user1_idx` (`user_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_message_Conversation1`
    FOREIGN KEY (`Conversation_idConversation`)
    REFERENCES `mydb`.`conversation` (`idConversation`),
  CONSTRAINT `fk_message_user1`
    FOREIGN KEY (`user_idUser`)
    REFERENCES `projet`.`user` (`idUser`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projet`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projet`.`video` (
  `idVideo` INT NOT NULL,
  `Videocol` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idVideo`),
  CONSTRAINT `idAssetV`
    FOREIGN KEY (`idVideo`)
    REFERENCES `projet`.`asset` (`idAsset`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
