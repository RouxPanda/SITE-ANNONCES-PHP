-- CREATION DE TABLES
CREATE TABLE T_annonce (
    A_idannonce      SERIAL PRIMARY KEY,
    A_titre          VARCHAR(255),
    A_cout_loyer     DECIMAL,
    A_cout_charges   DECIMAL,
    A_type_chauffage ENUM('collectif', 'individuel'),
    A_superfice      DECIMAL,
    A_description    VARCHAR(255),
    A_adresse        VARCHAR(255),
    A_ville          VARCHAR(255),
    A_CP             VARCHAR(255),
    A_energie        BIGINT UNSIGNED,
    A_type           VARCHAR(255),
    A_etat           BOOLEAN
)ENGINE=InnoDB;

CREATE TABLE T_typeMaison (
    T_type        VARCHAR(255) PRIMARY KEY,
    T_description VARCHAR(255)
)ENGINE=InnoDB;

CREATE TABLE T_energie (
    E_id_engie    SERIAL PRIMARY KEY ,
    E_description VARCHAR(255)
)ENGINE=InnoDB;

CREATE TABLE T_utilisateur (
    U_mail   VARCHAR(255) PRIMARY KEY,
    U_mdp    VARCHAR(255),
    U_pseudo VARCHAR(255),
    U_nom    VARCHAR(255),
    U_prenom VARCHAR(255),
    U_admin  BOOLEAN
)ENGINE=InnoDB;

CREATE TABLE T_message (
    M_idannonce         BIGINT UNSIGNED,
    M_mail              VARCHAR(255),
    M_dateheure_message DATE,
    M_texte_message     VARCHAR(255)
)ENGINE=InnoDB;

CREATE TABLE T_photo (
    P_idphoto SERIAL PRIMARY KEY,
    P_annoce  BIGINT UNSIGNED,
    P_titre   VARCHAR(255),
    P_nom     VARCHAR(255)
)ENGINE=InnoDB;


-- ALTERATION DES TABLES
ALTER TABLE T_message ADD PRIMARY KEY (M_idannonce, M_mail); 
ALTER TABLE T_message ADD CONSTRAINT FK_T_MESSAGE_ANNONCE FOREIGN KEY (M_idannonce) REFERENCES T_annonce(A_idannonce); 
ALTER TABLE T_message ADD CONSTRAINT FK_T_MESSAGE_MAIL FOREIGN KEY (M_mail) REFERENCES T_utilisateur(U_mail); 

ALTER TABLE T_annonce ADD CONSTRAINT FK_T_ANNONCE_ENERGIE FOREIGN KEY (A_energie) REFERENCES T_energie(E_id_engie); 
ALTER TABLE T_annonce ADD CONSTRAINT FK_T_ANNONCE_TYPE FOREIGN KEY (A_type) REFERENCES T_typeMaison(T_type); 

ALTER TABLE T_photo ADD CONSTRAINT FK_T_PHOTO_ANNONCE FOREIGN KEY (P_annoce) REFERENCES T_annonce(A_idannonce); 


-- DONNEES DE BASE
INSERT INTO T_typeMaison (T_type, T_description) VALUES ('T1', 'Une maison a une piece (un studio quoi)');
INSERT INTO T_typeMaison (T_type, T_description) VALUES ('T2', 'Contient 2 pieces');
INSERT INTO T_typeMaison (T_type, T_description) VALUES ('T3', 'Contient 3 pieces');
INSERT INTO T_typeMaison (T_type, T_description) VALUES ('T4', 'Contient 4 pieces');
INSERT INTO T_typeMaison (T_type, T_description) VALUES ('T5', 'Contient 5 pieces');
INSERT INTO T_typeMaison (T_type, T_description) VALUES ('T6', 'Contient 6 pieces');


INSERT INTO T_utilisateur VALUES ('admin@admin.admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin', 'ad', 'min', TRUE);