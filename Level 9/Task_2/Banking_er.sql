create database Banking_ER;

use Banking_ER;

CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(255)
);

CREATE TABLE Branch (
    Branch_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE Account (
    Account_ID INT PRIMARY KEY,
    Type VARCHAR(50),
    Balance DECIMAL(12,2),
    Customer_ID INT,
    Branch_ID INT,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)
);

CREATE TABLE Loan (
    Loan_ID INT PRIMARY KEY,
    Amount DECIMAL(12,2),
    Interest_Rate DECIMAL(5,2),
    Start_Date DATE,
    Term INT,
    Customer_ID INT,
    Branch_ID INT,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)
);

CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Loan_ID INT,
    Payment_Date DATE,
    Amount DECIMAL(12,2),
    FOREIGN KEY (Loan_ID) REFERENCES Loan(Loan_ID)
);
