SELECT * FROM ospiti;
SELECT * FROM ospiti WHERE document_type LIKE 'CI';
SELECT * FROM paganti WHERE ospite_id IS NOT NULL;
SELECT * FROM stanze WHERE floor = 1;
SELECT 'E' FROM ospiti; --Non sono sicuro
SELECT * FROM ospiti WHERE date_of_birth = DATE(DATE_SUB(NOW(), INTERVAL 30 YEAR));
SELECT * FROM prenotazioni WHERE created_at < '2018-05-28';
