-- All scenarios are based on Database NORTHWIND.

-- 1.      List all cities that have both Employees and Customers.
SELECT DISTINCT e.City
FROM Employees e
JOIN Customers c ON e.City = c.City;

-- 2.      List all cities that have Customers but no Employee.
    -- a.      Use sub-query
    SELECT DISTINCT c.City
    FROM Customers c
    WHERE c.City NOT IN (SELECT DISTINCT e.City FROM Employees e);

    -- b.      Do not use sub-query
    SELECT DISTINCT c.City
    FROM Customers c
    LEFT JOIN Employees e ON c.City = e.City
    WHERE e.City IS NULL;

-- 3.      List all products and their total order quantities throughout all orders.
SELECT p.ProductName, SUM(od.Quantity) AS TotalOrderQuantity
FROM Products p
JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductName;

-- 4.      List all Customer Cities and total products ordered by that city.
SELECT c.City, SUM(od.Quantity) AS TotalProductsOrdered
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.City;

-- 5.      List all Customer Cities that have at least two customers.
SELECT City, COUNT(CustomerID) AS CustomerCount
FROM Customers
GROUP BY City
HAVING COUNT(CustomerID) >= 2;

-- 6.      List all Customer Cities that have ordered at least two different kinds of products.
SELECT c.City, COUNT(DISTINCT od.ProductID) AS DifferentProducts
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.City
HAVING COUNT(DISTINCT od.ProductID) >= 2;

-- 7.      List all Customers who have ordered products, but have the ‘ship city’ on the order different from their own customer cities.
SELECT c.CustomerID, c.ContactName, c.City AS CustomerCity, o.ShipCity
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.City <> o.ShipCity;

-- 8.      List 5 most popular products, their average price, and the customer city that ordered most quantity of it.
WITH ProductQuantities AS (
    SELECT od.ProductID, p.ProductName, c.City, SUM(od.Quantity) AS TotalQuantity, AVG(od.UnitPrice) AS AvgPrice
    FROM [Order Details] od
    JOIN Products p ON od.ProductID = p.ProductID
    JOIN Orders o ON od.OrderID = o.OrderID
    JOIN Customers c ON o.CustomerID = c.CustomerID
    GROUP BY od.ProductID, p.ProductName, c.City
),
RankedProducts AS (
    SELECT ProductID, ProductName, City, TotalQuantity, AvgPrice,
           RANK() OVER (ORDER BY TotalQuantity DESC) AS ProductRank
    FROM ProductQuantities
)
SELECT ProductName, AvgPrice, City
FROM RankedProducts
WHERE ProductRank <= 5;

-- 9.      List all cities that have never ordered something but we have employees there.
    -- a.      Use sub-query
    SELECT DISTINCT e.City
    FROM Employees e
    WHERE e.City NOT IN (SELECT DISTINCT o.ShipCity FROM Orders o);

    -- b.      Do not use sub-query
    SELECT DISTINCT e.City
    FROM Employees e
    LEFT JOIN Orders o ON e.City = o.ShipCity
    WHERE o.ShipCity IS NULL;

-- 10.  List one city, if exists, that is the city from where the employee sold most orders (not the product quantity) is, and also the city of most total quantity of products ordered from. (tip: join  sub-query)
WITH EmployeeOrderCount AS (
    SELECT e.City, COUNT(o.OrderID) AS TotalOrders
    FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    GROUP BY e.City
),
CityProductCount AS (
    SELECT c.City, SUM(od.Quantity) AS TotalProducts
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    GROUP BY c.City
)
SELECT TOP 1 eoc.City
FROM EmployeeOrderCount eoc
JOIN CityProductCount cpc ON eoc.City = cpc.City
ORDER BY eoc.TotalOrders DESC, cpc.TotalProducts DESC;

-- 11. How do you remove the duplicates record of a table?
WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY column1, column2, column3 -- Specify the columns that define a duplicate
                              ORDER BY column1) AS row_num
    FROM table_name
)
DELETE FROM CTE
WHERE row_num > 1;
