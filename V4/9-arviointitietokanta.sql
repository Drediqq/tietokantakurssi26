1. Luominen
###############################################################
CREATE DATABASE arviointi;
USE arviointi;
-----------------------------------------------------------------------------------

CREATE TABLE opiskelija (
    idOpiskelija INT NOT NULL AUTO_INCREMENT,
    etunimi VARCHAR(45),
    sukunimi VARCHAR(45),
    osoite VARCHAR(45),
    luokkatunnus VARCHAR(45),
    PRIMARY KEY (idOpiskelija)
);

-----------------------------------------------------------------------------------

CREATE TABLE opintojakso (
    idOpintojakso INT NOT NULL AUTO_INCREMENT,
    koodi VARCHAR(45),
    laajuus TINYINT,
    nimi VARCHAR(45),
    PRIMARY KEY (idOpintojakso)
);

-----------------------------------------------------------------------------------

CREATE TABLE arviointi (
    idArviointi INT NOT NULL AUTO_INCREMENT,
    paivamaara DATE,
    arvosana TINYINT,
    idOpiskelija INT NOT NULL,
    idOpintojakso INT NOT NULL,
    PRIMARY KEY (idArviointi),
    CONSTRAINT fk_arviointi_opiskelija 
        FOREIGN KEY (idOpiskelija) 
        REFERENCES opiskelija (idOpiskelija),
    CONSTRAINT fk_arviointi_opintojakso 
        FOREIGN KEY (idOpintojakso) 
        REFERENCES opintojakso (idOpintojakso)
);

-----------------------------------------------------------------------------------

2. Tietojen lisäys:
-----------------------------------------------------------------------------------
Opintojaksot:

INSERT INTO opintojakso (koodi, laajuus, nimi) VALUES
('T20041', 3, 'Tieto kannattaa'),
('T20042', 3, 'Liike-elaman tarpeeton tietous'),
('T20043', 3, 'Fysiikka 0'),
('T20044', 6, 'Elektroniikan perusteettomat'),
('T20045', 5, 'Kellarihumppa'),
('T20046', 3, 'Matematiikka 64'),
('T20047', 3, 'Ruotsiton Ruotsi'),
('T20048', 3, 'Viinin salat');

-----------------------------------------------------------------------------------
Opiskelijat:

INSERT INTO opiskelija (etunimi, sukunimi, osoite, luokkatunnus) VALUES
('Aku', 'Ankka', 'Ankkalinna 313', 'TTE3SNH'),
('Roope', 'Ankka', 'Ankkalinna 314', 'TTE3SNH'),
('Iines', 'Ankka', 'Ankkalinna 315', 'TTE4SNL'),
('Mikki', 'Hiiri', 'Ankkalinna 316', 'TTE2SNO'),
('Hessu', 'Hopo', 'Ankkalinna 317', 'TTE2SNO'),
('Kroisos', 'Pennanen', 'Ankkalinna 666', 'LL666HE');

-----------------------------------------------------------------------------------
Arvioinnit:

INSERT INTO arviointi (paivamaara, arvosana, idOpiskelija, idOpintojakso) VALUES
('2014-09-05', 3, 1, 1),  
('2014-09-05', 3, 1, 3), 
('2014-09-05', 0, 1, 7),  
('2014-09-05', 4, 2, 1),  
('2014-09-05', 2, 2, 3),
('2014-09-05', 4, 3, 1),  
('2014-09-05', 3, 3, 3),  
('2014-09-05', 5, 4, 1),  
('2014-09-05', 4, 4, 3),  
('2014-09-05', 5, 5, 3),  
('2014-09-05', 1, 5, 1),  
('2014-09-05', 0, 6, 3),  
('2014-09-05', 0, 6, 2),  
('2014-09-05', 0, 6, 1);  
###########################################################################################

3. Tulosteet 

"a")
    SELECT * FROM opintojakso;
    
+---------------+--------+---------+--------------------------------+
| idOpintojakso | koodi  | laajuus | nimi                           |
+---------------+--------+---------+--------------------------------+
|             1 | T20041 |       3 | Tieto kannattaa                |
|             2 | T20042 |       3 | Liike-elaman tarpeeton tietous |
|             3 | T20043 |       3 | Fysiikka 0                     |
|             4 | T20044 |       6 | Elektroniikan perusteettomat   |
|             5 | T20045 |       5 | Kellarihumppa                  |
|             6 | T20046 |       3 | Matematiikka 64                |
|             7 | T20047 |       3 | Ruotsiton Ruotsi               |
|             8 | T20048 |       3 | Viinin salat                   |
+---------------+--------+---------+--------------------------------+

---------------------------------------------------------------------------------
"b")
    SELECT * FROM opiskelija;

+--------------+---------+----------+----------------+--------------+
| idOpiskelija | etunimi | sukunimi | osoite         | luokkatunnus |
+--------------+---------+----------+----------------+--------------+
|            1 | Aku     | Ankka    | Ankkalinna 313 | TTE3SNH      |
|            2 | Roope   | Ankka    | Ankkalinna 314 | TTE3SNH      |
|            3 | Iines   | Ankka    | Ankkalinna 315 | TTE4SNL      |
|            4 | Mikki   | Hiiri    | Ankkalinna 316 | TTE2SNO      |
|            5 | Hessu   | Hopo     | Ankkalinna 317 | TTE2SNO      |
|            6 | Kroisos | Pennanen | Ankkalinna 666 | LL666HE      |
+--------------+---------+----------+----------------+--------------+

-----------------------------------------------------------------------------------
"c")
    SELECT etunimi,sukunimi,arvosana,paivamaara,nimi FROM arviointi 
    JOIN opiskelija ON opiskelija.idOpiskelija = arviointi.idOpiskelija 
    JOIN opintojakso ON opintojakso.idOpintojakso = arviointi.idOpintojakso;

+---------+----------+----------+------------+--------------------------------+
| etunimi | sukunimi | arvosana | paivamaara | nimi                           |
+---------+----------+----------+------------+--------------------------------+
| Aku     | Ankka    |        3 | 2014-09-05 | Tieto kannattaa                |
| Aku     | Ankka    |        3 | 2014-09-05 | Fysiikka 0                     |
| Aku     | Ankka    |        0 | 2014-09-05 | Ruotsiton Ruotsi               |
| Roope   | Ankka    |        4 | 2014-09-05 | Tieto kannattaa                |
| Roope   | Ankka    |        2 | 2014-09-05 | Fysiikka 0                     |
| Iines   | Ankka    |        4 | 2014-09-05 | Tieto kannattaa                |
| Iines   | Ankka    |        3 | 2014-09-05 | Fysiikka 0                     |
| Mikki   | Hiiri    |        5 | 2014-09-05 | Tieto kannattaa                |
| Mikki   | Hiiri    |        4 | 2014-09-05 | Fysiikka 0                     |
| Hessu   | Hopo     |        5 | 2014-09-05 | Fysiikka 0                     |
| Hessu   | Hopo     |        1 | 2014-09-05 | Tieto kannattaa                |
| Kroisos | Pennanen |        0 | 2014-09-05 | Fysiikka 0                     |
| Kroisos | Pennanen |        0 | 2014-09-05 | Liike-elaman tarpeeton tietous |
| Kroisos | Pennanen |        0 | 2014-09-05 | Tieto kannattaa                |
+---------+----------+----------+------------+--------------------------------+
-----------------------------------------------------------------------------------