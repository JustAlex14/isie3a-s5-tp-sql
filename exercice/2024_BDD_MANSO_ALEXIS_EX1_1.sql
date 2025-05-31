-- Création de la table Student
CREATE TABLE Student(
   Id_Student serial PRIMARY KEY,
   Last_Name VARCHAR(50),
   Name VARCHAR(50),
   Mail VARCHAR(50)
);

-- Insertion de données dans la table Student
INSERT INTO Student (Last_Name, Name, Mail) VALUES
('Smith', 'John', 'john.smith@example.com'),
('Johnson', 'Emily', 'emily.johnson@example.com'),
('Lee', 'Michael', 'michael.lee@example.com'),
('Brown', 'Sarah', 'sarah.brown@example.com'),
('Garcia', 'David', 'david.garcia@example.com');
