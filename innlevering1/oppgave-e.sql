-- manuelt skrevet inn alle felt for å få i denne rekkefølgen og fjerne duplikate felt
SELECT passeringer.regnr,
	passeringer.bomnr,
	passeringer.dato,
	passeringer.tidspunkt,
	passeringer.pris,
	kundedata.fornavn,
	kundedata.etternavn,
	kundedata.tlf,
	kundedata.adresse,
	kundedata.postnr,
	kundedata.epost
FROM passeringer
	LEFT JOIN kundedata ON passeringer.regnr = kundedata.regnr
ORDER BY passeringer.regnr;