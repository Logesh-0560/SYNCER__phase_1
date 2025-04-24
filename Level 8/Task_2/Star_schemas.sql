create database customers_list ;
use customers_list ;

CREATE TABLE Sales_Fact (
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
    Category VARCHAR(50)  
);

CREATE TABLE Customer_Dim (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Location_ID INT 
);

CREATE TABLE Time_Dim (
    Date_ID DATE PRIMARY KEY,
    Year INT,
    Month VARCHAR(20),
    Quarter VARCHAR(10)
);

CREATE TABLE Store_Dim (
    Seller_ID INT PRIMARY KEY,
    Seller_Name VARCHAR(100),
    Region VARCHAR(50)
);


