
CREATE TABLE if not exists Sales_Fact (
    Order_ID INT PRIMARY KEY,
    Product_ID INT,
    Customer_ID INT,
    Date_ID DATE,
    Seller_ID INT,
    Quantity INT,
    Total_Amount DECIMAL(10,2)
);

CREATE TABLE Product_Dim (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Price DECIMAL(10,2),
    Category_ID INT
);

CREATE TABLE Product_Category_Dim (
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(50)
);

CREATE TABLE Customer_Dim (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Location_ID int 
);

CREATE TABLE Customer_Location_Dim (
    Location_ID INT PRIMARY KEY,
    Location VARCHAR(100)
);

CREATE TABLE Store_Dim (
    Seller_ID INT PRIMARY KEY,
    Seller_Name VARCHAR(100),
    Region VARCHAR(50)
);
