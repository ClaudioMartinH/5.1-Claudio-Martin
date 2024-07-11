-- Llista el total de compres d’un client/a.
SELECT * FROM transactions WHERE customerId = 1;
-- Llista les diferents ulleres que ha venut un empleat durant un any.
SELECT employeeId, count(*) AS employee_sales 
FROM transactions
GROUP BY employeeId
ORDER BY employee_sales DESC
LIMIT 3;
-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.
SELECT s.id, s.name, COUNT(t.id) AS num_sales 
FROM transactions t
JOIN glasses g ON t.glassesId = g.id
JOIN supplier s ON g.supplierId = s.id
GROUP BY s.id, s.name
ORDER BY num_sales DESC;