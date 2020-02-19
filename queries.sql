-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select product.ProductName
    , category.CategoryName

from product
inner join category ON category.Id = product.CategoryId

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT O.Id
, S.CompanyName
, O.OrderDate
FROM [Order] AS O 
INNER JOIN Shipper AS S ON O.ShipVia = S.Id
WHERE O.OrderDate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT p.ProductName
    , od.Quantity
    , od.OrderId
    from OrderDetail as od
    INNER JOIN [Product] as p ON od.ProductId = p.Id
    WHERE od.OrderId = '10251'

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT O.Id
    , Customer.CompanyName
    , Employee.LastName
FROM [Order] as O
INNER JOIN Customer ON O.CustomerId = Customer.Id
INNER JOIN Employee ON O.EmployeeId = Employee.Id

## Stretch Problems

--   In [SQL Try Editor at W3Schools.com](https://www.w3schools.com/Sql/tryit.asp?filename=trysql_select_top):
--   Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.



--   Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.

select CategoryName, count(*) as count
from Categories
join Products
on Categories.CategoryID = Products.CategoryID
group by categoryName;