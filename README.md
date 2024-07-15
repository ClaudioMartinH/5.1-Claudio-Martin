# TASCA: Entrega 5.1 - Estructura de dades MySQL

## Descripció
En aquesta tasca modelarem diversos diagrames entitat-relació per a diferents escenaris: una òptica, una pizzeria, una versió reduïda de YouTube i una versió reduïda de Spotify. A continuació es detallen els requeriments i els nivells a assolir.

## Nivell 1

### Exercici 1 - Òptica
Una òptica, anomenada “Cul d'Ampolla”, vol informatitzar la gestió dels clients i vendes d'ulleres.

**Requeriments:**

- Proveïdors: nom, adreça (carrer, número, pis, porta, ciutat, codi postal i país), telèfon, fax, NIF.
- Ulleres: marca, graduació de cadascun dels vidres, tipus de muntura, color de la muntura, color de cada vidre, preu.
- Clients: nom, adreça postal, telèfon, correu electrònic, data de registre, recomanador.
- Empleats: identificar l'empleat que ha venut cada ullera.
- Vendes: definir un període de temps de vendes.

**Consultes:** es poden trobar a l'arxiu "./Nivell1/Exercici1/views/querysOptica.sql"

1. Llista el total de compres d’un client.
2. Llista les diferents ulleres que ha venut un empleat durant un any.
3. Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.

### Exercici 2 - Pizzeria
Disseny d'una base de dades per a una pizzeria que permeti fer comandes de menjar a domicili per Internet.

**Requeriments:**

- Clients: identificador únic, nom, cognoms, adreça, codi postal, localitat, província, número de telèfon.
- Comandes: identificador únic, data/hora, tipus de comanda (domicili o recollida), quantitat de productes, preu total.
- Productes: identificador únic, nom, descripció, imatge, preu.
- Categories de pizzes: identificador únic, nom.
- Botigues: identificador únic, adreça, codi postal, localitat, província.
- Empleats: identificador únic, nom, cognoms, NIF, telèfon, rol (cuiner o repartidor).
- Comandes de repartiment: identificador de l'empleat repartidor, data/hora de lliurament.

**Consultes:** es poden trobar a l'arxiu "./Nivell1/Exercici2/views/querysPizzeria.sql"

1. Llista quants productes de tipus "Begudes" s'han venut en una determinada localitat.
2. Llista quantes comandes ha efectuat un determinat empleat.

## Nivell 2

### Exercici 1 - YouTube
Model senzill per a una versió reduïda de YouTube.

**Requeriments:**

- Usuaris: identificador únic, email, password, nom d'usuari, data de naixement, sexe, país, codi postal.
- Vídeos: identificador únic, títol, descripció, grandària, nom del fitxer, durada, thumbnail, reproduccions, likes, dislikes, estat (públic, ocult, privat), etiquetes, publicador, data/hora de publicació.
- Canals: identificador únic, nom, descripció, data de creació.
- Subscripcions: usuaris subscrits a canals.
- Likes/Dislikes: usuaris que han donat like o dislike a vídeos, data/hora.
- Playlists: identificador únic, nom, data de creació, estat (pública o privada).
- Comentaris: identificador únic, text, data/hora, likes/dislikes per comentari.

## Nivell 3

### Exercici 1 - Spotify
Model senzill per a una versió reduïda de Spotify.

**Requeriments:**

- Usuaris: identificador únic, email, password, nom d'usuari, data de naixement, sexe, país, codi postal.
- Subscripcions Premium: data d'inici, data de renovació, forma de pagament (targeta de crèdit o PayPal).
- Pagaments: data, número d'ordre, total.
- Playlists: identificador únic, títol, nombre de cançons, data de creació, estat (activa o esborrada), data d'eliminació.
- Cançons: identificador únic, títol, durada, reproduccions, àlbum.
- Àlbums: identificador únic, títol, any de publicació, imatge de portada.
- Artistes: identificador únic, nom, imatge.
- Favorits: àlbums i cançons favorites d'un usuari.
- Relacions entre artistes: artistes relacionats.
- Seguiments: usuaris que segueixen artistes.

**Nota:**
Un cop creades les bases de dades, omplirem les taules amb dades de prova per tal de verificar que les relacions són correctes.
