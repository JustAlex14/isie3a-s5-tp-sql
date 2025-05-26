#TP SQL

## Exercice 1

### Explication des différents choix de modélisations:
    - Voir [ModelV1] pour la modélisation des données
    - Voir [ModelTpSql] pour modifier la base du projet
    - Le entités Student, Materials et Reservation ont été créé conformément aux descriptions dans le fichier de présentation du projet
    - Les asssociations sont de type 1,1 pour réservation car une réservation ne contient qu'un type de matériel et qu'un seul élève.
    - Les associations sont de type 0,n pour le reste car un étudiant peut avoir plusieurs réservation et un matériel peut être dans plusieurs réservations. 


### Code LDD généré:
```sql
CREATE TABLE Student(
   Id_Student serial,
   Last_Name VARCHAR(50),
   Name VARCHAR(50),
   Mail VARCHAR(50),
   PRIMARY KEY(Id_Student)
);

CREATE TABLE Materials(
   Id_Materials serial,
   Name VARCHAR(50),
   PRIMARY KEY(Id_Materials)
);

CREATE TABLE Reservation(
   Id_Reservation serial,
   start_date DATE,
   end_date DATE,
   Id_Student INT NOT NULL,
   Id_Materials INT NOT NULL,
   quantity INT NOT NULL,
   PRIMARY KEY(Id_Reservation),
   FOREIGN KEY(Id_Student) REFERENCES Student(Id_Student),
   FOREIGN KEY(Id_Materials) REFERENCES Materials(Id_Materials)
);
```

### Code pour insérer les données:
``` sql
-- Insert students
-- Insert students
INSERT INTO Student (Last_Name, Name, Mail) VALUES
('Smith', 'John', 'john.smith@example.com'),
('Johnson', 'Emily', 'emily.johnson@example.com'),
('Lee', 'Michael', 'michael.lee@example.com'),
('Brown', 'Sarah', 'sarah.brown@example.com'),
('Garcia', 'David', 'david.garcia@example.com');

-- Insert materials
INSERT INTO Materials (Name) VALUES
('Laptop'),
('Projector'),
('Microscope'),
('Digital Camera'),
('3D Printer');

-- Insert reservations
INSERT INTO Reservation (start_date, end_date, Id_Student, Id_Materials, quantity) VALUES
('2025-05-01', '2025-05-03', 1, 1, 1), -- John reserves 1 Laptop
('2025-05-02', '2025-05-04', 2, 2, 2), -- Emily reserves 2 Projector
('2025-05-05', '2025-05-06', 3, 3, 3), -- Michael reserves 3 Microscope
('2025-05-07', '2025-05-10', 4, 4, 1), -- Sarah reserves 1 Camera
('2025-05-08', '2025-05-12', 5, 5, 2), -- David reserves 2 3D Printer
('2025-05-10', '2025-05-13', 1, 2, 1), -- John reserves 1 Projector
('2025-05-15', '2025-05-18', 2, 1, 1); -- Emily reserves 1 Laptop
```

### Code pour le select:
``` sql
Select * From materials where id_materials < 3;

Select * From reservation where quantity < 3;

Select * From student where id_student < 3;
```

### Code Select Ex3
```sql
Select student.last_name, student.name, materials.name, quantity from student
Inner Join reservation on student.id_student = reservation.id_student
Inner Join materials on reservation.id_materials = materials.id_materials;

Select materials.name, quantity from student
Inner Join reservation on student.id_student = reservation.id_student
Inner Join materials on reservation.id_materials = materials.id_materials
Where student.name = 'John';
```

### Code Select Ex4
```sql
Select Sum(quantity) as "Nombre de réservation" From reservation Where start_date >= '2025-05-01' And end_date <= '2025-05-10';

Select Count(DISTINCT id_student) as "Nombre d'étudiant ayant emprunter du matériels" from reservation;
```

### Code Update Ex5
```sql
UPDATE reservation set quantity = 5
where id_reservation = 8

UPDATE reservation set quantity = 5
where id_reservation in (
	Select id_reservation from reservation 
	where Current_Date Between start_date and end_date + interval '2 days'
)
```

### Code Supprimer les données Ex6
```sql
Delete from reservation where id_reservation = 1;

Delete from reservation where end_date < Current_Date;
```

### Code SELECT Ex7
```sql
SELECT Distinct name FROM student JOIN reservation ON student.id_student = reservation.id_student;

SELECT Distinct name FROM materials Right OUTER JOIN reservation ON materials.id_materials = reservation.id_materials;

Select name From materials 
Inner Join reservation On materials.id_materials = reservation.id_materials
Group by materials.name
Having Count(Materials.id_materials) >= '3'

Select distinct student.id_student, name from student 
left JOIN reservation ON student.id_student = reservation.id_student
Group by student.id_student
Order By student.id_student

```