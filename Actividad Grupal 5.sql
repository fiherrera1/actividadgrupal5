-- ACTIVIDAD GRUPAL 5

-- Parte 1: Crear entorno de trabajo
-- Crear una base de datos

CREATE SCHEMA `personas` ;

-- Crear un usuario con todos los privilegios para trabajar con la base de datos recién creada.

-- Se creo un usuario para esta actividad llamado "Usuario 1"

-- Parte 2: Crear dos tablas.

-- La primera almacena a los usuarios de la aplicación (id_usuario, nombre, apellido,
-- contraseña, zona horaria (por defecto UTC-3), género y teléfono de contacto).

CREATE TABLE `personas`.`usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  `zonaHoraria` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `genero` VARCHAR(45) NOT NULL,
  `telefonoContacto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `id_usuario_UNIQUE` (`id_usuario` ASC) VISIBLE)
COMMENT = 'Almacena los usuarios de la aplicación';


-- La segunda tabla almacena información relacionada a la fecha-hora de ingreso de los
-- usuarios a la plataforma (id_ingreso, id_usuario y la fecha-hora de ingreso (por defecto la
-- fecha-hora actual)).

CREATE TABLE `personas`.`ingreso` (
  `id_ingreso` INT NOT NULL,
  `id_usuario` VARCHAR(45) NOT NULL,
  `fechaIngreso` DATETIME DEFAULT NOW(),
  PRIMARY KEY (`id_ingreso`));

-- Parte 3: Modificación de la tabla

SET GLOBAL time_zone = '-02:00';

-- Parte 4: Creación de registros.

insert into usuarios (id_usuario, nombre, apellido, contraseña, zonaHoraria, genero, telefonoContacto) values (1, 'Meier', 'Boxer', 'ggnV5Ou', DEFAULT, 'Male', '5403968884');
insert into usuarios (id_usuario, nombre, apellido, contraseña, zonaHoraria, genero, telefonoContacto) values (2, 'Jenelle', 'Rene', 'FVFK3kpUL65a', DEFAULT, 'Female', '3998392866');
insert into usuarios (id_usuario, nombre, apellido, contraseña, zonaHoraria, genero, telefonoContacto) values (3, 'Carver', 'Cattanach', '7GRESDF', DEFAULT, 'Male', '1663925254');
insert into usuarios (id_usuario, nombre, apellido, contraseña, zonaHoraria, genero, telefonoContacto) values (4, 'Muhammad', 'Priest', 'H0Q3epz', DEFAULT, 'Male', '9604350752');
insert into usuarios (id_usuario, nombre, apellido, contraseña, zonaHoraria, genero, telefonoContacto) values (5, 'Benn', 'Gossage', 'fE6BHB', DEFAULT, 'Male', '4714559989');
insert into usuarios (id_usuario, nombre, apellido, contraseña, zonaHoraria, genero, telefonoContacto) values (6, 'Helene', 'Sitch', 'atwbs28', DEFAULT, 'Female', '1956390570');
insert into usuarios (id_usuario, nombre, apellido, contraseña, zonaHoraria, genero, telefonoContacto) values (7, 'Nolly', 'Sudron', 'AAPCKnt', DEFAULT, 'Male', '1545474701');
insert into usuarios (id_usuario, nombre, apellido, contraseña, zonaHoraria, genero, telefonoContacto) values (8, 'Myrtle', 'Chalkly', 'Dh1pduYQLGvY', DEFAULT, 'Female', '5427318702');

insert into ingreso (id_ingreso, id_usuario, fechaIngreso) values (40, 'abodham0', '2022-11-24');
insert into ingreso (id_ingreso, id_usuario, fechaIngreso) values (47, 'dcattonnet1', '2023-04-11');
insert into ingreso (id_ingreso, id_usuario, fechaIngreso) values (55, 'cizhak2', '2022-11-15');
insert into ingreso (id_ingreso, id_usuario, fechaIngreso) values (50, 'zbosche3', '2022-08-12');
insert into ingreso (id_ingreso, id_usuario, fechaIngreso) values (64, 'glorriman4', '2022-05-13');
insert into ingreso (id_ingreso, id_usuario, fechaIngreso) values (48, 'ahembry5', '2022-12-15');
insert into ingreso (id_ingreso, id_usuario, fechaIngreso) values (62, 'afrancklyn6', '2023-03-26');
insert into ingreso (id_ingreso, id_usuario, fechaIngreso) values (89, 'cfiorentino7', '2022-08-30');

-- Parte 5: Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso?

-- Tabla usuarios

-- id_usuario es un tipo de dato INT (entero) con la propiedad AUTO_INCREMENT para que se genere automáticamente un número único para cada usuario. Es una buena elección para un identificador único de un usuario.
-- nombre y apellido son campos de tipo VARCHAR(45) (cadena de caracteres) que contienen el nombre y apellido del usuario respectivamente. Esta elección es razonable ya que la longitud de 45 caracteres es suficiente para almacenar la mayoría de los nombres y apellidos, pero podría no ser suficiente en algunos casos.
-- contraseña es otro campo de tipo VARCHAR(45) que almacena la contraseña del usuario. En general, la longitud de 45 caracteres es suficiente para una contraseña, pero se podría argumentar que debería ser más larga para mayor seguridad.
-- zonaHoraria es un campo de tipo TIMESTAMP que registra la fecha y hora del registro del usuario. La elección es razonable ya que la propiedad DEFAULT CURRENT_TIMESTAMP establece el valor por defecto en la fecha y hora actual, lo que hace que sea fácil registrar el momento en que se creó el usuario.
-- genero es un campo de tipo VARCHAR(45) que contiene el género del usuario. Es una elección razonable, pero algunas personas podrían considerar que no es inclusivo ya que solo permite dos opciones (masculino o femenino).
-- telefonoContacto es otro campo de tipo VARCHAR(45) que almacena el número de teléfono de contacto del usuario. La elección es razonable, pero podría haberse utilizado un tipo de dato más específico, como BIGINT, para números de teléfono.

-- Tabla ingreso:

-- id_ingreso es un campo de tipo INT que contiene un identificador único para cada ingreso. Es una elección razonable para un identificador.
-- id_usuario es otro campo de tipo VARCHAR(45) que almacena el identificador del usuario al que pertenece el ingreso. Aunque id_usuario en la tabla usuario es de tipo INT, en la tabla ingreso se utiliza como una cadena de caracteres VARCHAR(45). Esto se debe a que la clave externa en la tabla ingreso debe coincidir con la clave primaria en la tabla usuario, que es de tipo INT, pero se ha utilizado una cadena de caracteres VARCHAR(45) en su lugar. Aunque esto es técnicamente posible, es menos eficiente que usar el mismo tipo de dato en ambas tablas.
-- fechaIngreso es un campo de tipo DATETIME que registra la fecha y hora del ingreso. La elección es razonable ya que se registra la fecha y hora exactas del ingreso.
-- En general, los tipos de datos elegidos son razonables para los campos correspondientes, pero en algunos casos podrían haberse utilizado tipos de datos más específicos o eficientes. Es importante tener en cuenta que la elección del tipo de dato correcto depende de las necesidades específicas de la aplicación.

-- Parte 6: Creen una nueva tabla llamada Contactos (id_contacto, id_usuario, numero de telefono, correo electronico).

CREATE TABLE `personas`.`contactos` (
  `id_contacto` INT NOT NULL,
  `id_usuario` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_contacto`));
  
--  Parte 7: Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la tabla Contactos.

ALTER TABLE usuarios
  DROP PRIMARY KEY;
  
 ALTER TABLE usuarios
  ADD PRIMARY KEY (telefonoContacto);

ALTER TABLE contactos
    ADD CONSTRAINT `telefono` FOREIGN KEY (`telefono`)
        REFERENCES usuarios (`telefonoContacto`);