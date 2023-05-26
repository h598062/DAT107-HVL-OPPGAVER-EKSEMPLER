DROP SCHEMA IF EXISTS jall1 CASCADE;
CREATE SCHEMA jall1;
SET search_path TO jall1;
CREATE TABLE Poststed (
	postnummer CHAR(4) PRIMARY KEY,
	poststed VARCHAR(50) NOT NULL
);
CREATE TABLE Person(
	personid SERIAL PRIMARY KEY,
	navn VARCHAR(20) NOT NULL,
	postnummer CHAR(4),
	adresse VARCHAR(100),
	telefonNr VARCHAR(15),
	FOREIGN KEY (postnummer) REFERENCES Poststed(postnummer) ON UPDATE CASCADE ON DELETE
	SET NULL
);
INSERT INTO Poststed (postnummer, poststed)
VALUES ('1234', 'gay'),
	('1337', 'boi'),
	('6969', 'lesbo'),
	('0420', 'girl'),
	('4200', 'weed');
INSERT INTO Person (navn, postnummer)
VALUES ('pen', '1234'),
	('pto', '1234'),
	('ptre', '1234'),
	('pfire', '1234'),
	('stårm', '1337'),
	('bjelle', '1337'),
	('c', '6969'),
	('djbk', '0420'),
	('fdgdfhg', '6969');
-- vår - LITT FEIL - denne teller at det e 1 på postnr 4200, som e feil
SELECT Poststed.postnummer,
	Poststed.poststed,
	COUNT(Poststed.postnummer) AS AntallPersoner
FROM Poststed
	LEFT JOIN Person ON Poststed.postnummer = Person.postnummer
GROUP BY Poststed.poststed,
	Poststed.postnummer;
-- gpt 1 - RIKTIG
SELECT PS.postnummer,
	PS.poststed,
	COUNT(P.postnummer) AS antall_personer
FROM Poststed PS
	LEFT JOIN Person P ON PS.postnummer = P.postnummer
GROUP BY PS.postnummer,
	PS.poststed;
-- gpt 2 - FEIL
SELECT P.postnummer,
	PS.poststed,
	COUNT(P.postnummer) AS antall_personer
FROM Person P
	RIGHT JOIN Poststed PS ON P.postnummer = PS.postnummer
GROUP BY P.postnummer,
	PS.poststed;
-- gpt 3 - KANSKJE riktig, viser ikke poststeder med null personer
SELECT P.postnummer,
	PS.poststed,
	COUNT(*) AS antall_personer
FROM Person P
	LEFT JOIN Poststed PS ON P.postnummer = PS.postnummer
GROUP BY P.postnummer,
	PS.poststed;