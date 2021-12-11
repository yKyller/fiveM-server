-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.14-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para vrp
CREATE DATABASE IF NOT EXISTS `venish` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `venish`;

-- Copiando estrutura para tabela vrp.phone_app_chat
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela vrp.phone_app_chat: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `phone_app_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_app_chat` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.phone_calls
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL,
  `num` varchar(10) NOT NULL,
  `incoming` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela vrp.phone_calls: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `phone_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_calls` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.phone_chat
CREATE TABLE IF NOT EXISTS `phone_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela vrp.phone_chat: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `phone_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_chat` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.phone_contacts
CREATE TABLE IF NOT EXISTS `phone_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) DEFAULT NULL,
  `number` varchar(10) DEFAULT NULL,
  `display` varchar(64) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`),
  KEY `number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela vrp.phone_contacts: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `phone_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_contacts` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `transmitter` (`transmitter`),
  KEY `receiver` (`receiver`),
  KEY `message` (`message`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela vrp.phone_messages: 0 rows
/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.phone_users_contacts
CREATE TABLE IF NOT EXISTS `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela vrp.phone_users_contacts: 0 rows
/*!40000 ALTER TABLE `phone_users_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_users_contacts` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.twitter_accounts
CREATE TABLE IF NOT EXISTS `twitter_accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela vrp.twitter_accounts: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `twitter_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_accounts` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.twitter_likes
CREATE TABLE IF NOT EXISTS `twitter_likes` (
  `id` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela vrp.twitter_likes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `twitter_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_likes` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.twitter_tweets
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela vrp.twitter_tweets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `twitter_tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_tweets` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.vrp_banco
CREATE TABLE IF NOT EXISTS `vrp_banco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `extrato` varchar(255) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela vrp.vrp_banco: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_banco` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_banco` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.vrp_business
CREATE TABLE IF NOT EXISTS `vrp_business` (
  `user_id` int(11) NOT NULL,
  `capital` int(11) DEFAULT NULL,
  `laundered` int(11) DEFAULT NULL,
  `reset_timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_business_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela vrp.vrp_business: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_business` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_business` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.vrp_criminal
CREATE TABLE IF NOT EXISTS `vrp_criminal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `crime` varchar(50) DEFAULT NULL,
  `pena` varchar(50) DEFAULT NULL,
  `criminoso` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela vrp.vrp_criminal: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_criminal` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_criminal` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.vrp_estoque
CREATE TABLE IF NOT EXISTS `vrp_estoque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(100) NOT NULL,
  `quantidade` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vehicle` (`vehicle`)
) ENGINE=InnoDB AUTO_INCREMENT=482 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela vrp.vrp_estoque: ~423 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_estoque` DISABLE KEYS */;
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(2, 'akuma', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(3, 'alpha', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(4, 'asea', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(5, 'asterope', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(6, 'audirs6', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(7, 'audirs7', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(8, 'autarch', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(9, 'avarus', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(10, 'bagger', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(11, 'baller', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(12, 'baller2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(13, 'baller3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(14, 'baller4', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(17, 'banshee', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(18, 'banshee2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(19, 'bati', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(20, 'bati2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(21, 'bestiagts', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(22, 'bf400', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(23, 'bfinjection', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(24, 'bifta', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(25, 'bison', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(26, 'bison2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(27, 'bjxl', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(28, 'blade', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(29, 'blazer', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(30, 'blazer4', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(31, 'blista', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(32, 'blista2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(33, 'blista3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(35, 'bobcatxl', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(36, 'bodhi2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(37, 'brawler', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(38, 'brioso', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(39, 'btype', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(40, 'btype2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(41, 'btype3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(42, 'buccaneer', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(43, 'buccaneer2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(44, 'buffalo', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(45, 'buffalo2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(46, 'buffalo3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(47, 'bullet', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(48, 'burrito', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(49, 'burrito2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(50, 'burrito3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(51, 'burrito4', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(52, 'carbonizzare', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(53, 'carbonrs', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(54, 'casco', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(55, 'cavalcade', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(56, 'cavalcade2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(57, 'cheburek', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(58, 'cheetah', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(59, 'cheetah2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(60, 'chimera', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(61, 'chino', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(62, 'chino2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(63, 'cliffhanger', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(64, 'clique', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(65, 'cog55', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(67, 'cogcabrio', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(68, 'cognoscenti', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(70, 'comet2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(71, 'comet3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(72, 'comet5', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(73, 'contender', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(74, 'coquette', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(75, 'coquette2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(76, 'coquette3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(77, 'cyclone', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(78, 'daemon2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(79, 'defiler', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(81, 'deviant', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(82, 'diablous', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(83, 'diablous2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(84, 'dilettante', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(85, 'dodgechargersrt', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(86, 'dominator', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(87, 'dominator2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(88, 'dominator3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(89, 'double', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(90, 'dubsta', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(91, 'dubsta2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(92, 'dubsta3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(93, 'dukes', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(95, 'elegy2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(96, 'ellie', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(97, 'emperor', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(98, 'emperor2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(99, 'enduro', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(100, 'entity2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(101, 'entityxf', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(102, 'esskey', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(103, 'exemplar', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(104, 'f620', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(105, 'faction', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(106, 'faction2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(107, 'faction3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(108, 'fagaloa', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(109, 'faggio', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(110, 'faggio2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(111, 'faggio3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(112, 'fcr', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(113, 'fcr2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(114, 'felon', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(115, 'feltzer2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(116, 'feltzer3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(117, 'flashgt', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(118, 'fmj', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(119, 'focusrs', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(120, 'fordmustang', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(121, 'fq2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(122, 'freecrawler', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(123, 'fugitive', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(124, 'furoregt', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(125, 'fusilade', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(126, 'futo', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(127, 'gargoyle', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(128, 'gauntlet', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(129, 'gauntlet2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(130, 'gb200', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(131, 'glendale', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(132, 'gp1', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(133, 'granger', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(134, 'gresley', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(135, 'gt500', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(136, 'guardian', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(137, 'habanero', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(138, 'hakuchou', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(140, 'hermes', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(141, 'hexer', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(142, 'hondafk8', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(143, 'hotknife', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(144, 'hotring', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(145, 'huntley', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(146, 'impaler', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(147, 'infernus', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(148, 'infernus2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(149, 'ingot', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(150, 'innovation', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(151, 'intruder', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(152, 'issi2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(153, 'issi3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(154, 'italigtb', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(155, 'italigtb2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(156, 'italigto', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(157, 'jackal', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(158, 'jb700', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(159, 'jester', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(160, 'jester3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(161, 'kamacho', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(162, 'khamelion', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(163, 'kuruma', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(167, 'landstalker', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(168, 'le7b', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(169, 'lectro', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(170, 'lurcher', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(171, 'lynx', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(172, 'mamba', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(173, 'manana', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(174, 'manchez', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(175, 'massacro', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(176, 'massacro2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(178, 'mesa', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(179, 'mesa3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(180, 'michelli', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(181, 'minivan', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(182, 'minivan2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(183, 'monroe', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(184, 'moonbeam', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(185, 'moonbeam2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(186, 'mustangmach1', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(187, 'nemesis', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(188, 'neon', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(189, 'nero', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(190, 'nero2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(191, 'nightblade', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(192, 'nightshade', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(193, 'ninef', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(194, 'ninef2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(196, 'omnis', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(197, 'oracle', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(198, 'oracle2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(199, 'osiris', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(200, 'panto', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(202, 'pariah', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(203, 'patriot', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(204, 'patriot2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(205, 'pcj', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(206, 'penetrator', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(207, 'penumbra', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(208, 'peyote', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(209, 'pfister811', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(210, 'phoenix', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(211, 'picador', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(212, 'pigalle', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(214, 'pony2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(216, 'prairie', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(217, 'premier', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(218, 'primo', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(219, 'primo2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(220, 'prototipo', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(221, 'radi', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(222, 'raiden', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(223, 'rancherxl', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(224, 'rapidgt', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(225, 'rapidgt2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(226, 'rapidgt3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(227, 'raptor', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(229, 'ratbike', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(230, 'ratloader2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(231, 'reaper', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(233, 'rebel2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(234, 'retinue', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(235, 'rhapsody', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(236, 'riata', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(237, 'rocoto', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(238, 'ruffian', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(239, 'ruiner', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(243, 'ruston', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(244, 'sabregt', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(245, 'sabregt2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(246, 'sadler', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(247, 'sanchez', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(248, 'sanchez2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(249, 'sandking', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(250, 'sandking2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(251, 'sc1', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(252, 'schafter3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(253, 'schafter4', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(255, 'schlagen', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(256, 'schwarzer', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(257, 'seminole', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(258, 'sentinel', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(259, 'sentinel2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(260, 'sentinel3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(261, 'serrano', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(262, 'seven70', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(263, 'sheava', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(265, 'slamvan', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(266, 'slamvan3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(267, 'sovereign', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(268, 'specter', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(269, 'specter2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(270, 'speedo', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(271, 'stafford', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(272, 'stalion', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(274, 'stanier', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(275, 'stinger', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(276, 'stingergt', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(277, 'stratum', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(278, 'streiter', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(279, 'stretch', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(280, 'sultan', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(281, 'sultanrs', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(282, 'superd', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(283, 'surano', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(284, 'surfer', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(285, 'surge', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(286, 'swinger', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(287, 't20', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(288, 'tailgater', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(289, 'taipan', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(290, 'tampa', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(291, 'tampa2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(292, 'tempesta', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(293, 'teslaprior', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(295, 'thrust', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(296, 'torero', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(297, 'tornado', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(298, 'tornado2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(299, 'tornado5', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(300, 'tornado6', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(302, 'trophytruck', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(303, 'trophytruck2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(304, 'tropos', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(305, 'tulip', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(306, 'turismo2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(307, 'turismor', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(308, 'tyrant', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(309, 'tyrus', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(310, 'vacca', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(311, 'vader', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(312, 'vagner', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(313, 'vamos', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(314, 'verlierer2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(315, 'vigero', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(316, 'vindicator', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(317, 'virgo', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(318, 'virgo2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(319, 'virgo3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(320, 'visione', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(321, 'voltic', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(322, 'voodoo', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(323, 'voodoo2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(324, 'vortex', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(325, 'warrener', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(326, 'washington', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(327, 'windsor', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(328, 'windsor2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(329, 'wolfsbane', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(330, 'xa21', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(331, 'xls', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(333, 'yosemite', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(336, 'z190', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(337, 'zentorno', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(338, 'zion', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(339, 'zion2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(340, 'zombiea', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(341, 'zombieb', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(342, 'ztype', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(356, 'sanctus', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(357, 'nissangtr', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(358, 'nissanskyliner34', 49);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(359, 'pista', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(360, 'r6', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(361, 'bmws', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(362, 'z1000', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(363, 'cb500x', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(364, 'lancerevolutionx', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(365, 'foxshelby', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(366, 'amarok', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(368, 'elegy', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(369, 'toros', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(370, 'hakuchou2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(371, 'daemon', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(373, 'celta', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(374, 'foxsupra', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(375, 'lamborghinihuracan', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(376, 'fox600lt', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(377, 'xt700', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(378, 'x6m', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(379, 'lamtmc', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(380, 'nissangtrnismo', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(383, 'fc15', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(384, 'beetle74', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(385, 'fe86', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(386, 'btsupra94', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(387, 'palameila', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(388, 'africat', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(391, '911r', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(392, 'rc', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(393, 'eclipse', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(394, 'eleanor', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(397, 'r8ppi', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(398, 'amggtrr20', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(399, 'hcbr17', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(400, '17m760i', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(401, 'urus', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(408, 'p1', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(409, 'lancerevolution9', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(410, 'bmwm4gts', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(411, 'mazdarx7', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(412, 'ferrariitalia', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(413, 'raptor2017', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(414, 'c7', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(415, 'foxc8', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(416, 'porsche930', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(417, 'db11', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(418, 'defiante', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(419, 'foxbentley', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(420, 'foxrouver1', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(421, 'foxsnt', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(422, 'rmodmi8lb', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(423, 'lp700r', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(424, 'bme6tun', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(425, 'porsche992', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(426, 'thrax', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(427, 'zorrusso', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(428, 'tezeract', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(429, 'krieger', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(430, 'emerus', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(431, 'neo', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(432, 'paragon', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(433, 'paragon2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(434, 'dynasty', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(435, 'nebula', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(436, 'zion3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(437, 'kanjo', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(438, 'rrocket', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(439, 'gauntlet3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(440, 'gauntlet4', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(441, 'peyote2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(442, 'caracara2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(443, 'hellion', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(444, 'outlaw', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(445, 'formula', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(446, 'formula2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(447, 'novak', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(448, 'rebla', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(449, 'drafter', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(450, 'komoda', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(451, 'imorgon', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(452, 'issi7', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(453, 'jugular', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(454, 'locust', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(455, 'shotaro', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(456, 'stalion2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(457, 'dloader', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(458, 'baller5', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(459, 'baller6', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(460, 'xls2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(461, 'cog552', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(462, 'cognoscenti2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(463, 'raiden2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(464, 'schafter5', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(465, 'adder', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(466, 'mule4', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(467, 'rallytruck', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(468, 'paradise', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(469, 'pony', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(470, 'rumpo', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(471, 'rumpo2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(472, 'rumpo3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(473, 'youga', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(474, 'taipam', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(475, 'deveste', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(476, 'gcr2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(477, 'rabike', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(478, 'bmwm3f80', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(479, 'mercedesa45', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(480, 'type263', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(481, 'h2carb', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(482, 'rmodgt63', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(483, 'gtr', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(484, 'r820', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(485, 'mlnovitec', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(486, 'r1200', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(487, '720stc', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(488, 'lanex400', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(489, 'paramedicoambu', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(490, 'paramedicocharger2014', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(491, '18charger', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(492, 'ffocus_speed', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(493, '11caprice', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(494, 'policiavictoria', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(495, 'africatp', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(498, 'tiger', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(499, 'r1250', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(500, 'amarokp', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(501, 'av', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(503, 'nc7', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(508, 'flatbed', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(509, 'taxi', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(510, 'boxville4', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(511, 'tribike3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(512, 'trash', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(513, 'trash2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(514, 'tiptruck', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(515, 'scorcher', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(516, 'tribike', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(517, 'tribike2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(518, 'fixter', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(519, 'cruiser', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(520, 'bmx', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(521, 'seashark', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(522, 'tropic', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(523, 'suntrap', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(524, 'speeder', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(525, 'dinghy', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(532, 'felon2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(569, 'slamvan2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(587, 'rebel', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(589, 'tractor2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(592, 'ratloader', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(705, 'stromberg', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(716, 'viseris', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(762, 'youga2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(782, 'gburrito', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(843, '488gtb', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(844, 'fxxkevo', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(846, 'mustang', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(848, 'gtrnismo', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(855, 'm2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(859, 'toyotasupra', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(860, '370z', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(864, 'speedo4', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(868, 'brutus', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(873, 'imperator', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(879, 'deathbike', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(881, 'ninjah2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(882, 'trr', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(883, 'i8', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(884, 'lwhuracan', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(887, 'aperta', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(888, 'bettle', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(889, 'senna', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(890, 'rmodx6', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(891, 'bnteam', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(892, 'rmodlp770', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(893, 'divo', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(894, 's15', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(895, 'amggtr', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(897, 'vantage', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(899, 'g65amg', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(901, 'slsamg', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(904, 'rmodamgc63', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(908, 'rsvr16', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(909, 'veneno', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(910, '19ramdonk', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(911, 'silv86', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(913, 'bc', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(914, '70camarofn', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(916, 'bbentayga', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(917, 'nissantitan17', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(918, 'regera', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(921, 'msohs', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(922, 'gt17', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(923, 'defiant', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(924, 'f12tdf', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(925, '71gtx', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(927, '18macan', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(928, 'm6e63', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(929, '19ftype', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(931, 'tug', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(932, '180sx', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(938, 'filthynsx', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(939, '2018zl1', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(944, 'yzfr125', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(945, 'pistas', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(946, 'mt03', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(947, 'flatbed3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(948, 'SVR14', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(949, 'evoq', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(950, 'Bimota', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(952, 'bobbes2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(953, 'bobber', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(954, '911tbs', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(955, 'volatus', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(957, 'cargobob2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(959, 'foxbent1', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(960, 'foxevo', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(961, 'jeepg', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(962, 'foxharley1', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(963, 'foxharley2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(964, 'foxleggera', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(965, 'foxrossa', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(967, 'foxsian', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(968, 'foxsterrato', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(970, 'm6x6', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(971, 'm6gt3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(972, 'w900', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(973, 'savestra', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(974, 'polgs350', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(975, 'ghispo2', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(976, 'typer', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(977, 'a45', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(978, 'gl63', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(979, 'giulia', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(980, 'amggt63s', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(982, 'lp770r', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(983, 'fusca', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(984, 'alpinab7', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(985, 'rmodjeep', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(986, 'rmodmartin', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(987, 'rmodm5e34', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(988, 'rmodcharger69', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(989, 'rmodjesko', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(990, 'rmodc63amg', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(991, 'rmodgtr50', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(992, 'm3f80wb', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(993, '2019gt3rs', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(994, 'lancer9', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(995, 'huracan', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(996, 'gs1', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(997, 'r1', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(998, '20r1', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(999, 'nh2r', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(1000, 'golfgti', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(1001, 'rmodrs6', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(1002, 'rmodf40', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(1003, 'rmodsianr', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(1004, 'rmode63s', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(1005, 'pmansory', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(1006, 'm3gtr', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(1007, 'MonalisaFF3', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(1009, 'agera', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(1010, '918', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(1011, 'ttrs', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(1013, 'aventador', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(1014, 'ySbrImpS11', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(1015, 'mach1', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(1016, '18Velar', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(1017, 'rmodcamaro', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(1018, 'rmodmk7', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(1019, 'jellybigpeen', 50);
INSERT INTO `vrp_estoque` (id, vehicle, quantidade) VALUES(1020, 'silvia', 50);
/*!40000 ALTER TABLE `vrp_estoque` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.vrp_homes_permissions
CREATE TABLE IF NOT EXISTS `vrp_homes_permissions` (
  `home` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `owner` int(1) NOT NULL DEFAULT 0,
  `tax` int(11) NOT NULL DEFAULT 1572029150,
  `garage` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`home`,`user_id`),
  KEY `home` (`home`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela vrp.vrp_homes_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_homes_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_homes_permissions` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.vrp_login
CREATE TABLE IF NOT EXISTS `vrp_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela vrp.vrp_login: 0 rows
/*!40000 ALTER TABLE `vrp_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_login` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.vrp_priority
CREATE TABLE IF NOT EXISTS `vrp_priority` (
  `passport` int(11) NOT NULL,
  `steam` varchar(100) NOT NULL,
  `priority` int(11) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`passport`,`steam`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela vrp.vrp_priority: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_priority` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_priority` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.vrp_srv_data
CREATE TABLE IF NOT EXISTS `vrp_srv_data` (
  `dkey` varchar(100) NOT NULL,
  `dvalue` text DEFAULT NULL,
  PRIMARY KEY (`dkey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela vrp.vrp_srv_data: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_srv_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_srv_data` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.vrp_users
CREATE TABLE IF NOT EXISTS `vrp_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_login` varchar(255) DEFAULT NULL,
  `whitelisted` tinyint(1) DEFAULT NULL,
  `banned` tinyint(1) DEFAULT NULL,
  `garagem` int(3) NOT NULL DEFAULT 5,
  `pets` varchar(50) NOT NULL,
  `phone` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela vrp.vrp_users: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_users` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.vrp_user_data
CREATE TABLE IF NOT EXISTS `vrp_user_data` (
  `user_id` int(11) NOT NULL,
  `dkey` varchar(100) NOT NULL,
  `dvalue` text DEFAULT NULL,
  PRIMARY KEY (`user_id`,`dkey`),
  CONSTRAINT `fk_user_data_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela vrp.vrp_user_data: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_user_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_user_data` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.vrp_user_homes
CREATE TABLE IF NOT EXISTS `vrp_user_homes` (
  `user_id` int(11) NOT NULL,
  `home` varchar(255) NOT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`home`),
  CONSTRAINT `fk_user_homes_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela vrp.vrp_user_homes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_user_homes` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_user_homes` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.vrp_user_identities
CREATE TABLE IF NOT EXISTS `vrp_user_identities` (
  `user_id` int(11) NOT NULL,
  `registration` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `registration` (`registration`),
  KEY `phone` (`phone`),
  CONSTRAINT `fk_user_identities_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela vrp.vrp_user_identities: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_user_identities` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_user_identities` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.vrp_user_ids
CREATE TABLE IF NOT EXISTS `vrp_user_ids` (
  `identifier` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  PRIMARY KEY (`identifier`),
  KEY `fk_user_ids_users` (`user_id`),
  CONSTRAINT `fk_user_ids_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela vrp.vrp_user_ids: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_user_ids` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_user_ids` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.vrp_user_moneys
CREATE TABLE IF NOT EXISTS `vrp_user_moneys` (
  `user_id` int(11) NOT NULL,
  `wallet` int(11) DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_moneys_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela vrp.vrp_user_moneys: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_user_moneys` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_user_moneys` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.vrp_user_vehicles
CREATE TABLE IF NOT EXISTS `vrp_user_vehicles` (
  `user_id` int(11) NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `detido` int(1) NOT NULL DEFAULT 0,
  `time` varchar(24) NOT NULL DEFAULT '0',
  `engine` int(4) NOT NULL DEFAULT 1000,
  `body` int(4) NOT NULL DEFAULT 1000,
  `fuel` int(3) NOT NULL DEFAULT 100,
  `ipva` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`vehicle`),
  CONSTRAINT `fk_user_vehicles_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela vrp.vrp_user_vehicles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_user_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_user_vehicles` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.yordi_twitter_accounts
CREATE TABLE IF NOT EXISTS `yordi_twitter_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela vrp.yordi_twitter_accounts: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `yordi_twitter_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `yordi_twitter_accounts` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.yordi_twitter_likes
CREATE TABLE IF NOT EXISTS `yordi_twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  KEY `FK_twitter_likes_twitter_tweets` (`tweetId`),
  CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `yordi_twitter_accounts` (`id`),
  CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `yordi_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela vrp.yordi_twitter_likes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `yordi_twitter_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `yordi_twitter_likes` ENABLE KEYS */;

-- Copiando estrutura para tabela vrp.yordi_twitter_tweets
CREATE TABLE IF NOT EXISTS `yordi_twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_tweets_twitter_accounts` (`authorId`),
  CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `yordi_twitter_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela vrp.yordi_twitter_tweets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `yordi_twitter_tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `yordi_twitter_tweets` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
