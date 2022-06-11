-- DELETE: eliminar uno o todos los registros de una tabla

-- Existen dos formas de eliminar datos de una tabla:

-- 1. Sin condicion: se eliminan todos los registros de la tabla.
DELETE FROM <TABLE>;
    -- TABLE es el nombre de la tabla

-- 2. Con condicion: se eliminan solo los registros que cumplan con la condición.
DELETE FROM <TABLE> 
WHERE <CONDITION>;
    
-- La condición se puede utilizar los operadores de comparación y aplica para columnas numéricas o de texto:
-- =, !=, <, >, <=, >=, LIKE, IN, IS NULL, IS NOT NULL (revisar el repositorio de operadores de comparación para más información)
-- P.ej:
DELETE FROM <TABLE>
WHERE <COLUMN> = <VALUE>, ... , <COLUMN> = <VALUE>;

-- La condición puede ser de una o varias columnas (se separan por comas).