-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Drogaria
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `farmacia` ;

-- -----------------------------------------------------
-- Schema Drogaria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Drogaria` DEFAULT CHARACTER SET UTF8 ;
USE `Drogaria` ;

-- -----------------------------------------------------
-- Table `Drogaria`.`Fornecedores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Drogaria`.`Fornecedores` ;

CREATE TABLE IF NOT EXISTS `Drogaria`.`Fornecedores` (
  `Id` INT NOT NULL COMMENT '',
  `Cnpj` VARCHAR(20) NOT NULL COMMENT '',
  `Nome` VARCHAR(40) NOT NULL COMMENT '',
  `Endereco` VARCHAR(80) NOT NULL COMMENT '',
  `Bairro` VARCHAR(20) NOT NULL COMMENT '',
  `Cidade` VARCHAR(15) NOT NULL COMMENT '',
  `Estado` VARCHAR(2) NOT NULL COMMENT '',
  `Cep` INT(11) NULL COMMENT '',
  `Telefone` INT NULL COMMENT '',
  PRIMARY KEY (`Id`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = UTF8;


-- -----------------------------------------------------
-- Table `Drogaria`.`Compras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Drogaria`.`Compras` ;

CREATE TABLE IF NOT EXISTS `Drogaria`.`Compras` (
  `Id` INT NOT NULL COMMENT '',
  `IdFornecedor` INT NOT NULL COMMENT '',
  `IdNotaFiscal` VARCHAR(30) NOT NULL COMMENT '',
  `IdFuncionario` INT NOT NULL COMMENT '',
  `ValorTotal` FLOAT NOT NULL COMMENT '',
  `DataCompra` DATE NOT NULL COMMENT '',
  PRIMARY KEY (`Id`)  COMMENT '',
  INDEX `fk_t_compra_t_fornecedor1_idx` (`IdFornecedor` ASC)  COMMENT '',
  CONSTRAINT `fk_t_compra_t_fornecedor1`
    FOREIGN KEY (`IdFornecedor`)
    REFERENCES `Drogaria`.`Fornecedores` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = UTF8;


-- -----------------------------------------------------
-- Table `Drogaria`.`Categorias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Drogaria`.`Categorias` ;

CREATE TABLE IF NOT EXISTS `Drogaria`.`Categorias` (
  `Id` INT NOT NULL COMMENT '',
  `Nome` VARCHAR(25) NOT NULL COMMENT '',
  PRIMARY KEY (`Id`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = UTF8;


-- -----------------------------------------------------
-- Table `Drogaria`.`Produtos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Drogaria`.`Produtos` ;

CREATE TABLE IF NOT EXISTS `Drogaria`.`Produtos` (
  `Id` INT NOT NULL COMMENT '',
  `IdCategoria` INT NOT NULL COMMENT '',
  `IdFornecedor` INT NOT NULL COMMENT '',
  `NomeProduto` VARCHAR(30) NOT NULL COMMENT '',
  `Preco` FLOAT NOT NULL COMMENT '',
  `Quantidade` INT NOT NULL COMMENT '',
  `Descricao` VARCHAR(45) NULL COMMENT '',
  `Foto` BLOB NULL COMMENT '',
  PRIMARY KEY (`Id`)  COMMENT '',
  INDEX `fk_t_produtos_t_categoria1_idx` (`IdCategoria` ASC)  COMMENT '',
  INDEX `fk_t_produtos_t_fornecedor1_idx` (`IdFornecedor` ASC)  COMMENT '',
  CONSTRAINT `fk_t_produtos_t_categoria1`
    FOREIGN KEY (`IdCategoria`)
    REFERENCES `Drogaria`.`Categorias` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_t_produtos_t_fornecedor1`
    FOREIGN KEY (`IdFornecedor`)
    REFERENCES `Drogaria`.`Fornecedores` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = UTF8;


-- -----------------------------------------------------
-- Table `Drogaria`.`ItensCompras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Drogaria`.`ItensCompras` ;

CREATE TABLE IF NOT EXISTS `Drogaria`.`ItensCompras` (
  `IdCompra` INT NOT NULL COMMENT '',
  `IdProduto` INT NOT NULL COMMENT '',
  `Quantidade` INT NOT NULL COMMENT '',
  PRIMARY KEY (`IdCompra`)  COMMENT '',
  CONSTRAINT `fk_t_aux_compra_t_compra1`
    FOREIGN KEY (`IdCompra`)
    REFERENCES `Drogaria`.`Compras` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_t_aux_compra_t_produtos1`
    FOREIGN KEY (`IdProduto`)
    REFERENCES `Drogaria`.`Produtos` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = UTF8;


-- -----------------------------------------------------
-- Table `Drogaria`.`Clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Drogaria`.`Clientes` ;

CREATE TABLE IF NOT EXISTS `Drogaria`.`Clientes` (
  `Id` INT NOT NULL COMMENT '',
  `Cpf` VARCHAR(20) NOT NULL COMMENT '',
  `Nome` VARCHAR(40) NOT NULL COMMENT '',
  `Endereco` VARCHAR(80) NOT NULL COMMENT '',
  `Bairro` VARCHAR(20) NOT NULL COMMENT '',
  `Cidade` VARCHAR(15) NOT NULL COMMENT '',
  `Estado` VARCHAR(2) NOT NULL COMMENT '',
  `Cep` INT(11) NULL COMMENT '',
  `Telefone` INT NULL COMMENT '',
  PRIMARY KEY (`Id`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = UTF8;


-- -----------------------------------------------------
-- Table `Drogaria`.`Funcionarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Drogaria`.`Funcionarios` ;

CREATE TABLE IF NOT EXISTS `Drogaria`.`Funcionarios` (
  `Id` INT NOT NULL COMMENT '',
  `Cpf` VARCHAR(20) NOT NULL COMMENT '',
  `Nome` VARCHAR(40) NOT NULL COMMENT '',
  `Endereco` VARCHAR(80) NOT NULL COMMENT '',
  `Bairro` VARCHAR(20) NOT NULL COMMENT '',
  `Cidade` VARCHAR(15) NOT NULL COMMENT '',
  `Cep` INT(11) NULL COMMENT '',
  `Estado` VARCHAR(2) NOT NULL COMMENT '',
  `Telefone` INT NULL COMMENT '',
  `Compras_IdCompra` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Id`)  COMMENT '',

  CONSTRAINT `fk_Funcionarios_Compras1`
    FOREIGN KEY (`Compras_IdCompra`)
    REFERENCES `Drogaria`.`Compras` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = UTF8;


-- -----------------------------------------------------
-- Table `Drogaria`.`Pedidos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Drogaria`.`Pedidos` ;

CREATE TABLE IF NOT EXISTS `Drogaria`.`Pedidos` (
  `Id` INT NOT NULL COMMENT '',
  `IdCliente` INT NOT NULL COMMENT '',
  `IdFuncionario` INT NOT NULL COMMENT '',
  `DataVenda` DATE NOT NULL COMMENT '',
  `ValorTotal` FLOAT NOT NULL COMMENT '',
  `FormaPagamento` VARCHAR(20) NOT NULL COMMENT '',
  PRIMARY KEY (`Id`)  COMMENT '',
    CONSTRAINT `fk_t_venda_t_clientes1`
    FOREIGN KEY (`IdCliente`)
    REFERENCES `Drogaria`.`Clientes` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_t_venda_t_funcionario1`
    FOREIGN KEY (`IdFuncionario`)
    REFERENCES `Drogaria`.`Funcionarios` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = UTF8;


-- -----------------------------------------------------
-- Table `Drogaria`.`ItensPedidos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Drogaria`.`ItensPedidos` ;

CREATE TABLE IF NOT EXISTS `Drogaria`.`ItensPedidos` (
  `IdPedido` INT NOT NULL COMMENT '',
  `IdProduto` INT NOT NULL COMMENT '',
  `Quantidade` INT NOT NULL COMMENT '',
  PRIMARY KEY (`IdPedido`)  COMMENT '',
  CONSTRAINT `fk_t_aux_venda_t_produtos1`
    FOREIGN KEY (`IdProduto`)
    REFERENCES `Drogaria`.`Produtos` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_aux_venda_t_venda1`
    FOREIGN KEY (`IdPedido`)
    REFERENCES `Drogaria`.`Pedidos` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = UTF8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
