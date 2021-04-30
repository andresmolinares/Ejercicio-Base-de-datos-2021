-- SENTENCIAS DML ORACLE

-- INSERT PARCIAL
-- INSERTAR PERSONAS
INSERT INTO persona(dni, nombre, direccion, telefono, parentezco)
VALUES ('111','John',NULL,'6558741','asd');

INSERT INTO persona(dni, nombre, direccion, telefono, parentezco)
VALUES('12321','Marco','Cartagena','22556644','tio');
INSERT INTO persona(dni, nombre, direccion, telefono, parentezco)
VALUES('12337','felipe','bocagrande','555','padre');

INSERT INTO persona(dni, nombre, telefono, parentezco)
VALUES('4','jorge','5553','padre');

INSERT INTO persona(dni, nombre, telefono, parentezco)
VALUES('55','antonio','5552','padre');


-- INSERTAR PLATOS
INSERT INTO plato (nombre, cantidad, descripcion, menu_id)
VALUES ('paella', 1, 'arroz con verdura y marisco', 1);

INSERT INTO plato (nombre, cantidad, descripcion, menu_id)
VALUES ('bandeja paisa', 1, 'asjdjasdkjhaskd', 2);

INSERT INTO plato (nombre, cantidad, descripcion, menu_id)
VALUES ('Ceviche', 1, 'asdasdas', 1);

INSERT INTO plato (nombre, cantidad, descripcion, menu_id)
VALUES ('sopa', 1, 'asdasdas', 2);

INSERT INTO plato (nombre, cantidad, descripcion, menu_id)
VALUES ('Nuggets', 5, 'asdasdas', 1);

SELECT * FROM plato;

-- INSERTAR UN MENU NUEVO
INSERT INTO menu (id_menu) VALUES (1);
INSERT INTO menu (id_menu, nombre) VALUES (2, 'menu2');
-- ACTUALIZAR MENU PARA AGREGAR NOMBRE
UPDATE menu SET nombre = 'menu1' WHERE id_menu=1;

INSERT INTO ingrediente VALUES
('Ajo', '02/05/2021', 223, 'paella');
INSERT INTO ingrediente VALUES
('mostaza', '12/06/2021', 243, 'Ceviche');
INSERT INTO ingrediente VALUES
('pollo', '11/08/2021',2704, 'sopa');

-- INSERTAR NIÑOS
INSERT INTO nino (id_matricula, nombre, fecha_ingreso, comidas_realizadas, fecha_nacimiento, fecha_baja, persona_id, menu_id) VALUES 
(223,'Marcos','27/01/2002', 3,'27/01/2012', NULL,'12321',1);

INSERT INTO nino (id_matricula, nombre, fecha_ingreso, comidas_realizadas, fecha_nacimiento, fecha_baja, persona_id, menu_id) 
VALUES (243,'Ana','03/10/2020', 2,'03/11/2019', '03/11/2020','111',1);

INSERT INTO nino (id_matricula, nombre, fecha_ingreso, comidas_realizadas, fecha_nacimiento, fecha_baja, persona_id, menu_id) 
VALUES (2704,'Andres','08/06/2015', 2,'10/01/2013', '15/04/2020','12337',2);

INSERT INTO nino (id_matricula, nombre, fecha_ingreso, comidas_realizadas, fecha_nacimiento, fecha_baja, persona_id, menu_id) 
VALUES (99,'Andrea','05/07/2016', 5,'20/02/2013', NULL,'111',2);

-- INSERTAR PAGADOR
INSERT INTO pagador (dni, numero_cuenta) VALUES ('111', '111');
INSERT INTO pagador (dni, numero_cuenta) VALUES ('12321', '00002222');
-- INSERTAR CUOTA MENSUAL
INSERT INTO cuota_mensual (id_mensualidad, valor_mensualidad, costo_comida, pagador_id, nino_id)
VALUES (2, 300000, 1000, '111', '223');

INSERT INTO cuota_mensual (id_mensualidad, valor_mensualidad, costo_comida, pagador_id, nino_id)
VALUES (1, 100000, 20000, '12321', '243');

-- INSERT TOTAL
INSERT INTO persona
VALUES ('223344','Raul',NULL,'4655','fasgf');

SELECT * FROM cuota_mensual;

-- UPDATE
UPDATE persona
SET direccion = 'Cartagena'
WHERE direccion IS NULL;

-- Actualiza la tabla personas para colocar sus nombres en mayuscula
UPDATE persona
SET nombre = upper(nombre);

SELECT * FROM pagador;

-- DELETE 
-- Elimina todos los registros de la tabla niño
DELETE FROM niño WHERE id_matricula IS NOT NULL;

-- Elimina aquellos niños que se retiraron de la guarderia
DELETE FROM niño
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

INSERT ALL
INTO pagador (dni, numero_cuenta, banco) VALUES ('55', '259844', 'BBVA')
INTO pagador (dni, numero_cuenta, banco) VALUES ('4', '4234', 'BBVA')
SELECT * FROM pagador;

