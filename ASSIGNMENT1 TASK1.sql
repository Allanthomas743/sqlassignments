use Techshop;
-- Write an SQL query to retrieve a list of all orders along with customer information (e.g., customer name) for each order
select * from Orders;select * from customers;select Orders.OrderID , Customers.CustomerId ,Customers.Firstname,orders.TotalAmountfrom Orders inner join Customerson Orders.CustomerId=Customers.CustomerId;
-- Write an SQL query to find the total revenue generated by each electronic gadget product. Include the product name and the total revenue.
select * from products;
select* from Orderdetails;
select Products.ProductID,Products.ProductName,sum(Products.Price * OrderDetails.Quantity) TotalAmount from Products inner join OrderDetails on Products.ProductId = Orderdetails.ProductId group by Products.ProductID order by Products.ProductID;
-- Write an SQL query to list all customers who have made at least one purchase. Include their names and contact information.
select CustomerId ,count(*)from Orders group by CustomerID having count(*)>0;
-- Write an SQL query to find the most popular electronic gadget, which is the one with the highest total quantity ordered. Include the product name and the total quantity ordered.
select Products.ProductName , OrderDetails.Quantity from Products inner join OrderDetails on Products.ProductID = OrderDetails.ProductID where OrderDetails.Quantity = (select max(OrderDetails.Quantity) from OrderDetails);
-- Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.
select * from Products;
alter table Products
add Categories varchar(100); I
INSERT INTO Products(ProductID,Categories) VALUES('141','smart'), ('142','smart'), ('143','sound'), ('145','food'), ('147','smart'),('148','digital'), ('149','smart'), ('150','smart'), ('151','sound'), ('152','digital'),('153','storage');
-- Write an SQL query to calculate the average order value for each customer. Include the customer's name and their average order values
Select Customers.FirstName,Customers.LastName,avg(TotalAmount)from Customers inner join Orders on Customers.CustomerID = Orders.CustomerId group by Customers.CustomerID;
-- Write an SQL query to find the order with the highest total revenue. Include the order ID, customer information, and the total revenue.
SELECT Orders.OrderID,Customers.FirstName,Customers.LastName,Orders.TotalAmount AS TotalRevenue FROM Orders JOIN Customers ON Orders.CustomerID = customers.CustomerID WHERE Orders.TotalAmount = (SELECT MAX(TotalAmount) FROM Orders);
-- Write an SQL query to list electronic gadgets and the number of times each product has been ordered.
Select ProductId , count(*)from OrderDetails group by ProductID;
-- Write an SQL query to find customers who have purchased a specific electronic gadget product. Allow users to input the product name as a parameter
-- Write an SQL query to calculate the total revenue generated by all orders placed within a specific time period. Allow users to input the start and end dates as parameters.
select sum(TotalAmount) from Orders where OrderDate between '2024-04-20' and '2024-04-23';