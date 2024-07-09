SELECT employeeId, count(*) AS employee_sales 
FROM transaction 
GROUP BY employeeId
ORDER BY employee_sales DESC
LIMIT 3;
