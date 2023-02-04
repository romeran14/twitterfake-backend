-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-02-2023 a las 21:56:47
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `twitter_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `twetts`
--

CREATE TABLE `twetts` (
  `idtwetts` int(11) NOT NULL,
  `text` varchar(280) DEFAULT NULL,
  `creationDate` datetime NOT NULL,
  `Retweet` int(11) DEFAULT NULL,
  `users_Userid` int(11) NOT NULL,
  `img` varchar(90) DEFAULT 'NULL',
  `Retweet_count` int(11) NOT NULL DEFAULT 0,
  `Retweet_original_username` varchar(45) DEFAULT NULL,
  `LikesId` int(11) DEFAULT NULL,
  `Like_count` int(11) NOT NULL DEFAULT 0,
  `Like_original_username` varchar(45) DEFAULT NULL,
  `Comments_count` int(11) DEFAULT 0,
  `Is_comment` int(11) DEFAULT NULL,
  `Comment_original_username` varchar(45) DEFAULT NULL,
  `rtwUserid` int(11) DEFAULT NULL,
  `lkUserid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `twetts`
--

INSERT INTO `twetts` (`idtwetts`, `text`, `creationDate`, `Retweet`, `users_Userid`, `img`, `Retweet_count`, `Retweet_original_username`, `LikesId`, `Like_count`, `Like_original_username`, `Comments_count`, `Is_comment`, `Comment_original_username`, `rtwUserid`, `lkUserid`) VALUES
(272, 'Lorem ipsum 1', '2022-09-25 15:45:11', NULL, 55, NULL, 1, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL, NULL),
(273, 'Lorem ipsum 2', '2022-09-25 15:45:16', NULL, 55, NULL, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(274, 'Lorem ipsum 3', '2022-09-25 15:45:20', NULL, 55, NULL, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(275, 'Lorem ipsum 4', '2022-09-25 15:45:24', NULL, 55, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(276, 'Lorem ipsum 5', '2022-09-25 15:45:27', NULL, 55, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(278, 'Ipsum Lorem 7', '2022-09-25 15:46:03', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(279, 'Ipsum Lorem 8', '2022-09-25 15:46:06', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(280, 'Ipsum Lorem 9', '2022-09-25 15:46:10', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(281, 'Ipsum Lorem 10', '2022-09-25 15:46:13', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(282, 'lorem lorem lorem 11', '2022-09-25 15:47:11', NULL, 47, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(283, 'lorem lorem lorem 12', '2022-09-25 15:47:14', NULL, 47, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(284, 'lorem lorem lorem 13', '2022-09-25 15:47:17', NULL, 47, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(285, 'lorem lorem lorem 14', '2022-09-25 15:47:21', NULL, 47, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(286, 'lorem lorem lorem 15', '2022-09-25 15:47:24', NULL, 47, NULL, 0, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, NULL),
(287, 'Ipsum Ipsum Ipsum 16', '2022-09-25 15:48:23', NULL, 54, NULL, 1, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, NULL),
(288, 'Ipsum Ipsum Ipsum 17', '2022-09-25 15:48:26', NULL, 54, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(289, 'Ipsum Ipsum Ipsum 18', '2022-09-25 15:48:29', NULL, 54, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(290, 'Ipsum Ipsum Ipsum 19', '2022-09-25 15:48:32', NULL, 54, NULL, 0, NULL, NULL, 2, NULL, 1, NULL, NULL, NULL, NULL),
(291, 'Ipsum Ipsum Ipsum 20', '2022-09-25 15:48:37', NULL, 54, NULL, 1, NULL, NULL, 2, NULL, -1, NULL, NULL, NULL, NULL),
(292, 'hola 21', '2022-09-25 15:49:24', NULL, 52, NULL, 2, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL, NULL),
(293, 'hola 22', '2022-09-25 15:49:28', NULL, 52, NULL, 1, NULL, NULL, 2, NULL, 1, NULL, NULL, NULL, NULL),
(294, 'hola 23', '2022-09-25 15:49:32', NULL, 52, NULL, 0, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL, NULL),
(295, 'hola 24', '2022-09-25 15:49:35', NULL, 52, NULL, 1, NULL, NULL, 2, NULL, 0, NULL, NULL, NULL, NULL),
(296, 'hola 25', '2022-09-25 15:49:39', NULL, 52, NULL, 3, NULL, NULL, 3, NULL, 0, NULL, NULL, NULL, NULL),
(337, 'hola 25', '2022-09-29 17:57:39', 296, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(338, 'hola 25', '2022-09-29 17:57:47', NULL, 50, NULL, 0, NULL, 296, 0, NULL, 0, NULL, NULL, NULL, NULL),
(339, 'hola 25', '2022-09-29 22:21:55', 296, 47, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(340, 'Ipsum Ipsum Ipsum 20', '2022-09-29 22:22:05', NULL, 47, NULL, 0, NULL, 291, 0, NULL, 0, NULL, NULL, NULL, NULL),
(342, 'hola 25', '2022-09-29 22:22:35', 296, 47, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(343, 'hola 25', '2022-09-29 22:25:24', NULL, 47, NULL, 0, NULL, 296, 0, NULL, 0, NULL, NULL, NULL, NULL),
(344, 'Lorem ipsum 1', '2022-09-29 22:25:56', 272, 47, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(392, 'Respuesta', '2022-10-05 13:51:28', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(393, 'alo', '2022-10-05 14:03:14', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 12, NULL, NULL, NULL, NULL),
(394, 'hola 22', '2022-10-05 19:11:17', 293, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(395, 'hola 22', '2022-10-05 19:11:47', NULL, 50, NULL, 0, NULL, 293, 0, NULL, 0, NULL, NULL, NULL, NULL),
(397, 'alo response', '2022-10-05 19:30:31', NULL, 50, NULL, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(403, 'Respuesta a Ipsum Ipsum Ipsum 20', '2022-10-06 09:43:17', NULL, 52, NULL, 1, NULL, NULL, 1, NULL, 0, 291, 'Romeran', NULL, NULL),
(405, 'Respuesta a Ipsum Ipsum Ipsum 20', '2022-10-06 09:51:16', 403, 50, NULL, 0, NULL, NULL, 0, NULL, 0, 291, 'RogerFederer', NULL, NULL),
(407, 'Ipsum Ipsum Ipsum 16', '2022-10-07 10:45:29', 287, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(415, 'hollaaaaa', '2022-10-08 15:28:26', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, 287, 'RogerFederer', NULL, NULL),
(416, 'alo response of alo response', '2022-10-08 15:31:13', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, 393, 'Rome', NULL, NULL),
(418, 'respuesta a hola 22 rt', '2022-10-08 15:42:24', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, 293, 'Jesus', NULL, NULL),
(419, 'AMIIIIIII', '2022-10-08 18:00:24', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(420, 'aloski', '2022-10-08 18:49:08', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, NULL),
(427, 'khgj', '2022-10-09 15:16:28', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, 393, 'Rome', NULL, NULL),
(428, 'hup', '2022-10-09 15:16:41', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 1, 393, 'Rome', NULL, NULL),
(430, 'respuesta a aloski', '2022-10-09 15:36:12', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, 420, 'Rome', NULL, NULL),
(456, 'xsc', '2022-10-13 13:29:28', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, NULL),
(457, 'csdsd', '2022-10-13 13:29:35', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(458, 'dvadf', '2022-10-13 13:30:47', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(459, 'fsdf', '2022-10-13 13:51:15', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, NULL),
(464, 'dnla', '2022-10-14 15:28:54', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(466, 'alojaxx', '2022-10-14 15:39:17', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(467, 'kjhk @ewggksjn', '2022-10-14 15:41:02', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(468, 'fdlkjlsd @[Romeran](51)', '2022-10-16 15:21:13', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(480, 'hola 21', '2022-10-19 15:15:11', 292, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(485, 'hola 24', '2022-10-20 22:54:04', 295, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(487, 'lksfn @[kjadkb](49) ', '2022-10-22 18:34:32', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, 456, NULL, NULL, NULL),
(491, 'dfh', '2022-11-02 22:09:06', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(492, 'alkslakhdla', '2022-11-03 12:33:05', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(494, 'sdg', '2022-11-03 17:31:24', NULL, 50, 'yfagpbx8pd35nvsgkpn8', 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(495, 'fshdfhv', '2022-11-03 17:44:10', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, 393, 'Rome', NULL, NULL),
(496, 'svaagvaf', '2022-11-04 00:13:18', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(497, 'afaf', '2022-11-04 00:13:38', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(499, 'Lorem ipsum 2', '2022-11-04 16:47:32', 273, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(500, 'Lorem ipsum 3', '2022-11-04 16:48:00', 274, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(501, 'Ipsum Ipsum Ipsum 20', '2022-11-04 17:21:47', 291, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(502, 'otra resúesta a alo', '2022-11-06 17:16:14', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, 393, 'Rome', NULL, NULL),
(503, 'hrh @[kjadkb](49) ', '2022-11-06 17:19:04', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(504, 'Hola mami @[Soraya](57) ', '2022-11-06 17:46:37', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, NULL),
(505, 'Holaaaa', '2022-11-06 17:46:56', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, 504, 'Rome', NULL, NULL),
(506, 'ssssfff', '2022-11-06 17:49:13', NULL, 50, 'c86txw7a99wio5lki4x7', 1, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(507, 'Soy jose', '2022-11-06 17:58:40', NULL, 58, NULL, 0, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, NULL),
(509, 'sgsdga af ', '2022-11-06 19:43:57', NULL, 64, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(510, 'ssssfff', '2022-11-06 19:44:10', 506, 64, 'c86txw7a99wio5lki4x7', 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(511, 'hola Jose', '2022-11-06 19:44:26', NULL, 64, NULL, 1, NULL, NULL, 2, NULL, 1, 507, 'Jose', NULL, NULL),
(512, 'lskf @[Facundo Gomez Bolaño](64) ', '2022-11-06 19:49:50', NULL, 64, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(513, 'adljd @[Facundo Gomez Bolaño](64) ', '2022-11-06 19:52:17', NULL, 64, NULL, 0, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL, NULL),
(514, 'gdg @[Romeran](47) ', '2022-11-06 19:54:30', NULL, 64, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(515, 'sdggsd ', '2022-11-07 20:30:00', NULL, 50, NULL, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(516, 'zgsg', '2022-11-08 22:21:46', NULL, 50, NULL, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(517, 'hola Jose', '2022-11-08 22:32:42', NULL, 50, NULL, 0, NULL, 511, 0, NULL, 0, 507, 'Jose', NULL, NULL),
(518, 'Publicacion de prueba', '2022-11-09 17:37:31', NULL, 66, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(519, 'hola Jose', '2022-11-09 17:37:36', NULL, 66, NULL, 0, NULL, 511, 0, NULL, 0, 507, 'Jose', NULL, NULL),
(520, 'zgsg', '2022-11-09 17:37:37', 516, 66, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(521, 'sdggsd ', '2022-11-09 17:37:42', 515, 66, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(522, 'tesitos', '2022-11-10 22:32:14', NULL, 50, 'hw99x3layhupvglbn9hv', 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(523, 'hola 23', '2022-11-12 09:26:37', NULL, 50, NULL, 0, NULL, 294, 0, NULL, 0, NULL, NULL, NULL, NULL),
(525, 'Hola soy Rafael Nadal @[RogerFederer](54) ', '2022-11-12 09:51:00', NULL, 68, NULL, 0, NULL, NULL, 0, NULL, 3, NULL, NULL, NULL, NULL),
(526, 'Hola rafaaaa', '2022-11-12 09:52:20', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, 525, 'RafaelNadal', NULL, NULL),
(527, 'Como estais?', '2022-11-12 09:52:32', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, 525, 'RafaelNadal', NULL, NULL),
(528, 'Soy yo Rome', '2022-11-12 09:52:41', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, 525, 'RafaelNadal', NULL, NULL),
(531, 'Hola Mundo', '2022-11-12 12:22:44', NULL, 69, 'mp9loh1jkpfjanjegqzq', 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(532, 'hola Jose', '2022-11-12 12:23:29', 511, 69, NULL, 0, NULL, NULL, 0, NULL, 0, 507, 'Jose', NULL, NULL),
(533, 'Hola facundo @[RogerFederer](54) ', '2022-11-12 12:24:30', NULL, 69, NULL, 1, NULL, NULL, 1, NULL, 1, 511, 'Facundo Gomez Bolaño', NULL, NULL),
(534, 'hola messi soy tu fan', '2022-11-12 12:30:55', NULL, 71, NULL, 0, NULL, NULL, 0, NULL, 0, 533, 'Messi', NULL, NULL),
(535, 'twit de explicacion', '2022-11-12 12:31:39', NULL, 71, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(536, 'haciendo un twit', '2022-11-12 12:38:34', NULL, 71, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(537, 'hola', '2022-12-25 18:49:08', NULL, 71, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(538, '@[RogerFederer](54)  sapo', '2022-12-25 18:49:23', NULL, 71, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(539, 'fkljsfjksf', '2022-12-25 18:50:02', NULL, 71, NULL, 0, NULL, NULL, 0, NULL, 0, 290, 'RogerFederer', NULL, NULL),
(540, 'Ipsum Ipsum Ipsum 19', '2022-12-25 18:50:08', NULL, 71, NULL, 0, NULL, 290, 0, NULL, 0, NULL, NULL, NULL, NULL),
(542, 'Hola facundo @[RogerFederer](54) ', '2022-12-25 18:51:36', 533, 50, NULL, 0, NULL, NULL, 0, NULL, 0, 511, 'Facundo Gomez Bolaño', NULL, NULL),
(543, 'Hola facundo @[RogerFederer](54) ', '2022-12-25 18:51:37', NULL, 50, NULL, 0, NULL, 533, 0, NULL, 0, 511, 'Facundo Gomez Bolaño', NULL, NULL),
(544, 'afasfaf', '2022-12-25 18:52:51', NULL, 50, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `Userid` int(11) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `password` varchar(500) NOT NULL,
  `creationDate` datetime NOT NULL,
  `user_img` varchar(90) DEFAULT NULL,
  `about_me` varchar(200) DEFAULT NULL,
  `verified` tinyint(4) NOT NULL DEFAULT 0,
  `token` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`Userid`, `Username`, `Email`, `password`, `creationDate`, `user_img`, `about_me`, `verified`, `token`) VALUES
(47, 'Romeran', 'romeran14@gmail.com', '$2b$10$oG8GIqZf7gB1E7LIoji81OfOfPhuxQMCkvv03NmjFhWJyNZHj64s.', '2022-07-28 10:12:58', NULL, 'sfdd', 1, NULL),
(48, 'jaime', 'romeran14@gmail.com', '$2b$10$eWk4V5SkHEFrUs3XQ4/fnO2qz2imuWNWhQHoiemPAK689rG2wGbEm', '2022-07-29 16:08:32', 'hrkvveoedkky1e7ofadq', 'holis', 1, NULL),
(50, 'Rome', 'romeran14@gmail.com', '$2b$10$6ADXeKtqEpq2AEVv1djTm.SjBbMYKOGKb.wt5Ho8FcKjcxB26gPi.', '2022-08-07 13:55:13', 'ggsio1uyalhzyqdf9thq', 'Soy hacker', 1, NULL),
(51, 'Romeran', 'romeran14@gmail.com', '$2b$10$ieXCB4edvAyEo1nCpV7BK.sq6a/yLY.k38RkJ.Gmt3gVm1Sq4GIAi', '2022-08-20 14:09:53', 'jffcrs2oej09tebma9to', 'soy desarrollador', 0, '1621439a59404545f161a82ae63ba0b317f5d6d9974ffee4caa0490d7a3da221'),
(52, 'Jesus', 'romeran14@gmail.com', '$2b$10$eue3TpJ6xnNHmRjGh61vjejvyQ.Z6gi9JcJTAazuH3iNHvFGI8CGC', '2022-08-20 14:11:27', 'st7emlmm513emhmfmfab', 'adkjbakd', 1, NULL),
(53, 'Roger Federer', 'romeran14@gmail.com', '$2b$10$Em4cJmplPfzZAwHAJ2oDHu8Gb6.Z23G7wMs1BPlExiEjcS7BhQ6VO', '2022-09-18 18:21:54', 'xryfryndthjkmw6ofno4', 'Best player ever', 0, '91947e05c5a0b7d1c48c311b0afac09db5c3957f752287c86a5570b20b41a0cd'),
(54, 'RogerFederer', 'romeran14@gmail.com', '$2b$10$A1FgM1S5ut9aIZ6eDGTXc.UQEgfyLJXhhtD/bifs1n2SHd410L3gS', '2022-09-18 18:26:54', 'l1wjdzbr7vbwhmj7un2u', 'Best player ever', 1, NULL),
(55, 'Luis', 'romeran14@gmail.com', '$2b$10$BGhKTnlOJbPzCnpEfAonz.qQqJED3JTLl/r4DeuJ2vXekHXYKK9ye', '2022-09-25 15:29:53', 'rqwm1xqfggav7ydlj44m', '1234', 1, NULL),
(56, 'Victor', 'romeran14@gmail.com', '$2b$10$ugwEfOY7ZH1ZMdXd0AOF1ukMUfbULMGvbhIcbxF5xhgMmmMhnmrKq', '2022-10-19 15:20:30', 'mjnsdhao4siw39iw3hus', 'igiugi', 1, NULL),
(57, 'Soraya', 'romeran14@gmail.com', '$2b$10$uhuKjJIaD8wAZp8avzqgheyGir3BYFnRjksfIbnuf9/X1QWytlT9u', '2022-11-06 17:43:14', 'mxcdaoiwj9hlezdafsi4', 'Soy la mama de Romeran', 1, '08b51ff7e9dec1b5580bb74e2b709c8057cce8ee83f3757cac7ecd9da70bb317'),
(58, 'Jose', 'romeran14@gmail.com', '$2b$10$nDVcs/gISVxi.mVFLhot5OxY8GTCqXSwiI0sjEmRxTVEkceLuu/iC', '2022-11-06 17:56:58', 'vvuae3nno8v67wsbiuqh', 'asfaaffa', 1, NULL),
(61, 'Rafa Nadal', 'romeran14@gmail.com', '$2b$10$iZBjBscNjNEBBkt.AQn6qOLts5UUXb6iyG2THbUhGEPK.OiJ63/T2', '2022-11-06 19:24:31', 'lsyd1etsormwsjmc5y2h', 'Tenista español', 0, '2aa19a0f6dd9a06a82855f85c16ccd59645929a8a6e1089b46760d13255286cf'),
(62, 'Rafa Nadalx', 'romeran14@gmail.com', '$2b$10$hXc172mqCcLOjNNN8P7p2.oeErJHUfG66eFaHZnstUQpmAZ85m9Vy', '2022-11-06 19:29:41', NULL, 'asaf', 0, '84d2cc9567a6735330bd2c9e20d89bb50813ea22b4f327cd86b65cd78e17bac7'),
(63, 'Facundo Gomez', 'romeran14@gmail.com', '$2b$10$KyMlkk6zn3VSDQm.1yH0heLHzaOUMoORsJtrcu.b/cWATHGcaM73.', '2022-11-06 19:37:58', NULL, 'Hincha de Boca', 0, '4c1853711086d1e2db11ac19b1ad4fe5061aed67ee38cb9320de058ac7a6f281'),
(64, 'Facundo Gomez Bolaño', 'romeran14@gmail.com', '$2b$10$ESKANfyZ/ayndWJ6KwGNZ.HGG79vWKakTeCk/es4OvcK6lyutpwei', '2022-11-06 19:42:12', NULL, 'adaff', 1, NULL),
(65, 'ElJAvi', 'romeran14@gmail.com', '$2b$10$1a9/4Zy.JycKQdyghfQKH./xuvUzKgGbTbrqb5FoBIwrPu3llwjPa', '2022-11-07 19:55:31', NULL, 'afaga', 1, NULL),
(66, 'UsuarioPrueba', 'romeran14@gmail.com', '$2b$10$P5xJXs6IWad2EiApeOkkheJp6Y6Oxf127g6jkg4IPjbt1e.v.B8BC', '2022-11-09 17:35:24', 'ct79wqbwa53nxmqlc2ko', 'Informacion del usuario de prueba', 1, NULL),
(67, 'Juanito', 'romeran14@gmail.com', '$2b$10$QOvFCt8la5iKiT3csmYR9O62F57WP/9AlbsPufj77UoXAstas.u.W', '2022-11-12 09:41:55', 'tu20lgm931p9qeqixxoc', 'soy juanito', 0, '057e12f0c9877f34af3f4507b6244d4db4b495f90232cb03e3467e630ace37fb'),
(68, 'RafaelNadal', 'romeran14@gmail.com', '$2b$10$fzAvwzI0vBo54PLmkpRzOeg1u30wRfI8k7PktgLsPyLmEQ1sgBjIO', '2022-11-12 09:49:35', 'tbvcbcxaomxdoguqd4fr', 'tenista español', 1, NULL),
(69, 'Messi', 'romeran14@gmail.com', '$2b$10$Hp.waE0r.9IjBcL1Me92pO6.1gVkvb3RBiV1yjrFPyIWhD1rVJbau', '2022-11-12 12:17:56', 'bg3zaoa2yisdinacw0se', 'Jugador de futbol', 1, NULL),
(70, 'jesus', 'romeran14@gmail.com', '$2b$10$eU/KZzM63tUbw84Z2Go/UO6hMoBwkFtGT2TGQjptWY7JHSlS/8Imu', '2022-11-12 12:29:01', NULL, 'jesus desarrolla', 0, 'df707f705e7ee1552cf09fad9b1f37df79f7353e7169155e966f57d2232cf91a'),
(71, 'jesus123', 'romeran14@gmail.com', '$2b$10$aXNiA5wC4XJXi6FgxX9Z0ed4FgKHhpzMAKKeXkJ2LYQ0.P/Y6S5/G', '2022-11-12 12:29:53', NULL, 'jesus desarrolla', 1, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `twetts`
--
ALTER TABLE `twetts`
  ADD PRIMARY KEY (`idtwetts`),
  ADD KEY `fk_twetts_users_idx` (`users_Userid`),
  ADD KEY `fk_Retwetts_twetts_idx` (`Retweet`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Userid`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `twetts`
--
ALTER TABLE `twetts`
  MODIFY `idtwetts` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=545;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `Userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `twetts`
--
ALTER TABLE `twetts`
  ADD CONSTRAINT `fk_Retwetts_twetts` FOREIGN KEY (`Retweet`) REFERENCES `twetts` (`idtwetts`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_twetts_users` FOREIGN KEY (`users_Userid`) REFERENCES `users` (`Userid`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
