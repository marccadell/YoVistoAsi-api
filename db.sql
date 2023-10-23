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
CREATE SCHEMA IF NOT EXISTS `db_yovistoasi` DEFAULT CHARACTER SET utf8 ;
USE `db_yovistoasi` ;

-- -----------------------------------------------------
-- Table `db_yovistoasi`.`tipoEvento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_yovistoasi`.`tipoEvento` (
  `id` INT NOT NULL,
  `tipo_evento` VARCHAR(50) NULL,
  `genero_id` INT NULL,
  `ropa_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_genero_id_idx` (`genero_id` ASC) VISIBLE,
  INDEX `fk_ropa_id_4_idx` (`ropa_id` ASC) VISIBLE,
  CONSTRAINT `fk_genero_id_2`
    FOREIGN KEY (`genero_id`)
    REFERENCES `db_yovistoasi`.`genero` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ropa_id_4`
    FOREIGN KEY (`ropa_id`)
    REFERENCES `db_yovistoasi`.`ropa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_yovistoasi`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_yovistoasi`.`genero` (
  `id` INT NOT NULL,
  `tipo_genero` VARCHAR(45) NULL,
  `evento_id` INT NULL,
  `ropa_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_evento_id_idx` (`evento_id` ASC) VISIBLE,
  INDEX `fk_ropa_id_3_idx` (`ropa_id` ASC) VISIBLE,
  CONSTRAINT `fk_evento_id`
    FOREIGN KEY (`evento_id`)
    REFERENCES `db_yovistoasi`.`tipoEvento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ropa_id_3`
    FOREIGN KEY (`ropa_id`)
    REFERENCES `db_yovistoasi`.`ropa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_yovistoasi`.`categoriaRopa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_yovistoasi`.`categoriaRopa` (
  `id` INT NOT NULL,
  `tipo_categoria` VARCHAR(45) NULL,
  `ropa_id` INT NULL,
  `genero_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ropa_id_5_idx` (`ropa_id` ASC) VISIBLE,
  INDEX `fk_genero_id_4_idx` (`genero_id` ASC) VISIBLE,
  CONSTRAINT `fk_ropa_id_5`
    FOREIGN KEY (`ropa_id`)
    REFERENCES `db_yovistoasi`.`ropa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_genero_id_4`
    FOREIGN KEY (`genero_id`)
    REFERENCES `db_yovistoasi`.`genero` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_yovistoasi`.`tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_yovistoasi`.`tags` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_yovistoasi`.`ropa_tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_yovistoasi`.`ropa_tags` (
  `id` INT NOT NULL,
  `ropa_id` INT NULL,
  `tag_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ropa_id_idx` (`ropa_id` ASC) VISIBLE,
  INDEX `fk_tags_id_idx` (`tag_id` ASC) VISIBLE,
  CONSTRAINT `fk_ropa_id`
    FOREIGN KEY (`ropa_id`)
    REFERENCES `db_yovistoasi`.`ropa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tags_id`
    FOREIGN KEY (`tag_id`)
    REFERENCES `db_yovistoasi`.`tags` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_yovistoasi`.`ropa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_yovistoasi`.`ropa` (
  `id` INT NOT NULL,
  `name` VARCHAR(50) NULL,
  `description` VARCHAR(100) NULL,
  `categoria_id` INT NULL,
  `tipoGenero_id` INT NULL,
  `tipoEvento_id` INT NULL,
  `tagRopa_id` INT NULL,
  `material` VARCHAR(45) NULL,
  `color` VARCHAR(45) NULL,
  `precio` DECIMAL(4,2) NULL,
  `imagen` VARCHAR(50) NULL,
  `url` VARCHAR(500) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_categoriaRopa_id_idx` (`categoria_id` ASC) VISIBLE,
  INDEX `fk_ropaTags_id_idx` (`tagRopa_id` ASC) VISIBLE,
  INDEX `fk_tipoEvento_id_idx` (`tipoEvento_id` ASC) VISIBLE,
  INDEX `fk_genero_id_idx` (`tipoGenero_id` ASC) VISIBLE,
  CONSTRAINT `fk_categoriaRopa_id`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `db_yovistoasi`.`categoriaRopa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ropaTags_id`
    FOREIGN KEY (`tagRopa_id`)
    REFERENCES `db_yovistoasi`.`ropa_tags` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipoEvento_id`
    FOREIGN KEY (`tipoEvento_id`)
    REFERENCES `db_yovistoasi`.`tipoEvento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_genero_id`
    FOREIGN KEY (`tipoGenero_id`)
    REFERENCES `db_yovistoasi`.`genero` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_yovistoasi`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_yovistoasi`.`users` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `username` VARCHAR(50) NULL,
  `password` VARCHAR(50) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_yovistoasi`.`user_tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_yovistoasi`.`user_tag` (
  `id` INT NOT NULL,
  `user_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `db_yovistoasi`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
