SELECT regnr,
	COUNT(*) AS "Antall passeringer"
FROM passeringer
WHERE regnr IS NOT NULL
GROUP BY regnr;