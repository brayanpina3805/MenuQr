-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         PostgreSQL 14.9, compiled by Visual C++ build 1914, 64-bit
-- SO del servidor:              
-- HeidiSQL Versión:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando datos para la tabla public.cat_estatus_usu: -1 rows
/*!40000 ALTER TABLE "cat_estatus_usu" DISABLE KEYS */;
INSERT INTO "cat_estatus_usu" ("cat_est_id", "descripcion") VALUES
	(1, 'ACTIVO'),
	(2, 'INACTIVO'),
	(3, 'BLOQUEADO'),
	(4, ' CLIENTE CON PEDIDOS PENDIENTES'),
	(5, 'CLIENTES CON PAGOS PENDIENTES');
/*!40000 ALTER TABLE "cat_estatus_usu" ENABLE KEYS */;

-- Volcando datos para la tabla public.cat_est_prod: -1 rows
/*!40000 ALTER TABLE "cat_est_prod" DISABLE KEYS */;
INSERT INTO "cat_est_prod" ("cat_est_id", "descripcion") VALUES
	(1, 'ACTIVO'),
	(3, 'INACTIVO'),
	(6, 'ELIMINADO');
/*!40000 ALTER TABLE "cat_est_prod" ENABLE KEYS */;

-- Volcando datos para la tabla public.cat_tipo_prod: -1 rows
/*!40000 ALTER TABLE "cat_tipo_prod" DISABLE KEYS */;
INSERT INTO "cat_tipo_prod" ("cat_tipo_id", "descripcion") VALUES
	(1, 'BEBIDAS'),
	(3, 'COMIDA');
/*!40000 ALTER TABLE "cat_tipo_prod" ENABLE KEYS */;

-- Volcando datos para la tabla public.cat_tipo_usu: -1 rows
/*!40000 ALTER TABLE "cat_tipo_usu" DISABLE KEYS */;
INSERT INTO "cat_tipo_usu" ("cat_usu_id", "descripcion") VALUES
	(1, 'ADMINISTRADOR'),
	(2, 'CLIENTE EN LINEA'),
	(5, 'EMPLEADO');
/*!40000 ALTER TABLE "cat_tipo_usu" ENABLE KEYS */;

-- Volcando datos para la tabla public.producto: 38 rows
/*!40000 ALTER TABLE "producto" DISABLE KEYS */;
INSERT INTO "producto" ("id_prod", "prod_est", "prod_tipo", "nombre", "descripcion", "precio") VALUES
	(6, 1, 3, 'HAMBURGUESA', 'Una hamburguesa es un emparedado que contiene, generalmente, carne picada o de origen vegetal,​ aglutinada en forma de filete cocinado a la parrilla o a la plancha,', 70),
	(19, 1, 1, 'PIÑA COLADA', 'La piña colada es un cóctel tropical que se prepara con jugo de piña, crema de coco, ron y hielo.', 70),
	(27, 1, 3, 'ENCHILADAS VERDES', 'Tortillas rellenas de pollo con salsa verde', 18),
	(25, 1, 3, 'POZOLE', 'Sopa tradicional de maíz y carne', 20),
	(28, 1, 3, 'CHILES EN NOGADA', 'Chiles rellenos con crema de nuez y granada', 25),
	(29, 1, 3, 'MOLE POBLANO', 'Platillo de pollo con mole tradicional', 22),
	(30, 1, 3, 'SOPES', 'Masa de maíz con frijoles, crema y queso', 12),
	(31, 1, 3, 'QUESADILLAS', 'Tortillas rellenas de queso y hongos', 8),
	(32, 1, 3, 'FLAUTAS', 'Tortillas rellenas de pollo y fritas', 14),
	(33, 1, 3, 'TOSTADAS DE TINGA', 'Tostadas con pollo desmenuzado y salsa', 16),
	(34, 1, 3, 'COCHINITA PIBIL', 'Cerdo marinado en achiote y jugo de naranja', 24),
	(35, 1, 3, 'CHILAQUILES', 'Totopos bañados en salsa roja o verde', 13),
	(36, 1, 3, 'CARNITAS', 'Carne de cerdo jugosa y crujiente', 20),
	(37, 1, 3, 'GUACAMOLE', 'Crema de aguacate con limón y cilantro', 10),
	(38, 1, 3, 'TAMAL DE ELOTE', 'Tamal dulce hecho de elote tierno', 7),
	(39, 1, 1, 'MARGARITA', 'Cóctel de tequila, limón y sal en el borde del vaso', 18),
	(40, 1, 1, 'MOJITO', 'Refrescante bebida de ron, menta y limón', 15),
	(41, 1, 1, 'PIÑA TRADICIONAL', 'Bebida tropical de piña, coco y ron', 20),
	(42, 1, 1, 'CAIPIRINHA', 'Cóctel brasileño de cachaza, limón y azúcar', 17),
	(43, 1, 1, 'MICHELADA', 'Cerveza preparada con limón, sal y salsa picante', 12),
	(44, 1, 1, 'TEQUILA SUNRISE', 'Cóctel de tequila, jugo de naranja y granadina', 16),
	(45, 1, 1, 'DAIQUIRI', 'Bebida de ron, jugo de limón y azúcar', 14),
	(46, 1, 1, 'CUBA LIBRE', 'Combinación de ron, refresco de cola y limón', 13),
	(47, 1, 1, 'PALOMA', 'Bebida mexicana de tequila, refresco de toronja y limón', 15),
	(48, 1, 1, 'CLERICOT', 'Vino tinto mezclado con frutas y un toque de licor', 18),
	(49, 1, 1, 'NEGRONI', 'Cóctel clásico de ginebra, vermut y Campari', 22),
	(50, 1, 1, 'BLOODY MARY', 'Bebida a base de vodka y jugo de tomate con especias', 19),
	(51, 1, 1, 'MARTINI', 'Cóctel clásico de ginebra y vermut, adornado con aceituna', 25),
	(52, 1, 1, 'SANGRÍA', 'Mezcla de vino tinto, frutas y un toque de brandy', 20),
	(53, 1, 1, 'COSMOPOLITAN', 'Cóctel elegante de vodka, triple sec y jugo de arándano', 21),
	(26, 1, 3, 'TACOS DE BARBACOA', 'Tacos de carne de barbacoa con salsa', 10),
	(24, 1, 3, 'TAMALES', 'Tamales de maíz con pollo o cerdo', 15),
	(71, 1, 1, 'PRODUCTO PRUEBA', 'CREACION DE PRODUCTO PARA REALIZAR PRUEBAS DE INSERCIÓN Y ACTUALIZACION', 33),
	(75, 1, 1, 'Prueba desde celular', 'Buena prueba', 122),
	(1, 1, 3, 'ENCHILADAS SUIZAS', 'Las enchiladas suizas son una variedad de las verdes, pero se diferencian porque su salsa es preparada con crema y son gratinadas con queso manchego.', 50),
	(74, 1, 1, 'TAMALESPRUEBA', 'SA', 123),
	(3, 1, 1, 'PALOMA', 'Cóctel mexicano refrescante y cítrico, a base de tequila, jugo de lima, refresco de toronja y soda', 60);
/*!40000 ALTER TABLE "producto" ENABLE KEYS */;

-- Volcando datos para la tabla public.usuario: -1 rows
/*!40000 ALTER TABLE "usuario" DISABLE KEYS */;
INSERT INTO "usuario" ("usu_id", "usu_tipo", "usu_est", "nombre", "correo", "contrasena") VALUES
	(1, 1, 1, 'brayan', 'brayan@gmail.com', '$2a$10$Y6LDLHmHHIjzN6ubd/iEmu87UwXtCbjC239pEFg6gudZEFSGLdsCq'),
	(8, 2, 1, 'DIEGO ISMAEL ORTIZ', 'diego@umb.edomex.mx', '$2a$10$QsQDeyYF7eSd/sOrcjtBB.8BehADC1Llie2afgKvIqXa1kcAQ9vSm');
/*!40000 ALTER TABLE "usuario" ENABLE KEYS */;

-- Volcando datos para la tabla public._pgmdd_backup_cat_est_prod_2025-09-01_02:31: -1 rows
/*!40000 ALTER TABLE "_pgmdd_backup_cat_est_prod_2025-09-01_02:31" DISABLE KEYS */;
/*!40000 ALTER TABLE "_pgmdd_backup_cat_est_prod_2025-09-01_02:31" ENABLE KEYS */;

-- Volcando datos para la tabla public._pgmdd_backup_cat_tipo_prod_2025-09-01_02:31: -1 rows
/*!40000 ALTER TABLE "_pgmdd_backup_cat_tipo_prod_2025-09-01_02:31" DISABLE KEYS */;
/*!40000 ALTER TABLE "_pgmdd_backup_cat_tipo_prod_2025-09-01_02:31" ENABLE KEYS */;

-- Volcando datos para la tabla public._pgmdd_backup_producto_2025-09-01_02:35: -1 rows
/*!40000 ALTER TABLE "_pgmdd_backup_producto_2025-09-01_02:35" DISABLE KEYS */;
INSERT INTO "_pgmdd_backup_producto_2025-09-01_02:35" ("id_prod", "prod_est", "prod_tipo", "nombre", "descripcion", "precio") VALUES
	(1, 1, 3, 'ENCHILADAS SUIZAS', 'DELICIOSAS', 50);
/*!40000 ALTER TABLE "_pgmdd_backup_producto_2025-09-01_02:35" ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
