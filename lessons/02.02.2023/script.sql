-- вывести все товары, кроме категории напитков, в диапазоны цены от 1 до 100

-- решение 1
SELECT * FROM Products t1
left join Categories t2 on t1.CategoryID = t2.CategoryID
where t2.CategoryName = 'Beverages' and t1.price between 1 and 100;

-- решение 2
SELECT * FROM Products 
WHERE NOT CategoryID=1 AND Price BETWEEN 1 AND 100 
ORDER BY Price DESC;

-- очистить у всех поставщиков, кроме тех что из UK и США, поле ContactName
update Suppliers 
set ContactName = ''
where not country in ('USA', 'UK');


-- =========================================
