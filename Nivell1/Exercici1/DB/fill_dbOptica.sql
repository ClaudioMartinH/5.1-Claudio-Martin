INSERT INTO address (id, street, number, floor, door, city, postalcode, country)
VALUES 
(1, "Rocafort", 188, 5, "2", "Barcelona", 08029, "Espanya"),
(2, "Entença", 100, 4, "2", "Barcelona",08015, "Espanya"),
(3, "Mallorca", 25, 2, "1", "Barcelona",08020, "Espanya"),
(4, "Valencia", 35, 3, "3", "Barcelona",08020, "Espanya"),
(5, "Calabria", 45, 5, "4", "Barcelona",08015, "Espanya"),
(6, "Viladomat", 55, 6, "2", "Barcelona",08017, "Espanya"),
(7, "Urgell", 65, 1, "1", "Barcelona",08018, "Espanya"),
(8, "Casanova", 40, 2, "3", "Barcelona",08018, "Espanya"),
(9, "Aribau", 50, 3, "4", "Barcelona",08018, "Espanya"),
(10, "Muntaner", 60, 4, "4", "Barcelona",08029, "Espanya");

INSERT INTO frame (id, type, color)
VALUES
(1, "Pasta", "Blau"),
(2, "Flotant", "Vermell"),
(3, "Metal.lica", "Groc"),
(4, "Pasta", "Verd"),
(5, "Flotant", "Negre"),
(6, "Metal.lica", "Gris");

INSERT INTO employee (id, name)
VALUES
(1, "Ana Ruiz"),
(2, "Marta Perez"),
(3, "Lis Fernandez"),
(4, "Marc Mato"),
(5, "Luis Ibarz");

INSERT INTO supplier (id, name, phone, fax, nif, brand, addressId)
VALUES
(1, "Buenver", 931112233, 932221133, "B65432109", "Oakley", 1),
(2, "Regafas", 932223311, 933331133, "B65432110", "Oakley", 2),
(3, "Noteveo", 933332233, 934441133, "B65432111", "Oakley", 3),
(4, "Miramebien", 934442233, 938887766, "B65432112", "Oakley", 4),
(5, "Verloclaro", 935552233, 937776688, "B65432113", "Oakley", 5);

INSERT INTO customer (id, name, phone, email, registerDate, customerSentBy, addressId)
VALUES
(1, "Alberto Perez", 931982374, "alberto@perez.com", "2024-01-10", NULL, 6),
(2, "Juan Fernandez", 934567890, "juan@fernandez.com","2024-02-01", 1, 7),
(3, "Ana Pardo", 934321098, "ana@pardo.com", "2024-02-16", 2, 8),
(4, "Maria Martinez", 934431256, "maria@fernandez.com", "2024-03-01", NULL, 9),
(5, "Arantxa Sanchez", 939879807, "arantxa@sanchez.com", "2024-03-03", 3, 10);

INSERT INTO brand (id, name, supplierId)
VALUES
(1, "Oakley", 1),
(2, "RayBan", 2),
(3, "Carrera", 3),
(4, "Hawkers", 4),
(5, "SafiloOxido", 5),
(6, "Pull&Bear", 1);

INSERT INTO glasses (id, prize, glassesColor, prescriptionL, prescriptionR, supplierId, frameId, brandId)
VALUES
(1, 75.95, "Light", 01.00, 01.50, 1, 1, 1),
(2, 65.95, "Light", 02.00, 02.50, 2, 2, 2),
(3, 55.95, "Light", 00.50, 01.50, 3, 3, 3),
(4, 85.95, "Dark", 01.50, 02.50, 4, 4, 4),
(5, 55.95, "Dark", 02.50, 03.50, 5, 5, 5);

INSERT INTO transactions (id, date, prize, glassesId, customerId, employeeId)
VALUES 
(1, "2024-06-06", 75.95, 1, 2, 1),
(2, "2024-06-10", 65.95, 2, 1, 2),
(3, "2024-06-11", 55.95, 3, 3, 3),
(4, "2024-06-12", 55.95, 3, 4, 4),
(5, "2024-06-13", 75.95, 1, 5, 5);