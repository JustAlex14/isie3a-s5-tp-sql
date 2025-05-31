-- Requêtes avancées

-- 1. Utilisateurs ayant emprunté au moins un équipement
SELECT DISTINCT student.name
FROM student
JOIN reservation ON student.id_student = reservation.id_student;

-- 2. Équipements n'ayant jamais été empruntés
SELECT name 
FROM materials
WHERE id_materials NOT IN (
    SELECT id_materials FROM reservation
);

-- 3. Équipements empruntés plus de 3 fois
SELECT materials.name
FROM materials
JOIN reservation ON materials.id_materials = reservation.id_materials
GROUP BY materials.name
HAVING COUNT(*) > 3;

-- 4. Nombre d’emprunts par utilisateur (incluant ceux à 0)
SELECT student.id_student, student.name, COUNT(reservation.id_reservation) AS nb_emprunts
FROM student
LEFT JOIN reservation ON student.id_student = reservation.id_student
GROUP BY student.id_student, student.name
ORDER BY student.id_student;
