-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT c.CategoryName, p.ProductName
FROM category as C
JOIN Product as P
on P.CategoryId = c.id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
Select o.id as OrderId, s.CompanyName, o.orderdate
from [order] as O
join Shipper as  s
on o.shipvia = s.id
where o.OrderDate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select p.ProductName, ord.Quantity, ord.OrderId
from [order] as o
join OrderDetail as ord on o.id = ord.OrderId
join product as p on ord.ProductId=p.id
where ord.OrderId = 10251
order by p.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select o.Id as OrderId, c.CompanyName, e.LastName
from [order] as o
join Employee as e on e.id=o.EmployeeId
join Customer as c on c.id=o.CustomerId 