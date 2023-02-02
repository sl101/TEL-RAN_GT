-- Напишите запрос (в рамках "песочницы"), который покажет заказы клиентов из США. Поля:
-- ID заказа
-- Имя клиента
-- Название компании-перевозчика (shippers)

SELECT 
	t1.OrderID,
    t2.CustomerName,
    t3.ShipperName
FROM Orders t1
Join Customers t2 on t1.CustomerID = t2.CustomerID
Join Shippers t3 on t1.ShipperID = t3.ShipperID
where t2.Country = 'USA';