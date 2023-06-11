CREATE TABLE IF NOT EXISTS Athlete(
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    date_naissance DATE NOT NULL,
    sexe VARCHAR(32) NOT NULL,
    taille DECIMAL(5,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS Session(
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    annee INT NOT NULL,
    saison VARCHAR(32) NOT NULL,
    date_ouverture DATE NOT NULL,
    date_cloture DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Sport(
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Equipe(
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    code VARCHAR(255) NOT NULL,
    libelle VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Epreuve(
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    status VARCHAR(32) NOT NULL,
    id_sport BIGINT(20) NOT NULL,
    FOREIGN KEY(id_sport) REFERENCES Sport(id)
);

CREATE TABLE IF NOT EXISTS Prenom(
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    prenom VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS SessionEquipe(
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    id_session BIGINT(20) NOT NULL,
    id_athlete BIGINT(20) NOT NULL,
    id_equipe BIGINT(20) NOT NULL,
    poids DECIMAL(5,2) NOT NULL,
    FOREIGN KEY(id_athlete) REFERENCES Athlete(id), 
    FOREIGN KEY(id_session) REFERENCES Session(id), 
    FOREIGN KEY(id_equipe) REFERENCES Equipe(id)
);

CREATE TABLE IF NOT EXISTS Resultat(
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    classement VARCHAR(16) NOT NULL,
    score VARCHAR(255),
    id_session BIGINT(20) NOT NULL,
    id_athlete BIGINT(20) NOT NULL,
    id_epreuve BIGINT(20) NOT NULL,
    FOREIGN KEY(id_athlete) REFERENCES Athlete(id), 
    FOREIGN KEY(id_session) REFERENCES Session(id), 
    FOREIGN KEY(id_epreuve) REFERENCES Epreuve(id)
);

CREATE TABLE IF NOT EXISTS SessionEpreuve(
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    id_session BIGINT(20) NOT NULL,
    id_epreuve BIGINT(20) NOT NULL,
    FOREIGN KEY(id_session) REFERENCES Session(id), 
    FOREIGN KEY(id_epreuve) REFERENCES Epreuve(id)
);

CREATE TABLE IF NOT EXISTS AthletePrenom(
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    id_athlete BIGINT(20) NOT NULL,
    id_prenom BIGINT(20) NOT NULL,
    FOREIGN KEY(id_athlete) REFERENCES Athlete(id), 
    FOREIGN KEY(id_prenom) REFERENCES Prenom(id)
);
