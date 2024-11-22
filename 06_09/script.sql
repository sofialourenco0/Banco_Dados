

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- criar banco de dados mydb se não existir com configuração utf8
CREATE SCHEMA IF NOT EXISTS `aluguelCarro` DEFAULT CHARACTER SET utf8 ;
USE `aluguelCarro` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aluguelCarro`.`Cliente` (
  `idCliente` INT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,cliente
  `cnh` VARCHAR(11) NOT NULL,
  `endereco` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;

select * from cliente


-- -----------------------------------------------------
-- Table `mydb`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aluguelCarro`.`Telefone` (
  `idTelefone` INT NOT NULL,
  `NumeroTelefone` VARCHAR(15) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idTelefone`, `Cliente_idCliente`),
 -- INDEX `fk_Telefone_Cliente_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_Cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `aluguelCarro`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Carro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aluguelCarro`.`Carro` (
  `idCarro` INT NOT NULL,
  `Placa` VARCHAR(8) NOT NULL,
  `Cor` VARCHAR(15) NOT NULL,
  `Modelo` VARCHAR(25) NOT NULL,
  `Ano` INT NOT NULL,
  `Diaria` DOUBLE NOT NULL,
  PRIMARY KEY (`idCarro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Alugar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aluguelCarro`.`Alugar` (
  `idAlugar` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Carro_idCarro` INT NOT NULL,
  `DataInicial` DATE NOT NULL,
  `DataFinal` DATE NOT NULL,
 -- INDEX `fk_Cliente_has_Carro_Carro1_idx` (`Carro_idCarro` ASC) VISIBLE,
 -- INDEX `fk_Cliente_has_Carro_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  PRIMARY KEY (`idAlugar`),
  CONSTRAINT `fk_Cliente_has_Carro_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `aluguelCarro`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_has_Carro_Carro1`
    FOREIGN KEY (`Carro_idCarro`)
    REFERENCES `aluguelCarro`.`Carro` (`idCarro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Esportivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aluguelCarro`.`Esportivo` (
  `Velocidade` DOUBLE NOT NULL,
  `Carro_idCarro` INT NOT NULL,
  PRIMARY KEY (`Carro_idCarro`),
  CONSTRAINT `fk_Esportivo_Carro1`
    FOREIGN KEY (`Carro_idCarro`)
    REFERENCES `aluguelCarro`.`Carro` (`idCarro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Seda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aluguelCarro`.`Seda` (
  `Passageiros` INT NOT NULL,
  `Carro_idCarro` INT NOT NULL,
  PRIMARY KEY (`Carro_idCarro`),
  CONSTRAINT `fk_Seda_Carro1`
    FOREIGN KEY (`Carro_idCarro`)
    REFERENCES `aluguelCarro`.`Carro` (`idCarro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
