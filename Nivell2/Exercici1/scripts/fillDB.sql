INSERT INTO
    user
    (id, email, password, username, birthdate, gender, country, postalCode)
VALUES
    (1, "jose@gmail.com", "password123", "Josito123", "2000-07-01", "Male", "Spain", 08021),
    (2, "paco@gmail.com", "password456", "Pakito456", "1999-12-13", "Male", "Spain", 17789),
    (3, "ana@gmail.com", "password321", "Anita321", "1999-03-09", "Female", "Spain", 09876),
    (4, "silvia@gmail.com", "password987", "Silvita987", "1996=11-08", "Female", "Spain", 08012);

INSERT INTO
    video
    (
    id,
    title,
    description,
    sizeMB,
    filename,
    videolength,
    thumbnail,
    timesReproduced,
    videoState
    )
VALUES
    (
        1,
        "Romantico",
        "Cenando en la playa",
        12,
        "vid001.mp4",
        "00:01:10",
        "vid001.jpg",
        0,
        "Public"
    ),
    (
        2,
        "Roma",
        "Paseando por Roma",
        22,
        "vid002.mp4",
        "00:02:23",
        "vid002.jpg",
        0,
        "Public"
    ),
    (
        3,
        "Viaje",
        "De camino a Sevilla",
        32,
        "vid003.mp4",
        "00:03:13",
        "vid003.jpg",
        0,
        "Private"
    ),
    (
        4,
        "SanFermines",
        "Encierro en San Fermines",
        120,
        "vid004.mp4",
        "00:11:13",
        "vid004.jpg",
        0,
        "Public"
    ),
    (
        5,
        "Tutorial Node",
        "Aprende node con este tutorial",
        3145,
        "vid005.mp4",
        "01:45:25",
        "vid005.jpg",
        0,
        "Public"
    ),
    (
        6,
        "Arreglar moto",
        "Cambiando carburador moto",
        233,
        "vid006.mp4",
        "00:35:13",
        "vid006.jpg",
        0,
        "Hidden"
    ),
    (
        7,
        "Puesta de sol",
        "Puesta de sol en Finisterre",
        123,
        "vid007.mp4",
        "00:15:23",
        "vid007.jpg",
        0,
        "Public"
    ),
    (
        8,
        "Perretes",
        "Mis perretes jugando",
        98,
        "vid008.mp4",
        "00:02:23",
        "vid008.jpg",
        0,
        "Public"
    );

INSERT INTO
    playlist
    (id, name, datetime, playlistState, idVideo)
VALUES
    (1, "Paisajes", "2024-03-30 11:32:15", "Public", 7),
    (2, "SanFermines", "2024-06-16 14:23:18", "Public", 4),
    (3, "Animales", "2024-07-08 19:34:12", "Public", 8),
    (4, "Tutoriales", "2024-01-08 10:12:10", "Private", 5);

INSERT INTO channel
    (id, name, description, datetimeCreated)
VALUES
    (1, "NodeJs para dummies", "Aprendiendo node con videos online", "2023-08-12 11:15:24"),
    (2, "Educa a tu perro", "Aprendiendo a educar a tu mascota", "2023-09-21 12:13:27"),
    (3, "Paisajes", "Las mas bellas estampas de mis viajes", "2024-02-10 21:14:25"),
    (4, "Encierros", "Videos de los mejores encierros", "2024-03-21 22:35:54");

INSERT INTO comment
    (id, text, datetime, video_ID)
VALUES
    (1, "Que bonitos tus perritos", "2024-01-04 12:13:14", 8),
    (2, "Que bonito el sol en la puesta, increible", "2024-07-08 12:14:19", 7),
    (3, "Gracias por este video, he aprendido mucho", "2024-07-06 23:30:14", 5),
    (4, "Que miedo correr delante de esos toros bravos", "2024-07-07 23:34:56", 4),
    (5, "Que preciosidad Roma, cuanta historia en sus calles", "2024-07-05 12:10:19", 2),
    (6, "Ten cuidado en el camino", "2024-07-03 12:19:08", 3),
    (7, "Que calor debe hacer ahi ahora mismo", "2024-07-04 14:23:56", 3),
    (8, "Que grande se ha hecho tu perrete", "2024-07-01 23:34:45", 8);

INSERT INTO layers (id, layername, datetime, userId, videoId)
VALUES 
(1, "Animales", "2024-01-01 12:00:00", 1, 8),
(2, "Perretes", "2024-01-01 12:01:00", 1, 8),
(3, "Viajes", "2024-01-01 12:02:00", 2, 3),
(4, "Escapadas", "2024-01-01 12:03:00", 2, 2),
(5, "Cursos", "2024-01-01 12:04:00", 3, 5),
(6, "Autoaprendizaje", "2024-01-01 12:05:00", 3, 5),
(7, "Mecanica", "2024-01-01 12:06:00", 4, 6),
(8, "DIY", "2024-01-01 12:07:00", 4, 6);

INSERT INTO likes (datetime, video__Id, comment__Id, channel__Id, user__Id, typeOfReaction)
VALUES
("2024-01-01 12:00:00", 1, NULL, NULL, 1, 'Like'),
("2024-01-01 12:01:00", 2, NULL, NULL, 2, 'Like'),
("2024-01-01 12:02:00", NULL, NULL, 1, 3, 'Like'),
("2024-01-01 12:03:00", NULL, 1, NULL, 4, 'Like'),
("2024-01-01 12:00:00", 3, NULL, NULL, 1, 'Dislike'),
("2024-01-01 12:01:00", 4, NULL, NULL, 2, 'Dislike'),
("2024-01-01 12:02:00", NULL, NULL, 2, 3, 'Dislike'),
("2024-01-01 12:03:00", NULL, 3, NULL, 4, 'Dislike');
