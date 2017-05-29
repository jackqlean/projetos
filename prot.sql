-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.21-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para prot
CREATE DATABASE IF NOT EXISTS `prot` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `prot`;

-- Copiando estrutura para tabela prot.encaminhamento
CREATE TABLE IF NOT EXISTS `encaminhamento` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `cod_prenc` int(11) DEFAULT NULL,
  `cod_stenv` int(11) DEFAULT NULL,
  `cod_stdst` int(11) DEFAULT NULL,
  `cod_rqenc` int(11) DEFAULT NULL,
  `user_env` int(11) DEFAULT NULL,
  `user_rec` int(11) DEFAULT NULL,
  `data_env` date DEFAULT NULL,
  `horas_env` time DEFAULT NULL,
  `data_rec` date DEFAULT NULL,
  `horas_rec` time DEFAULT NULL,
  `obs` text,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`cod`),
  KEY `cod_proc` (`cod_prenc`),
  KEY `cod_setor` (`cod_stdst`),
  KEY `cod_rqenc` (`cod_rqenc`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela prot.encaminhamento: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `encaminhamento` DISABLE KEYS */;
INSERT INTO `encaminhamento` (`cod`, `cod_prenc`, `cod_stenv`, `cod_stdst`, `cod_rqenc`, `user_env`, `user_rec`, `data_env`, `horas_env`, `data_rec`, `horas_rec`, `obs`, `status`) VALUES
	(36, 59, 3, 4, 19, 1, 2, '2017-05-26', '10:31:17', '2017-05-26', '10:31:34', 'qualquer coisa ..', '1');
INSERT INTO `encaminhamento` (`cod`, `cod_prenc`, `cod_stenv`, `cod_stdst`, `cod_rqenc`, `user_env`, `user_rec`, `data_env`, `horas_env`, `data_rec`, `horas_rec`, `obs`, `status`) VALUES
	(41, 64, 4, 3, 31, 2, 1, '2017-05-26', '11:15:51', '2017-05-26', '11:16:26', 'para apreciação com extrema urgência.', '1');
INSERT INTO `encaminhamento` (`cod`, `cod_prenc`, `cod_stenv`, `cod_stdst`, `cod_rqenc`, `user_env`, `user_rec`, `data_env`, `horas_env`, `data_rec`, `horas_rec`, `obs`, `status`) VALUES
	(42, 65, 1, 2, 30, 1, 2, '2017-05-26', '11:27:42', '2017-05-26', '11:28:22', 'para verificação no setor competente.', '1');
INSERT INTO `encaminhamento` (`cod`, `cod_prenc`, `cod_stenv`, `cod_stdst`, `cod_rqenc`, `user_env`, `user_rec`, `data_env`, `horas_env`, `data_rec`, `horas_rec`, `obs`, `status`) VALUES
	(43, 67, 2, 4, 30, 1, 2, '2017-05-29', '09:30:46', '2017-05-29', '09:31:00', 'processo para verificação ao setor competente.', '1');
/*!40000 ALTER TABLE `encaminhamento` ENABLE KEYS */;

-- Copiando estrutura para tabela prot.itens_arq
CREATE TABLE IF NOT EXISTS `itens_arq` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `cod_proc` int(11) DEFAULT NULL,
  `arquivo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod`),
  KEY `cod_proc` (`cod_proc`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela prot.itens_arq: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `itens_arq` DISABLE KEYS */;
INSERT INTO `itens_arq` (`cod`, `cod_proc`, `arquivo`) VALUES
	(25, 66, 'Publicacao do dia 06 Janeiro 2017.pdf');
INSERT INTO `itens_arq` (`cod`, `cod_proc`, `arquivo`) VALUES
	(26, 67, 'Publicacao do dia 06 Janeiro 2017.pdf');
/*!40000 ALTER TABLE `itens_arq` ENABLE KEYS */;

-- Copiando estrutura para tabela prot.itens_proc
CREATE TABLE IF NOT EXISTS `itens_proc` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `cod_proc` int(11) NOT NULL,
  `cod_ob` int(11) NOT NULL,
  PRIMARY KEY (`cod`),
  KEY `cod_proc` (`cod_proc`),
  KEY `cod_ob` (`cod_ob`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela prot.itens_proc: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `itens_proc` DISABLE KEYS */;
INSERT INTO `itens_proc` (`cod`, `cod_proc`, `cod_ob`) VALUES
	(1, 9, 7);
INSERT INTO `itens_proc` (`cod`, `cod_proc`, `cod_ob`) VALUES
	(2, 9, 8);
INSERT INTO `itens_proc` (`cod`, `cod_proc`, `cod_ob`) VALUES
	(3, 11, 8);
INSERT INTO `itens_proc` (`cod`, `cod_proc`, `cod_ob`) VALUES
	(4, 10, 9);
INSERT INTO `itens_proc` (`cod`, `cod_proc`, `cod_ob`) VALUES
	(5, 12, 8);
INSERT INTO `itens_proc` (`cod`, `cod_proc`, `cod_ob`) VALUES
	(6, 12, 7);
INSERT INTO `itens_proc` (`cod`, `cod_proc`, `cod_ob`) VALUES
	(7, 12, 9);
INSERT INTO `itens_proc` (`cod`, `cod_proc`, `cod_ob`) VALUES
	(8, 13, 7);
INSERT INTO `itens_proc` (`cod`, `cod_proc`, `cod_ob`) VALUES
	(9, 13, 8);
INSERT INTO `itens_proc` (`cod`, `cod_proc`, `cod_ob`) VALUES
	(10, 14, 8);
INSERT INTO `itens_proc` (`cod`, `cod_proc`, `cod_ob`) VALUES
	(12, 23, 8);
INSERT INTO `itens_proc` (`cod`, `cod_proc`, `cod_ob`) VALUES
	(14, 25, 9);
INSERT INTO `itens_proc` (`cod`, `cod_proc`, `cod_ob`) VALUES
	(15, 25, 8);
INSERT INTO `itens_proc` (`cod`, `cod_proc`, `cod_ob`) VALUES
	(16, 26, 8);
INSERT INTO `itens_proc` (`cod`, `cod_proc`, `cod_ob`) VALUES
	(18, 29, 10);
/*!40000 ALTER TABLE `itens_proc` ENABLE KEYS */;

-- Copiando estrutura para tabela prot.ob
CREATE TABLE IF NOT EXISTS `ob` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` char(1) DEFAULT NULL,
  `titulo` varchar(50) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela prot.ob: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `ob` DISABLE KEYS */;
INSERT INTO `ob` (`cod`, `tipo`, `titulo`) VALUES
	(7, 'G', 'Processo');
INSERT INTO `ob` (`cod`, `tipo`, `titulo`) VALUES
	(8, 'D', 'Acompanhamento 3');
/*!40000 ALTER TABLE `ob` ENABLE KEYS */;

-- Copiando estrutura para tabela prot.proc
CREATE TABLE IF NOT EXISTS `proc` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `cod_req` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tipo` varchar(2) DEFAULT NULL,
  `assunto` text,
  `descricao` varchar(50) DEFAULT NULL,
  `setor` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `horas` time DEFAULT NULL,
  PRIMARY KEY (`cod`),
  KEY `cod_req` (`cod_req`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela prot.proc: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `proc` DISABLE KEYS */;
INSERT INTO `proc` (`cod`, `cod_req`, `user_id`, `tipo`, `assunto`, `descricao`, `setor`, `data`, `horas`) VALUES
	(59, 19, 2, 'PE', 'Licença saúde', 'para tratamento de renite alérgica', 1, '2017-05-26', '10:04:57');
INSERT INTO `proc` (`cod`, `cod_req`, `user_id`, `tipo`, `assunto`, `descricao`, `setor`, `data`, `horas`) VALUES
	(64, 31, 1, 'PI', 'Aposentadoria de Tom', 'porque ele achou melhor.', 1, '2017-05-26', '11:15:22');
INSERT INTO `proc` (`cod`, `cod_req`, `user_id`, `tipo`, `assunto`, `descricao`, `setor`, `data`, `horas`) VALUES
	(65, 30, 1, 'PI', 'Aposentadoria', 'para ontem.', 2, '2017-05-26', '11:27:14');
INSERT INTO `proc` (`cod`, `cod_req`, `user_id`, `tipo`, `assunto`, `descricao`, `setor`, `data`, `horas`) VALUES
	(66, 23, 1, 'PI', 'Licença saúde', 'para tratamento médico especializado.', 7, '2017-05-26', '11:35:11');
INSERT INTO `proc` (`cod`, `cod_req`, `user_id`, `tipo`, `assunto`, `descricao`, `setor`, `data`, `horas`) VALUES
	(67, 30, 1, 'PI', 'Aposentadoria de Scooby ', 'para o fim do ano.', 2, '2017-05-29', '09:29:37');
/*!40000 ALTER TABLE `proc` ENABLE KEYS */;

-- Copiando estrutura para tabela prot.req
CREATE TABLE IF NOT EXISTS `req` (
  `cod` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `cpf` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `sexo` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `cel` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `rec` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela prot.req: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `req` DISABLE KEYS */;
INSERT INTO `req` (`cod`, `nome`, `tipo`, `cpf`, `sexo`, `tel`, `cel`, `rec`, `email`) VALUES
	(19, 'Letícia de Oliveira Ferreira Leandro', 'F', '189.903.888-48', 'M', '(13)3821-6117', '(13)99612-9793', '(13)98180-5044', 'leleolive@hotmail.com');
INSERT INTO `req` (`cod`, `nome`, `tipo`, `cpf`, `sexo`, `tel`, `cel`, `rec`, `email`) VALUES
	(23, 'Jaquison Quintão Leandro', 'S', '189.903.888-48', 'M', '(13)3821-8542', '(13)98224-9408', '(13)98180-5044', 'jackqlean@gmail.com');
INSERT INTO `req` (`cod`, `nome`, `tipo`, `cpf`, `sexo`, `tel`, `cel`, `rec`, `email`) VALUES
	(24, 'Melissa', 'F', '189.903.888-48', 'F', '(13)3821-8542', '', '', 'melissa@gmail.com');
INSERT INTO `req` (`cod`, `nome`, `tipo`, `cpf`, `sexo`, `tel`, `cel`, `rec`, `email`) VALUES
	(26, 'Joana S/A', 'J', '189.903.888-48', 'M', '(13)3821-8542', '(13)98224-9408', '(13)98180-5044', 'joana@msn.com');
INSERT INTO `req` (`cod`, `nome`, `tipo`, `cpf`, `sexo`, `tel`, `cel`, `rec`, `email`) VALUES
	(29, 'Miguel Santos Rosa', 'F', '189.903.888-48', 'F', '(13)3821-8542', '(13)99612-9793', '(13)98180-5044', 'miguel.santos@gmail.com');
INSERT INTO `req` (`cod`, `nome`, `tipo`, `cpf`, `sexo`, `tel`, `cel`, `rec`, `email`) VALUES
	(30, 'Aurea Aparecida Alves Pinze', 'F', '189.903.888-48', 'F', '(13)3821-8542', '(13)97913-3996', '', 'pinze7@hotmail.com');
INSERT INTO `req` (`cod`, `nome`, `tipo`, `cpf`, `sexo`, `tel`, `cel`, `rec`, `email`) VALUES
	(31, 'Emerson José Quintão Leandro', 'S', '189.903.888-48', 'M', '(13)3821-8542', '(13)3821-8542', '(13)98112-5045', 'emersonjql@gmail.com');
INSERT INTO `req` (`cod`, `nome`, `tipo`, `cpf`, `sexo`, `tel`, `cel`, `rec`, `email`) VALUES
	(32, 'Maria Joaquina', 'F', '189.903.888-48', 'F', '(13)3821-8542', '(13)3821-8542', '(13)98112-5045', 'mariajoaquina@gmail.com');
INSERT INTO `req` (`cod`, `nome`, `tipo`, `cpf`, `sexo`, `tel`, `cel`, `rec`, `email`) VALUES
	(33, 'João de Oliveira', 'F', '189.903.888-48', 'M', '(13)3821-6655', '(13)3821-8542', '(13)98112-5045', 'joaoliveira@gmail.com');
INSERT INTO `req` (`cod`, `nome`, `tipo`, `cpf`, `sexo`, `tel`, `cel`, `rec`, `email`) VALUES
	(34, 'Olavo de Almeida', 'F', '189.903.888-48', 'M', '(13)3821-8542', '(13)97913-3996', '(13)98112-5045', 'olavo@gmail.com');
INSERT INTO `req` (`cod`, `nome`, `tipo`, `cpf`, `sexo`, `tel`, `cel`, `rec`, `email`) VALUES
	(35, 'Cristiane de Oliveira', 'F', '189.903.888-48', 'F', '(13)3821-8542', '(13)97913-3996', '(13)98112-5045', 'cristianeoliveira@hotmail.com');
/*!40000 ALTER TABLE `req` ENABLE KEYS */;

-- Copiando estrutura para tabela prot.setor
CREATE TABLE IF NOT EXISTS `setor` (
  `cod_setor` int(11) NOT NULL AUTO_INCREMENT,
  `setor` varchar(50) NOT NULL DEFAULT '0',
  `responsavel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod_setor`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela prot.setor: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `setor` DISABLE KEYS */;
INSERT INTO `setor` (`cod_setor`, `setor`, `responsavel`) VALUES
	(1, 'Administração', 'Toninho Cabral');
INSERT INTO `setor` (`cod_setor`, `setor`, `responsavel`) VALUES
	(2, 'Tesouraria', 'Aurealice Firmino');
INSERT INTO `setor` (`cod_setor`, `setor`, `responsavel`) VALUES
	(3, 'Jurídico', 'Dr. Fernando');
INSERT INTO `setor` (`cod_setor`, `setor`, `responsavel`) VALUES
	(4, 'Previdenciário', 'Juliana Borges');
INSERT INTO `setor` (`cod_setor`, `setor`, `responsavel`) VALUES
	(6, 'Contabilidade', 'Aurealice Firmino');
INSERT INTO `setor` (`cod_setor`, `setor`, `responsavel`) VALUES
	(7, 'TI', NULL);
/*!40000 ALTER TABLE `setor` ENABLE KEYS */;

-- Copiando estrutura para tabela prot.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela prot.users: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
	(1, 'Jaquison ', 'jackqlean@gmail.com', '2d29b962490320f821db80cddf6ed4b6e4ac7498');
INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
	(2, 'Usuario', 'usuario@usuario', '2d29b962490320f821db80cddf6ed4b6e4ac7498');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
