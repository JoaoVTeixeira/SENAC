-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11-Nov-2022 às 21:33
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `reservadesalas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cep`
--

CREATE TABLE `cep` (
  `cep` int(11) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `numero` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cep`
--

INSERT INTO `cep` (`cep`, `tipo`, `nome`, `numero`) VALUES
(69011222, 'Casa', 'Rua Takakara Noxao', '102'),
(69011242, 'Casa', 'Rua Vadal Kuzin', '200'),
(69023250, 'Casa', 'Rua General Benjamin Arrola', '150');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cod_cliente` int(3) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `tel` bigint(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `cep` int(8) NOT NULL,
  `cod_func` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cod_cliente`, `nome`, `tel`, `email`, `cep`, `cod_func`) VALUES
(1, 'Fugiro Nakombi', 9211111111, 'fn@salas', 69011242, 2),
(2, 'Fugiro Namoto', 9222221111, 'fnm@salas', 69011222, 2),
(3, 'Kutuka Jaka Kakaiabiu', 9211112222, 'kjk@salas', 69011242, 2),
(4, 'Tadeu Namata', 9222222222, 'tn@salas', 69023250, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcao`
--

CREATE TABLE `funcao` (
  `cod_funcao` int(3) NOT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `salario` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `funcao`
--

INSERT INTO `funcao` (`cod_funcao`, `descricao`, `salario`) VALUES
(1, 'Administrador', 10000),
(2, 'Recepcionista', 2000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `cod_func` int(3) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cpf` bigint(20) NOT NULL,
  `cep` int(8) NOT NULL,
  `tel` bigint(20) NOT NULL,
  `e-mail` varchar(50) DEFAULT NULL,
  `cod_funcao` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`cod_func`, `nome`, `cpf`, `cep`, `tel`, `e-mail`, `cod_funcao`) VALUES
(1, 'Manoelovsick Portuga', 12345678901, 69050011, 9299991234, 'mv@salas', 1),
(2, 'Paula Noku', 10987654321, 69050025, 9298769856, 'pn@salas', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `reserva`
--

CREATE TABLE `reserva` (
  `num_reserva` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `cod_sala` int(3) NOT NULL,
  `cod_cliente` int(3) NOT NULL,
  `cod_func` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `reserva`
--

INSERT INTO `reserva` (`num_reserva`, `data`, `cod_sala`, `cod_cliente`, `cod_func`) VALUES
(1, '2022-11-14', 4, 1, 2),
(2, '2022-11-14', 3, 2, 2),
(3, '2022-11-15', 4, 1, 2),
(4, '2022-11-15', 1, 3, 2),
(5, '2022-11-16', 4, 1, 2),
(6, '2022-11-17', 2, 2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sala`
--

CREATE TABLE `sala` (
  `cod_sala` int(3) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `qtde` int(3) NOT NULL,
  `tamanhom2` varchar(10) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `vistoria` int(11) NOT NULL,
  `cod_func` int(3) NOT NULL,
  `valor` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `sala`
--

INSERT INTO `sala` (`cod_sala`, `descricao`, `qtde`, `tamanhom2`, `tipo`, `vistoria`, `cod_func`, `valor`) VALUES
(1, 'Sala Azul', 32, '15m2', '1', 1, 2, 150),
(2, 'Sala Verde', 36, '15m2', '1', 1, 2, 200),
(3, 'Sala Branca', 48, '25m2', '2', 1, 2, 350),
(4, 'Sala Vermelha&Preta', 80, '60m2', '3', 1, 2, 1000);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cep`
--
ALTER TABLE `cep`
  ADD PRIMARY KEY (`cep`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cod_cliente`),
  ADD KEY `cep` (`cep`),
  ADD KEY `cod_func` (`cod_func`);

--
-- Índices para tabela `funcao`
--
ALTER TABLE `funcao`
  ADD PRIMARY KEY (`cod_funcao`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`cod_func`),
  ADD KEY `cod_funcao` (`cod_funcao`);

--
-- Índices para tabela `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`num_reserva`),
  ADD KEY `cod_cliente` (`cod_cliente`),
  ADD KEY `cod_func` (`cod_func`),
  ADD KEY `cod_sala` (`cod_sala`);

--
-- Índices para tabela `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`cod_sala`),
  ADD KEY `cod_func` (`cod_func`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cod_cliente` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `funcao`
--
ALTER TABLE `funcao`
  MODIFY `cod_funcao` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `cod_func` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `reserva`
--
ALTER TABLE `reserva`
  MODIFY `num_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `sala`
--
ALTER TABLE `sala`
  MODIFY `cod_sala` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`cep`) REFERENCES `cep` (`cep`),
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`cod_func`) REFERENCES `funcionario` (`cod_func`);

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`cod_funcao`) REFERENCES `funcao` (`cod_funcao`);

--
-- Limitadores para a tabela `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`cod_cliente`) REFERENCES `cliente` (`cod_cliente`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`cod_func`) REFERENCES `funcionario` (`cod_func`),
  ADD CONSTRAINT `reserva_ibfk_3` FOREIGN KEY (`cod_sala`) REFERENCES `sala` (`cod_sala`);

--
-- Limitadores para a tabela `sala`
--
ALTER TABLE `sala`
  ADD CONSTRAINT `sala_ibfk_1` FOREIGN KEY (`cod_func`) REFERENCES `funcionario` (`cod_func`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
