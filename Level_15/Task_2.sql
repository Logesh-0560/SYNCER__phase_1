SELECT 
    customer_id,
    COUNT(DISTINCT invoice_no) AS total_orders,
    SUM(price) AS total_spent
FROM customer_list
GROUP BY customer_id
HAVING total_orders >= 1
ORDER BY total_spent DESC
LIMIT 1;
