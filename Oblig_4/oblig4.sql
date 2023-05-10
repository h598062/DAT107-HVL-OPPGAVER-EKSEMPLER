DROP SCHEMA IF EXISTS OBLIG4 CASCADE;
CREATE SCHEMA OBLIG4;
SET search_path TO OBLIG4;

-- Lag tabeller for å holde JSON dokumentene
CREATE TABLE Passering
(
    id   SERIAL PRIMARY KEY,
    data JSONB NOT NULL
);

CREATE TABLE Kunde
(
    id   SERIAL PRIMARY KEY,
    data JSONB NOT NULL
);

-- Oppgave B)
-- Legg til test data
INSERT INTO Passering(data)
VALUES ('{
  "regnr": "SU57668",
  "dato": "2023-05-09",
  "bod": 4
}'),
       ('{
         "regnr": "EB66699",
         "dato": "2023-05-09",
         "bod": 4
       }'),
       ('{
         "regnr": "ZZ69420",
         "dato": "2023-05-09",
         "bod": 3
       }'),
       ('{
         "regnr": "",
         "dato": "2023-05-09",
         "bod": 3
       }'),
       ('{
         "regnr": "TV95995",
         "dato": "2023-25-09",
         "bod": 7
       }'),
       ('{
         "regnr": "XD12332",
         "dato": "2000-01-02",
         "bod": 3
       }'),
       ('{
         "regnr": "TV80011",
         "dato": "2023-12-09",
         "bod": 4
       }'),
       ('{
         "regnr": "",
         "dato": "1902-02-28",
         "bod": 34
       }'),
       ('{
         "regnr": "XD12332",
         "dato": "2022-08-11",
         "bod": 1033
       }'),
       ('{
         "regnr": "XD12332",
         "dato": "1023-08-15",
         "bod": 23
       }')
;

INSERT INTO Kunde(data)
VALUES ('{
  "regnr": "SU57668",
  "navn": "Ola Normann",
  "adresse": "Bergenveien 2",
  "epost": "ola.normann@mail.no",
  "tlf": 99988777
}'),
       ('{
         "regnr": "EB66699",
         "navn": "Kari Normann",
         "adresse": "Oslogaten 4",
         "epost": "kari.normann@mail.no",
         "tlf": 44422333
       }'),
       ('{
         "regnr": "ZZ69420",
         "navn": "Nikko Nanana",
         "adresse": "Nikobergfjellviken 100",
         "epost": "nikor03@hotmail.no",
         "tlf": 44444444
       }'),
       ('{
         "regnr": "TV95995",
         "navn": "Kristian Bjelleklang",
         "adresse": "Stormulf 123",
         "epost": "nikor03@hotmail.no",
         "tlf": 123408663
       }'),
       ('{
         "regnr": "TV80011",
         "navn": "Bjårn Hai",
         "adresse": "Fjellet 14",
         "epost": "bjarnhai@gmail.com",
         "tlf": 42042014
       }'),
       ('{
         "regnr": "XD12332",
         "navn": "Stårm Boi",
         "adresse": "Søreide 43",
         "epost": "stormnikor03@live.no",
         "tlf": 98048883
       }');


-- Oppgave C)
-- Fjern tlf fra alle kunder
UPDATE Kunde
SET data = data - 'tlf';
SELECT * FROM Kunde;


-- Oppgave D)
-- Strukturen med JSON håndterer tomme / ikke-regitrerte regnr for passeringer helt ok.


-- Oppgave E)
-- skriv ut alle passeringer og join med matchende kunde hvis det finnes en
SELECT Passering.data ->> 'regnr' AS regnr,
       Passering.data ->> 'dato'  AS dato,
       Passering.data ->> 'bod'   as bod,
       Kunde.data ->> 'navn'      as navn,
       Kunde.data ->> 'adresse'   as adresse,
       Kunde.data ->> 'epost'     as epost
FROM Passering,
     Kunde
WHERE Passering.data ->> 'regnr' = Kunde.data ->> 'regnr'
UNION
SELECT Passering.data ->> 'regnr' AS regnr,
       Passering.data ->> 'dato'  AS dato,
       Passering.data ->> 'bod'   as bod,
       null,
       null,
       null
FROM Passering
WHERE Passering.data ->> 'regnr' NOT IN (SELECT data ->> 'regnr' FROM Kunde);


-- Oppgave F)
-- Skriv ut passeringer matchet med en eier og join sammen
SELECT Passering.data ->> 'regnr' AS regnr,
       Passering.data ->> 'dato'  AS dato,
       Passering.data ->> 'bod'   as bod,
       Kunde.data ->> 'navn'      as navn,
       Kunde.data ->> 'adresse'   as adresse,
       Kunde.data ->> 'epost'     as epost
FROM Passering,
     Kunde
WHERE Passering.data ->> 'regnr' = Kunde.data ->> 'regnr'
ORDER BY Passering.data ->> 'regnr';


-- Oppgave G)
-- ikke relevant


-- Oppgave H)
-- skriv ut antall passeringer per registreringsnummer
SELECT Passering.data ->> 'regnr' AS regnr, COUNT(*) AS antall
FROM Passering
GROUP BY Passering.data ->> 'regnr';


-- Oppgave I)
-- Skriv ut siste passering til bil med regnr XD12332
SELECT Passering.data ->> 'regnr' AS regnr, Passering.data ->> 'dato' AS dato
FROM Passering
WHERE Passering.data ->> 'regnr' = 'XD12332'
ORDER BY Passering.data ->> 'dato' DESC
LIMIT 1;


-- Oppgave J)
-- Skriv ut antall passeringer uten registrert regnr
SELECT COUNT(*) AS antall
FROM Passering
WHERE Passering.data ->> 'regnr' = '';


-- Oppgave K)
-- Vår løsning håndterer utlandske regnr helt ok, da det ikke er noen begrensninger på datatypen i JSON.

-- Oppgave L)
-- Ikke relevant for vår dokumentdatabase