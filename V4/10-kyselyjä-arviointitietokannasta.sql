10. Kyselyjä arviointitietokannasta
--------------------------------------------------------------------------------------------------------------
Lyhyt:
--------------------------------------------------------------------------------------------------------------
1)  SELECT DISTINCT etunimi,sukunimi FROM arviointi 
    JOIN opiskelija ON opiskelija.idOpiskelija = arviointi.idOpiskelija      
    WHERE arvosana=0;

--------------------------------------------------------------------------------------------------------------
2)  SELECT etunimi,sukunimi FROM arviointi       
    JOIN opiskelija ON opiskelija.idOpiskelija = arviointi.idOpiskelija       
    JOIN opintojakso ON opintojakso.idOpintojakso = arviointi.idOpintojakso  
    WHERE arvosana>0 AND nimi="Fysiikka 0";

--------------------------------------------------------------------------------------------------------------
3)  SELECT nimi FROM arviointi       
    JOIN opiskelija ON opiskelija.idOpiskelija = arviointi.idOpiskelija
    JOIN opintojakso ON opintojakso.idOpintojakso = arviointi.idOpintojakso 
    WHERE etunimi="Hessu" AND sukunimi="Hopo";

--------------------------------------------------------------------------------------------------------------
4)  SELECT nimi FROM arviointi       
    JOIN opiskelija ON opiskelija.idOpiskelija = arviointi.idOpiskelija
    JOIN opintojakso ON opintojakso.idOpintojakso = arviointi.idOpintojakso 
    WHERE etunimi="Hessu" AND sukunimi="Hopo";

--------------------------------------------------------------------------------------------------------------
5)  SELECT nimi FROM opintojakso 
    LEFT JOIN arviointi ON opintojakso.idOpintojakso = arviointi.idOpintojakso 
    WHERE idArviointi IS NULL;

--------------------------------------------------------------------------------------------------------------
Tulosteilla:
--------------------------------------------------------------------------------------------------------------
1) Tulosta kaikki opiskelijat, joilla on tietokannassa hylätty arvosana

    SELECT DISTINCT etunimi,sukunimi FROM arviointi 
    JOIN opiskelija ON opiskelija.idOpiskelija = arviointi.idOpiskelija      
    WHERE arvosana=0;

+---------+----------+
| etunimi | sukunimi |
+---------+----------+
| Aku     | Ankka    |
| Kroisos | Pennanen |
+---------+----------+


--------------------------------------------------------------------------------------------------------------
2) Tulosta kaikki Fysiikka 3-kurssin hyväksytysti suorittaneet
    
    SELECT etunimi,sukunimi FROM arviointi       
    JOIN opiskelija ON opiskelija.idOpiskelija = arviointi.idOpiskelija       
    JOIN opintojakso ON opintojakso.idOpintojakso = arviointi.idOpintojakso  
    WHERE arvosana>0 AND nimi="Fysiikka 0";

+---------+----------+
| etunimi | sukunimi |
+---------+----------+
| Aku     | Ankka    |
| Roope   | Ankka    |
| Iines   | Ankka    |
| Mikki   | Hiiri    |
| Hessu   | Hopo     |
+---------+----------+


--------------------------------------------------------------------------------------------------------------
3) Mille kursseille Hessu on osallistunut ?

    SELECT nimi FROM arviointi       
    JOIN opiskelija ON opiskelija.idOpiskelija = arviointi.idOpiskelija
    JOIN opintojakso ON opintojakso.idOpintojakso = arviointi.idOpintojakso 
    WHERE etunimi="Hessu" AND sukunimi="Hopo";

+-----------------+
| nimi            |
+-----------------+
| Fysiikka 0      |
| Tieto kannattaa |
+-----------------+


--------------------------------------------------------------------------------------------------------------
4) Mikä on Akun opintosuoritusten keskiarvo ?
    
    SELECT AVG(arvosana) AS keskiarvo FROM opiskelija 
    JOIN arviointi ON opiskelija.idOpiskelija = arviointi.idOpiskelija 
    WHERE etunimi = 'Aku' AND sukunimi="Ankka";

+-----------+
| keskiarvo |
+-----------+
|    2.0000 |
+-----------+


--------------------------------------------------------------------------------------------------------------
5) Millä opintojaksoilla ei ole yhtään suoritusmerkintää ? (Vihje: Tarvitset tässä left tai right joinia...)

    SELECT nimi FROM opintojakso 
    LEFT JOIN arviointi ON opintojakso.idOpintojakso = arviointi.idOpintojakso 
    WHERE idArviointi IS NULL;

+------------------------------+
| nimi                         |
+------------------------------+
| Elektroniikan perusteettomat |
| Kellarihumppa                |
| Matematiikka 64              |
| Viinin salat                 |
+------------------------------+


--------------------------------------------------------------------------------------------------------------
