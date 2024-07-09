SELECT glassesId, 
count(*) AS num_sales 
FROM transaction
group by glassesId
ORDER BY num_sales DESC
LIMIT 3;