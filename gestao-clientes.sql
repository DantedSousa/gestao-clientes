-- Criação do schema
CREATE SCHEMA IF NOT EXISTS `gestao_clientes` DEFAULT CHARACTER SET utf8mb4;
USE `gestao_clientes`;

-- Tabela de clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(150) NOT NULL,
  `idade` INT DEFAULT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `email` VARCHAR(100) DEFAULT NULL,
  `endereco` LONGTEXT DEFAULT NULL,
  `localidade` VARCHAR(100) DEFAULT NULL,
  `data_nascimento` DATE DEFAULT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE (`cpf`),
  UNIQUE (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabela de telefones dos clientes
CREATE TABLE IF NOT EXISTS `cliente_telefones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(20) DEFAULT NULL,
  `tipo` VARCHAR(100) DEFAULT NULL,
  `clientes_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`clientes_id`) REFERENCES `clientes`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
