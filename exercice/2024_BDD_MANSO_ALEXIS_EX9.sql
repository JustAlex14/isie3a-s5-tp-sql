CREATE TABLE RetourMateriel (
    id_retour serial PRIMARY KEY,
    id_reservation INT REFERENCES Reservation(id_reservation),
    date_retour DATE,
    retard boolean
);

ALTER TABLE Reservation
ADD COLUMN date_retour_effectif DATE;

ALTER TABLE Reservation
ADD CHECK (date_retour_effectif > start_date);

SELECT id_reservation, (date_retour_effectif - end_date) AS Retard FROM Reservation
WHERE (date_retour_effectif > end_date)


SELECT id_reservation, (date_retour_effectif - end_date) AS Retard, (date_retour_effectif - end_date)*1.5 as Penalite FROM Reservation
WHERE (date_retour_effectif > end_date)
