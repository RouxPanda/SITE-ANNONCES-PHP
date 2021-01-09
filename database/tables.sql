CREATE TABLE T_annonce (
    A_idannonce      SERIAL PRIMARY KEY,
    A_titre          VARCHAR(255) NOT NULL,
    A_cout_loyer     DECIMAL NOT NULL,
    A_cout_charges   DECIMAL NOT NULL,
    A_type_chauffage ENUM('collectif', 'individuel') NOT NULL,
    A_superfice      DECIMAL NOT NULL,
    A_description    VARCHAR(255),
    A_adresse        VARCHAR(255),
    A_ville          VARCHAR(255),
    A_CP             VARCHAR(255),
    A_energie        BIGINT UNSIGNED DEFAULT null,
    A_type           VARCHAR(255) NOT NULL,
    A_etat           INTEGER NOT NULL,
    A_auteur         VARCHAR(255) NOT NULL,
    A_blocked        BOOLEAN NOT NULL DEFAULT false     
)ENGINE=InnoDB;

CREATE TABLE T_typeMaison (
    T_type        VARCHAR(255) PRIMARY KEY,
    T_description VARCHAR(255) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE T_energie (
    E_id_engie    SERIAL PRIMARY KEY ,
    E_description VARCHAR(255) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE T_utilisateur (
    U_mail   VARCHAR(255) PRIMARY KEY,
    U_mdp    VARCHAR(255) NOT NULL,
    U_pseudo VARCHAR(255) NOT NULL,
    U_nom    VARCHAR(255) NOT NULL,
    U_prenom VARCHAR(255) NOT NULL,
    U_admin  BOOLEAN NOT NULL DEFAULT false
)ENGINE=InnoDB;

CREATE TABLE T_message (
    M_id                SERIAL PRIMARY KEY ,
    M_idannonce         BIGINT UNSIGNED NOT NULL,
    M_mail              VARCHAR(255) NOT NULL,
    M_mail_dest         VARCHAR(255) NOT NULL,
    M_dateheure_message DATE,
    M_texte_message     VARCHAR(255) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE T_photo (
    P_idphoto SERIAL PRIMARY KEY,
    P_annonce  BIGINT UNSIGNED NOT NULL,
    P_titre   VARCHAR(255) NOT NULL,
    P_nom     VARCHAR(255) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE T_recovery (
    R_mail    VARCHAR(255) PRIMARY KEY,
    R_token   VARCHAR(255) NOT NULL
)ENGINE=InnoDB;

-- ALTERATION DES TABLES
ALTER TABLE T_message ADD CONSTRAINT FK_T_MESSAGE_ANNONCE FOREIGN KEY (M_idannonce) REFERENCES T_annonce(A_idannonce); 
ALTER TABLE T_message ADD CONSTRAINT FK_T_MESSAGE_MAIL FOREIGN KEY (M_mail) REFERENCES T_utilisateur(U_mail); 
ALTER TABLE T_message ADD CONSTRAINT FK_T_MESSAGE_MAIL_DEST FOREIGN KEY (M_mail_dest) REFERENCES T_utilisateur(U_mail); 

ALTER TABLE T_annonce ADD CONSTRAINT FK_T_ANNONCE_ENERGIE FOREIGN KEY (A_energie) REFERENCES T_energie(E_id_engie); 
ALTER TABLE T_annonce ADD CONSTRAINT FK_T_ANNONCE_TYPE FOREIGN KEY (A_type) REFERENCES T_typeMaison(T_type); 
ALTER TABLE T_annonce ADD CONSTRAINT FK_T_ANNONCE_AUTEUR FOREIGN KEY (A_auteur) REFERENCES T_utilisateur(U_mail); 

ALTER TABLE T_photo ADD CONSTRAINT FK_T_PHOTO_ANNONCE FOREIGN KEY (P_annonce) REFERENCES T_annonce(A_idannonce); 

ALTER TABLE T_recovery ADD CONSTRAINT FK_T_RECOVERY_MAIL FOREIGN KEY (R_mail) REFERENCES T_utilisateur(U_mail); 