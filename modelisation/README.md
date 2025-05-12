#TP SQL

## Exercice 1

### Explication des différents choix de modélisations:
    - Voir **ModelV1** pour la modélisation des données
    - Voir **ModelTpSql** pour modifier la base du projet
    - Le entités Student, Materials et Reservation ont été créé conformément aux descriptions dans le fichier de présentation du projet
    - Les asssociations sont de type 1,1 pour réservation car une réservation ne contient qu'un type de matériel et qu'un seul élève.
    - Les associations sont de type 0,n pour le reste car un étudiant peut avoir plusieurs réservation et un matériel peut être dans plusieurs réservations. 


### Code LDD généré:
```sql
CREATE TABLE Student(
   Id_Student COUNTER,
   Last_Name VARCHAR(50),
   Name VARCHAR(50),
   Mail VARCHAR(50),
   PRIMARY KEY(Id_Student)
);

CREATE TABLE Materials(
   Id_Materials COUNTER,
   Name VARCHAR(50),
   PRIMARY KEY(Id_Materials)
);

CREATE TABLE Reservation(
   Id_Reservation COUNTER,
   start_date DATE,
   end_date DATE,
   Id_Student INT NOT NULL,
   Id_Materials INT NOT NULL,
   PRIMARY KEY(Id_Reservation),
   FOREIGN KEY(Id_Student) REFERENCES Student(Id_Student),
   FOREIGN KEY(Id_Materials) REFERENCES Materials(Id_Materials)
);
```