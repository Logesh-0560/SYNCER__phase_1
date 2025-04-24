SELECT customer_id, COUNT(customer_id) 
FROM customer_list
WHERE invoice_date BETWEEN '01.02.2025' AND '01.05.2025'
GROUP BY customer_id
HAVING COUNT(customer_id) > 1

