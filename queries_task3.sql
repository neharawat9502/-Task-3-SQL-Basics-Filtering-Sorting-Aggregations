1️⃣ Basic SELECT 
SELECT * FROM customers LIMIT 10;


2️⃣  WHERE + ORDER BY
SELECT customerName, country, creditLimit
FROM customers
WHERE country = 'USA'
ORDER BY creditLimit DESC;

3️⃣ GROUP BY + SUM
SELECT p.productLine,
SUM(od.quantityOrdered * od.priceEach) AS total_sales
FROM products p
JOIN orderdetails od
ON p.productCode = od.productCode
GROUP BY p.productLine;

4️⃣ HAVING clause
SELECT p.productLine,
SUM(od.quantityOrdered * od.priceEach) AS total_sales
FROM products p
JOIN orderdetails od
ON p.productCode = od.productCode
GROUP BY p.productLine
HAVING total_sales > 100000;

5️⃣ date range
SELECT *
FROM orders
WHERE orderDate BETWEEN '2004-01-01' AND '2004-12-31';

6️⃣ pattern search
SELECT customerName
FROM customers
WHERE customerName LIKE '%Auto%';

7️⃣  Top 5 customers
SELECT c.customerName,
SUM(od.quantityOrdered * od.priceEach) AS total_spend
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY c.customerName
ORDER BY total_spend DESC
LIMIT 5;
