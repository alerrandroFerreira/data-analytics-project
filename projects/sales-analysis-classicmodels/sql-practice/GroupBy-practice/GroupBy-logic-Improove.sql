-- Group by selects for practice

/* 1. Calcula el número total de pedidos por cada cliente */

select orderNumber, COUNT(customerNumber) from orders
group by orderNumber ;

/* 2. Obtén el total de pagos realizados por cada cliente */

/* 3. Muestra el número de clientes por cada país */

/* 4. Calcula el total vendido por cada producto (quantityOrdered * priceEach) */

/* 5. Muestra el total de pedidos por estado (status) */