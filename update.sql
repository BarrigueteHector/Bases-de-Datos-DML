-- UPDATE: actualizar un registro en una tabla

-- Para poder utilizar esta instrucción, se deben de conocer el nombre y estructura de una tabla, la tabla de tener registros y debemos saber los valores de dichos registros.

-- Hay dos formas de realizar la actualización de un registro:
-- 1. Sin condicion: se actualizan todos los registros de la tabla.
UPDATE <TABLE> SET <COLUMN> = <VALUE>;
    -- TABLE es el nombre de la tabla
    -- COLUMN es el nombre de la columna que vamos a actualizar
    -- VALUE es el nuevo valor para la columna

-- Se pueden hacer actualizaciones a una o varias columnas, deben ser separadas por una coma.

-- 2. Con condicion: se actualizan solo los registros que cumplan con la condición.
UPDATE <TABLE> SET <COLUMN> = <VALUE>, ... , <COLUMN> = <VALUE> 
WHERE <CONDITION>;

-- La condición se puede utilizar los operadores de comparación y aplica para columnas numéricas o de texto:
-- =, !=, <, >, <=, >=, LIKE, IN, IS NULL, IS NOT NULL (revisar el repositorio de operadores de comparación para más información)
-- P.ej: 
UPDATE <TABLE> SET <COLUMN> = <VALUE>, ... , <COLUMN> = <VALUE> 
WHERE <COLUMN> = <VALUE>, ... , <COLUMN> = <VALUE>;

-- La condición puede ser de una o varias columnas (se separan por comas).