-- Må hente et regnr fra database vi kan teste, da vi har automatisk generert test data
SELECT *
FROM passeringer
WHERE regnr = 'HH23581'
ORDER BY tidspunkt DESC
LIMIT 1;