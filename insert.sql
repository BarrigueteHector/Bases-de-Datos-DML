-- INSERT: Insertar un registro en una tabla

-- Existen dos formas en las que podemos agregar datos a nuestras tablas
-- 1. Utilizando encabezado
INSERT INTO <TABLE> (<COLUMN>, ... , <COLUMN>) VALUES (<VALUE>, ... , <VALUE>);
    -- TABLE es el nombre de la tabla
    -- COLUMN es el nombre de la columna
    -- VALUE es el valor que queremos insertar en la columna

-- En esta primera forma podemos agregar la cantidad de datos que queramos, no es necesario llenar todas las columnas para un registro. 
-- P.ej: Si nuestra tabla tiene 5 columnas y nosotros solo queremos agregar informaciona a 2 de ellas, podemos hacerlo.

-- NOTA #1: El orden de COLUMN no importa, pero deben coincidir con el VALUE. De no coincidir, se generará un error.
-- NOTA #2: La cantidad de valores que se insertaran deben ser iguales a la cantidad de columnas mencionadas, de no ser el caso se generará un error.

-- 2. Sin encabezado
INSERT INTO <TABLE> VALUES (<VALUE>, ... , <VALUE>);
    -- TABLE es el nombre de la tabla
    -- VALUE es el valor que queremos insertar en la tabla

-- A diferencia de la primera forma, debemos insertar datos para cada columna del registro.
-- P.ej: Si nuestra tabla tiene 5 columnas, debemos mandar datos para las 5 columnas.

-- NOTA #1: El orden de VALUE debe ser el mismo que el de las columnas al momento de crear la tabla, de no ser el caso se generara un error.
-- NOTA #2: Si no se agregan los datos para cada columna, se generara un error.