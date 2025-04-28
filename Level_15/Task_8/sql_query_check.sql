SELECT * FROM customer_list WHERE invoice_date IS NULL;

-- for viewing the full month sales
SELECT 
    DATE_FORMAT(STR_TO_DATE(invoice_date, '%d-%m-%Y'), '%Y-%m') AS month,
    SUM(price) AS monthly_total,
    SUM(SUM(price)) OVER (ORDER BY DATE_FORMAT(STR_TO_DATE(invoice_date, '%d-%m-%Y'), '%Y-%m')) AS cumulative_total
FROM customer_list
WHERE invoice_date IS NOT NULL
GROUP BY DATE_FORMAT(STR_TO_DATE(invoice_date, '%d-%m-%Y'), '%Y-%m');


-- for viewing between 
SELECT 
    DATE_FORMAT(STR_TO_DATE(invoice_date, '%d-%m-%Y'), '%Y-%m') AS month,
    SUM(price) AS monthly_total,
    SUM(SUM(price)) OVER (ORDER BY DATE_FORMAT(STR_TO_DATE(invoice_date, '%d-%m-%Y'), '%Y-%m')) AS cumulative_total
FROM customer_list
WHERE invoice_date IS NOT NULL
    AND YEAR(STR_TO_DATE(invoice_date, '%d-%m-%Y')) BETWEEN 2022 AND 2025  
GROUP BY DATE_FORMAT(STR_TO_DATE(invoice_date, '%d-%m-%Y'), '%Y-%m');

select category,price,quantity from customer_list
group by category,price,quantity
order by category;

select category,price,quantity,customer_id from customer_list
group by category,price,quantity,customer_id
order by category;

SELECT 
    category,
    customer_id,
    SUM(price * quantity) AS total_sales
FROM customer_list
GROUP BY category, customer_id
ORDER BY category, total_sales DESC;

SELECT DISTINCT category,quantity FROM customer_list;

SELECT *
FROM customer_list
WHERE price = (SELECT MAX(price) FROM customer_list) 
order by gender="Male" desc, gender
limit 5;

SELECT category, customer_id, total_spent
FROM (
    SELECT 
        category,
        customer_id,
        total_spent,
        RANK() OVER (PARTITION BY category ORDER BY total_spent DESC) AS rnk
    FROM (
        SELECT category, customer_id, SUM(price) AS total_spent
        FROM customer_list
        GROUP BY category, customer_id
    ) AS totals
) AS ranked
WHERE rnk <= 5
ORDER BY category, rnk;








