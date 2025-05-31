# TP PostgreSQL — Alexis Manso

## Exercice 1 : Création et insertion des données

Ce premier exercice a pour but de :
- Créer les tables `Student`, `Materials`, et `Reservation`
- Insérer des données d'exemple
- Valider la cohérence du schéma relationnel

---


## Contenu des fichiers

| Fichier | Description |
|--------|-------------|
| `2024_BDD_MANSO_ALEXIS_EX1_1.sql` | Création de la table `Student` et insertion de 5 étudiants |
| `2024_BDD_MANSO_ALEXIS_EX1_2.sql` | Création des tables `Materials` et `Reservation`, et insertion de données |

---

## Modèle relationnel utilisé

- **Student** : Identifie chaque étudiant avec un ID, un nom, un prénom et un email
- **Materials** : Représente les équipements empruntables
- **Reservation** : Relie un étudiant à un matériel avec une date de début, une date de fin et une quantité

### Contraintes appliquées :
- Clés primaires sur les identifiants (`serial`)
- Clés étrangères :
  - `Reservation.Id_Student → Student.Id_Student`
  - `Reservation.Id_Materials → Materials.Id_Materials`

---

## Données insérées

### Étudiants (extraits) :
```
(Smith, John, john.smith@example.com)
(Johnson, Emily, emily.johnson@example.com)
```

### Matériels :
```
Laptop, Projector, Microscope, Digital Camera, 3D Printer
```

### Réservations :
```
Exemple : John réserve un Laptop du 2025-05-01 au 2025-05-03
```

---

## Remarques

Ce jeu de données permettra de tester efficacement les requêtes des exercices suivants, notamment les jointures et les agrégations.

