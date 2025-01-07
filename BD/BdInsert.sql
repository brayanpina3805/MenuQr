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

-- Volcando estructura para tabla public.cat_aula
CREATE TABLE IF NOT EXISTS "cat_aula" (
	"cat_aula_id" INTEGER NOT NULL DEFAULT 'nextval(''serial_seq_cat_aula_cat_aula_id''::regclass)',
	"numero" INTEGER NULL DEFAULT NULL,
	"descripcion" VARCHAR(100) NULL DEFAULT NULL,
	PRIMARY KEY ("cat_aula_id")
);

-- Volcando datos para la tabla public.cat_aula: 3 rows
/*!40000 ALTER TABLE "cat_aula" DISABLE KEYS */;
INSERT INTO "cat_aula" ("cat_aula_id", "numero", "descripcion") VALUES
	(1, 101, 'Ingenieria en Sistemas'),
	(6, 102, 'Nutricion'),
	(7, NULL, 'Inexistente');
/*!40000 ALTER TABLE "cat_aula" ENABLE KEYS */;

-- Volcando estructura para tabla public.cat_estatus_com
CREATE TABLE IF NOT EXISTS "cat_estatus_com" (
	"cat_est_id" INTEGER NOT NULL DEFAULT 'nextval(''serial_seq_cat_estatus_com_cat_est_id''::regclass)',
	"descripcion" VARCHAR(100) NULL DEFAULT NULL,
	PRIMARY KEY ("cat_est_id")
);

-- Volcando datos para la tabla public.cat_estatus_com: 3 rows
/*!40000 ALTER TABLE "cat_estatus_com" DISABLE KEYS */;
INSERT INTO "cat_estatus_com" ("cat_est_id", "descripcion") VALUES
	(4, 'PENDIENTE'),
	(5, 'ELIMINADO'),
	(1, 'PRINCIPAL');
/*!40000 ALTER TABLE "cat_estatus_com" ENABLE KEYS */;

-- Volcando estructura para tabla public.cat_estatus_ped
CREATE TABLE IF NOT EXISTS "cat_estatus_ped" (
	"cat_est_id" INTEGER NOT NULL DEFAULT 'nextval(''serial_seq_cat_estatus_ped_cat_est_id''::regclass)',
	"descripcion" VARCHAR(100) NULL DEFAULT NULL,
	PRIMARY KEY ("cat_est_id")
);

-- Volcando datos para la tabla public.cat_estatus_ped: 4 rows
/*!40000 ALTER TABLE "cat_estatus_ped" DISABLE KEYS */;
INSERT INTO "cat_estatus_ped" ("cat_est_id", "descripcion") VALUES
	(2, 'EN RUTA'),
	(3, 'ENTREGADO'),
	(9, 'EN PREPARACION'),
	(1, 'RECIBIDO EN TIENDA');
/*!40000 ALTER TABLE "cat_estatus_ped" ENABLE KEYS */;

-- Volcando estructura para tabla public.cat_estatus_prod
CREATE TABLE IF NOT EXISTS "cat_estatus_prod" (
	"cat_est_id" INTEGER NOT NULL DEFAULT 'nextval(''serial_seq_cat_estatus_prod_cat_est_id''::regclass)',
	"descripcion" VARCHAR(100) NULL DEFAULT NULL,
	PRIMARY KEY ("cat_est_id")
);

-- Volcando datos para la tabla public.cat_estatus_prod: 3 rows
/*!40000 ALTER TABLE "cat_estatus_prod" DISABLE KEYS */;
INSERT INTO "cat_estatus_prod" ("cat_est_id", "descripcion") VALUES
	(1, 'DISPONIBLE'),
	(2, 'NO DISPONIBLE'),
	(3, 'ELIMINADO');
/*!40000 ALTER TABLE "cat_estatus_prod" ENABLE KEYS */;

-- Volcando estructura para tabla public.cat_estatus_usu
CREATE TABLE IF NOT EXISTS "cat_estatus_usu" (
	"cat_est_id" INTEGER NOT NULL DEFAULT 'nextval(''serial_seq_cat_estatus_usu_cat_est_id''::regclass)',
	"descripcion" VARCHAR(100) NULL DEFAULT NULL,
	PRIMARY KEY ("cat_est_id")
);

-- Volcando datos para la tabla public.cat_estatus_usu: 5 rows
/*!40000 ALTER TABLE "cat_estatus_usu" DISABLE KEYS */;
INSERT INTO "cat_estatus_usu" ("cat_est_id", "descripcion") VALUES
	(1, 'ACTIVO'),
	(2, 'INACTIVO'),
	(3, 'BLOQUEADO'),
	(4, ' CLIENTE CON PEDIDOS PENDIENTES'),
	(5, 'CLIENTES CON PAGOS PENDIENTES');
/*!40000 ALTER TABLE "cat_estatus_usu" ENABLE KEYS */;

-- Volcando estructura para tabla public.cat_tipo_prod
CREATE TABLE IF NOT EXISTS "cat_tipo_prod" (
	"cat_prod_id" INTEGER NOT NULL DEFAULT 'nextval(''serial_seq_cat_tipo_prod_cat_prod_id''::regclass)',
	"descripcion" VARCHAR(100) NULL DEFAULT NULL,
	PRIMARY KEY ("cat_prod_id")
);

-- Volcando datos para la tabla public.cat_tipo_prod: 3 rows
/*!40000 ALTER TABLE "cat_tipo_prod" DISABLE KEYS */;
INSERT INTO "cat_tipo_prod" ("cat_prod_id", "descripcion") VALUES
	(1, 'PRODUCTO'),
	(2, 'BEBIDA'),
	(3, 'PROMOCION');
/*!40000 ALTER TABLE "cat_tipo_prod" ENABLE KEYS */;

-- Volcando estructura para tabla public.cat_tipo_usu
CREATE TABLE IF NOT EXISTS "cat_tipo_usu" (
	"cat_usu_id" INTEGER NOT NULL DEFAULT 'nextval(''serial_seq_cat_tipo_usu_cat_usu_id''::regclass)',
	"descripcion" VARCHAR(100) NULL DEFAULT NULL,
	PRIMARY KEY ("cat_usu_id")
);

-- Volcando datos para la tabla public.cat_tipo_usu: 3 rows
/*!40000 ALTER TABLE "cat_tipo_usu" DISABLE KEYS */;
INSERT INTO "cat_tipo_usu" ("cat_usu_id", "descripcion") VALUES
	(1, 'ADMINISTRADOR'),
	(2, 'CLIENTE EN LINEA'),
	(5, 'EMPLEADO');
/*!40000 ALTER TABLE "cat_tipo_usu" ENABLE KEYS */;

-- Volcando estructura para tabla public.comentario
CREATE TABLE IF NOT EXISTS "comentario" (
	"com_id" INTEGER NOT NULL DEFAULT 'nextval(''serial_seq_comentario_com_id''::regclass)',
	"com_tipo" INTEGER NULL DEFAULT NULL,
	"nombre" VARCHAR(60) NULL DEFAULT NULL,
	"correo" VARCHAR(60) NULL DEFAULT NULL,
	"asunto" VARCHAR(255) NULL DEFAULT NULL,
	"mensaje" VARCHAR(255) NULL DEFAULT NULL,
	PRIMARY KEY ("com_id"),
	CONSTRAINT "Ref_comentario_to_cat_est_com" FOREIGN KEY ("com_tipo") REFERENCES "cat_estatus_com" ("cat_est_id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Volcando datos para la tabla public.comentario: 6 rows
/*!40000 ALTER TABLE "comentario" DISABLE KEYS */;
INSERT INTO "comentario" ("com_id", "com_tipo", "nombre", "correo", "asunto", "mensaje") VALUES
	(52, 5, 'BRANDON MISAEL PIÑA FLORES', 'af339150@gmail.com', 'Segundo Comentario', 'Volviendo a calar'),
	(55, 5, 'BRANDON MISAEL PIÑA FLORES', 'brandon@umb.edomex.mx', 'Ahora si Ultimo Comentario', 'Finalmente quedo, todo funciona Bien'),
	(53, 1, 'JESUS FRANCISCO PIÑA FLORES', 'af339150@gmail.com', 'Tercer comentario', 'Volviendo a calar paps, ya es la ultiima'),
	(51, 4, 'ZURIEL GUTIERREZ CASTAÑEDA', 'af339150@gmail.com', 'Prueba 1', 'Calando los comentarios paps'),
	(61, 1, 'CECILIA FLORES GALLEGOS', 'ceci@umb.edomex.mx', 'Ultimo Comentario ', 'Probando de pies a cabeza el sistema'),
	(63, 4, 'BRANDON PEÑALOZA', 'penaloza@umb.edomex.mx', 'Segundo Comentario', 'Prueba');
/*!40000 ALTER TABLE "comentario" ENABLE KEYS */;

-- Volcando estructura para tabla public.detalle_pedido
CREATE TABLE IF NOT EXISTS "detalle_pedido" (
	"det_id" INTEGER NOT NULL DEFAULT 'nextval(''serial_seq_detalle_pedido_det_id''::regclass)',
	"ped_id" INTEGER NULL DEFAULT NULL,
	"producto" VARCHAR(255) NULL DEFAULT NULL,
	"cantidad" INTEGER NULL DEFAULT NULL,
	"descripcion" VARCHAR(255) NULL DEFAULT 'NULL::character varying',
	"total" REAL NULL DEFAULT NULL,
	"imagen" VARCHAR(255) NULL DEFAULT NULL,
	PRIMARY KEY ("det_id"),
	INDEX "detid" ("det_id"),
	INDEX "pro" ("producto"),
	CONSTRAINT "Ref_detalle_pedido_to_pedido" FOREIGN KEY ("ped_id") REFERENCES "pedido" ("ped_id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Volcando datos para la tabla public.detalle_pedido: 0 rows
/*!40000 ALTER TABLE "detalle_pedido" DISABLE KEYS */;
/*!40000 ALTER TABLE "detalle_pedido" ENABLE KEYS */;

-- Volcando estructura para tabla public.pedido
CREATE TABLE IF NOT EXISTS "pedido" (
	"ped_id" INTEGER NOT NULL DEFAULT 'nextval(''serial_seq_pedido_ped_id''::regclass)',
	"usu_id" INTEGER NULL DEFAULT NULL,
	"ped_est" INTEGER NULL DEFAULT NULL,
	"fecha" TIMESTAMP NULL DEFAULT NULL,
	"total" REAL NULL DEFAULT NULL,
	"descripcion" VARCHAR(255) NULL DEFAULT NULL,
	"emp_id" INTEGER NULL DEFAULT NULL,
	"fecha_concluido" TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY ("ped_id"),
	INDEX "usuid" ("usu_id"),
	INDEX "pedest" ("ped_est"),
	INDEX "empid" ("emp_id"),
	INDEX "pedid" ("ped_id"),
	CONSTRAINT "Ref_Emplpedido_to_usuario" FOREIGN KEY ("emp_id") REFERENCES "usuario" ("usu_id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "Ref_pedido_to_cat_estatus_ped" FOREIGN KEY ("ped_est") REFERENCES "cat_estatus_ped" ("cat_est_id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "Ref_pedido_to_usuario" FOREIGN KEY ("usu_id") REFERENCES "usuario" ("usu_id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Volcando datos para la tabla public.pedido: 0 rows
/*!40000 ALTER TABLE "pedido" DISABLE KEYS */;
/*!40000 ALTER TABLE "pedido" ENABLE KEYS */;

-- Volcando estructura para tabla public.producto
CREATE TABLE IF NOT EXISTS "producto" (
	"prod_id" INTEGER NOT NULL DEFAULT 'nextval(''serial_seq_producto_prod_id''::regclass)',
	"prod_tipo" INTEGER NULL DEFAULT NULL,
	"prod_estatus" INTEGER NULL DEFAULT NULL,
	"producto" VARCHAR(60) NULL DEFAULT NULL,
	"ingredientes" VARCHAR(255) NULL DEFAULT NULL,
	"descripcion" VARCHAR(255) NULL DEFAULT NULL,
	"precio" REAL NULL DEFAULT NULL,
	"imagen" VARCHAR(255) NULL DEFAULT NULL,
	PRIMARY KEY ("prod_id"),
	INDEX "imagen" ("imagen"),
	INDEX "productoid" ("prod_id"),
	INDEX "prodesta" ("prod_estatus"),
	INDEX "prdotipo" ("prod_tipo"),
	CONSTRAINT "Ref_producto_to_cat_est_prod" FOREIGN KEY ("prod_estatus") REFERENCES "cat_estatus_prod" ("cat_est_id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "Ref_producto_to_cat_tipo_prod" FOREIGN KEY ("prod_tipo") REFERENCES "cat_tipo_prod" ("cat_prod_id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Volcando datos para la tabla public.producto: 20 rows
/*!40000 ALTER TABLE "producto" DISABLE KEYS */;
INSERT INTO "producto" ("prod_id", "prod_tipo", "prod_estatus", "producto", "ingredientes", "descripcion", "precio", "imagen") VALUES
	(1, 1, 1, 'Boneles', 'Jicama,Pepino,Zanahoria', '530g (8 a 10pzas)', 257, '/assets/img/Productos/Alimentos/Boneles.jpg'),
	(2, 1, 1, 'Burritos', 'Bistec,Pastor,Tocino,Queso', '', 174, '/assets/img/Productos/Alimentos/Burritos.jpg'),
	(3, 1, 1, 'Chilaquiles Verdes', 'Milanesa,Cebolla,Cilantro,Huevo,Frijoles', '', 130, '/assets/img/Productos/Alimentos/Chilaquiles.jpg'),
	(4, 1, 1, 'COSTILLAS BBQ', 'ADEREZO BÁSICO,HONEY MUSTARD,RANCH', 'Costillas de Cerdo al Horno', 130, '/assets/img/Productos/Alimentos/Costillas.jpg'),
	(5, 1, 1, 'HAMBURGUESA DOBLE', 'Lechuga,Queso,Jitomate,Cebolla,Mayonesa,Mostasa,Catchup ', 'Hamburguesa con doble carne', 100, '/assets/img/Productos/Alimentos/HamburguesaDoble.jpg'),
	(6, 1, 1, 'HAMBURGUESA SENCILLA', 'Lechuga,Queso,Jitomate,Cebolla,Mayonesa,Mostasa,Catchup', 'Hamburguesa Secilla de una carne.', 80, '/assets/img/Productos/Alimentos/HamburguesaSencilla.jpg'),
	(7, 1, 1, 'PAPAS FRITAS', 'QUESO,CATHCHUP,CREAM', 'Nuestras patatas fritas de corte natural con piel y sal de mar, bañadas con salsa de queso cremosa y tibia, queso cheddar rallado y crujiente tocino ahumado', 50, '/assets/img/Productos/Alimentos/PapasFrancesa.png'),
	(8, 1, 1, 'QUESABIRRIA', 'LIMON,CEBOLLA,CILANTRO', 'Quesadilla de harina rellena de deliciosa birria. Acompañada de su consomé.', 70, '/assets/img/Productos/Alimentos/QuesaBirrias.jpg'),
	(9, 1, 1, 'QUESADILLAS', 'LIMON,CEBOLLA,CILANTRO', 'Quesadilla Frita de Tinga de Pollo', 30, '/assets/img/Productos/Alimentos/Quesadillas.jpg'),
	(10, 1, 1, 'SOPES DE POLLO', 'CHILE MANZANO,CEBOLLA,AGUACATE,CREMA,NOPAL', 'Sope Tradicional ', 60, '/assets/img/Productos/Alimentos/Sopes.jpg'),
	(17, 3, 1, 'SPORTS PACK', '', '15 BONELESS, PAPAS FRITAS Y MOZZARELLA', 130, '/assets/img/Productos/Promociones/PBoneles.jpg'),
	(18, 3, 1, 'BONELESS 2x1', '', 'COMPRA UNA Y LLEVATE DOS', 140, '/assets/img/Productos/Promociones/PBoneles2.png'),
	(19, 3, 1, 'HAMBURESA', '', 'UNA HAMBURGUESA, UN JUGO DEL VALLE Y UNAS PAPAS FRITAS', 180, '/assets/img/Productos/Promociones/PHamburgesasPapasJugos.jpg'),
	(20, 3, 1, 'QUESADILLAS Y SOPES', '', 'COMPRA 2 Y LLEVATE 3 SOPES O QUESADILLAS', 130, '/assets/img/Productos/Promociones/PQusadillasYSopes.jpg'),
	(15, 2, 1, 'PEPSI', '', 'Bebida PEPSI 680 ml', 30, '/assets/img/Productos/Bebidas/Pepsi.jpg'),
	(16, 2, 1, 'SPRITE', '', 'Bebida SPRITE 680 m', 30, '/assets/img/Productos/Bebidas/Sprite.jpg'),
	(13, 2, 1, 'FANTA', '', 'Bebida FANTA 680 ml', 30, '/assets/img/Productos/Bebidas/Fanta.jpg'),
	(14, 2, 1, 'JUGO DEL VALLE DURAZNO', '', 'Bebida JUGO DEL VALLE DURAZNO 680 ml', 30, '/assets/img/Productos/Bebidas/JugoDelValle.jpg'),
	(11, 2, 1, 'ARIZONA SANDIA', '', 'Bebida Arizona sandía 680 ml', 30, '/assets/img/Productos/Bebidas/Arizona.jpg'),
	(12, 2, 1, 'COCA-COLA', '-', 'Bebida COCA-COLA 680 ml', 30, '/assets/img/Productos/Bebidas/CocaCola.png');
/*!40000 ALTER TABLE "producto" ENABLE KEYS */;

-- Volcando estructura para tabla public.usuario
CREATE TABLE IF NOT EXISTS "usuario" (
	"usu_id" INTEGER NOT NULL DEFAULT 'nextval(''serial_seq_usuario_usu_id''::regclass)',
	"usu_tipo" INTEGER NULL DEFAULT NULL,
	"usu_est" INTEGER NULL DEFAULT NULL,
	"usu_aula" INTEGER NULL DEFAULT NULL,
	"nombre" VARCHAR(100) NULL DEFAULT NULL,
	"correo" VARCHAR(60) NULL DEFAULT NULL,
	"contrasena" VARCHAR(255) NULL DEFAULT NULL,
	PRIMARY KEY ("usu_id"),
	INDEX "nombre" ("nombre"),
	INDEX "correo" ("correo"),
	INDEX "idusuaio" ("usu_id"),
	CONSTRAINT "Ref_usuario_to_cat_aula" FOREIGN KEY ("usu_aula") REFERENCES "cat_aula" ("cat_aula_id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "Ref_usuario_to_cat_est_usu" FOREIGN KEY ("usu_est") REFERENCES "cat_estatus_usu" ("cat_est_id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "Ref_usuario_to_cat_tipo_usu" FOREIGN KEY ("usu_tipo") REFERENCES "cat_tipo_usu" ("cat_usu_id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Volcando datos para la tabla public.usuario: 0 rows
/*!40000 ALTER TABLE "usuario" DISABLE KEYS */;
/*!40000 ALTER TABLE "usuario" ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
