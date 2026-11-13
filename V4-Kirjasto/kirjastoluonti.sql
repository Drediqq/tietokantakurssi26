CREATE DATABASE kirjasto;
USE kirjasto;

CREATE TABLE tekija (
    id_tekija INT AUTO_INCREMENT PRIMARY KEY,
    etunimi VARCHAR(255) NOT NULL,
    sukunimi VARCHAR(255) NOT NULL,
    syntymavuosi INT NULL
);

CREATE TABLE teos (
    id_teos INT AUTO_INCREMENT PRIMARY KEY,
    nimi VARCHAR(255) NOT NULL,
    isbn VARCHAR(255) UNIQUE NULL,
    julkaisuvuosi INT NULL
);

CREATE TABLE teos_tekija (
    id_teos INT NOT NULL,
    id_tekija INT NOT NULL,
    PRIMARY KEY (id_teos, id_tekija),
    FOREIGN KEY (id_teos) REFERENCES teos(id_teos) ON DELETE CASCADE,
    FOREIGN KEY (id_tekija) REFERENCES tekija(id_tekija) ON DELETE CASCADE
);

CREATE TABLE kirja (
    id_kirja INT AUTO_INCREMENT PRIMARY KEY,
    id_teos INT NOT NULL,
    hylly_sijainti VARCHAR(255) NOT NULL,
    tila VARCHAR(255) NOT NULL DEFAULT 'hyllyssä',
    FOREIGN KEY (id_teos) REFERENCES teos(id_teos) ON DELETE RESTRICT
);

CREATE TABLE asiakas (
    id_asiakas INT AUTO_INCREMENT PRIMARY KEY,
    etunimi VARCHAR(255) NOT NULL,
    sukunimi VARCHAR(255) NOT NULL,
    lahiosoite VARCHAR(255) NOT NULL,
    sahkoposti VARCHAR(255) UNIQUE NOT NULL,
    puhelinnumero VARCHAR(255) UNIQUE NOT NULL,
    velka DECIMAL(6,2) NOT NULL DEFAULT 0.00
);

CREATE TABLE lainaus (
    id_lainaus INT AUTO_INCREMENT PRIMARY KEY,
    id_kirja INT NOT NULL,
    id_asiakas INT NOT NULL,
    lainauspaivamaara DATE NOT NULL,
    palautuspaivamaara DATE NOT NULL,
    todellinen_palautuspvm DATE NULL,
    myohastymismaksu DECIMAL(6,2) NOT NULL DEFAULT 0.00,
    maksettu TINYINT(1) NOT NULL DEFAULT 0,
    FOREIGN KEY (id_kirja) REFERENCES kirja(id_kirja) ON DELETE RESTRICT,
    FOREIGN KEY (id_asiakas) REFERENCES asiakas(id_asiakas) ON DELETE RESTRICT
);