DROP SCHEMA IF EXISTS OBLIG4 CASCADE;
CREATE SCHEMA OBLIG4;
SET search_path TO OBLIG4;

-- Lag tabeller
CREATE TABLE Passering
(
    id   SERIAL PRIMARY KEY,
    data JSON NOT NULL
);

CREATE TABLE Kunde
(
    id   SERIAL PRIMARY KEY,
    data JSON NOT NULL
);

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
       }');

INSERT INTO Kunde(data)
VALUES ('{
  "regnr": "SU57668",
  "navn": "Ola Normann",
  "adresse": "Bergenveien 2",
  "epost": "ola.normann@mail.no",
  "tlf": 99988777
}');

-- Hent ut all info om passeringer inkludert eier med tilsvarende regnr og join info sammen
SELECT Passering.data, Kunde.data
FROM Passering,
     Kunde
WHERE Passering.data ->> 'regnr' = Kunde.data ->> 'regnr'
ORDER BY Passering.data ->> 'regnr';

-- skriv ut alle passeringer og join med matchende kunde hvis det finnes en
SELECT Passering.data, Kunde.data
FROM Passering,
     Kunde
WHERE Passering.data ->> 'regnr' = Kunde.data ->> 'regnr'
UNION
SELECT Passering.data, NULL
FROM Passering
WHERE Passering.data ->> 'regnr' NOT IN (SELECT data ->> 'regnr' FROM Kunde); -- takk AWS CodeWhisperer