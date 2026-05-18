/* 1. Muestra la cantidad total de productos por cada proveedor (productVendor) */
select * from products;

Select productVendor, count(productCode) as p_c
from products

group by productVendor;

/* 2. Calcula el promedio de stock disponible por línea de producto */

select productLine, sum(quantityInStock)
from products
group by productLine;

/* 3. Muestra cuántos empleados existen por cargo (jobTitle) */

select jobTitle, count(firstName) 
from employees
group by jobTitle; 

/* 4. Calcula el total de pagos realizados en cada fecha de pago (paymentDate) */

/* 5. Muestra el número de pedidos realizados por año usando orderDate */

/* 6. Calcula el precio promedio de compra (buyPrice) por proveedor */

/* 7. Muestra cuántos clientes tiene asignado cada representante de ventas, excluyendo representantes sin clientes */
