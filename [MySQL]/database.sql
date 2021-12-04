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
INSERT INTO `vrp_estoque` (`id`, `vehicle`, `quantidade`) VALUES
	(2, 'akuma', 9),
	(3, 'alpha', 10),
	(4, 'asea', 14),
	(5, 'asterope', 9),
	(6, 'audirs6', 10),
	(7, 'audirs7', 10),
	(8, 'autarch', 10),
	(9, 'avarus', 10),
	(10, 'bagger', 9),
	(11, 'baller', 10),
	(12, 'baller2', 7),
	(13, 'baller3', 7),
	(14, 'baller4', 9),
	(17, 'banshee', 10),
	(18, 'banshee2', 8),
	(19, 'bati', 9),
	(20, 'bati2', 10),
	(21, 'bestiagts', 10),
	(22, 'bf400', 6),
	(23, 'bfinjection', 10),
	(24, 'bifta', 6),
	(25, 'bison', 10),
	(26, 'bison2', 9),
	(27, 'bjxl', 9),
	(28, 'blade', 15),
	(29, 'blazer', 10),
	(30, 'blazer4', 4),
	(31, 'blista', 49),
	(32, 'blista2', 8),
	(33, 'blista3', 9),
	(35, 'bobcatxl', 9),
	(36, 'bodhi2', 8),
	(37, 'brawler', 10),
	(38, 'brioso', 0),
	(39, 'btype', 10),
	(40, 'btype2', 10),
	(41, 'btype3', 9),
	(42, 'buccaneer', 15),
	(43, 'buccaneer2', 15),
	(44, 'buffalo', 10),
	(45, 'buffalo2', 10),
	(46, 'buffalo3', 10),
	(47, 'bullet', 9),
	(48, 'burrito', 2),
	(49, 'burrito2', 7),
	(50, 'burrito3', 2),
	(51, 'burrito4', 7),
	(52, 'carbonizzare', 8),
	(53, 'carbonrs', 10),
	(54, 'casco', 10),
	(55, 'cavalcade', 10),
	(56, 'cavalcade2', 10),
	(57, 'cheburek', 4),
	(58, 'cheetah', 9),
	(59, 'cheetah2', 10),
	(60, 'chimera', 10),
	(61, 'chino', 15),
	(62, 'chino2', 14),
	(63, 'cliffhanger', 10),
	(64, 'clique', 15),
	(65, 'cog55', 10),
	(67, 'cogcabrio', 15),
	(68, 'cognoscenti', 10),
	(70, 'comet2', 10),
	(71, 'comet3', 8),
	(72, 'comet5', 9),
	(73, 'contender', 6),
	(74, 'coquette', 6),
	(75, 'coquette2', 10),
	(76, 'coquette3', 9),
	(77, 'cyclone', 10),
	(78, 'daemon2', 10),
	(79, 'defiler', 5),
	(81, 'deviant', 15),
	(82, 'diablous', 9),
	(83, 'diablous2', 8),
	(84, 'dilettante', 15),
	(85, 'dodgechargersrt', 10),
	(86, 'dominator', 14),
	(87, 'dominator2', 10),
	(88, 'dominator3', 15),
	(89, 'double', 0),
	(90, 'dubsta', 10),
	(91, 'dubsta2', 6),
	(92, 'dubsta3', 9),
	(93, 'dukes', 14),
	(95, 'elegy2', 9),
	(96, 'ellie', 15),
	(97, 'emperor', 10),
	(98, 'emperor2', 10),
	(99, 'enduro', 1),
	(100, 'entity2', 10),
	(101, 'entityxf', 9),
	(102, 'esskey', 1),
	(103, 'exemplar', 8),
	(104, 'f620', 16),
	(105, 'faction', 15),
	(106, 'faction2', 14),
	(107, 'faction3', 15),
	(108, 'fagaloa', 10),
	(109, 'faggio', 7),
	(110, 'faggio2', 11),
	(111, 'faggio3', 8),
	(112, 'fcr', 10),
	(113, 'fcr2', 10),
	(114, 'felon', 13),
	(115, 'feltzer2', 10),
	(116, 'feltzer3', 10),
	(117, 'flashgt', 8),
	(118, 'fmj', 9),
	(119, 'focusrs', 11),
	(120, 'fordmustang', 7),
	(121, 'fq2', 10),
	(122, 'freecrawler', 9),
	(123, 'fugitive', 9),
	(124, 'furoregt', 9),
	(125, 'fusilade', 10),
	(126, 'futo', 9),
	(127, 'gargoyle', 1),
	(128, 'gauntlet', 15),
	(129, 'gauntlet2', 10),
	(130, 'gb200', 10),
	(131, 'glendale', 10),
	(132, 'gp1', 10),
	(133, 'granger', 10),
	(134, 'gresley', 9),
	(135, 'gt500', 10),
	(136, 'guardian', 47),
	(137, 'habanero', 10),
	(138, 'hakuchou', 4),
	(140, 'hermes', 14),
	(141, 'hexer', 0),
	(142, 'hondafk8', 10),
	(143, 'hotknife', 15),
	(144, 'hotring', 10),
	(145, 'huntley', 9),
	(146, 'impaler', 9),
	(147, 'infernus', 11),
	(148, 'infernus2', 10),
	(149, 'ingot', 10),
	(150, 'innovation', 0),
	(151, 'intruder', 10),
	(152, 'issi2', 16),
	(153, 'issi3', 9),
	(154, 'italigtb', 9),
	(155, 'italigtb2', 8),
	(156, 'italigto', 5),
	(157, 'jackal', 7),
	(158, 'jb700', 10),
	(159, 'jester', 8),
	(160, 'jester3', 10),
	(161, 'kamacho', 7),
	(162, 'khamelion', 9),
	(163, 'kuruma', 0),
	(167, 'landstalker', 10),
	(168, 'le7b', 10),
	(169, 'lectro', 1),
	(170, 'lurcher', 10),
	(171, 'lynx', 10),
	(172, 'mamba', 10),
	(173, 'manana', 10),
	(174, 'manchez', 9),
	(175, 'massacro', 10),
	(176, 'massacro2', 10),
	(178, 'mesa', 9),
	(179, 'mesa3', 9),
	(180, 'michelli', 10),
	(181, 'minivan', 10),
	(182, 'minivan2', 10),
	(183, 'monroe', 10),
	(184, 'moonbeam', 15),
	(185, 'moonbeam2', 14),
	(186, 'mustangmach1', 10),
	(187, 'nemesis', 2),
	(188, 'neon', 0),
	(189, 'nero', 10),
	(190, 'nero2', 8),
	(191, 'nightblade', 0),
	(192, 'nightshade', 15),
	(193, 'ninef', 10),
	(194, 'ninef2', 9),
	(196, 'omnis', 10),
	(197, 'oracle', 13),
	(198, 'oracle2', 13),
	(199, 'osiris', 7),
	(200, 'panto', 40),
	(202, 'pariah', 5),
	(203, 'patriot', 10),
	(204, 'patriot2', 10),
	(205, 'pcj', 10),
	(206, 'penetrator', 10),
	(207, 'penumbra', 9),
	(208, 'peyote', 10),
	(209, 'pfister811', 7),
	(210, 'phoenix', 10),
	(211, 'picador', 14),
	(212, 'pigalle', 10),
	(214, 'pony2', 7),
	(216, 'prairie', 5),
	(217, 'premier', 10),
	(218, 'primo', 9),
	(219, 'primo2', 10),
	(220, 'prototipo', 10),
	(221, 'radi', 10),
	(222, 'raiden', 3),
	(223, 'rancherxl', 10),
	(224, 'rapidgt', 10),
	(225, 'rapidgt2', 10),
	(226, 'rapidgt3', 9),
	(227, 'raptor', 9),
	(229, 'ratbike', 0),
	(230, 'ratloader2', 15),
	(231, 'reaper', 9),
	(233, 'rebel2', 10),
	(234, 'retinue', 9),
	(235, 'rhapsody', 8),
	(236, 'riata', 9),
	(237, 'rocoto', 10),
	(238, 'ruffian', 4),
	(239, 'ruiner', 15),
	(243, 'ruston', 10),
	(244, 'sabregt', 14),
	(245, 'sabregt2', 14),
	(246, 'sadler', 10),
	(247, 'sanchez', 0),
	(248, 'sanchez2', 3),
	(249, 'sandking', 7),
	(250, 'sandking2', 10),
	(251, 'sc1', 10),
	(252, 'schafter3', 9),
	(253, 'schafter4', 9),
	(255, 'schlagen', 8),
	(256, 'schwarzer', 10),
	(257, 'seminole', 10),
	(258, 'sentinel', 13),
	(259, 'sentinel2', 10),
	(260, 'sentinel3', 2),
	(261, 'serrano', 10),
	(262, 'seven70', 10),
	(263, 'sheava', 10),
	(265, 'slamvan', 15),
	(266, 'slamvan3', 12),
	(267, 'sovereign', 1),
	(268, 'specter', 10),
	(269, 'specter2', 9),
	(270, 'speedo', 7),
	(271, 'stafford', 10),
	(272, 'stalion', 15),
	(274, 'stanier', 10),
	(275, 'stinger', 10),
	(276, 'stingergt', 10),
	(277, 'stratum', 10),
	(278, 'streiter', 10),
	(279, 'stretch', 10),
	(280, 'sultan', 9),
	(281, 'sultanrs', 6),
	(282, 'superd', 10),
	(283, 'surano', 10),
	(284, 'surfer', 10),
	(285, 'surge', 9),
	(286, 'swinger', 10),
	(287, 't20', 10),
	(288, 'tailgater', 10),
	(289, 'taipan', 10),
	(290, 'tampa', 14),
	(291, 'tampa2', 10),
	(292, 'tempesta', 17),
	(293, 'teslaprior', 9),
	(295, 'thrust', 8),
	(296, 'torero', 10),
	(297, 'tornado', 10),
	(298, 'tornado2', 10),
	(299, 'tornado5', 10),
	(300, 'tornado6', 9),
	(302, 'trophytruck', 10),
	(303, 'trophytruck2', 10),
	(304, 'tropos', 9),
	(305, 'tulip', 13),
	(306, 'turismo2', 10),
	(307, 'turismor', 19),
	(308, 'tyrant', 10),
	(309, 'tyrus', 19),
	(310, 'vacca', 10),
	(311, 'vader', 2),
	(312, 'vagner', 19),
	(313, 'vamos', 15),
	(314, 'verlierer2', 10),
	(315, 'vigero', 15),
	(316, 'vindicator', 9),
	(317, 'virgo', 15),
	(318, 'virgo2', 15),
	(319, 'virgo3', 15),
	(320, 'visione', 15),
	(321, 'voltic', 20),
	(322, 'voodoo', 15),
	(323, 'voodoo2', 10),
	(324, 'vortex', 0),
	(325, 'warrener', 9),
	(326, 'washington', 10),
	(327, 'windsor', 15),
	(328, 'windsor2', 14),
	(329, 'wolfsbane', 0),
	(330, 'xa21', 14),
	(331, 'xls', 5),
	(333, 'yosemite', 13),
	(336, 'z190', 10),
	(337, 'zentorno', 9),
	(338, 'zion', 14),
	(339, 'zion2', 9),
	(340, 'zombiea', 0),
	(341, 'zombieb', 1),
	(342, 'ztype', 10),
	(356, 'sanctus', 0),
	(357, 'nissangtr', 10),
	(358, 'nissanskyliner34', 8),
	(359, 'pista', 0),
	(360, 'r6', 10),
	(361, 'bmws', 10),
	(362, 'z1000', 10),
	(363, 'cb500x', 8),
	(364, 'lancerevolutionx', 7),
	(365, 'foxshelby', 5),
	(366, 'amarok', 10),
	(368, 'elegy', 9),
	(369, 'toros', 5),
	(370, 'hakuchou2', 4),
	(371, 'daemon', 0),
	(373, 'celta', 0),
	(374, 'foxsupra', 0),
	(375, 'lamborghinihuracan', 2),
	(376, 'fox600lt', 5),
	(377, 'xt700', 10),
	(378, 'x6m', 5),
	(379, 'lamtmc', 5),
	(380, 'nissangtrnismo', 8),
	(383, 'fc15', 5),
	(384, 'beetle74', 11),
	(385, 'fe86', 0),
	(386, 'btsupra94', 0),
	(387, 'palameila', 10),
	(388, 'africat', 10),
	(391, '911r', 10),
	(392, 'rc', 10),
	(393, 'eclipse', 10),
	(394, 'eleanor', 5),
	(397, 'r8ppi', 10),
	(398, 'amggtrr20', 3),
	(399, 'hcbr17', 4),
	(400, '17m760i', 10),
	(401, 'urus', 10),
	(408, 'p1', 10),
	(409, 'lancerevolution9', 10),
	(410, 'bmwm4gts', 0),
	(411, 'mazdarx7', 9),
	(412, 'ferrariitalia', 4),
	(413, 'raptor2017', 8),
	(414, 'c7', 9),
	(415, 'foxc8', 10),
	(416, 'porsche930', 11),
	(417, 'db11', 10),
	(418, 'defiante', 10),
	(419, 'foxbentley', 10),
	(420, 'foxrouver1', 10),
	(421, 'foxsnt', 10),
	(422, 'rmodmi8lb', 5),
	(423, 'lp700r', 5),
	(424, 'bme6tun', 10),
	(425, 'porsche992', 10),
	(426, 'thrax', 9),
	(427, 'zorrusso', 10),
	(428, 'tezeract', 10),
	(429, 'krieger', 10),
	(430, 'emerus', 10),
	(431, 'neo', 10),
	(432, 'paragon', 10),
	(433, 'paragon2', 0),
	(434, 'dynasty', 10),
	(435, 'nebula', 10),
	(436, 'zion3', 10),
	(437, 'kanjo', 9),
	(438, 'rrocket', 10),
	(439, 'gauntlet3', 9),
	(440, 'gauntlet4', 8),
	(441, 'peyote2', 10),
	(442, 'caracara2', 10),
	(443, 'hellion', 9),
	(444, 'outlaw', 9),
	(445, 'formula', 0),
	(446, 'formula2', 0),
	(447, 'novak', 10),
	(448, 'rebla', 9),
	(449, 'drafter', 10),
	(450, 'komoda', 9),
	(451, 'imorgon', 10),
	(452, 'issi7', 10),
	(453, 'jugular', 10),
	(454, 'locust', 10),
	(455, 'shotaro', 25),
	(456, 'stalion2', 10),
	(457, 'dloader', 10),
	(458, 'baller5', 3),
	(459, 'baller6', 3),
	(460, 'xls2', 10),
	(461, 'cog552', 10),
	(462, 'cognoscenti2', 10),
	(463, 'raiden2', 10),
	(464, 'schafter5', 10),
	(465, 'adder', 5),
	(466, 'mule4', 10),
	(467, 'rallytruck', 10),
	(468, 'paradise', 10),
	(469, 'pony', 10),
	(470, 'rumpo', 10),
	(471, 'rumpo2', 10),
	(472, 'rumpo3', 10),
	(473, 'youga', 10),
	(474, 'taipam', 10),
	(475, 'deveste', 2),
	(476, 'gcr2', 10),
	(477, 'rabike', 10),
	(478, 'bmwm3f80', 2),
	(479, 'mercedesa45', 5),
	(480, 'type263', 5);
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
