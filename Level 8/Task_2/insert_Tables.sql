INSERT INTO Sales_Fact (Order_ID, Product_ID, Customer_ID, Date_ID, Seller_ID, Quantity, Total_Amount) VALUES 
(1001, 201, 301, '2024-01-01', 401, 2, 500.0),
(1002, 202, 302, '2024-01-02', 402, 2, 300.0),
(1003, 203, 303, '2024-01-03', 403, 4, 1200.0),
(1004, 204, 304, '2024-01-04', 404, 3, 900.0);

update sales_fact
set Quantity=9
where Order_ID=1002;

DESC Sales_Fact;
SHOW COLUMNS FROM Sales_Fact;
SELECT * FROM Sales_Fact;

INSERT INTO Customer_Dim (Customer_ID, Customer_Name, Location) VALUES 
(301, 'Alice','New York'),
(302, 'Bob','California'),
(303, 'Charlie','Texas'),
(304, 'David','Florida');

DESC Customer_Dim;
SHOW COLUMNS FROM Customer_Dim;
SELECT * FROM Customer_Dim;

INSERT INTO Product_Dim (Product_ID, Product_Name, Price, Category_ID) VALUES 
(201, 'Laptop', 250, 1),
(202, 'Phone', 300, 1),
(203, 'Tablet', 300, 1),
(204, 'Monitor', 150, 2);

INSERT INTO Time_Dim (Date_ID, Year, Month, Quarter) VALUES 
('2024-01-01', 2024, 'January', 'Q1'),
('2024-01-02', 2024, 'January', 'Q1'),
('2024-01-03', 2024, 'January', 'Q1'),
('2024-01-04', 2024, 'January', 'Q1');

INSERT INTO Store_Dim (Seller_ID, Seller_Name, Region) VALUES 
(401, 'BestBuy', 'USA'),
(402, 'Amazon', 'USA'),
(403, 'eBay', 'USA'),
(404, 'Walmart', 'USA');

INSERT INTO Customer_Location_Dim (Location, Location_ID) VALUES 
('New York', 1),
('California', 2),
('Texas', 3),
('Florida', 4);

INSERT INTO Product_Category_Dim (Category_ID,Category_Name) VALUES 
(1,'Electronics'),
(2,'Accessories');

DESC Product_Category_Dim;
SHOW COLUMNS FROM Product_Category_Dim;
SELECT * FROM Product_Category_Dim;


 
