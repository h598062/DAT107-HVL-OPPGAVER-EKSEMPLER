-- Innlevering1
DROP TABLE passeringer;
DROP TABLE kundedata;
-- Tabell for å holde registrerte skiltnummer
CREATE TABLE kundedata(
	-- REGNR varchar(10) hvis vi skal støtte ikke-norske numre og
	-- lengste regnr eg fant i europa var 9 lang
	-- primary key
	regnr CHAR(9) PRIMARY KEY NOT NULL UNIQUE,
	etternavn VARCHAR(25) NOT NULL,
	fornavn VARCHAR(25) NOT NULL,
	adresse VARCHAR(100),
	postnr CHAR(5) NOT NULL,
	tlf CHAR(8),
	--https://dba.stackexchange.com/questions/37014/in-what-data-type-should-i-store-an-email-address-in-database
	epost VARCHAR(320)
);
-- Tabell for å holde alle passeringer
CREATE TABLE passeringer(
	id SERIAL PRIMARY KEY,
	-- Bommen bilen passerer, skal vi si at bommene har et navn, eller et nummer som id?
	bomnr VARCHAR(10) NOT NULL,
	-- Dato og tid skal bli automatisk generert av programmet
	-- Dato og tid på format: 'YYYY-MM-DD HH:MM:SS'
	tidspunkt TIMESTAMP NOT NULL,
	-- REGNR varchar(10) hvis vi skal støtte ikke-norske numre og
	-- lengste regnr eg fant i europa var 9 lang
	-- vi må legge inn at denne kan være tom
	-- foreign key
	regnr CHAR(9),
	-- SMALLINT, INT eller MONEY, burde være ok å bruke integer typer siden vi kun bruker priser med hele kroner
	pris SMALLINT NOT NULL CHECK(pris > 0),
	FOREIGN KEY(regnr) REFERENCES kundedata(regnr)
);
-- legge inn test data eksempel
-- insert into kundedata (regnr, etternavn, fornavn, adresse, postnr, tlf, epost)
-- values(
-- 		'SV69420',
-- 		'Nordmann',
-- 		'Ole',
-- 		'Olav Kyrres gate 9',
-- 		'5014',
-- 		'22573000',
-- 		'ole.nordmann@example.com'
-- 	);
-- logikk i passeringer tabell skal automatisk øke passeringer for denne regnummer i regnummer tabell
-- insert into passeringer (bomnr, tidspunkt, regnr, pris)
-- values(
-- 		'gvdsvfb',
-- 		'2023-01-20 09:33:04',
-- 		'SV69420',
-- 		40
-- 	);