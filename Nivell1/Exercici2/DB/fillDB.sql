INSERT INTO customer (id, name, surname, address, postalCode, city, province, phone)
VALUES
(1, "Paco", "Perez", "Muntaner 92, 3º1ª", 08015, "Barcelona", "Barcelona", 600112233),
(2, "Ana", "Lopez", "Diagonal 838, bajos", 08013, "Barcelona", "Barcelona", 611223344),
(3, "Marc", "Marti", "Tusset 13, 3º2ª", 08013, "Barcelona", "Barcelona", 630405060),
(4, "Marina", "Waffle", "Aribau 13, 3º", 17013, "Girona", "Girona", 649852031),
(5, "Joan", "Escriba", "Constitucio 22, bajos", 23013, "Tarragona", "Tarragona", 697463105),
(6, "Antonio", "Rosell", "Renaixement 4, 3º",  89013, "Lleida", "Lleida", 669852014);

INSERT INTO shop (id, city)
VALUES
(1, "Barcelona"),
(2, "Girona"),
(3, "lleida"),
(4, "Tarragona");

INSERT INTO productCategory (id, name)
VALUES
(1, "Especialidad"),
(2, "Vegetariana"),
(3, "Clasicas"),
(4, "Temporada");

INSERT INTO product (id, name, typeOfProduct, unitPrize, id_productCategory)
VALUES
(1, "Margarita", "Pizza", 9.90, 3),
(2, "Especial de la casa", "Pizza", 12.95, 1),
(3, "De la huerta", "Pizza", 11.95, 2),
(4, "La Fresca", "Pizza", 12.95, 4),
(5, "Pecado Carnal", "Hamburguesa", 9.75, NULL),
(6, "Doble con queso", "Hamburguesa", 8.95, NULL),
(7, "La Vegana", "Hamburguesa", 9.25, NULL),
(8, "Coca Cola", "Bebida", 2.30, NULL),
(9, "Cerveza", "Bebida", 3.00, NULL),
(10, "Agua", "Bebida", 2.50, NULL);

INSERT INTO employee (id, fullName, nif, phoneNumber, duty, id_shop)
VALUES
(1, "John Ramirez", "41236578A", 645987123, "Delivery", 1),
(2, "Marta Marti", "41717410B", 663214587, "Sala", 1),
(3, "Paco Martinez", "45987123C", 646589720, "Cocina", 1),
(4, "Antonio Mirez", "41741078D", 695487123, "Delivery", 2),
(5, "Sofia Marsal", "40174105E", 663214587, "Sala", 2),
(6, "Juan Ruiz", "45812039F", 646589720, "Cocina", 2),
(7, "Dani Marquez", "41245789G", 645987123, "Delivery", 3),
(8, "Marta Marti", "47458410H", 663214587, "Sala", 3),
(9, "Paco Martinez", "45633123J", 646589720, "Cocina", 3),
(10, "John Ramirez", "41240578K", 645987123, "Delivery", 4),
(11, "Marta Marti", "41716310L", 663214587, "Sala", 4),
(12, "Paco Martinez", "45697123M", 646589720, "Cocina", 4);

INSERT INTO delivery (id, date_time, id_employee)
VALUES
(1, "2023-10-03 21:15:00", 1),
(2, "2023-11-06 22:37:30", 4),
(3, "2023-11-27 22:05:00", 1),
(4, "2023-11-30 23:00:15", 7),
(5, "2023-12-02 21:48:15", 10),
(6, "2023-12-10 22:05:18", 7),
(7, "2023-12-15 23:15:10", 10),
(8, "2023-12-19 21:58:55", 4),
(9, "2023-12-20 22:01:30", 1);

INSERT INTO orders (id, date_time, orderType, shop_id, employee_id, id_delivery)
VALUES
(1, "2023-10-03 20:35:15", "Delivery", 1, 2, 1),
(2, "2023-11-06 22:00:15", "Delivery", 2, 5, 2),
(3, "2023-11-27 21:41:50", "Delivery", 1, 2, 3),
(4, "2023-11-30 22:35:15", "Delivery", 3, 8, 4),
(5, "2023-12-02 21:11:20", "Delivery", 4, 11, 5),
(6, "2023-12-10 21:25:45", "Delivery", 3, 8, 6),
(7, "2023-12-15 22:25:45", "Delivery", 4, 11 ,7),
(8, "2023-12-19 21:10:50", "Delivery", 2, 5, 8),
(9, "2023-12-20 21:20:15", "Delivery", 1, 2, 9),
(10, "2023-12-21 20:45:15", "Local", 4, 11, NULL),
(11, "2023-12-21 21:00:15", "Local", 3, 8, NULL),
(12, "2023-12-28 20:55:15", "Local", 4, 11, NULL);

INSERT INTO orderDetails (order_id, product_id, quantity, subtotal, customer_id)
VALUES
(1, 1, 1, 9.90 * 1, 1),
(1, 9, 1, 2.50 * 1, 1),
(2, 2, 2, 12.95 * 2, 2), 
(2, 1, 8, 2.30 * 1, 2),
(3, 5, 1, 9.75 * 1, 3),
(4, 3, 1, 11.95 * 1, 4), 
(5, 6, 1, 8.95 * 1, 5), 
(6, 7, 2, 9.25 * 2, 6), 
(7, 4, 1, 12.95 * 1, 1), 
(7, 2, 1, 9.90 * 1, 1), 
(7, 9, 2, 3.00 * 2, 1), 
(8, 7, 1, 9.25 * 1, 2), 
(9, 2, 1, 12.95 * 1, 3), 
(9, 10, 1, 2.50 * 1, 3), 
(10, 8, 1, 2.30 * 1, 4), 
(10, 3, 1, 11.95 * 1, 4), 
(10, 5, 1, 9.75 * 1, 4), 
(11, 10, 1, 2.50 * 1, 5), 
(11, 9, 1, 3.00 * 1, 5), 
(11, 4, 1, 12.95 * 1, 5), 
(12, 1, 3, 9.90 * 3, 6);