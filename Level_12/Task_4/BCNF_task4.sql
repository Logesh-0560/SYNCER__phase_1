CREATE TABLE Products_bcnf (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

CREATE TABLE Product_Warehouses (
    product_id VARCHAR(10),
    warehouse_id VARCHAR(10),
    PRIMARY KEY (product_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Products_bcnf (product_id, product_name, price)
VALUES
('P1', 'Laptop', 1000.00),
('P2', 'Mouse', 20.00);

INSERT INTO Product_Warehouses (product_id, warehouse_id)
VALUES
('P1', 'W1'),
('P2', 'W2');

select * from products_bcnf;
select * from Product_Warehouses;