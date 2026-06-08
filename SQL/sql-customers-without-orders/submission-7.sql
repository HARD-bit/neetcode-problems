-- Write your query below
SELECT c.name
FROM customers AS c
LEFT JOIN orders AS o ON c.ID = o.customer_id
WHERE o.id IS NULL;
