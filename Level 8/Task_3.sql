CREATE DATABASE scd_level8;

USE scd_level8;

DROP TABLE IF EXISTS customer_dimension;

CREATE TABLE customer_dimension (
    customer_key INT AUTO_INCREMENT PRIMARY KEY,
    customer_id VARCHAR(20),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    loyalty_tier VARCHAR(20),
    start_date DATE,
    end_date DATE,
    is_current_flag TINYINT
);

INSERT INTO customer_dimension (
    customer_id, first_name, last_name, email, 
    loyalty_tier, start_date, end_date, is_current_flag
) VALUES (
    'CUST001', 'Jane', 'Smith', 'jane.smith@email.com',
    'Bronze', '2022-01-15', '2023-06-30', 0
);

INSERT INTO customer_dimension (
    customer_id, first_name, last_name, email, 
    loyalty_tier, start_date, end_date, is_current_flag
) VALUES (
    'CUST001', 'Jane', 'Smith', 'jane.smith@email.com',
    'Gold', '2023-07-01', '9999-12-31', 1
);

SELECT * FROM customer_dimension;

