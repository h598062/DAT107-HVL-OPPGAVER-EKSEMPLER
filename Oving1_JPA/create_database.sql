DROP SCHEMA IF EXISTS oving1 CASCADE;
CREATE SCHEMA oving1;
SET search_path TO oving1;

CREATE TABLE ansatt
(
    brukernavn      VARCHAR(4) PRIMARY KEY UNIQUE,
    fornavn         VARCHAR(20) NOT NULL,
    etternavn       VARCHAR(20) NOT NULL,
    ansettelsesdato DATE        NOT NULL,
    stilling        VARCHAR(40) NOT NULL,
    maanedslonn     INTEGER CHECK ( maanedslonn >= 0 )
);

INSERT INTO ansatt(brukernavn, fornavn, etternavn, ansettelsesdato, stilling, maanedslonn)
VALUES ('babb', 'Bjørnar', 'Helgeland', '17.03.2023', 'Kebab-spiser', 84),
       ('bell', 'Kristian', 'Bell', '01.01.1999', 'Tidsreiser', 69),
       ('nr1', 'Storm', 'Sangolt', '10.01.2023', '"VarHerFraBegynnelsen"', 9999999),
       ('rubi', 'Robin', 'Giskegjerde', '11.11.2011', 'NumberOne', 1),
       ('dofs', 'Cristopher', 'Rojas', '09.10.2021', 'TwennyOne', 21),
       ('eren', 'Eren', 'Akat', '12.04.2000', 'HaddeKortNavnOgFikkDetSomBrukernavn', 4);

SELECT *
FROM ansatt;