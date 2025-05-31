-- Requêtes SELECT avec filtres WHERE

-- Liste des matériels avec un ID inférieur à 3
SELECT * FROM materials WHERE id_materials < 3;

-- Réservations où la quantité est inférieure à 3
SELECT * FROM reservation WHERE quantity < 3;

-- Étudiants avec un ID inférieur à 3
SELECT * FROM student WHERE id_student < 3;
