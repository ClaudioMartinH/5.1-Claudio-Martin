USE spotify;

INSERT INTO genreMusic (type) VALUES 
('Pop'),
('Rock'),
('Classic'),
('Metal'),
('Salsa');

INSERT INTO artist (name, img, genre_id) VALUES
('Alejandro Sanz', 'alejandro_sanz.jpg', 1),
('Rosalía', 'rosalia.jpg', 1),
('Extremoduro', 'extremoduro.jpg', 2),
('Paco de Lucía', 'paco_de_lucia.jpg', 3),
('Mago de Oz', 'mago_de_oz.jpg', 4),
('Marc Anthony', 'marc_anthony.jpg', 5);

INSERT INTO album (title, year, coverImage, artist_id) VALUES
('El Alma al Aire', 2000, 'el_alma_al_aire.jpg', 1),
('El Mal Querer', 2018, 'el_mal_querer.jpg', 2),
('Agila', 1996, 'agila.jpg', 3),
('Almoraima', 1976, 'almoraima.jpg', 4),
('Finisterra', 2000, 'finisterra.jpg', 5),
('Valió la Pena', 2004, 'valio_la_pena.jpg', 6);

INSERT INTO song (title, length, album_id, timesPlayed) VALUES
('Cuando nadie me ve', '00:05:08', 1, 150),
('Malamente', '00:02:29', 2, 200),
('So payaso', '00:04:06', 3, 100),
('Entre dos aguas', '00:05:59', 4, 250),
('Fiesta pagana', '00:04:58', 5, 300),
('Tu amor me hace bien', '00:05:08', 6, 180);

INSERT INTO creditCard (number, expireDate, securityCode, user_id) VALUES
('1234567812345678', '12/24', 123, 1),
('8765432187654321', '11/23', 456, 2);

INSERT INTO paypal (username) VALUES
('user1@paypal.com'),
('user2@paypal.com');

INSERT INTO subscription (memberSince, renewalDate, payment, card_id, paypal_id) VALUES
('2023-01-01', '2024-01-01', 'Credit Card', 1, NULL),
('2022-05-15', '2023-05-15', 'Paypal', NULL, 1);

INSERT INTO playlist (title, CreateDate, song_count, playlist_song_id) VALUES
('Rock Hits', '2023-07-01', 2, 1),
('Pop Favorites', '2023-07-01', 1, 2);

INSERT INTO user (email, password, username, birthdate, genre, country, postalCode, typeUser, subscription_id, playlist_id) VALUES
('user1@example.com', 'password1', 'user1', '1990-01-01', 'Male', 'España', 28001, 'Premium', 1, 1),
('user2@example.com', 'password2', 'user2', '1985-05-15', 'Female', 'España', 08001, 'Free', NULL, NULL);

INSERT INTO favorites (fav_song, fav_album, user_id) VALUES
(1, 1, 1),
(2, 2, 2);

INSERT INTO playlistSongs (playlist_id, song_id) VALUES
(1, 3),
(1, 5),
(2, 1);

