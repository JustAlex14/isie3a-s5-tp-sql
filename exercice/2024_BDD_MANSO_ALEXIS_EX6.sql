-- Suppression des données

-- Supprimer une réservation spécifique
DELETE FROM reservation WHERE id_reservation = 1;

-- Supprimer les réservations dont la date de retour est passée
DELETE FROM reservation WHERE end_date < CURRENT_DATE;
