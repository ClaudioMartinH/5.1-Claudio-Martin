SELECT employeeId, count(*) AS employee_sales 
FROM transactions 
GROUP BY employeeId
ORDER BY employee_sales DESC
LIMIT 3;
