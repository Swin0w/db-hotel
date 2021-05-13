SELECT * FROM ospiti;
SELECT * FROM ospiti WHERE document_type = 'CI'; -- || = o LIKE
SELECT * FROM paganti WHERE ospite_id  NOT NULL; -- Sbagliata
SELECT * FROM stanze WHERE floor = 1; -- || SELECT * FROM stanze WHERE floor LIKE 1
SELECT 'E%' FROM ospiti; --Sbagliata
SELECT * FROM ospiti WHERE date_of_birth = DATE(DATE_SUB(NOW(), INTERVAL 30 YEAR)); --Sbagliata
SELECT * FROM prenotazioni WHERE created_at < '2018-05-28';

-- Query giuste
SELECT * FROM ospiti WHERE document_type LIKE 'CI';
SELECT * FROM paganti WHERE ospiti_id IS NOT NULL
SELECT * FROM ospiti WHERE name LIKE 'E%' && 'e%'
SELECT * FROM ospiti WHERE YEAR(NOW()) - YEAR(date_of_birth) < 30



-- Continuo db-hotel -> FOGLIO 1
SELECT ospiti.id, name, lastname, prenotazioni_has_ospiti.prenotazione_id, COUNT(prenotazione_id)
FROM ospiti
JOIN prenotazioni_has_ospiti ON ospiti.id=prenotazioni_has_ospiti.ospite_id
GROUP BY ospiti.id
HAVING COUNT(prenotazione_id) > 2
-- 1
SELECT ospiti.id,name,lastname, prenotazioni.stanza_id,prenotazioni.configurazione_id
FROM ospiti
JOIN prenotazioni_has_ospiti
ON prenotazioni_has_ospiti.ospite_id = ospiti.id
JOIN prenotazioni
ON prenotazioni_has_ospiti.prenotazione_id=prenotazioni.id
ORDER BY prenotazioni.configurazione_id DESC
-- 2

-- 3




-- Continuo db-hotel -> FOGLIO 2
SELECT * FROM ospiti ORDER BY date_of_birth ASC -- Sbagliata | 1
SELECT *, SUM(price) FROM pagamenti GROUP BY status -- 2
SELECT stanza_id, COUNT(stanza_id) FROM prenotazioni GROUP BY stanza_id -- 3
SELECT COUNT(HOUR(created_at)), HOUR(created_at) FROM prenotazioni GROUP BY HOUR(created_at) ORDER BY COUNT(HOUR(created_at)) -- 4
SELECT COUNT(prenotazione_id), ospite_id FROM prenotazioni_has_ospiti GROUP BY ospite_id ORDER BY COUNT(prenotazione_id) DESC -- 5


-- Query Giuste
SELECT COUNT(*), YEAR(date_of_birth) FROM ospiti GROUP BY YEAR(date_of_birth) -- 1
