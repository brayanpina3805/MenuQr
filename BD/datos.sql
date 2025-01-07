
INSERT INTO "cat_aula" ("cat_aula_id", "numero", "descripcion") VALUES
	(1, 101, 'Ingenieria en Sistemas'),
	(6, 102, 'Nutricion'),
	(7, NULL, 'Inexistente');

INSERT INTO "cat_estatus_com" ("cat_est_id", "descripcion") VALUES
	(4, 'PENDIENTE'),
	(5, 'ELIMINADO'),
	(1, 'PRINCIPAL');

INSERT INTO "cat_estatus_ped" ("cat_est_id", "descripcion") VALUES
	(2, 'EN RUTA'),
	(3, 'ENTREGADO'),
	(9, 'EN PREPARACION'),
	(1, 'RECIBIDO EN TIENDA');

INSERT INTO "cat_estatus_prod" ("cat_est_id", "descripcion") VALUES
	(1, 'DISPONIBLE'),
	(2, 'NO DISPONIBLE'),
	(3, 'ELIMINADO');

INSERT INTO "cat_estatus_usu" ("cat_est_id", "descripcion") VALUES
	(1, 'ACTIVO'),
	(2, 'INACTIVO'),
	(3, 'BLOQUEADO'),
	(4, ' CLIENTE CON PEDIDOS PENDIENTES'),
	(5, 'CLIENTES CON PAGOS PENDIENTES');

INSERT INTO "cat_tipo_prod" ("cat_prod_id", "descripcion") VALUES
	(1, 'PRODUCTO'),
	(2, 'BEBIDA'),
	(3, 'PROMOCION');

INSERT INTO "cat_tipo_usu" ("cat_usu_id", "descripcion") VALUES
	(1, 'ADMINISTRADOR'),
	(2, 'CLIENTE EN LINEA'),
	(5, 'EMPLEADO');

INSERT INTO "comentario" ("com_id", "com_tipo", "nombre", "correo", "asunto", "mensaje") VALUES
	(52, 5, 'BRANDON MISAEL PIÑA FLORES', 'af339150@gmail.com', 'Segundo Comentario', 'Volviendo a calar'),
	(55, 5, 'BRANDON MISAEL PIÑA FLORES', 'brandon@umb.edomex.mx', 'Ahora si Ultimo Comentario', 'Finalmente quedo, todo funciona Bien'),
	(53, 1, 'JESUS FRANCISCO PIÑA FLORES', 'af339150@gmail.com', 'Tercer comentario', 'Volviendo a calar paps, ya es la ultiima'),
	(51, 4, 'ZURIEL GUTIERREZ CASTAÑEDA', 'af339150@gmail.com', 'Prueba 1', 'Calando los comentarios paps'),
	(61, 1, 'CECILIA FLORES GALLEGOS', 'ceci@umb.edomex.mx', 'Ultimo Comentario ', 'Probando de pies a cabeza el sistema'),
	(63, 4, 'BRANDON PEÑALOZA', 'penaloza@umb.edomex.mx', 'Segundo Comentario', 'Prueba');

INSERT INTO "usuario" ("usu_id", "usu_tipo", "usu_est", "usu_aula", "nombre", "correo", "contrasena") VALUES
	(1, 1, 1, 1, 'brayan', 'brayan@gmail.com', '$2a$10$Y6LDLHmHHIjzN6ubd/iEmu87UwXtCbjC239pEFg6gudZEFSGLdsCq'),
	(8, 2, 1, 1, 'DIEGO ISMAEL ORTIZ', 'diego@umb.edomex.mx', '$2a$10$QsQDeyYF7eSd/sOrcjtBB.8BehADC1Llie2afgKvIqXa1kcAQ9vSm');

INSERT INTO "pedido" ("ped_id", "usu_id", "ped_est", "fecha", "total", "descripcion", "emp_id", "fecha_concluido") VALUES
	(1, 8, 3, '2025-01-03 04:13:42.128', 434, 'Muy buena comida', 1, '2025-01-03 04:15:34.207');


INSERT INTO "detalle_pedido" ("det_id", "ped_id", "producto", "cantidad", "descripcion", "total", "imagen") VALUES
	(1, 1, 'Chilaquiles Verdes', 2, 'Milanesa,Cebolla,Cilantro,Huevo,Frijoles', 260, '/assets/img/Productos/Alimentos/Chilaquiles.jpg'),
	(2, 1, 'Burritos', 1, 'Bistec,Pastor,Tocino,Queso', 174, '/assets/img/Productos/Alimentos/Burritos.jpg');


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


