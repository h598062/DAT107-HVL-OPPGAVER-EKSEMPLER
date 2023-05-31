SET search_path TO EKSOBLIG1;

ALTER TABLE Kunde
    DROP COLUMN tlf;

-- Passeringer matchet mot kunde
SELECT Passering.*,
       Kunde.navn,
       Kunde.adresse,
       Kunde.epost
FROM Passering
         LEFT JOIN Kunde
                   on Passering.regnr = Kunde.regnr
ORDER BY Passering.tidspunkt DESC;


-- Passeringer ikke inkludert tomme regnr
SELECT Passering.*,
       Kunde.navn,
       Kunde.adresse,
       Kunde.epost
FROM Passering
         INNER JOIN Kunde
                    ON Passering.regnr = Kunde.regnr
ORDER BY Passering.tidspunkt DESC;

-- antall passeringer per kunde
SELECT regnr, COUNT(*) AS antall
FROM passering
WHERE regnr IS NOT NULL
GROUP BY regnr;

-- Siste passering for kunde
SELECT *
FROM Passering as P
WHERE P.regnr = 'KA40980'
ORDER BY tidspunkt DESC
LIMIT 1;

-- antall passeringer uten regnr
SELECT COUNT(*) AS antall
FROM passering
WHERE regnr IS NULL
GROUP BY regnr;




