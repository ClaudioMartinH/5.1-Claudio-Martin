SELECT glassesId, 
count(*) AS num_sales 
FROM transactions
group by glassesId
ORDER BY num_sales DESC
LIMIT 3;