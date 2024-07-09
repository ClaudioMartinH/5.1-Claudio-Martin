SELECT
    s.city,
    SUM(od.quantity) AS total_drinks_sold
FROM
    orderDetails od
    JOIN product p ON od.product_id = p.id
    JOIN orders o ON od.order_id = o.id
    JOIN shop s ON o.shop_id = s.id
WHERE
    p.typeOfProduct = 'Bebida'
    AND s.city = 'Tarragona'
GROUP BY
    s.city;
