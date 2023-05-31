DROP SCHEMA IF EXISTS EKSOVOBLIG3 CASCADE;
CREATE SCHEMA EKSOVOBLIG3;
SET search_path TO EKSOVOBLIG3;


/*
 Mange til mange mot Prosjekt
 */
CREATE TABLE Ansatt
(
    ansatt_id SERIAL PRIMARY KEY,
    navn      VARCHAR(50) NOT NULL,
    stilling  VARCHAR(50) NOT NULL,
    startdato DATE        NOT NULL,
    lønn      INTEGER     NOT NULL
);

/*
 Mange til mange mot Ansatt
 */
CREATE TABLE Prosjekt
(
    prosjekt_id          SERIAL PRIMARY KEY,
    prosjekt_navn        VARCHAR(50)  NOT NULL,
    prosjekt_beskrivelse TEXT NOT NULL
);

/*
 Løsningen for Mange til Mange mellom Prosjekt og Ansattt
 */
CREATE TABLE Prosjektdeltagelse
(
    ansatt_id   INTEGER NOT NULL,
    prosjekt_id INTEGER NOT NULL,
    timer DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (ansatt_id, prosjekt_id),
    FOREIGN KEY (ansatt_id) REFERENCES Ansatt (ansatt_id),
    FOREIGN KEY (prosjekt_id) REFERENCES Prosjekt (prosjekt_id)
);