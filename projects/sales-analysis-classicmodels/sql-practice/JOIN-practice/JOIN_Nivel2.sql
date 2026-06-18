USE classicmodels;
-- Ejercicio 1:
-- Muestra el nombre de cada empleado junto con el nombre
-- de la ciudad donde trabaja su oficina.
select * from offices;

select 
e.firstname as Empleado, 
o.city as CiudadOficina  
from employees e
inner join offices o
on e.officeCode = o.officeCode;

-- Ejercicio 2:
-- Lista todos los pedidos mostrando el nombre del cliente,
-- el nombre de su representante de ventas (empleado)
-- y la fecha del pedido.

select 
o.orderNumber as Pedido,
c.customerName as NombreCliente,
e.firstName as RepresentanteVentas
from orders o
inner join customers c
on o.customerNumber = c.customerNumber 
inner join employees e
on c.salesRepEmployeeNumber = e.employeeNumber;

-- Ejercicio 3:
-- Muestra el total facturado por cada cliente
-- Incluye el nombre del cliente en el resultado.
select * from orders;
select * from orderdetails;
select * from customers;
select SUM(od.quantityOrdered * od.priceEach) as FacturaTotalCliente,
c.customerName
from orders o
inner join customers c
on o.customerNumber = c.customerNumber
inner join orderdetails od
on o.orderNumber = od.orderNumber
group by c.customerNumber, c.customerName
order by FacturaTotalCliente DESC;

-- Ejercicio 4:
-- Lista los productos que han sido pedidos alguna vez,
-- mostrando el nombre del producto y el total de unidades
-- vendidas en todos los pedidos.
select 
o.orderNumber as Pedido,
p.productName as NombreProducto, 
od.quantityOrdered as CantidadPedida
from products p
inner join orderdetails od on p.productCode = od.productCode
inner join orders o on od.orderNumber = o.orderNumber;

-- Ejercicio 5:
-- Muestra los clientes que SÍ tienen pedidos registrados,
-- junto con cuántos pedidos tienen.
select
c.customerName as Cliente,
count(o.orderNumber) as TotalPedidos
from customers c
inner join orders o on c.customerNumber = o.customerNumber
group by c.customerNumber, c.customerName
order by TotalPedidos DESC;

-- Ejercicio 6:
-- Lista cada empleado junto con el nombre de su jefe directo.
-- Si un empleado no tiene jefe (el CEO), muéstralo igual
select 
e.firstName,  
c.customerName
from employees e
inner join customers c on e.reportsTo = c.salesRepEmployeeNumber
;
-- versión correcta
SELECT
    e.firstName AS Empleado,
    jefe.firstName AS JefeDirecto
FROM employees e
LEFT JOIN employees jefe ON e.reportsTo = jefe.employeeNumber;

-- Ejercicio 7:
-- El equipo directivo quiere saber qué oficina genera
-- más ingresos sumando el total facturado de todos sus empleados.
SELECT
    ofs.city AS Oficina,
    SUM(od.quantityOrdered * od.priceEach) AS TotalFacturado
FROM offices ofs
-- cada empleado pertenece a una oficina (officeCode es la FK en employees)
INNER JOIN employees e     ON ofs.officeCode    = e.officeCode
-- cada cliente tiene asignado un representante de ventas (que es un empleado)
INNER JOIN customers c     ON e.employeeNumber  = c.salesRepEmployeeNumber
-- cada pedido pertenece a un cliente
INNER JOIN orders o        ON c.customerNumber  = o.customerNumber
-- cada pedido tiene líneas de detalle con cantidad y precio
INNER JOIN orderdetails od ON o.orderNumber     = od.orderNumber
-- agrupamos por oficina para sumar todo lo facturado desde esa oficina
GROUP BY ofs.officeCode, ofs.city
ORDER BY TotalFacturado DESC;
