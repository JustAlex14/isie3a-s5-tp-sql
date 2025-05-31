-- Création de la table Materials
CREATE TABLE Materials(
   Id_Materials serial PRIMARY KEY,
   Name VARCHAR(50)
);

-- Insertion de données dans la table Materials
INSERT INTO Materials (Name) VALUES
('Laptop'),
('Projector'),
('Microscope'),
('Digital Camera'),
('3D Printer');

-- Création de la table Reservation
CREATE TABLE Reservation(
   Id_Reservation serial PRIMARY KEY,
   start_date DATE,
   end_date DATE,
   Id_Student INT NOT NULL REFERENCES Student(Id_Student),
   Id_Materials INT NOT NULL REFERENCES Materials(Id_Materials),
   quantity INT NOT NULL
);

-- Insertion de données dans la table Reservation
INSERT INTO Reservation (start_date, end_date, Id_Student, Id_Materials, quantity) VALUES
('2025-05-01', '2025-05-03', 1, 1, 1),
('2025-05-02', '2025-05-04', 2, 2, 2),
('2025-05-05', '2025-05-06', 3, 3, 3),
('2025-05-07', '2025-05-10', 4, 4, 1),
('2025-05-08', '2025-05-12', 5, 5, 2),
('2025-05-10', '2025-05-13', 1, 2, 1),
('2025-05-15', '2025-05-18', 2, 1, 1);
