-- Primero indico que voy a y trabajar en el database sakila --
use sakila;
-- Selecciono la tabla customer indicando que quiero ver las columnas de nombre y apellido --
SELECT first_name, last_name
FROM actor
-- Filtro los apellidos buscando uno em especifico --
WHERE first_name = 'Penelope'
-- Se ordenan los resultados por orden ascendente --
ORDER BY last_name ASC;
-- Continuo ahora con agregar una nueva persona a la tabla
INSERT INTO actor (first_name, last_name) 
VALUES ('ANDRES', 'MARTINEZ');
-- Se descubre que el nombre está mal y que se debe corregir
INSERT INTO actor (first_name, last_name) 
VALUES ('FERNANDO', 'MARTINEZ');
-- Se decide borrar el nombre ya agregado
DELETE FROM actor 
WHERE first_name = 'ANDRES' AND last_name = 'MARTINEZ';
