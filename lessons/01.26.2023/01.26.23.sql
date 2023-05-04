-- Работа с БД https://www.w3schools.com/sql/trysql.asp?filename=trysql_select_all

-- Задача 1.
-- 	- вывести клиентов не из Германии. 
-- 	Поля: 
-- 	-- Имя клиента	
-- 	-- страна

SELECT CustomerName, Country 
FROM Customers
WHERE Country != 'Germany';

-- или

SELECT CustomerName, Country 
FROM Customers
WHERE NOT Country = 'Germany';

-- Задача 2.
-- 	-	вывести все товары (products) с ценой в диапазоне от 50 до 150 
-- 	с сортировкой по убыванию цены

select * from products
where price between 50 and 150
order by price desc;

-- Задача 3.
-- 	-	вывести три самых дорогих товара (products) из категори 2 и 3

select * from products
where CategoryID in (2, 3)
order by price desc
limit 3;

-- ### оператор LIMIT определяет выборку по количеству.

-- Задача 4.
	-- вывести информацию о товарах
	-- название товара
	-- стоимость
	-- имя поставщика

SELECT 
	Products.ProductName, 
	Products.Price, 
	Suppliers.SupplierName 
FROM Products 
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;

-- Задача 5.
		-- вывести товары из Франции и Германии
		-- поля
		-- название товара
		-- стоимость товара
		-- страна поставки
SELECT 
	t1.ProductName, 
	t1.Price, 
	t2.Country
FROM Products t1
JOIN Suppliers t2 ON t1.SupplierID = t2.SupplierID
where t2.Country in ('Germany', 'France');

-- Задача 6.
		-- вывести информацию о заказах
		-- поля
		-- номер заказа
		-- имя клиента
		-- страна клиента
		-- имя сотрудника
SELECT 
	t1.OrderID, 
	t2.CustomerName, 
	t2.Country, 
	t3.LastName,
	t3.FirstName 
FROM Orders t1
LEFT JOIN Customers t2 ON t1.CustomerID = t2.CustomerID
LEFT JOIN Employees t3 ON t1.EmployeeID = t3.EmployeeID