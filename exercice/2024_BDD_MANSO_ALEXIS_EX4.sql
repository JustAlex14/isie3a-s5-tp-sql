-- Requêtes d'agrégation

-- Nombre total de réservations entre deux dates
SELECT SUM(quantity) AS "Nombre de réservations"
FROM reservation
WHERE start_date >= '2025-05-01' AND end_date <= '2025-05-10';

-- Nombre d'étudiants distincts ayant emprunté du matériel
SELECT COUNT(DISTINCT id_student) AS "Nombre d'étudiants"
FROM reservation;
