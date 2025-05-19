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
   PRIMARY KEY(Id_Reservation),
   FOREIGN KEY(Id_Student) REFERENCES Student(Id_Student),
   FOREIGN KEY(Id_Materials) REFERENCES Materials(Id_Materials)
);
```

### Code pour insérer les données:
``` sql
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
INSERT INTO Reservation (start_date, end_date, Id_Student, Id_Materials) VALUES
('2025-05-01', '2025-05-03', 1, 1), -- John reserves Laptop
('2025-05-02', '2025-05-04', 2, 2), -- Emily reserves Projector
('2025-05-05', '2025-05-06', 3, 3), -- Michael reserves Microscope
('2025-05-07', '2025-05-10', 4, 4), -- Sarah reserves Camera
('2025-05-08', '2025-05-12', 5, 5), -- David reserves 3D Printer
('2025-05-10', '2025-05-13', 1, 2), -- John reserves Projector
('2025-05-15', '2025-05-18', 2, 1); -- Emily reserves Laptop

```