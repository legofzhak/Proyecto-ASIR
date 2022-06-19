SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP DATABASE IF EXISTS lamp_db;
CREATE DATABASE lamp_db CHARACTER SET utf8mb4;
USE lamp_db;

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `productos_Codigo` int(11) NOT NULL,
  `Cliente_login` varchar(50) NOT NULL,
  `cantidad` int(11) DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `IdCategoria` int(11) NOT NULL,
  `IdSeccion` int(11) NOT NULL,
  `Nombre` text DEFAULT NULL
);

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`IdCategoria`, `IdSeccion`, `Nombre`) VALUES
(1, 1, 'Lácteos'),
(2, 1, 'Embutidos'),
(3, 1, 'Snacks'),
(4, 1, 'Verduras'),
(5, 1, 'Frutas'),
(6, 2, 'Ratones'),
(7, 2, 'Teclados'),
(8, 2, 'Monitores'),
(9, 2, 'Ordenadores'),
(10, 2, 'Audio'),
(11, 3, 'Cómics'),
(12, 3, 'Mangas'),
(13, 3, 'Poesía'),
(14, 3, 'Manuales'),
(15, 3, 'Novelas'),
(16, 4, 'Acción'),
(17, 4, 'Sci-Fi'),
(18, 4, 'Historia'),
(19, 4, 'Animación'),
(20, 4, 'Comedia'),
(21, 5, 'Bolígrafos'),
(22, 5, 'Carpetas'),
(23, 5, 'Marcadores'),
(24, 5, 'Folios'),
(25, 5, 'Sillas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `login` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL
);

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`login`, `password`, `nombre`, `apellidos`, `correo`) VALUES
('cliente', 'cliente', 'Snoop Dogg', 'González Capel', 'snoopdogg420@wdd.com'),
('codfan123123', '123123', 'Mauricious', 'Jerrynson', 'codfan123123@hotmail.com'),
('filipo123', '123filipo', 'Filipino', 'Martinez Harrison Manuel', 'filipineboy@gmail.com'),
('jointlover420', '42069', 'Lebron', 'James', 'lbjm@yahoo.com'),
('nbafanlover', 'nbaforever123', 'Jamaico', 'Tomenhawher', 'nbafanlover@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idCompras` int(11) NOT NULL,
  `fechaRealizacion` date DEFAULT NULL,
  `total` float DEFAULT NULL,
  `fechaEnvio` date DEFAULT NULL,
  `fechaRecepcion` date DEFAULT NULL,
  `estado` enum('pendiente','enviada','recibida') DEFAULT NULL,
  `Cliente_login` varchar(50) NOT NULL,
  `Transportes_nombre` varchar(45) NOT NULL,
  `direccion_idDireccion` int(11) NOT NULL
);

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`idCompras`, `fechaRealizacion`, `total`, `fechaEnvio`, `fechaRecepcion`, `estado`, `Cliente_login`, `Transportes_nombre`, `direccion_idDireccion`) VALUES
(1, '2021-01-01', 100, '2021-05-15', '2021-05-15', 'enviada', 'cliente', 'empresa', 1),
(2, '2021-01-02', 12, '2021-05-15', '2021-05-15', 'enviada', 'cliente', 'empresa', 1),
(3, '2021-01-03', 732, '2021-05-15', '2021-05-15', 'enviada', 'cliente', 'empresa', 1),
(4, '2021-01-04', 322, NULL, NULL, 'pendiente', 'codfan123123', 'AirbNb', 2),
(5, '2021-01-05', 114, '2021-01-05', NULL, 'enviada', 'codfan123123', 'AirbNb', 2),
(6, '2021-01-06', 110, '2021-01-06', '2021-01-17', 'recibida', 'codfan123123', 'AirbNb', 2),
(7, '2021-01-07', 11, NULL, NULL, 'pendiente', 'filipo123', 'Correrus', 3),
(8, '2021-01-08', 169, '2021-01-08', NULL, 'enviada', 'filipo123', 'Correrus', 3),
(9, '2021-01-09', 114, '2021-01-09', '2021-01-21', 'recibida', 'filipo123', 'Correrus', 3),
(10, '2021-01-10', 10001, NULL, NULL, 'pendiente', 'jointlover420', 'FodEx', 4),
(11, '2021-01-11', 34, '2021-01-11', NULL, 'enviada', 'jointlover420', 'FodEx', 4),
(12, '2021-01-12', 10020, '2021-01-12', '2021-01-24', 'recibida', 'jointlover420', 'FodEx', 4),
(13, '2021-01-13', 430, NULL, NULL, 'pendiente', 'nbafanlover', 'PacoTransportes', 5),
(14, '2021-01-14', 110, '2021-01-14', NULL, 'enviada', 'nbafanlover', 'PacoTransportes', 5),
(15, '2021-01-15', 2, '2021-01-15', '2021-01-29', 'recibida', 'nbafanlover', 'PacoTransportes', 5),
(69, '2021-05-15', 10, '2021-05-15', '2021-05-15', 'enviada', 'cliente', 'empresa', 1),
(70, '2021-05-15', 10, '0000-00-00', NULL, 'enviada', 'cliente', 'empresa', 1),
(71, '2021-05-15', 12414, '2021-05-15', NULL, 'enviada', 'cliente', 'empresa', 1),
(72, '2021-05-23', 12414, '0000-00-00', '2021-05-15', 'recibida', 'cliente', 'empresa', 1),
(74, '2021-05-23', 12414, '0000-00-00', NULL, 'enviada', 'cliente', 'empresa', 1),
(76, '2021-05-24', 10, '0000-00-00', '2021-05-15', 'recibida', 'cliente', 'empresa', 1),
(77, '2021-05-24', 10, '2021-05-15', '2021-05-15', 'recibida', 'cliente', 'empresa', 1),
(79, '2021-05-24', 10, '0000-00-00', '2021-05-15', 'recibida', 'cliente', 'empresa', 1),
(80, '2021-05-15', 10, '0000-00-00', NULL, 'enviada', 'cliente', 'empresa', 1),
(81, '0000-00-00', 10, '0000-00-00', '2021-05-15', 'recibida', 'cliente', 'empresa', 1),
(141, '0000-00-00', 36246, NULL, NULL, 'pendiente', 'cliente', 'AirbNb', 1),
(142, '0000-00-00', 36246, NULL, NULL, 'pendiente', 'cliente', 'AirbNb', 1),
(143, '0000-00-00', 36246, NULL, NULL, 'pendiente', 'cliente', 'AirbNb', 1),
(144, '0000-00-00', 36246, NULL, NULL, 'pendiente', 'cliente', 'AirbNb', 1),
(145, '0000-00-00', 36246, NULL, NULL, 'pendiente', 'cliente', 'AirbNb', 1),
(146, '0000-00-00', 36246, NULL, NULL, 'pendiente', 'cliente', 'AirbNb', 1),
(147, '0000-00-00', 36246, NULL, NULL, 'pendiente', 'cliente', 'AirbNb', 1),
(148, '0000-00-00', 36246, NULL, NULL, 'pendiente', 'cliente', 'AirbNb', 1),
(149, '0000-00-00', 36246, NULL, NULL, 'pendiente', 'cliente', 'AirbNb', 1),
(150, '0000-00-00', 36246, NULL, NULL, 'pendiente', 'cliente', 'AirbNb', 1),
(151, '0000-00-00', 36246, NULL, NULL, 'pendiente', 'cliente', 'AirbNb', 1),
(152, '0000-00-00', 36246, NULL, NULL, 'pendiente', 'cliente', 'AirbNb', 1),
(153, '0000-00-00', 36246, NULL, NULL, 'pendiente', 'cliente', 'AirbNb', 1),
(154, '0000-00-00', 36246, NULL, NULL, 'pendiente', 'cliente', 'AirbNb', 1),
(155, '0000-00-00', 36246, NULL, NULL, 'pendiente', 'cliente', 'AirbNb', 1),
(156, '0000-00-00', 36246, NULL, NULL, 'pendiente', 'cliente', 'AirbNb', 1),
(157, '0000-00-00', 36246, NULL, NULL, 'pendiente', 'cliente', 'AirbNb', 1),
(158, '0000-00-00', 36246, NULL, NULL, 'pendiente', 'cliente', 'AirbNb', 1),
(159, '0000-00-00', 36246, NULL, NULL, 'pendiente', 'cliente', 'AirbNb', 1),
(160, '0000-00-00', 36246, NULL, NULL, 'pendiente', 'cliente', 'AirbNb', 1),
(161, '0000-00-00', 0, NULL, NULL, 'pendiente', 'cliente', 'AirbNb', 1),
(162, '0000-00-00', 0, NULL, NULL, 'pendiente', 'cliente', 'AirbNb', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `idDireccion` int(11) NOT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `piso` int(11) DEFAULT NULL,
  `letra` char(1) DEFAULT NULL,
  `codigo postal` int(11) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `telefono` int(9) DEFAULT NULL,
  `Cliente_login` varchar(50) NOT NULL
);

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`idDireccion`, `calle`, `numero`, `piso`, `letra`, `codigo postal`, `ciudad`, `telefono`, `Cliente_login`) VALUES
(1, 'campra', 68, 3, 'A', 4117, 'Almería', 612345678, 'cliente'),
(2, 'camilo', 57, 1, 'F', 4114, 'Granada', 698765432, 'codfan123123'),
(3, 'roca', 12, 2, 'D', 4117, 'Amería', 666777888, 'filipo123'),
(4, 'papiro', 9, 5, 'N', 4114, 'Granada', 654321987, 'jointlover420'),
(5, 'casimiro', 120, 4, 'I', 4132, 'Murcia', 623, 'nbafanlover');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajeria`
--

CREATE TABLE `mensajeria` (
  `Transportes_nombre` varchar(45) NOT NULL,
  `mensaje` varchar(45) DEFAULT NULL,
  `Compras_idCompras` int(11) NOT NULL
);

--
-- Volcado de datos para la tabla `mensajeria`
--

INSERT INTO `mensajeria` (`Transportes_nombre`, `mensaje`, `Compras_idCompras`) VALUES
('empresa', 'Aun no se ha enviado', 1),
('empresa', 'Pendiente de entrega', 2),
('empresa', 'Se ha entregado correctamente', 3),
('AirbNb', 'Aun no se ha enviado', 4),
('AirbNb', 'Pendiente de entrega', 5),
('AirbNb', 'Se ha entregado correctamente', 6),
('Correrus', 'Aun no se ha enviado', 7),
('Correrus', 'Pendiente de entrega', 8),
('Correrus', 'Se ha entregado correctamente', 9),
('FodEx', 'Aun no se ha enviado', 10),
('FodEx', 'Pendiente de entrega', 11),
('FodEx', 'Se ha entregado correctamente', 12),
('PacoTransportes', 'Aun no se ha enviado', 13),
('PacoTransportes', 'Pendiente de entrega', 14),
('PacoTransportes', 'Se ha entregado correctamente', 15),
('empresa', 'mimimimi', 79),
('empresa', 'JELOU', 80),
('empresa', 'ertgergt', 81);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetivos`
--

CREATE TABLE `objetivos` (
  `fecha` date DEFAULT NULL,
  `idSecciones` int(11) NOT NULL
);

--
-- Volcado de datos para la tabla `objetivos`
--

INSERT INTO `objetivos` (`fecha`, `idSecciones`) VALUES
('2021-04-22', 2),
('2021-05-15', 3),
('2021-05-15', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Codigo` int(11) NOT NULL,
  `Nombre` text DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `Precio` int(11) DEFAULT NULL,
  `Fabricante` text DEFAULT NULL,
  `idCategoria` int(11) NOT NULL,
  `idProveedor` int(11) NOT NULL
);

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`Codigo`, `Nombre`, `Descripcion`, `Precio`, `Fabricante`, `idCategoria`, `idProveedor`) VALUES
(1, 'Leche', 'Leche fresca', 1, 'CLA', 1, 1),
(2, 'Batido', 'Batidos de sabores', 4, 'CLA', 1, 1),
(3, 'Queso curado', 'Queso curado de oveja', 7, 'CLA', 1, 2),
(4, 'Chocolate', 'Chocolate de leche', 87, 'CLA', 1, 2),
(5, 'Leche condensada', 'Leche condensada para postres', 9, 'LCA', 1, 2),
(6, 'Chorizo', 'Chorizo picante', 98, 'Casa Tarradellas', 2, 2),
(7, 'Salchichón', 'Salchichón de pimienta', 7, 'Casa Tarradellas', 2, 2),
(8, 'Lomo', 'Lomo ibérico', 99, 'Casa Tarradellas', 2, 2),
(9, 'Jamón', 'Jamon de bellota', 1000, 'Casa Tarradellas', 2, 2),
(10, 'Jamon York', 'Jamon de pavo ahumado', 10, 'Casa Tarradellas', 2, 2),
(11, 'Pipas', 'Pipas con sal', 2, 'Grefusa', 3, 2),
(12, 'Risquetos', 'Gusanitos de queso', 1, 'Pepsico', 3, 2),
(13, 'Doritos', 'Tortitas de maiz con queso', 2, 'Doritos', 3, 2),
(14, 'Gusanitos', 'Bichos de maiz', 1, 'Pepsico', 3, 2),
(15, 'Frutos Secos', 'Surtido de frutos secos', 15, 'Elefante', 3, 2),
(16, 'Calabacino', 'Calabacino de Almería', 1, 'Hergonca', 4, 3),
(17, 'Sandía', 'Sandia de Almeria', 2, 'Hergonca', 4, 2),
(18, 'Tomate', 'Tomate de Almeria', 3, 'Hergonca', 4, 2),
(19, 'Limón', 'Lemon', 3, 'DoxtorDoz', 4, 3),
(20, 'Lechuga', 'Lechuga de Almería', 2, 'Hergonca', 4, 3),
(21, 'Manzana', 'Manzana verde', 3, 'Don Simon', 5, 3),
(22, 'Pera', 'Pera Europea', 2, 'Don Simon', 5, 3),
(23, 'Fresa', 'Fresa Roja', 4, 'Hergonca', 5, 3),
(24, 'Platano', 'Platano de Almería', 4, 'Hergonca', 5, 3),
(25, 'Mango', 'Mango de Almería', 10, 'Hergonca', 5, 3),
(26, 'RazerXL', '10 BOTONES', 100, 'Razer', 6, 3),
(27, 'GLAB 1121', '12 BOTONES', 100, 'Glab', 6, 3),
(28, 'SNAKE30', '6 BOTONES', 60, 'Snake', 6, 3),
(29, 'MARS12', '8 BOTONES', 123, 'Mars Gaming', 6, 3),
(30, 'Microsoft Mouse', '3 botones', 10, 'Micrososft', 6, 3),
(31, 'Mars T40', 'Teclado RGB', 100, 'Mars Gaming', 7, 3),
(32, 'GLAB T491', 'Teclado LGBT', 100, 'Glab', 7, 3),
(33, 'Asus AC130', 'Teclado militar', 100, 'Asus', 7, 3),
(34, 'Lenovo KB3', 'Teclado Portatil', 30, 'Lenovo', 7, 3),
(35, 'Micrososft KBT23', 'Teclado de oficina', 100, 'Microondas', 7, 3),
(36, 'HP 27', '27 cm de monstruosidad', 170, 'HP', 8, 3),
(37, 'VideoSeven 18+', 'V7 18 pulgadas', 123, 'VideoSeven', 8, 3),
(38, 'bENQ 38', '38 pulgadas', 380, 'bENQ', 8, 3),
(39, 'Toshiba 3999', '39 pulgadas', 392, 'Toshiba', 8, 3),
(40, 'LG 130', '48 pulgadas', 200, 'LG', 8, 3),
(41, 'Apollo 13', 'Pepino de PC', 700, 'Pcomponentes', 9, 4),
(42, 'PIONNER 1', 'Bestia de ordenador', 999, 'Mercadona', 9, 4),
(43, 'NASA MACHINA', 'PC DE LA NASA', 9999, 'NASA PLS', 9, 4),
(44, 'SPACEX PROPURSOR', 'PC DE SPACE X', 9998, 'SPACE Y', 9, 4),
(45, 'CARREFOUR HYPER BEAST', 'BEST PC EVER', 10000, 'CARREFOUR', 9, 4),
(46, 'ELEGiANT', 'STEREO3.0', 14, 'CHINA XD', 10, 4),
(47, 'SONY XD', 'AUDIO STEREO', 300, 'SONI', 10, 4),
(48, 'BEATS SON', 'SONIDO ENVOLVENTE', 983, 'BEASTS', 10, 4),
(49, 'SONIDO PA TI', 'YOQUESEEEEEEE', 333, 'YOMISMO', 10, 4),
(50, 'MORFINA', 'PA TU COCINA', 40, 'CAMELLO', 9, 4),
(51, 'Mortadelo y Filemon 1', 'Comin namber 1', 13, 'Ibaniez', 11, 5),
(52, 'Mortadelo y Filemon 2', 'comic chulo', 10, 'Ibaniez', 11, 5),
(53, 'Pepe Gotera y Otilio', 'xdxdxdxdxdx', 20, 'Ibaniez', 11, 5),
(54, 'Superman x Batman', 'pium pium pam pam', 10, 'DC', 11, 5),
(55, 'ChesterStone745 on Florida', 'Chester Stone 745 Bad Boy', 19, 'Chester Stone', 11, 5),
(56, 'Detective Conan', 'Niño pequeño Detective', 20, 'Japones YKS', 12, 5),
(57, 'Parasity', 'Adolescente con bicho', 12, 'Japones Random de Japón', 12, 5),
(58, 'Bola de Drazon Z', 'Kamehameha', 10, 'Otro Japones Socio', 12, 5),
(59, 'Tokyo Ghoul', 'Impostor Among Us!', 10, 'Hermano Otro Japones YO QUE SE', 12, 5),
(60, 'One Piece', 'One Comic', 1, 'One Japones de por ahí', 12, 5),
(61, 'La dronja', 'que bonita la pradera', 12, 'Yonkao Vivó', 13, 5),
(62, 'Los Pajaritos hacen pío', 'Y el gato miau', 12, 'Un Pajaron', 13, 5),
(63, 'Pelo Pico Pata', 'Araña la pta de la rata', 69, 'El Gato Donald', 13, 5),
(64, 'Acuestate a dormir', 'Que hace sueño', 10, 'Dormidina', 13, 5),
(65, 'Vladimir Una', 'Pa Jacinto se va a dormir', 69, 'Jacinto', 13, 5),
(66, 'Bomba casera facil!', 'Haz tu propia bomba en casa :D', 420, 'Al-Quaeda', 14, 5),
(67, 'How to make LSD', 'El arte de fliparlo en colores, en casa!', 420, 'Albert Hofmann', 14, 5),
(68, 'Como hacer un avion en casa', 'La aviación es para todos', 6942, 'Censudaro', 14, 5),
(69, 'Como leer un libro', 'wejfbjhfvbwehfwefhkwefjbfvqwevhfwehfwevgfvwekfwehfbwejfwebjfwevbjfbvjfqvbjfehrgvberiuqbevenvbehvb', 9999, 'Gugu Gaguensen', 14, 5),
(70, 'Como hacer tuya a una chica', 'Paso 1: Una furgoneta', 32, 'CandyVAN TM', 14, 5),
(71, 'Bajo mi cama', 'Hay un exconvicto de Venezuela llamado Don Mama Wbo', 68, 'Jacinto de nuevo', 15, 5),
(72, 'LAS 2 DE LA MAÑANA', 'TENGO SUEÑO', 55, 'Funko del Heavy de Team Fortress 2', 15, 5),
(73, 'Que quieres que te diga', 'Huele peste', 45, 'Atun con tomate', 15, 5),
(74, 'El mostruo del armario', 'Sale en Junio', 111, 'Adolf Mitler', 15, 5),
(75, 'El hombre que era irrespetuoso', 'Y lo va a seguir siendo', 74, 'No te lo esperabas: Jacinto de nuevo!', 15, 5),
(76, 'Pelicula de Michael Bay', 'Sus peliculas parecen Siria', 30, 'Michael MF Bay', 16, 6),
(77, 'Transformers', 'Película que da visibilidad al orgullo trans', 10, 'LGBTIQ+', 16, 6),
(78, 'V de Vendetta', 'Anonymous como hackear Facebook Gemas Infinitas Dragon Sity', 10, 'Jose Peralta, no preguntes como de grande era', 17, 6),
(79, 'Los Greemlins', 'Quien le ha vuelto a dar droga a los gatos dios mio que habeis liado', 78, 'Americano Random', 16, 6),
(80, 'Armageddon', 'Meteorito hazme el favor y vuelve pronto', 90, 'America EEUU EUA PATRIA', 16, 6),
(81, 'Regreso al futuro', 'La tia del futuro de los anuncios de lejía era una visionaria… El COVID nos acecharía en un futuro', 10, 'NS SL', 17, 6),
(82, 'Jurassic Park', 'No teniamos suficiente con los cocodrilos, serpientes, dragones de Komodo etc, que teniamos quedar por culo de más…', 99, 'Guarner Bros', 17, 6),
(83, 'GodZilla', 'La pilila', 98, 'Facebook (?????)', 17, 6),
(84, 'Ready Player One', 'Hostia tio una pelicula de juegos, brutal', 78, 'CHINA, MAYBE', 17, 6),
(85, 'Logan', 'El de Lobezno no el Logan Paul', 18, 'Dinsey Channel', 17, 6),
(86, 'AK-47', 'Drop me AK pls blue drop me AK blue pls you have 16K blue drop me AK47 pls', 47, 'BluEnters', 18, 7),
(87, 'El Fundador', 'Película de culto en EEUU. Para tener nacionalidad americana, hay que versela 27 veces seguidas.', 27, 'McDonalds', 18, 7),
(88, 'Corazones de Hierro', 'Basado en hechos reales del Tanki Online… Andrei, pq me robaste el powerup…', 88, 'FecTeam', 18, 7),
(89, 'Tesla', 'Quiero uno (coche)', 12, 'Emon Kuls', 18, 7),
(90, 'Dunkerque', 'No me la he visto, pero es de historia.', 98, 'Amor Irme', 18, 7),
(91, 'Toy Story 2', 'Ahora con los juguetes de mamá!', 98, 'Dixney', 19, 7),
(92, 'Cars', 'Película recomendada por la DGT para estudiarse el teórico del carné', 20, 'Dizney', 19, 7),
(93, 'Pollitos en fuga', 'Que habrán liao', 129, 'Nick', 19, 7),
(94, 'Los Increíbles', 'Mi madre ha echado LSD a la sopa pensando que era una pastilla de Avecrem la pelicula', 200, 'Dikney', 19, 7),
(95, 'Aladdin', 'La pipa echa más que humo', 420, 'Dicney', 19, 7),
(96, 'Deadpool', 'jaja', 20, 'Marvel', 20, 8),
(97, 'Deadpool 2', 'Jajajaja', 201, 'Marvel', 20, 8),
(98, 'Torrente', 'Documental sobre la administración española que fue tratada como una comedia por la situación del país.', 1234, 'España ole', 20, 8),
(99, 'Ocho Apellidos Vascos', 'Se me fue el hipo y nunca más he tenido.', 1, 'España… ole', 20, 8),
(100, 'Superlópez', ': l', 1, 'España…………….. Ole', 20, 8),
(101, 'Waterman azul', 'Boli azul', 1, 'Waterman', 21, 9),
(102, 'Mont Blanc Negro', 'Boli negro', 1, 'Mont Blanc', 21, 9),
(103, 'MonteGrapa Verde', 'Boligrafo verde', 1, 'MonteGrappa', 21, 9),
(104, 'Dupont Blanco', 'Boligrafo de color blanco', 1, 'Dupont', 21, 9),
(105, 'Parker Amarillo', 'Bolirgafo amarillo', 1, 'Parker', 21, 9),
(106, 'Elba Azul', 'Carpeta azul', 2, 'Elba', 22, 9),
(107, 'Esselte negro', 'Carpeta negra', 2, 'Esselte', 22, 9),
(108, 'Definiclas rosa', 'Carpeta rosa', 2, 'Definiclas', 22, 9),
(109, 'Gallery roja', 'Carpeta roja', 2, 'Gallery', 22, 9),
(110, 'Avery blanco', 'Carpeta blanca', 2, 'Avery', 22, 9),
(111, 'Stabilo pack', 'Pack de marcadores Stabilo', 12, 'Stabilo', 23, 10),
(112, 'Faber-Castell Pack', 'Pack marcadores Faber-Castell', 11, 'Faber-Castell', 23, 10),
(113, 'Pelikan 12 Pack', 'Pack marcadores Pelikan', 10, 'Pelikan', 23, 10),
(114, 'Staedtler pack', 'Marcadores pack 12', 9, 'Staedtler', 23, 10),
(115, 'Marcadores Q-connect', 'Pack de 15', 13, 'Q-Connect', 23, 10),
(116, 'Navigator 500', '500 hojas a4', 5, 'Navigator', 24, 10),
(117, 'GoCopy 1000', '1000 hojas a4', 7, 'GoCopy', 24, 10),
(118, 'HP Office 5000', '5000 hojas (1000x5) a4', 20, 'HP', 24, 10),
(119, 'PaperOne 500', '500 hojas A4', 3, 'OneGroup', 24, 10),
(120, 'paperBox 500', '500 hojas a4 80 micras', 4, 'BoxGroup', 24, 10),
(121, 'Stokke pls 123', 'Silla ergonomica oficina', 290, 'Stokke', 25, 10),
(122, 'Menorca AllInOne', 'Silla ergonomica para jugar', 151, 'Menorca', 25, 10),
(123, 'Vitra Club PP10', 'Silla para jugar', 100, 'Vitra', 25, 10),
(124, 'AKRacing Office', 'Silla de coche para oficina', 200, 'AKRacing', 25, 10),
(125, 'Steelcase 808', 'Silla gaming', 321, 'Steelcase', 25, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productoscompra`
--

CREATE TABLE `productoscompra` (
  `producto` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `Compras_idCompras` int(11) NOT NULL,
  `devuelto` enum('devuelto','','pendiente') DEFAULT NULL
);

--
-- Volcado de datos para la tabla `productoscompra`
--

INSERT INTO `productoscompra` (`producto`, `cantidad`, `Compras_idCompras`, `devuelto`) VALUES
(1, 3, 1, NULL),
(2, 3, 1, NULL),
(6, 1, 1, ''),
(13, 1, 1, ''),
(24, 6, 1, NULL),
(30, 3, 1, NULL),
(31, 3, 1, NULL),
(50, 6, 1, NULL),
(52, 6, 1, NULL),
(53, 6, 1, NULL),
(69, 3, 1, NULL),
(78, 300000, 1, NULL),
(79, 3000, 1, NULL),
(10, 1, 2, ''),
(16, 3000, 2, NULL),
(17, 1, 2, ''),
(19, 30000, 3, NULL),
(22, 30000, 3, NULL),
(27, 30000, 3, NULL),
(41, 1, 3, 'pendiente'),
(54, 30000, 3, NULL),
(70, 1, 3, 'devuelto'),
(110, 30000, 3, NULL),
(111, 30000, 3, NULL),
(112, 30000, 3, NULL),
(2, 1, 4, NULL),
(7, 10000, 4, NULL),
(9, 10000, 4, NULL),
(13, 10, 4, NULL),
(23, 10, 4, NULL),
(24, 10, 4, NULL),
(28, 100000, 4, NULL),
(54, 30000, 4, NULL),
(89, 10, 4, NULL),
(100, 1, 4, ''),
(125, 1, 4, ''),
(3, 10000, 5, NULL),
(16, 2, 5, NULL),
(28, 10000, 5, NULL),
(29, 10000, 5, NULL),
(32, 1, 5, ''),
(46, 1, 5, ''),
(69, 1, 5, NULL),
(72, 1000, 5, NULL),
(91, 20000, 5, NULL),
(54, 1, 6, 'pendiente'),
(123, 1, 6, 'devuelto'),
(1, 1, 7, ''),
(54, 1, 7, ''),
(32, 1, 8, ''),
(65, 1, 8, ''),
(4, 1, 9, 'pendiente'),
(87, 1, 9, 'devuelto'),
(12, 1, 10, ''),
(45, 1, 10, ''),
(23, 1, 11, ''),
(34, 1, 11, ''),
(45, 1, 12, 'pendiente'),
(56, 1, 12, 'devuelto'),
(67, 1, 13, ''),
(78, 1, 13, ''),
(89, 1, 14, ''),
(90, 1, 14, ''),
(100, 1, 15, 'pendiente'),
(101, 1, 15, 'devuelto'),
(1, 2, 159, 'pendiente'),
(3, 5, 159, 'pendiente'),
(16, 3, 159, 'pendiente'),
(23, 23, 159, 'pendiente'),
(56, 3, 159, 'pendiente'),
(74, 321, 159, 'pendiente'),
(80, 4, 159, 'pendiente'),
(96, 2, 159, 'pendiente'),
(1, 2, 160, 'pendiente'),
(3, 5, 160, 'pendiente'),
(16, 3, 160, 'pendiente'),
(23, 23, 160, 'pendiente'),
(56, 3, 160, 'pendiente'),
(74, 321, 160, 'pendiente'),
(80, 4, 160, 'pendiente'),
(96, 2, 160, 'pendiente');

--
-- Disparadores `productoscompra`
--
DELIMITER $$
CREATE TRIGGER `updateSaldoSeccion` AFTER INSERT ON `productoscompra` FOR EACH ROW BEGIN
	DECLARE idS int;
    DECLARE precioP int;
	SELECT S.IdSeccion, P.Precio INTO idS, precioP
    FROM secciones S
	INNER JOIN categorias cat ON cat.IdSeccion = S.IdSeccion
    INNER JOIN productos P ON P.idCategoria = cat.IdCategoria AND new.producto = P.Codigo;
    
    UPDATE saldoseccion
    SET saldo = saldo + (precioP * new.cantidad), fecha = now()
    WHERE idSecciones = idS;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productosfavoritos`
--

CREATE TABLE `productosfavoritos` (
  `Cliente_login` varchar(50) NOT NULL,
  `productos_Codigo` int(11) NOT NULL
);

--
-- Volcado de datos para la tabla `productosfavoritos`
--

INSERT INTO `productosfavoritos` (`Cliente_login`, `productos_Codigo`) VALUES
('cliente', 39);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `IdProveedor` int(11) NOT NULL,
  `Nombre` text DEFAULT NULL,
  `Direccion` text DEFAULT NULL,
  `Correo Electronico` text DEFAULT NULL,
  `Telefono` text DEFAULT NULL,
  `CIF` text DEFAULT NULL
);

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`IdProveedor`, `Nombre`, `Direccion`, `Correo Electronico`, `Telefono`, `CIF`) VALUES
(1, 'Juan Ramón Rayo', 'Almería, calle Francisco Campra Bautista, nº 211', 'jurara@hotmail.com', '692108328', '77883322K'),
(2, 'Papa Francisco', 'The Vaticano', 'papaFrancisco@hotmail.com', '666666666', '42066669F'),
(3, 'Papapapapa', 'AAAAAAAAA', 'WEDRWE@SAEDWQE.COM', '234280947', '23249828K'),
(4, 'WAWAWAWAWA', 'WEWEWEWEWEW', 'WIWIWIWI@WIWIWI.WI', '999988822', '21321321K'),
(5, 'JOSELICO JOSELICO', 'CALLE JOSE HOMBRE COMO', 'JOSELICOJOSELICO@GMAIL.COM', '090897786', '23232145Q'),
(6, 'CLARA YEMA HUEVO', 'CALLE TORTILLA DE PATATAS', 'HUEVOSROTOS@GMAIL.COM', '234242358', '43538097Z'),
(7, 'PACA CARTA CARA', 'PACAROYA@HOTMAIL.COM', 'CLASHROYAL@GMAIL.COM', '209849234', '21378214L'),
(8, 'TOM SCOTT', 'CALLE AMSTERDAN', 'TOMSCOTT@GMAIL.COM', '234214572', '06735345A'),
(9, 'CHARLOTTE DE WITTE', 'CALLE TECHNO', 'PUMPUMPUM@MAIL.COM', '578252369', '00348523B'),
(10, 'SNOOP DOGG', 'CALLE DOGGY DOGG', 'SNOOPDOGG@GMAIL.COM', '232142572', '23894842N');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saldoseccion`
--

CREATE TABLE `saldoseccion` (
  `idSecciones` int(11) NOT NULL,
  `saldo` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL
);

--
-- Volcado de datos para la tabla `saldoseccion`
--

INSERT INTO `saldoseccion` (`idSecciones`, `saldo`, `fecha`) VALUES
(1, 266, '2021-05-15'),
(2, 1230000, '2021-04-22'),
(3, 136381, '2021-05-15'),
(4, 1960800, '2021-05-15'),
(5, 0, NULL);

--
-- Disparadores `saldoseccion`
--
DELIMITER $$
CREATE TRIGGER `updateObjetivos` AFTER UPDATE ON `saldoseccion` FOR EACH ROW BEGIN
	DECLARE idS int;
    DECLARE saldoS int;
	SELECT SS.saldo, SS.idSecciones into saldoS, idS
    FROM saldoseccion SS
    WHERE new.saldo > 10000
			AND SS.idSecciones = new.idSecciones;
    
    IF (idS IN (SELECT O.idSecciones
				FROM objetivos O))
	THEN
		UPDATE objetivos
		SET fecha = now()
		WHERE idSecciones = idS;
    
    ELSE IF(ids NOT IN (SELECT O.idSecciones
						FROM objetivos O) 
			AND new.saldo > 10000)
    THEN
		INSERT INTO objetivos
		(fecha,
		idSecciones)
		VALUES
		(now(), idS);
	
    ELSE /**IF((ids NOT IN (SELECT O.idSecciones
						FROM objetivos O)
						AND new.saldo < 10000) 
            OR ((idS IN (SELECT O.idSecciones
						 FROM objetivos O) 
                         AND new.saldo < 10000)))
	THEN*/
		UPDATE objetivos
        SET fecha = fecha;
		
	END IF;
    END IF;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateSaldoTienda` AFTER UPDATE ON `saldoseccion` FOR EACH ROW BEGIN
    UPDATE saldotiendavirtual
    SET saldo = saldo + new.saldo - OLD.saldo , fecha = now()
    WHERE saldo >= 0;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saldotiendavirtual`
--

CREATE TABLE `saldotiendavirtual` (
  `saldo` int(11) NOT NULL,
  `fecha` date DEFAULT NULL
);

--
-- Volcado de datos para la tabla `saldotiendavirtual`
--

INSERT INTO `saldotiendavirtual` (`saldo`, `fecha`) VALUES
(3327447, '2021-05-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secciones`
--

CREATE TABLE `secciones` (
  `IdSeccion` int(11) NOT NULL,
  `Nombre` text DEFAULT NULL
);

--
-- Volcado de datos para la tabla `secciones`
--

INSERT INTO `secciones` (`IdSeccion`, `Nombre`) VALUES
(1, 'Alimentación'),
(2, 'Informática'),
(3, 'Biblioteca'),
(4, 'Películas'),
(5, 'Papelería');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transportes`
--

CREATE TABLE `transportes` (
  `nombre` varchar(45) NOT NULL,
  `telefono` int(9) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL
);

--
-- Volcado de datos para la tabla `transportes`
--

INSERT INTO `transportes` (`nombre`, `telefono`, `ciudad`, `correo`, `login`, `password`) VALUES
('AirbNb', 652124823, 'Jaén', 'air1bnb@gmail.com', 'airbnb', 'air923bnb'),
('Correrus', 611622633, 'Madrid', 'Correus@hotmail.com', 'coreus', '123321cs'),
('empresa', 666666666, 'Almería', 'empresa@empresa.com', 'empresa', 'empresa'),
('FodEx', 722722722, 'Murcia', 'fodexT@yahoo.com', 'fodex', 'fod876ex'),
('PacoTransportes', 676767776, 'Almería', 'pacoT@gmail.com', 'pacoT', 'TransportesPaco');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD KEY `fk_Carrito_productos1_idx` (`productos_Codigo`),
  ADD KEY `fk_Carrito_Cliente1_idx` (`Cliente_login`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`IdCategoria`),
  ADD KEY `IdSeccion_idx` (`IdSeccion`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`login`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idCompras`),
  ADD KEY `fk_Compras_Cliente1_idx` (`Cliente_login`),
  ADD KEY `fk_Compras_Transportes1_idx` (`Transportes_nombre`),
  ADD KEY `fk_compras_direccion1_idx` (`direccion_idDireccion`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`idDireccion`),
  ADD KEY `fk_Direccion_Cliente1_idx` (`Cliente_login`);

--
-- Indices de la tabla `mensajeria`
--
ALTER TABLE `mensajeria`
  ADD PRIMARY KEY (`Compras_idCompras`,`Transportes_nombre`),
  ADD KEY `fk_Mensajeria_Transportes1_idx` (`Transportes_nombre`);

--
-- Indices de la tabla `objetivos`
--
ALTER TABLE `objetivos`
  ADD PRIMARY KEY (`idSecciones`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `idProveedor_idx` (`idProveedor`),
  ADD KEY `IdCategoria_idx` (`idCategoria`);

--
-- Indices de la tabla `productoscompra`
--
ALTER TABLE `productoscompra`
  ADD PRIMARY KEY (`Compras_idCompras`,`producto`),
  ADD KEY `fk_ProductosCompra_Compras1_idx` (`Compras_idCompras`),
  ADD KEY `Codigo_idx` (`producto`);

--
-- Indices de la tabla `productosfavoritos`
--
ALTER TABLE `productosfavoritos`
  ADD PRIMARY KEY (`Cliente_login`,`productos_Codigo`),
  ADD KEY `fk_ProductosFavoritos_Cliente1_idx` (`Cliente_login`),
  ADD KEY `fk_ProductosFavoritos_productos1_idx` (`productos_Codigo`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`IdProveedor`);

--
-- Indices de la tabla `saldoseccion`
--
ALTER TABLE `saldoseccion`
  ADD PRIMARY KEY (`idSecciones`);

--
-- Indices de la tabla `saldotiendavirtual`
--
ALTER TABLE `saldotiendavirtual`
  ADD PRIMARY KEY (`saldo`);

--
-- Indices de la tabla `secciones`
--
ALTER TABLE `secciones`
  ADD PRIMARY KEY (`IdSeccion`);

--
-- Indices de la tabla `transportes`
--
ALTER TABLE `transportes`
  ADD PRIMARY KEY (`nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idCompras` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `fk_Carrito_Cliente1` FOREIGN KEY (`Cliente_login`) REFERENCES `cliente` (`login`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Carrito_productos1` FOREIGN KEY (`productos_Codigo`) REFERENCES `productos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `IdSeccion` FOREIGN KEY (`IdSeccion`) REFERENCES `secciones` (`IdSeccion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `fk_Compras_Cliente1` FOREIGN KEY (`Cliente_login`) REFERENCES `cliente` (`login`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Compras_Transportes1` FOREIGN KEY (`Transportes_nombre`) REFERENCES `transportes` (`nombre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_compras_direccion1` FOREIGN KEY (`direccion_idDireccion`) REFERENCES `direccion` (`idDireccion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `fk_Direccion_Cliente1` FOREIGN KEY (`Cliente_login`) REFERENCES `cliente` (`login`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mensajeria`
--
ALTER TABLE `mensajeria`
  ADD CONSTRAINT `fk_Mensajeria_Compras1` FOREIGN KEY (`Compras_idCompras`) REFERENCES `compras` (`idCompras`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Mensajeria_Transportes1` FOREIGN KEY (`Transportes_nombre`) REFERENCES `transportes` (`nombre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `objetivos`
--
ALTER TABLE `objetivos`
  ADD CONSTRAINT `objetivos_ibfk_1` FOREIGN KEY (`idSecciones`) REFERENCES `secciones` (`IdSeccion`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `IdCategoria` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`IdCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `IdProveedor` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`IdProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productoscompra`
--
ALTER TABLE `productoscompra`
  ADD CONSTRAINT `Codigo` FOREIGN KEY (`producto`) REFERENCES `productos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ProductosCompra_Compras1` FOREIGN KEY (`Compras_idCompras`) REFERENCES `compras` (`idCompras`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productosfavoritos`
--
ALTER TABLE `productosfavoritos`
  ADD CONSTRAINT `fk_ProductosFavoritos_Cliente1` FOREIGN KEY (`Cliente_login`) REFERENCES `cliente` (`login`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ProductosFavoritos_productos1` FOREIGN KEY (`productos_Codigo`) REFERENCES `productos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `saldoseccion`
--
ALTER TABLE `saldoseccion`
  ADD CONSTRAINT `saldoseccion_ibfk_1` FOREIGN KEY (`idSecciones`) REFERENCES `secciones` (`IdSeccion`);
COMMIT;
