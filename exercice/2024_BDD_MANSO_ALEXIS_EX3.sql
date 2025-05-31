-- Jointure entre Student, Reservation et Materials

-- Informations sur les étudiants et les matériels réservés
SELECT student.last_name, student.name, materials.name AS material_name, quantity 
FROM student
INNER JOIN reservation ON student.id_student = reservation.id_student
INNER JOIN materials ON reservation.id_materials = materials.id_materials;

-- Informations sur le matériel emprunté par John
SELECT materials.name, quantity 
FROM student
INNER JOIN reservation ON student.id_student = reservation.id_student
INNER JOIN materials ON reservation.id_materials = materials.id_materials
WHERE student.name = 'John';
