-- ============================================================
-- DÍA 17 JUNIO — SQL: JOIN básico
-- Base de datos: classicmodels
-- ============================================================

-- CONCEPTO 1 — Normalización: por qué los datos se separan
-- ---------------------------------------------------------------
-- La tabla orders NO guarda el nombre del cliente, solo su número.
-- La tabla customers SÍ tiene el nombre.
-- Esto es normalización: cada dato vive en un único sitio.
--
-- Ejercicio 1:
-- Ejecuta estas dos queries por separado y observa:
-- ¿Qué tiene orders que no tiene el nombre del cliente?
-- ¿Qué tiene customers que sí lo tiene?
SELECT orderNumber, customerNumber, orderDate, status
FROM orders
LIMIT 5;

SELECT customerNumber, customerName, country
FROM customers
LIMIT 5;


-- CONCEPTO 2 — Primary Key: identificador único de cada fila
-- ---------------------------------------------------------------
-- Ejercicio 2:
-- Muestra los primeros 10 clientes con solo su customerNumber
-- y customerName. Observa que customerNumber nunca se repite
-- — eso lo convierte en Primary Key.

SELECT customerNumber, customerName
FROM customers
LIMIT 10;


-- CONCEPTO 3 — Foreign Key: columna que apunta a otra tabla
-- ---------------------------------------------------------------
-- En orders, customerNumber es una Foreign Key que apunta
-- a customers.customerNumber (Primary Key).
-- Esto es el "puente" entre las dos tablas.
--
-- Ejercicio 3:
-- Muestra todos los pedidos del cliente con customerNumber = 103.
-- Luego busca ese cliente en la tabla customers.
-- Confirma que el customerNumber coincide en ambas tablas.

SELECT orderNumber, customerNumber, orderDate, status
FROM orders
WHERE customerNumber = 103;

SELECT customerNumber, customerName, country
FROM customers
WHERE customerNumber = 103;


-- CONCEPTO 4 — Relación one-to-many: un cliente, muchos pedidos
-- ---------------------------------------------------------------
-- Ejercicio 4:
-- Cuenta cuántos pedidos tiene cada cliente.
-- Ordena de mayor a menor y muestra los 10 primeros.
-- Esto demuestra que un cliente puede tener muchos pedidos
-- pero cada pedido pertenece a un solo cliente.

SELECT customerNumber, COUNT(orderNumber) AS total_pedidos
FROM orders
GROUP BY customerNumber
ORDER BY total_pedidos DESC
LIMIT 10;


-- CONCEPTO 5 — INNER JOIN: sintaxis base
-- ---------------------------------------------------------------
-- Sintaxis:
-- SELECT columnas
-- FROM tabla1 alias1
-- INNER JOIN tabla2 alias2 ON alias1.clave = alias2.clave
--
-- Ejercicio 5:
-- Conecta orders con customers usando INNER JOIN.
-- Muestra: orderNumber, customerName, orderDate, status.
-- Usa alias o (orders) y c (customers).

SELECT o.orderNumber, c.customerName, o.orderDate, o.status
FROM orders o
INNER JOIN customers c ON o.customerNumber = c.customerNumber;


-- CONCEPTO 6 — Qué descarta el INNER JOIN
-- ---------------------------------------------------------------
-- INNER JOIN solo devuelve filas que tienen correspondencia
-- en AMBAS tablas. Si un pedido no tiene cliente registrado,
-- o un cliente no tiene pedidos, esa fila desaparece.
--
-- Ejercicio 6:
-- Compara estos dos resultados:
-- A) Total de filas en orders (sin JOIN)
-- B) Total de filas después del INNER JOIN con customers
-- ¿Son iguales? ¿Por qué sí o por qué no?

SELECT COUNT(*) AS total_orders FROM orders;

SELECT COUNT(*) AS total_con_join
FROM orders o
INNER JOIN customers c ON o.customerNumber = c.customerNumber;


-- CONCEPTO 7 — JOIN completo aplicado al negocio
-- ---------------------------------------------------------------
-- Ejercicio 7:
-- El equipo comercial necesita un listado completo de pedidos
-- con el nombre del cliente, su país, la fecha del pedido
-- y el estado actual.
-- Escribe el INNER JOIN entre orders y customers que lo resuelva.
-- Ordena por fecha de pedido de más reciente a más antiguo.

SELECT
    o.orderNumber,
    c.customerName,
    c.country,
    o.orderDate,
    o.status
FROM orders o
INNER JOIN customers c ON o.customerNumber = c.customerNumber
ORDER BY o.orderDate DESC;
