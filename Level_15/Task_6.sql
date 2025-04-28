select*from customer_list

CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    gender VARCHAR(10),
    age INT
);

CREATE TABLE invoices (
    invoice_no VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    payment_method VARCHAR(50),
    invoice_date DATE,
    shopping_mall VARCHAR(100),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE invoice_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_no VARCHAR(50),
    category VARCHAR(100),
    quantity INT,
    price FLOAT,
    FOREIGN KEY (invoice_no) REFERENCES invoices(invoice_no)
);

create table products (
	category varchar(50),
    price float
);
	

INSERT INTO customers (customer_id, gender, age)
SELECT DISTINCT customer_id, gender, age
FROM customer_list;

INSERT INTO invoices (invoice_no, customer_id, payment_method, invoice_date, shopping_mall)
SELECT DISTINCT 
    invoice_no, 
    customer_id, 
    payment_method, 
    STR_TO_DATE(invoice_date, '%d-%m-%Y') AS invoice_date, 
    shopping_mall
FROM customer_list;

INSERT INTO invoice_items (invoice_no, category, quantity, price)
SELECT 
    cl.invoice_no,
    cl.category,
    cl.quantity,
    cl.price
FROM 
    customer_list cl
INNER JOIN 
    invoices i ON cl.invoice_no = i.invoice_no;

insert into products (category,price)
select distinct category,price
from customer_list;

select * from customers;
select * from invoice_items;
select * from invoices;
select * from products;

select * from customer_list;
