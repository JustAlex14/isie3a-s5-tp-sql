alter table disponibilite drop constraint disponibilite_id_materiel_fkey;
alter table reservation drop constraint reservation_numeroetudiant_fkey;
alter table reservation drop constraint reservation_identifiantmateriel_fkey;
alter table reservation drop constraint reservation_id_disponibilite_fkey;

TRUNCATE TABLE reservation RESTART IDENTITY CASCADE;
TRUNCATE TABLE disponibilite RESTART IDENTITY CASCADE;
TRUNCATE TABLE materiel RESTART IDENTITY CASCADE;
TRUNCATE TABLE utilisateur RESTART IDENTITY CASCADE;


-- Insert 1,000,000 rows into utilisateur
DO $$
DECLARE
    i INT;
BEGIN
    FOR i IN 1..100000 LOOP
        INSERT INTO student (id_student, last_name, "name", mail)
        VALUES (
            id_student || ,
            'nom_' || i,
            'prenom_' || i,
            'user_' || i || '@example.com'
        );
    END LOOP;
END $$;

-- Insert 1,000,000 rows into materiel
DO $$
DECLARE
    i INT;
BEGIN
    FOR i IN 1..100000 LOOP
        INSERT INTO materials (id_materials, "name")
        VALUES (
            i,
            'materiel_' || i,
            'description for materiel_' || i
        );
    END LOOP;
END $$;

-- Insert 2,000,000 rows into disponibilite
DO $$
DECLARE
    i INT;
    start_date DATE;
    end_date DATE;
BEGIN
    FOR i IN 1..200000 LOOP
        -- Generate random start and end dates
        start_date := DATE '2025-01-01' + (random() * 365)::INT;
        end_date := start_date + (random() * 30)::INT;

        INSERT INTO disponibilite (id_disponibilite, id_materiel, date_debut, date_fin, )
        VALUES (
            i,
            (random() * 999999)::INT + 1, -- Random id_materiel between 1 and 1,000,000
            start_date,
            end_date,
            (random() < 0.5) -- Random boolean for retard
        );
    END LOOP;
END $$;

-- Insert 2,000,000 rows into reservation
DO $$
DECLARE
    i INT;
    reservation_date DATE;
    return_date DATE;
	effective_return_date DATE;
BEGIN
    FOR i IN 1..200000 LOOP
        -- Generate random reservation and return dates
        reservation_date := DATE '2025-01-01' + (random() * 365)::INT;
        return_date := reservation_date + (random() * 15)::INT;
		effective_return_date := reservation_date + (random() * 15)::INT;

        INSERT INTO reservation (id_reservation, start_date, end_date, id_student, id_materials, id_disponibilite, date_retour_effectif, quantity)
        VALUES (
            i,
            reservation_date,
            return_date,
            (random() * 999999)::INT + 1, -- Random numero_etudiant between 1 and 1,000,000
            (random() * 999999)::INT + 1,  -- Random identifiant_materiel between 1 and 1,000,000
			(random() * 999999)::INT + 1 , -- Random id_disponibilite between 1 and 1,000,000
			effective_return_date,
			(random() * 20)::INT + 1 -- Random quantity between 1 and 20 for the available quantity
        );
    END LOOP;
END $$;