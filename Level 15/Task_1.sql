create database customer; 
use customer;
select* from customer_list;

DESCRIBE customer_list;


SELECT 
    SUM(price)/count(distinct invoice_no) as aov
from 
    customer_list;
    

