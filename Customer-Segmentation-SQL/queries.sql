-- Customer Lifetime Value
SELECT 
    o.customer_id,
    SUM(od.price * od.quantity) AS total_spent
FROM orders o
JOIN order_details od 
    ON o.order_id = od.order_id
GROUP BY o.customer_id;

-- Customer Segmentation
SELECT 
    customer_id,
    total_spent,
    CASE 
        WHEN total_spent > 40 THEN 'High Value'
        WHEN total_spent BETWEEN 20 AND 40 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS segment
FROM (
    SELECT 
        o.customer_id,
        SUM(od.price * od.quantity) AS total_spent
    FROM orders o
    JOIN order_details od 
        ON o.order_id = od.order_id
    GROUP BY o.customer_id
) t;
