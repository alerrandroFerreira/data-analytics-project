-- Group by selects for practice

/* 1. Calcula el número total de pedidos por cada cliente */

select customerNumber as Customer, COUNT(orderNumber)as Total_Order_By_Customer from orders
group by customerNumber ;

/* 2. Obtén el total de pagos realizados por cada cliente */

select customerNumber as Customer, COUNT(checkNumber) as Total_Customers_payments from payments
group by customerNumber;
/* 3. Muestra el número de clientes por cada país */
select country as Country, COUNT(customerNumber) as Total_Customers_per_country from customers
group by country;
/* 4. Calcula el total vendido por cada producto  */
SELECT 
    productCode,
    SUM(quantityOrdered * priceEach) AS total_vendido
FROM orderdetails
GROUP BY productCode;
/* 5. Muestra el total de pedidos por estado (status) */
SELECT 
    status,
    COUNT(orderNumber) AS total_pedidos
FROM orders
GROUP BY status;