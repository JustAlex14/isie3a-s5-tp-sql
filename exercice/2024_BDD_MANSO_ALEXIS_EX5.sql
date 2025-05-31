-- Mise à jour des données

-- Modifier la quantité pour une réservation précise
UPDATE reservation
SET quantity = 5
WHERE id_reservation = 8;

-- Modifier la quantité pour les matériels en cours d'emprunt et retour prévu dans plus de 2 jours
UPDATE reservation
SET quantity = 5
WHERE CURRENT_DATE BETWEEN start_date AND end_date + INTERVAL '2 days';
