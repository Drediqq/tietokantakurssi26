--funktio
USE arviointi;

DELIMITER //

CREATE PROCEDURE lisaa_opintosuoritus(
    IN p_etunimi VARCHAR(45),
    IN p_sukunimi VARCHAR(45),
    IN p_kurssikoodi VARCHAR(45),
    IN p_arvosana TINYINT
)
BEGIN
    DECLARE v_id_opiskelija INT DEFAULT NULL;
    DECLARE v_id_opintojakso INT DEFAULT NULL;

    -- tarkistaa että arvosana on 0 - 5
    IF p_arvosana IS NULL OR p_arvosana < 0 OR p_arvosana > 5 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Virhe: Arvosanan on oltava 0 - 5.';
    END IF;

    -- tarkistaa että opiskelija on olemassa
    SELECT idOpiskelija INTO v_id_opiskelija
    FROM opiskelija
    WHERE etunimi = p_etunimi AND sukunimi = p_sukunimi
    LIMIT 1;

    IF v_id_opiskelija IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Virhe: Opiskelijaa ei löytynyt!';
    END IF;

    -- tarkistaa että opintojakso on olemassa
    SELECT idOpintojakso INTO v_id_opintojakso
    FROM opintojakso
    WHERE koodi = p_kurssikoodi
    LIMIT 1;

    IF v_id_opintojakso IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Virhe: Opintojaksoa ei löytynyt!';
    END IF;

    -- lisää uuden opintosuorituksen
    INSERT INTO arviointi (paivamaara, arvosana, idOpiskelija, idOpintojakso)
    VALUES (CURDATE(), p_arvosana, v_id_opiskelija, v_id_opintojakso);
END //

DELIMITER ;

----------------------------------------------------------------------------------------------------

-- lisäys
CALL lisaa_opintosuoritus('Aku', 'Ankka', 'T20045', 5);


-- tarkistus
SELECT
    idArviointi,
    paivamaara,
    etunimi, 
    sukunimi,
    koodi,
    nimi,
    arvosana
FROM arviointi
JOIN opiskelija ON arviointi.idOpiskelija = opiskelija.idOpiskelija
JOIN opintojakso ON arviointi.idOpintojakso = opintojakso.idOpintojakso
ORDER BY arviointi.idArviointi DESC
LIMIT 1;

--+-------------+------------+---------+----------+--------+---------------+----------+
--| idArviointi | paivamaara | etunimi | sukunimi | koodi  | nimi          | arvosana |
--+-------------+------------+---------+----------+--------+---------------+----------+
--|          15 | 2026-11-23 | Aku     | Ankka    | T20045 | Kellarihumppa |        5 |
--+-------------+------------+---------+----------+--------+---------------+----------+

----------------------------------------------------------------------------------------------------

CALL lisaa_opintosuoritus('Aku', 'Ankka', 'T20045', 6);      
--ERROR 1644 (45000): Virhe: Arvosanan on oltava 0 - 5.

CALL lisaa_opintosuoritus('Onki', 'Mato', 'T20045', 3);
--ERROR 1644 (45000): Virhe: Opiskelijaa ei löytynyt!

CALL lisaa_opintosuoritus('Aku', 'Ankka', 'qweqweqwe', 3);      
-- ERROR 1644 (45000): Virhe: Opintojaksoa ei löytynyt!

----------------------------------------------------------------------------------------------------
