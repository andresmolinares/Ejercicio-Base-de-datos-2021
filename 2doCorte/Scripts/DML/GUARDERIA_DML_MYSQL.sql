-- SENTENCIAS DML EN MYSQL

-- INSERT TOTAL
-- INSERTAR NIÑOS

INSERT INTO ninos VALUES 
(223, 'Marcos','2020-01-27', 3, NULL, '1007975579',1),
(243, 'Ana','2020-10-03', 2, '2021-03-23', '111',2);


-- INSERTAR PLATO
INSERT INTO platos
VALUES ('Nuggets', 5, 'asdasdas', 1);


-- INSERT PARCIAL
-- INSERTAR PLATOS
INSERT INTO platos (nombre, cantidad, menu_id)
VALUES ('paella', 1, 1),
('bandeja paisa', 1, 2),
('Ceviche', 1, 1),
('sopa', 1, 2);

-- INSERTAR PAGADORES
INSERT INTO pagadores (id, numero_cuenta, banco) VALUES ('111', '111', 'Bancolombia'),
('12321', '00002222', 'Bancolombia');


-- INSERTAR CUOTA MENSUAL
INSERT INTO cuota_mensual (id, valor_mensualidad, costo_comida, pagador_id, nino_id)
VALUES (2, 300000, 1000, '111', '223');

INSERT INTO cuota_mensual (id_mensualidad, valor_mensualidad, costo_comida, pagador_id, nino_id)
VALUES (1, 100000, 20000, '12321', '243');

-- INSERTAR NIÑOS
INSERT INTO ninos (id, nombre, fecha_ingreso, comidas_realizadas, fecha_nacimiento, fecha_baja, persona_id, menu_id) 
VALUES (2704,'Andres','2015-06-08', 2,'2020-04-15','12337',2);

INSERT INTO ninos
VALUES (99, 'Andrea','2013-02-20', 5, '2016-07-05', NULL,'555',2);

-- INSERT MASIVO
INSERT INTO personas VALUES 
('1007975579','Andres Molinares',NULL,'3015109237','Hermano'),
('111','John',NULL,'6558741','asd'),
('12321','Marco','Cartagena','22556644','tio'),
('12337','felipe','bocagrande','555','padre'),
('4546','Antonio','sanfernando','444','tio'),
('555','salma','getsemani','999','madre'),
('56564','alberto','libano','777','hermano'),
('744','gabriela','alameda','888','prima'),
('877977','juan','pozon','666','abuelo');

INSERT INTO menus VALUES (2, 'menu2'), (1, 'menu1');

INSERT INTO ingredientes VALUES
('Ajo', '2021-05-02', 223, 'paella'),
('mostaza', '2021-06-12', 243, 'Ceviche'),
('pollo', '2021-08-11',2704, 'sopa');

-- UPDATE
UPDATE personas
SET direccion = 'Cartagena'
WHERE direccion IS NULL;

-- Actualiza la tabla personas para colocar sus nombres en mayuscula
UPDATE personas
SET nombre = upper(nombre);

-- DELETE 
-- Elimina todos los registros de la tabla niño
DELETE FROM ninos WHERE id IS NOT NULL;

-- Elimina aquellos niños que se retiraron de la guarderia
DELETE FROM ninos
WHERE fecha_baja IS NOT NULL;

-- CONSULTAS SELECT
-- NIÑOS QUE SALIERON DE LA GUARDERIA
SELECT * FROM ninos 
WHERE fecha_baja IS NOT NULL;

-- NIÑOS QUE SON ALERGICOS A ALGUN INGREDIENTE
SELECT ingredientes.nombre AS Nombre_ingrediente, ninos.nombre AS NOMBRE_NIÑO
FROM ingredientes, ninos WHERE ninos.id = ingredientes.niño_id;

-- CALCULO MENSUALIDAD TOTAL

SELECT ninos.nombre AS Nombre_niño, ninos.comidas_realizadas, cuota_mensuales.valor_mensualidad AS cargo_mensual,
cuota_mensuales.costo_comida, (cuota_mensuales.costo_comida * ninos.comidas_realizadas) as total_comidas , (cuota_mensuales.costo_comida * ninos.comidas_realizadas) + cuota_mensuales.valor_mensualidad AS total_mensualidad FROM ninos JOIN cuota_mensuales ON ninos.id = cuota_mensuales.niño_id
;


-- Numero de platos que tiene cada menú
SELECT menus.nombre, COUNT(platos.menu_id) AS total_platos FROM platos 
JOIN menus ON platos.menu_id = menus.id
group by platos.menu_id;

-- Menus favoritos
SELECT COUNT(ninos.id) AS cantidad_niños, menus.nombre AS nombre_menu FROM ninos
JOIN menus ON ninos.menu_id = menus.id
GROUP BY ninos.menu_id;