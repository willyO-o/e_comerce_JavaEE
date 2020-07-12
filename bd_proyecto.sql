-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-07-2020 a las 06:24:41
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9


--
-- Base de datos: `bd_proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(2) NOT NULL,
  `categoria` varchar(30) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `categoria`, `descripcion`) VALUES
(17, 'Varon', 'vestimentas y accesorio de para varones'),
(18, 'Mujer', 'vestimentas y accesorio de para mujeres'),
(19, 'Niños', 'vestimentas y accesorio de para niños  pequeños'),
(20, 'Niñas', 'vestimentas y accesorio de para niñas'),
(21, 'Accesorios de Vestir', 'reloges de todas las marcas'),
(22, 'Trajes', 'trajes de varones'),
(23, 'Vetidos', 'vestidos par damas'),
(24, 'Calzados', 'Clazados para ambos sexos'),
(25, 'Jeans', 'jenas para ambos sexos'),
(26, 'Joyeria', 'joyeria para damas'),
(27, 'Mochilas', 'mochilas para niños y adultos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id_ciudad` int(3) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `Departamento` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id_ciudad`, `ciudad`, `Departamento`) VALUES
(1, 'La Paz', 'La Paz'),
(2, 'El Alto', 'La Paz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre_cliente` varchar(50) NOT NULL,
  `apellido_cliente` varchar(50) NOT NULL,
  `nit` varchar(15) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `fecha_registro` date NOT NULL,
  `telefono` varchar(14) NOT NULL,
  `direccion` varchar(300) NOT NULL,
  `id_ciudad` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre_cliente`, `apellido_cliente`, `nit`, `correo`, `password`, `fecha_registro`, `telefono`, `direccion`, `id_ciudad`) VALUES
(38, 'Marcos', 'Chambi', '12345678', 'juan@gmail.com', 'a94652aa97c7211ba8954dd15a3cf838', '2020-07-01', '', '77777777', 2),
(40, 'Jose', 'Colque ', '12345678', 'jose@gmail.com', '662eaa47199461d01a623884080934ab', '2020-07-10', '77777777', 'C. 21 Calacoto', 1),
(41, 'Maria', 'Chavez', '1234567', 'maria@gmail.com', '263bce650e68ab4e23f28263760b9fa5', '2020-07-10', '123123', 'Av buenos Aires #518', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `id_contacto` int(11) NOT NULL,
  `nombre_contacto` varchar(200) NOT NULL,
  `email_contacto` varchar(200) NOT NULL,
  `telefono_contacto` varchar(15) NOT NULL,
  `mensaje_contacto` text NOT NULL,
  `fecha_contacto` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`id_contacto`, `nombre_contacto`, `email_contacto`, `telefono_contacto`, `mensaje_contacto`, `fecha_contacto`) VALUES
(1, 'willy', 'marcggmarc.20@gmail.com', '1234567', 'mensaje', '2019-11-12 15:52:00'),
(2, 'Juan', 'marco.chambi20@gmail.com', '1234567', 'mensaje', '2019-11-12 15:52:00'),
(3, 'Pedro', 'marcos.chambi20@gmail.com', '1234567', 'mensaje', '2019-11-12 15:52:00'),
(4, 'Luis Camacho', 'marcos.chambi20@gmail.com', '1234567', 'como estan, quisiera saber si mi pedido esta fue recibido', '2019-11-12 15:52:00'),
(5, 'Jaime', 'marcgg_20@hotmail.com', '1234567', 'hola probandoo...', '2019-11-12 15:54:02'),
(6, 'willy chana', '2223421', 'admin@gmail.com', 'holaa probandpooo', '2020-07-04 13:40:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

CREATE TABLE `imagenes` (
  `id_producto` int(10) NOT NULL,
  `imagen1` varchar(100) NOT NULL,
  `imagen2` varchar(100) NOT NULL,
  `imagen3` varchar(199) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `imagenes`
--

INSERT INTO `imagenes` (`id_producto`, `imagen1`, `imagen2`, `imagen3`) VALUES
(24, 'img/blazer-skinny-de-esmoquin,-negro (2).jfif', 'img/blazer-skinny-de-esmoquin,-negro (1).jfif', 'img/blazer-skinny-de-esmoquin,-negro.jfif'),
(25, 'img/zapatillas-de-deporte-gruesas-mate,-negro (1).jfif', 'img/zapatillas-de-deporte-gruesas-mate,-negro (3).jfif', 'img/zapatillas-de-deporte-gruesas-mate,-negro.jfif'),
(26, 'img/zapatillas-deportivas-con-varios-paneles-y-suela-cupsole,-crema (2).jfif', 'img/zapatillas-deportivas-con-varios-paneles-y-suela-cupsole,-crema (3).jfif', 'img/zapatillas-deportivas-con-varios-paneles-y-suela-cupsole,-crema.jfif'),
(27, 'img/W924326640101.jpg', 'img/W924326640102.jpg', 'img/W924326640103.jpg'),
(28, 'img/S087696960101.jpg', 'img/S087696960102.jpg', 'img/S087696960106.jpg'),
(29, 'img/W992691040101.jpg', 'img/W992691040102.jpg', 'img/W992691040103.jpg'),
(30, 'img/S098271041601.jpg', 'img/S098271041602.jpg', 'img/S098271041603.jpg'),
(31, 'img/S097031047001.jpg', 'img/S097031047002.jpg', 'img/S097031047005.jpg'),
(33, 'img/Chaqueton-Lolo-074 (1).jpg', 'img/banner-01.jpg', 'img/banner-02.jpg'),
(34, 'img/Pijama-Vintage-051.jpg', 'img/banner-01.jpg', 'img/banner-02.jpg'),
(35, 'img/S075508282101.jpg', 'img/S075508282102.jpg', 'img/S075508282103.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_marca` int(3) NOT NULL,
  `marca` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `marca`) VALUES
(37, 'Airborn'),
(38, 'Rebook'),
(39, 'BOWEN London'),
(40, 'Narda'),
(42, 'Manaco'),
(43, 'Joyeria'),
(44, 'Nike'),
(45, 'Mate'),
(46, 'Bolsos'),
(48, 'Rayban'),
(49, 'Cargo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participa`
--

CREATE TABLE `participa` (
  `id_venta` int(11) NOT NULL,
  `id_producto` int(10) NOT NULL,
  `cantidad_pro` int(3) NOT NULL,
  `precio` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `participa`
--

INSERT INTO `participa` (`id_venta`, `id_producto`, `cantidad_pro`, `precio`) VALUES
(42, 28, 1, 180.00),
(42, 31, 2, 80.00),
(42, 30, 1, 310.00),
(43, 25, 1, 250.00),
(43, 24, 1, 1230.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participa_pedido`
--

CREATE TABLE `participa_pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(10) NOT NULL,
  `cantidad_producto` int(2) NOT NULL,
  `precio` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `participa_pedido`
--

INSERT INTO `participa_pedido` (`id_pedido`, `id_producto`, `cantidad_producto`, `precio`) VALUES
(84, 25, 1, 250.00),
(84, 24, 1, 1230.00),
(85, 28, 1, 180.00),
(85, 31, 2, 80.00),
(85, 30, 1, 310.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `tipo_pago` varchar(40) NOT NULL,
  `productos` text NOT NULL,
  `total_pago` float(10,2) NOT NULL,
  `fecha_pedido` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado_pedido` int(1) NOT NULL,
  `id_cliente` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `tipo_pago`, `productos`, `total_pago`, `fecha_pedido`, `estado_pedido`, `id_cliente`) VALUES
(81, 'Otras Formas', 'Smart samsung 32\'\', Polera s romis, ', 145.00, '2020-07-04 23:26:45', 1, 38),
(82, 'Deposito Bancario', 'Polera s romis, ', 22.00, '2020-07-04 23:29:50', 2, 38),
(83, 'Contra Entrega', 'Sven, ', 250.00, '2020-07-04 22:15:18', 2, 38),
(84, 'Deposito Bancario', 'Zapatillas de deporte,  Blazer skinny de esmoquin, ', 1480.00, '2020-07-11 03:37:44', 2, 40),
(85, 'Contra Entrega', ' Vestido estampado floral, Set pendientes aro, Gafas de sol chica espejo roja, ', 650.00, '2020-07-11 03:37:40', 2, 41);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(10) NOT NULL,
  `producto` varchar(100) NOT NULL,
  `imagen` varchar(300) NOT NULL,
  `descripcion_prod` text NOT NULL,
  `caracteristicas_prod` text NOT NULL,
  `stock` int(4) NOT NULL,
  `stock_minimo` int(2) NOT NULL,
  `precio_venta` float(6,2) NOT NULL,
  `garantia` varchar(10) NOT NULL,
  `id_marca` int(3) NOT NULL,
  `id_categoria` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `producto`, `imagen`, `descripcion_prod`, `caracteristicas_prod`, `stock`, `stock_minimo`, `precio_venta`, `garantia`, `id_marca`, `id_categoria`) VALUES
(24, ' Blazer skinny de esmoquin', 'img/blazer-skinny-de-esmoquin,-negro (3).jfif', 'Esmoquin negro para varon', 'COLOR: NEGRO,\r\nTALLA : L, XL, XXL', 6, 1, 1230.00, 'ninguna', 37, 22),
(25, 'Zapatillas de deporte', 'img/zapatillas-de-deporte-gruesas-mate,-negro (2).jfif', 'Es el calzado de moda de cualquier atuendo.\r\n\r\nConsigue la Ãºltima Pisa en nuestra colecciÃ³n de esta temporada mÃ¡s se habla zapatos. Los zapatos Oxford y los mocasines ponen la elegancia a tus pies, mientras que las zapatillas pijas de lona y las zapatillas deportivas de toda la vida garantizan que tu estilo de ocio permanezca a la Ãºltima. Botas Safari de esta temporada y jeans skinny son la prenda al dÃ­a y mejor para canalizar unas botas Chelsea.', 'Talla, 39, 40, 41,\r\nColor: negro', 4, 2, 250.00, '3 meses', 45, 24),
(26, '', 'img/zapatillas-deportivas-con-varios-paneles-y-suela-cupsole,-crema (1).jfif', 'Es el calzado de moda de cualquier atuendo.\r\n\r\nConsigue la Ãºltima Pisa en nuestra colecciÃ³n de esta temporada mÃ¡s se habla zapatos. Los zapatos Oxford y los mocasines ponen la elegancia a tus pies, mientras que las zapatillas pijas de lona y las zapatillas deportivas de toda la vida garantizan que tu estilo de ocio permanezca a la Ãºltima. Botas Safari de esta temporada y jeans skinny son la prenda al dÃ­a y mejor para canalizar unas botas Chelsea.', 'COLOR: CREMA,\r\ntallas: 38,41', 6, 1, 270.00, 'ninguna', 38, 24),
(27, 'Pant.deport.bandas laterales', 'img/W924326640100.jpg', 'Pant.deport.bandas laterales', 'tallas: s, m ,l', 10, 2, 320.00, '2 meses', 39, 18),
(28, ' Vestido estampado floral', 'img/S087696960100.jpg', 'EXTERIOR 100%POLIESTER INTERIOR 95%POLIESTER 5% ELASTANO', 'tallas :s, m', 11, 2, 180.00, 'ninguna', 39, 23),
(29, 'Bolso bandolera', 'img/W992691040100.jpg', 'TEJIDO PRINCIPAL 100%POLIURETANO FORRO 100%POLIESTER', 'color: negro , tamaÃ±o: 32 x 27', 20, 2, 240.00, '2 aÃ±os', 37, 18),
(30, 'Gafas de sol chica espejo roja', 'img/S098271041600.jpg', '100%POLICARBONATO', '100%POLICARBONATO', 40, 2, 310.00, '2 aÃ±os', 48, 21),
(31, 'Set pendientes aro', 'img/S097031047000.jpg', '100%METALICO', '100%METALICO', 40, 2, 80.00, '1 mes', 40, 26),
(33, ' Bomber unisex Amarillo', 'img/Chaqueton-Lolo-074.jpg', 'Bomber unisex AmarilloBomber unisex', 'color: mostaza, talla: s', 20, 1, 86.00, 'ninguna', 37, 19),
(34, 'Pijama Vintage Morado', 'img/Pijama-Vintage-051 (1).jpg', 'Pijama Vintage Morado', 'COLOR:	Morado\r\nTEMPORADA:;	PRIMAVERA-VERANO\r\nCOMPOSICION:	100%ALGODON', 30, 2, 69.00, 'ninguna', 37, 19),
(35, ' PantalÃ³n cargo', 'img/S075508282100.jpg', 'PantalÃ³n cargo', '97%ALGODON 3%ELASTANO', 40, 2, 170.00, 'ninguna', 49, 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resenia`
--

CREATE TABLE `resenia` (
  `id_reseña` int(11) NOT NULL,
  `nombre_res` varchar(50) NOT NULL,
  `email_res` varchar(200) NOT NULL,
  `resenia` text NOT NULL,
  `calificacion` int(1) NOT NULL,
  `fecha_resenia` date NOT NULL,
  `id_producto` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(2) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `ultima_conexion` timestamp NULL DEFAULT NULL,
  `apellido` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `email`, `nombre`, `password`, `estado`, `ultima_conexion`, `apellido`) VALUES
(20, 'wil@gmail.com', 'willy Marcos', 'e39622164d485c2dc8970f518b0189cd', 1, '2020-07-06 00:20:02', 'chana'),
(21, 'admin@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, '2020-07-11 03:40:13', 'admin'),
(22, 'gilda@gmail.com', 'gilda', 'd05308537d2513fc0caec462aebebafb', 1, '2020-07-11 03:40:37', 'alcon');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `tipo_pago` varchar(30) NOT NULL,
  `total_pago` float(10,2) NOT NULL,
  `fecha_venta` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_venta`, `tipo_pago`, `total_pago`, `fecha_venta`, `id_cliente`) VALUES
(36, 'Contra Entrega', 250.00, '2020-04-08 22:02:36', 38),
(37, 'Otras Formas', 145.00, '2020-05-20 22:05:04', 38),
(38, 'Otras Formas', 145.00, '2020-05-24 22:11:30', 38),
(39, 'Contra Entrega', 250.00, '2020-06-09 22:15:18', 38),
(40, 'Otras Formas', 145.00, '2020-07-04 22:15:35', 38),
(41, 'Deposito Bancario', 22.00, '2020-07-04 23:29:50', 38),
(42, 'Contra Entrega', 650.00, '2020-07-11 03:37:40', 41),
(43, 'Deposito Bancario', 1480.00, '2020-07-11 03:37:44', 40);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id_ciudad`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `id_cuidad` (`id_ciudad`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id_contacto`);

--
-- Indices de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `participa`
--
ALTER TABLE `participa`
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `participa_pedido`
--
ALTER TABLE `participa_pedido`
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_marca` (`id_marca`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `resenia`
--
ALTER TABLE `resenia`
  ADD PRIMARY KEY (`id_reseña`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id_ciudad` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id_contacto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `resenia`
--
ALTER TABLE `resenia`
  MODIFY `id_reseña` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD CONSTRAINT `imagenes_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `participa`
--
ALTER TABLE `participa`
  ADD CONSTRAINT `participa_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participa_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `participa_pedido`
--
ALTER TABLE `participa_pedido`
  ADD CONSTRAINT `participa_pedido_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participa_pedido_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `resenia`
--
ALTER TABLE `resenia`
  ADD CONSTRAINT `resenia_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
