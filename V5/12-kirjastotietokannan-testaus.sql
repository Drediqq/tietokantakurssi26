-- Kirjastotietokannan testaus
-------------------------------------------------------------------------------------------------------------------

INSERT INTO tekija (etunimi, sukunimi, syntymavuosi) VALUES
('Marjatta', 'Ankerias', 1945),
('Riiga', 'Purgga', 1978),
('Petturi', 'Orbonen', 1985);

    SELECT * FROM tekija;
--+-----------+----------+----------+--------------+
--| id_tekija | etunimi  | sukunimi | syntymavuosi |
--+-----------+----------+----------+--------------+
--|         1 | Marjatta | Ankerias |         1945 |
--|         2 | Riiga    | Purgga   |         1978 |
--|         3 | Petturi  | Orbonen  |         1985 |
--+-----------+----------+----------+--------------+

-------------------------------------------------------------------------------------------------------------------

INSERT INTO teos (nimi, isbn, julkaisuvuosi) VALUES
('Marjatan paivakirja', '123-456-7-89101-1', 1960),
('Saksiakatemia', '121-314-1-51617-1', 2000),
('Kuinka kusettaa kokonaista valtiota opas', '819-202-1-22232-4', 2019);

MariaDB [kirjasto]> SELECT * FROM teos;

-- +---------+------------------------------------------+-------------------+---------------+
-- | id_teos | nimi                                     | isbn              | julkaisuvuosi |
-- +---------+------------------------------------------+-------------------+---------------+
-- |       1 | Marjatan paivakirja                      | 123-456-7-89101-1 |          1960 |
-- |       2 | Saksiakatemia                            | 121-314-1-51617-1 |          2000 |
-- |       3 | Kuinka kusettaa kokonaista valtiota opas | 819-202-1-22232-4 |          2019 |
-- +---------+------------------------------------------+-------------------+---------------+

-------------------------------------------------------------------------------------------------------------------

--Kirja, jossa on useampi kuin yksi tekijä.
INSERT INTO teos_tekija (id_teos, id_tekija) VALUES
(1, 1),
(2, 2),
(3, 2),
(3, 3);

SELECT etunimi, sukunimi, nimi FROM teos_tekija 
JOIN tekija ON tekija.id_tekija = teos_tekija.id_tekija 
JOIN teos ON teos.id_teos = teos_tekija.id_teos;
-- +----------+----------+------------------------------------------+
-- | etunimi  | sukunimi | nimi                                     |
-- +----------+----------+------------------------------------------+
-- | Marjatta | Ankerias | Marjatan paivakirja                      |
-- | Riiga    | Purgga   | Saksiakatemia                            |
-- | Riiga    | Purgga   | Kuinka kusettaa kokonaista valtiota opas |
-- | Petturi  | Orbonen  | Kuinka kusettaa kokonaista valtiota opas |
-- +----------+----------+------------------------------------------+

-------------------------------------------------------------------------------------------------------------------

--Ainakin kaksi samaa kirjaa (pitää tallentua eri pääavaimille)
INSERT INTO kirja (id_teos, hylly_sijainti, tila) VALUES
(1, 'A1-01', 'hyllyssa'),
(1, 'A1-02', 'hyllyssa'),
(2, 'B3-10', 'lainassa'),
(2, 'B3-11', 'hyllyssa'),
(3, 'C2-04', 'hyllyssa');

SELECT teos.id_teos, id_kirja, tila, nimi FROM kirja 
JOIN teos ON kirja.id_teos = teos.id_teos;
-- +---------+----------+----------+------------------------------------------+
-- | id_teos | id_kirja | tila     | nimi                                     |
-- +---------+----------+----------+------------------------------------------+
-- |       1 |        1 | hyllyssa | Marjatan paivakirja                      |
-- |       1 |        2 | hyllyssa | Marjatan paivakirja                      |
-- |       2 |        3 | lainassa | Saksiakatemia                            |
-- |       2 |        4 | hyllyssa | Saksiakatemia                            |
-- |       3 |        5 | hyllyssa | Kuinka kusettaa kokonaista valtiota opas |
-- +---------+----------+----------+------------------------------------------+

-------------------------------------------------------------------------------------------------------------------

INSERT INTO asiakas (etunimi, sukunimi, lahiosoite, sahkoposti, puhelinnumero, velka) VALUES
('Anu', 'Saukko', 'Oja', 'anu.saukko@vauveli.fi', '+3581234567', 0.00),
('Seppo', 'Onkimies', 'Syrinraitti 6, 69420 Syri', 'seppo.onkimies@vauveli.fi', '+35889101112', 0.00),
('Tarmo', 'Temonen', 'Sillan alla', 'tarmo.temonen@vauveli.fi', '+35813141516', 2500.00);

SELECT * FROM asiakas;
--+------------+---------+----------+---------------------------+---------------------------+---------------+---------+
--| id_asiakas | etunimi | sukunimi | lahiosoite                | sahkoposti                | puhelinnumero | velka   |
--+------------+---------+----------+---------------------------+---------------------------+---------------+---------+
--|          1 | Anu     | Saukko   | Oja                       | anu.saukko@vauveli.fi     | +3581234567   |    0.00 |
--|          2 | Seppo   | Onkimies | Syrinraitti 6, 69420 Syri | seppo.onkimies@vauveli.fi | +35889101112  |    0.00 |
--|          3 | Tarmo   | Temonen  | Sillan alla               | tarmo.temonen@vauveli.fi  | +35813141516  | 2500.00 |
--+------------+---------+----------+---------------------------+---------------------------+---------------+---------+

-------------------------------------------------------------------------------------------------------------------

--Lainaustapahtuma, jossa asiakas on lainannut kirjan ja se on vielä lainassa.
INSERT INTO lainaus (
    id_kirja,
    id_asiakas,
    lainauspaivamaara,
    palautuspaivamaara,
    todellinen_palautuspvm,
    myohastymismaksu,
    maksettu
) VALUES
(1, 1, DATE_SUB(CURDATE(), INTERVAL 1 YEAR), CURDATE(), CURDATE(), 0.00, 1),
(3, 2, DATE_SUB(CURDATE(), INTERVAL 20 DAY), DATE_ADD(CURDATE(), INTERVAL 8 DAY), NULL, 0.00, 0), 
(5, 3, DATE_SUB(CURDATE(), INTERVAL 60 DAY), DATE_SUB(CURDATE(), INTERVAL 32 DAY), DATE_SUB(CURDATE(), INTERVAL 30 DAY), 2500, 0);

-------------------------------------------------------------------------------------------------------------------

SELECT etunimi, sukunimi, nimi, tila, todellinen_palautuspvm, velka, maksettu FROM lainaus 
JOIN kirja ON kirja.id_kirja = lainaus.id_kirja 
JOIN teos ON kirja.id_teos = teos.id_teos 
JOIN asiakas ON lainaus.id_asiakas = asiakas.id_asiakas;

--+---------+----------+------------------------------------------+----------+------------------------+---------+----------+
--| etunimi | sukunimi | nimi                                     | tila     | todellinen_palautuspvm | velka   | maksettu |
--+---------+----------+------------------------------------------+----------+------------------------+---------+----------+
--| Anu     | Saukko   | Marjatan paivakirja                      | hyllyssa | 2026-11-23             |    0.00 |        1 |
--| Seppo   | Onkimies | Saksiakatemia                            | lainassa | NULL                   |    0.00 |        0 |
--| Tarmo   | Temonen  | Kuinka kusettaa kokonaista valtiota opas | hyllyssa | 2026-10-24             | 2500.00 |        0 |
--+---------+----------+------------------------------------------+----------+------------------------+---------+----------+

-------------------------------------------------------------------------------------------------------------------
