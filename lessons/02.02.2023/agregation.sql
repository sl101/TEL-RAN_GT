-- Agregation

SELECT COUNT(*) AS total_suppliers FROM Suppliers;
SELECT AVG(Price) AS avg_price FROM Products;
SELECT 
	COUNT(*) AS total_products,	
	AVG(Price) AS avg_price,    
    MIN(Price) AS min_price,    
    MAX(Price) AS max_price,    
    SUM(Price) AS total_price 
FROM Products;

-- вывести ко-во клиентов из США
SELECT COUNT(*) as count
FROM Customers 
where Country = 'USA';

-- вывести среднюю стоимость напитка 
SELECT AVG(Price) as avg_beverage_price
from Products
where CategoryID = 1;

-- вывести кол. распределение товаров по категориям
SELECT Categories.CategoryName,
COUNT(*) AS total
FROM Products
left join Categories on Products.CategoryID = Categories.CategoryID
GROUP BY FROM Products.CategoryID
ORDER BY total DESC

SELECT COUNT(*) AS total, 
Categories.CategoryName 
FROM Products 
LEFT JOIN Categories ON Products.CategoryID=Categories.CategoryID 
GROUP BY Products.CategoryID 
ORDER BY total DESC

-- вывести кол. распределение заказов по менеджерам
SELECT COUNT(*) AS total, 
t2.FirstName,
t2.LastName 
FROM Orders t1
LEFT JOIN Employees t2 ON t1.EmployeeID = t2.EmployeeID
GROUP BY t1.EmployeeID 
ORDER BY total DESC;

SELECT COUNT(*) AS total, 
t2.FirstName,
t2.LastName 
FROM Orders t1
LEFT JOIN Employees t2 ON t1.EmployeeID = t2.EmployeeID
GROUP BY t1.EmployeeID 
ORDER BY total ASC
limit 1;

SELECT COUNT(*) AS total, 
t2.FirstName,
t2.LastName 
FROM Orders t1
LEFT JOIN Employees t2 ON t1.EmployeeID = t2.EmployeeID
GROUP BY t1.EmployeeID
HAVING total >= 20
ORDER BY total DESC;

-- из сотрудников 1 и 2 показать того, у кого заказов больше
SELECT COUNT(*) as total, 
	Employees.FirstName, 
	Employees.LastName
FROM Orders
LEFT JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID
WHERE Orders.EmployeeID IN (1, 2)
GROUP BY Orders.EmployeeID
ORDER BY total DESC
LIMIT 1;

-- вывести кто из поставщиков 2 и 3 привез меньше товаров
SELECT COUNT(*) as total, Suppliers.SupplierName
FROM Products
LEFT JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
WHERE Products.SupplierID IN (2, 3)
GROUP BY Products.SupplierID
ORDER BY total
LIMIT 1;

-- удалить всех поставщиков, у которых название города начинается с буквы 'T'
delete FROM Suppliers
where City like 't%';

SELECT avg(price) as avg_price,
t2.SupplierName
FROM Products t1
LEFT JOIN Suppliers t2 ON t1.SupplierID = t2.SupplierID
GROUP BY t2.SupplierID
ORDER BY avg_price DESC
LIMIT 3;

/* 
customer = {
	id: 1,
	email: [
    	1@example.org,
        2@example.org
	],
	contact_person: [
		{fullname: 'Ivan Ivanov', phone: '+0000000000'},
		{fullname: 'Ivan Sidorov', phone: '+11111111'},
		{fullname: 'Ivan Petrov', phone: '+000002222200000'}
	],
	datetime: {
		created: ...,
		online: ...
	}
}
*/
