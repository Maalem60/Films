DROP DATABASE IF EXISTS filmBD;
CREATE DATABASE filmsBD;

CREATE TABLE personne (
    personneID INT PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    sexe VARCHAR(50),
    dateNaissance VARCHAR(50)
);

CREATE TABLE realisateur (
    realisateurID INT PRIMARY KEY,
    personneID INT,
    FOREIGN KEY (personneID) REFERENCES personne(personneID)
);

CREATE TABLE acteur (
    acteurID INT PRIMARY KEY,
    personneID INT,
    FOREIGN KEY (personneID) REFERENCES personne(personneID)
);

CREATE TABLE genre (
    genreID INT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    libelle VARCHAR(255) NOT NULL
);

CREATE TABLE Films (
    filmID INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    anneeSortie INT NOT NULL,
    duree INT NOT NULL,
    synopsis TEXT NOT NULL,
    note INT NOT NULL,
    affiche VARCHAR(255) NOT NULL,
    realisateurID INT,
    FOREIGN KEY (realisateurID) REFERENCES realisateur(realisateurID)
);

CREATE TABLE personnage (
    personnageID INT PRIMARY KEY,
    nom VARCHAR(50),
    role VARCHAR(255)
);

CREATE TABLE casting (
    filmID INT NOT NULL,
    acteurID INT NOT NULL,
    personnageID INT NOT NULL,
    PRIMARY KEY (filmID, acteurID, personnageID),
    FOREIGN KEY (filmID) REFERENCES Films(filmID),
    FOREIGN KEY (acteurID) REFERENCES acteur(acteurID),
    FOREIGN KEY (personnageID) REFERENCES personnage(personnageID)
);

CREATE TABLE film_genre (
    filmID INT NOT NULL,
    genreID INT NOT NULL,
    PRIMARY KEY (filmID, genreID),
    FOREIGN KEY (filmID) REFERENCES Films(filmID),
    FOREIGN KEY (genreID) REFERENCES genre(genreID)
);
