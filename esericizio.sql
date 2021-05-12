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
SELECT * FORM ospiti WHERE name LIKE 'E%' && 'e%'
SELECT * FROM ospiti WHERE YEAR(NOW()) - YEAR(date_of_birth) < 30
