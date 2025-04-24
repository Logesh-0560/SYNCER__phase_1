
CREATE TABLE Customers_5nf (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE Customer_Addresses (
    customer_id VARCHAR(10),
    address VARCHAR(200),
    PRIMARY KEY (customer_id, address),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Customer_Phones (
    customer_id VARCHAR(10),
    phone_number VARCHAR(20),
    PRIMARY KEY (customer_id, phone_number),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Customers_5nf (customer_id, customer_name)
VALUES ('C1', 'Alice');

INSERT INTO Customer_Addresses (customer_id, address)
VALUES
('C1', '123 Main St'),
('C1', '456 Park Ave');

INSERT INTO Customer_Phones (customer_id, phone_number)
VALUES
('C1', '555-1234'),
('C1', '555-5678');

select * from Customers_5nf;
select * from Customer_Addresses;
select * from Customer_Phones;
