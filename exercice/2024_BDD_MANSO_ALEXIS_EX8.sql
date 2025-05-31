-- Gestion des disponibilités

-- 1. Création de la table Disponibilité
CREATE TABLE Disponibilite (
    id_disponibilite serial PRIMARY KEY,
    id_materiel INT REFERENCES Materials(id_materials),
    date_debut DATE,
    date_fin DATE
);

-- 2. Modification de la table Reservation
ALTER TABLE Reservation
ADD COLUMN id_disponibilite INT REFERENCES Disponibilite(id_disponibilite);

-- 3. Vérification de disponibilité avant réservation
-- Exemple de requête pour tester la disponibilité
SELECT
    CASE
        WHEN '2025-05-05' BETWEEN date_debut AND date_fin
        THEN 'Disponible'
        ELSE 'Non disponible'
    END AS statut_disponibilite
FROM disponibilite
WHERE id_materiel = 1;

-- 5. Gestion des périodes de disponibilité (insertion exemple)
INSERT INTO disponibilite (id_materiel, date_debut, date_fin)
VALUES (1, '2025-05-01', '2025-05-10');
