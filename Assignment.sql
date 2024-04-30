Use TechShop;
Create table Customers(
CustomerID varchar(255) primary key,
FirstName varchar(255),
LastName varchar(255),
Email varchar(255),
Phone varchar(20),
Address varchar(255)
);
Create table Products(
ProductID varchar(255) primary key,
ProductName varchar(255),
Description varchar(255),
Price int
);
Create table Orders(
OrderID varchar(255) primary key,
CustomerID varchar(255),
OrderDate Datetime,
TotalAmount numeric(10,2),
Foreign key(Customerid)
references Customers(CustomerId)
);
Create table OrderDetails(
OrderDetailID varchar(20) primary key,
OrderID varchar(255),
ProductID varchar(255),
Quantity varchar(30),
Foreign key(OrderID)
references Orders(OrderID),
Foreign key(ProductID)
references Products(ProductID)
)
Create table Inventory(
InventoryID varchar(30) primary key,
ProductID varchar(255),
QuantityInStock varchar(255),
LastStockUpdate varchar(255),
Foreign key(ProductID)
references Products(ProductID)
)
Insert into Customers(CustomerID,FirstName,LastName,Email,Phone,Address) 
Values('1','Allan','Thomas','allan@gmail.com','9988998871','Chennai');
Insert into Customers(CustomerID,FirstName,LastName,Email,Phone,Address) 
Values('2','Hari','Bhaskaran','hari@gmail.com','7767218871','Chennai');
Insert into Customers(CustomerID,FirstName,LastName,Email,Phone,Address) 
Values('3','Ganesh','Raaj','ganesh12@gmail.com','2288998873','Delhi');
Insert into Customers(CustomerID,FirstName,LastName,Email,Phone,Address) 
Values('4','Anandhan','Selvan','anandhan78@gmail.com','6655998842','Pune');
Insert into Customers(CustomerID,FirstName,LastName,Email,Phone,Address) 
Values('5','Sai','Rakesh','sai_rakesh@gmail.com','5577624351','Chennai');
Insert into Customers(CustomerID,FirstName,LastName,Email,Phone,Address) 
Values('6','Sathya','Sai','sathya_sai@gmail.com','4474476272','Pune');
Insert into Customers(CustomerID,FirstName,LastName,Email,Phone,Address) 
Values('7','Anandhan','Selvan','anandhan74@gmail.com','7418689112','Canada');
Insert into Customers(CustomerID,FirstName,LastName,Email,Phone,Address) 
Values('8','Akash','Karthi','akash77@gmail.com','4288248871','Pune');
Insert into Customers(CustomerID,FirstName,LastName,Email,Phone,Address) 
Values('9','Joseph','Paul','joseph6789@gmail.com','6767456712','Chennai');
Insert into Customers(CustomerID,FirstName,LastName,Email,Phone,Address) 
Values('10','Dhanush','Adithya','dadithya@gmail.com','6345987871','Chennai');
INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES 
('11', 'Laptop', 'A powerful laptop with high-end specifications', 999.99),
('12', 'Smartphone', 'The latest smartphone model with a stunning display', 699.99),
('13', 'Headphones', 'Wireless headphones with noise-cancelling feature', 149.99),
('14', 'Tablet', 'A compact tablet with a long-lasting battery', 299.99),
('15', 'Smartwatch', 'A smartwatch with fitness tracking and heart rate monitor', 199.99),
('16', 'Speaker', 'High-fidelity speaker system for immersive audio experience', 249.99),
('17', 'Camera', 'Professional-grade camera with high-resolution sensor', 799.99),
('18', 'Gaming Console', 'A gaming console with top-notch graphics and performance', 499.99),
('19', 'Printer', 'A multifunctional printer for home and office use', 129.99),
('20', 'Monitor', 'An ultra-wide monitor for enhanced productivity', 399.99);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES 
(21, 1, '2024-04-01', 999.99),
(22, 2, '2024-04-02', 699.99),
(23, 3, '2024-04-03', 149.99),
(24, 4, '2024-04-04', 299.99),
(25, 5, '2024-04-05', 199.99),
(26, 6, '2024-04-06', 249.99),
(27, 7, '2024-04-07', 799.99),
(28, 8, '2024-04-08', 499.99),
(29, 9, '2024-04-09', 129.99),
(30, 10, '2024-04-10', 399.99);
Select * from Orders;
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES 
(31, 21, 11, 2),
(32, 22, 12, 1),
(33, 23, 13, 3),
(34, 24, 14, 1),
(35, 25, 15, 2),
(36, 26, 16, 2),
(37, 27, 17, 1),
(38, 28, 18, 3),
(39, 29, 19, 1),
(40, 30, 20, 2);
Select * from OrderDetails;