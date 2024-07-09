SELECT employee_Id, COUNT(*) AS num_orders
FROM orders
GROUP BY employee_Id
ORDER BY num_orders DESC
LIMIT 1;

