-- Primero indico que voy a y trabajar en el database sakila --
use sakila;

-- PARTE 1 --
-- Selecciono la tabla customer indicando que quiero ver las columnas de nombre y apellido --
SELECT first_name, last_name
FROM customer;
-- Tambien las peliculas con duracion mayor a 120 minutos --
SELECT title, length 
FROM film 
WHERE length > 120;

-- PARTE 2 --
--  Ordeno los  clientes por apellido de manera ascendente --
SELECT first_name, last_name 
FROM customer 
ORDER BY last_name ASC;
-- Top 5 películas más largas --
SELECT title, length 
FROM film 
ORDER BY length DESC 
LIMIT 5;

-- PARTE 3 --
-- Cantidad pagada y fecha del pago con nombre y apellido del cliente --
SELECT p.amount, p.payment_date, c.first_name, c.last_name 
FROM payment p
INNER JOIN customer c ON p.customer_id = c.customer_id;
-- Peliculas alquiladas --
SELECT f.title, r.rental_date 
FROM rental r
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.	film_id;
-- El inner join conecta la tabla rental con inventory, luego conecta inventory con peliculas --

-- PARTE 4 --
-- Nombre y apellido de clientes sin pagos --
-- Al usar LEFT JOIN desde clientes hacia pagos, se filtra con WHERE p.payment_id IS NULL para encontrar aquellos clientes que no tienen registros coincidentes en la tabla de pagos.
SELECT c.first_name, c.last_name 
FROM customer c
LEFT JOIN payment p ON c.customer_id = p.customer_id
WHERE p.payment_id IS NULL;
-- Listar los nombres de las películas y su duración de aquellos títulos que no tienen actores --
SELECT f.title, f.length 
FROM film f
LEFT JOIN film_actor fa ON f.film_id = fa.film_id
WHERE fa.actor_id IS NULL;

-- PARTE 5 --
-- Agregar nuevo actor --
INSERT INTO actor (first_name, last_name) 
VALUES ('ANDRES', 'MARTINEZ');
-- Corregir el nombre del actor --
UPDATE actor 
SET first_name = 'FERNANDO' 
WHERE first_name = 'ANDRES' AND last_name = 'MARTINEZ';
-- Eliminar el actor agregado --
DELETE FROM actor 
WHERE first_name = 'FERNANDO' AND last_name = 'MARTINEZ';

-- PARTE 6 --
-- Top 5 clientes con mayor cantidad de dinero pagado al servicio de rentas --
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_pagado
FROM customer c
INNER JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY total_pagado DESC
LIMIT 5;
-- Top 5 Películas más alquiladas --
SELECT f.title, COUNT(r.rental_id) AS total_alquileres
FROM rental r
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id
GROUP BY f.film_id, f.title
ORDER BY total_alquileres DESC
LIMIT 5;