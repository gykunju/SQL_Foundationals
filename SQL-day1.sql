CREATE DATABASE SalesDB;

use SalesDB;

CREATE TABLE Customers (
	CustomerID INT AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    PRIMARY KEY (CustomerID)
    );
    
CREATE TABLE Products (
	ProductID INT AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (ProductID)
    );
    
CREATE TABLE Sales (
	SaleID INT AUTO_INCREMENT,
    CustomerID INT,
    ProductID INT,
    SaleDate DATE,
    Quantity INT NOT NULL,
    PRIMARY KEY (SaleID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
    );
    
-- INSERT CUSTOMERS
INSERT INTO Customers (FirstName,LastName,Email) VALUES 
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com'),
('Michael', 'Brown', 'michael.brown@example.com');

-- INSERT PRODUCTS 
INSERT INTO Products (ProductName,Price) VALUES
('Laptop', 1200.00),
('Smartphone', 800.00),
('Tablet', 300.00);

-- INSERT SALES
INSERT INTO Sales (CustomerID, ProductID, SaleDate, Quantity) VALUES
(1, 1, '2024-05-01', 1),
(1, 2, '2024-05-03', 2),
(2, 1, '2024-05-04', 1),
(2, 3, '2024-05-05', 1),
(3, 2, '2024-05-06', 3),
(3, 3, '2024-05-07', 2);

SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Sales;

-- AVERAGE QUANTITY
SELECT AVG(Quantity) AS Avg_Qty FROM Sales;

-- TOTAL SALES MADE
SELECT COUNT(*) AS TotalSales FROM Sales;

-- MAXIMUM QUANTITY SOLD
SELECT MAX(Quantity) AS MaxQtyFROM FROM Sales;

-- MINIMUM QUANTITY SOLD
SELECT MIN(Quantity) AS MinQty FROM  Sales;

SELECT c.CustomerID,c.FirstName,c.LastName,SUM(s.Quantity * p.Price) AS TotalSalesAmount
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSalesAmount DESC;

SELECT p.ProductID, p.ProductName, SUM(s.Quantity) AS TotalQtySold
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalQtySold DESC;

SELECT c.CustomerId, c.FirstName, AVG(s.Quantity)
FROM Sales s
JOIN Customers c ON c.CustomerID = s.CustomerID
GROUP BY c.customerID, c.FirstName;

SELECT c.CustomerID, c.FirstName, c.LastName, SUM(s.Quantity * p.price) AS TotalSalesAmount
FROM Sales s
JOIN Customers c ON s.CustomerId = c.CustomerID
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING TotalSalesAmount > 1500;






