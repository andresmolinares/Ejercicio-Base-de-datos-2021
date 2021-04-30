-- SENTENCIAS DML EN POSTGRESQL

-- INSERT TOTAL
-- INSERTAR NIÑOS

INSERT INTO nino VALUES 
(223,'2020-01-27', 3, '2015-05-21', NULL, '1007975579',1, 'Marcos'),
(243,'2020-10-03', 2, '2012-01-15', '2021-03-23', '111',2, 'Ana');


-- INSERTAR PLATO
INSERT INTO plato
VALUES ('Nuggets', 5, 'asdasdas', 1);



-- INSERT PARCIAL
-- INSERTAR PLATOS
INSERT INTO plato (nombre, cantidad, menu_id)
VALUES ('paella', 1, 1),
('bandeja paisa', 1, 2),
('Ceviche', 1, 1),
('sopa', 1, 2);

-- INSERTAR PAGADORES
INSERT INTO pagador (dni, numero_cuenta, banco) VALUES ('111', '111', 'Bancolombia'),
('12321', '00002222', 'Bancolombia');


-- INSERTAR CUOTA MENSUAL
INSERT INTO cuota_mensual (id_mensualidad, valor_mensualidad, costo_comida, pagador_id, nino_id)
VALUES (2, 300000, 1000, '111', '223');

INSERT INTO cuota_mensual (id_mensualidad, valor_mensualidad, costo_comida, pagador_id, nino_id)
VALUES (1, 100000, 20000, '12321', '243');

-- INSERTAR NIÑOS
INSERT INTO nino (id_matricula, nombre, fecha_ingreso, comidas_realizadas, fecha_nacimiento, fecha_baja, persona_id, menu_id) 
VALUES (2704,'Andres','2015-06-08', 2,'2013-01-10', '2020-04-15','12337',2);

INSERT INTO nino 
VALUES (99,'2013-02-20', 5, '2016-07-05', NULL,'555',2, 'Andrea');

-- INSERT MASIVO
INSERT INTO persona VALUES 
('1007975579','Andres Molinares',NULL,'3015109237','Hermano'),
('111','John',NULL,'6558741','asd'),
('12321','Marco','Cartagena','22556644','tio'),
('12337','felipe','bocagrande','555','padre'),
('4546','Antonio','sanfernando','444','tio'),
('555','salma','getsemani','999','madre'),
('56564','alberto','libano','777','hermano'),
('744','gabriela','alameda','888','prima'),
('877977','juan','pozon','666','abuelo');

INSERT INTO menu VALUES (2, 'menu2'), (1, 'menu1');

INSERT INTO ingrediente VALUES
('Ajo', '2021-05-02', 223, 'paella'),
('mostaza', '2021-06-12', 243, 'Ceviche'),
('pollo', '2021-08-11',2704, 'sopa');

-- UPDATE
UPDATE persona
SET direccion = 'Cartagena'
WHERE direccion IS NULL;

-- Actualiza la tabla personas para colocar sus nombres en mayuscula
UPDATE persona
SET nombre = upper(nombre);

-- DELETE 
-- Elimina todos los registros de la tabla niño
DELETE FROM niño WHERE id_matricula IS NOT NULL;

-- Elimina aquellos niños que se retiraron de la guarderia
DELETE FROM nino
WHERE fecha_baja IS NOT NULL;

-- CONSULTAS SELECT

-- MOSTRAR TOTAL MENSUALIDADES
SELECT nino.nombre AS Nombre_niño, nino.comidas_realizadas, cuota_mensual.valor_mensualidad AS cargo_mensual,
cuota_mensual.costo_comida, 
(cuota_mensual.costo_comida * nino.comidas_realizadas) as total_comidas,
(cuota_mensual.costo_comida * nino.comidas_realizadas) + cuota_mensual.valor_mensualidad AS total_mensualidad 
FROM nino JOIN cuota_mensual ON nino.id_matricula = cuota_mensual.nino_id;

-- Numero de platos que tiene cada menú
SELECT menu.nombre, COUNT(plato.menu_id) AS total_platos FROM plato 
JOIN menu ON plato.menu_id = menu.id_menu
GROUP BY  menu.nombre,plato.menu_id;


-- NIÑOS QUE SALIERON DE LA GUARDERIA
SELECT * FROM nino 
WHERE fecha_baja IS NOT NULL;

-- NIÑOS QUE SON ALERGICOS A ALGUN INGREDIENTE
SELECT ingrediente.nombre AS Nombre_ingrediente, nino.nombre AS NOMBRE_NIÑO
FROM ingrediente, nino WHERE nino.id_matricula = ingrediente.nino_id;

-- Menus favoritos
SELECT COUNT(nino.id_matricula) AS cantidad_niños, menu.nombre AS nombre_menu FROM nino
JOIN menu ON nino.menu_id = menu.id_menu
GROUP BY nino.menu_id, menu.nombre;
