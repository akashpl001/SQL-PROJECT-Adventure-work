Q1,

select 
e.[EmailAddress],
p.[PhoneNumber],

t.[Name]
from [Person].[EmailAddress] e
join [Person].[PersonPhone] p
on e.[BusinessEntityID] = p.[BusinessEntityID]
join [Person].[PhoneNumberType] t
on p.[PhoneNumberTypeID]=t.[PhoneNumberTypeID]


Q2,

SELECT *
FROM [Sales].[SalesOrderDetail]
WHERE FORMAT(OrderDate, 'yyyy-MM') = '2011-05';

Q3,


SELECT 
o.*
FROM [Sales].[SalesOrderDetail] o
join [Sales].[SalesOrderHeader] h
on h.[SalesOrderID] = o.[SalesOrderID]
WHERE FORMAT(h.OrderDate, 'yyyy-MM') = '2011-05';


Q4,


SELECT COUNT(s.[ProductID]) AS sales_unit
FROM [Sales].[SalesOrderDetail] s
JOIN [Sales].[SalesOrderHeader] h
    ON s.[SalesOrderID] = h.[SalesOrderID]
WHERE FORMAT(h.[OrderDate], 'yyyy-MM') = '2011-05';

Q5,

SELECT  
    MONTH(h.OrderDate) AS OrderMonth,
    COUNT(s.ProductID) AS sales_unit
FROM [Sales].[SalesOrderDetail] s
JOIN [Sales].[SalesOrderHeader] h
    ON s.SalesOrderID = h.SalesOrderID
WHERE YEAR(h.OrderDate) = 2011
GROUP BY YEAR(h.OrderDate), MONTH(h.OrderDate)
ORDER BY OrderMonth ASC;

Q6,


SELECT 
    p.FirstName,
    p.LastName,
    SUM(soh.TotalDue) AS Total_Sales
FROM Sales.SalesOrderHeader soh
JOIN Sales.Customer c
    ON soh.CustomerID = c.CustomerID
JOIN Person.Person p
    ON c.PersonID = p.BusinessEntityID
WHERE p.FirstName = 'Gustavo'
  AND p.LastName = 'Achong'
GROUP BY p.FirstName, p.LastName;
