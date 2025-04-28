WITH customer_spend_rank AS (
    SELECT 
        customer_id,
        SUM(price) AS total_spent,
        RANK() OVER (ORDER BY SUM(price) DESC) AS spend_rank
    FROM 
        customer_list
    GROUP BY 
        customer_id
)

SELECT 
    cl.*,  
    csr.total_spent,
    csr.spend_rank
FROM 
    customer_list cl
JOIN 
    customer_spend_rank csr
ON 
    cl.customer_id = csr.customer_id
WHERE 
    csr.spend_rank <= 5
ORDER BY 
    csr.spend_rank, cl.customer_id
limit 5;