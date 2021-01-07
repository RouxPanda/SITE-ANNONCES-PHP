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
    A_etat           INTEGER,
    A_auteur         VARCHAR(255)          
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
    M_id                SERIAL PRIMARY KEY ,
    M_idannonce         BIGINT UNSIGNED,
    M_mail              VARCHAR(255),
    M_mail_dest         VARCHAR(255),
    M_dateheure_message DATE,
    M_texte_message     VARCHAR(255)
)ENGINE=InnoDB;

CREATE TABLE T_photo (
    P_idphoto SERIAL PRIMARY KEY,
    P_annonce  BIGINT UNSIGNED,
    P_titre   VARCHAR(255),
    P_nom     VARCHAR(255)
)ENGINE=InnoDB;


-- ALTERATION DES TABLES
ALTER TABLE T_message ADD CONSTRAINT FK_T_MESSAGE_ANNONCE FOREIGN KEY (M_idannonce) REFERENCES T_annonce(A_idannonce); 
ALTER TABLE T_message ADD CONSTRAINT FK_T_MESSAGE_MAIL FOREIGN KEY (M_mail) REFERENCES T_utilisateur(U_mail); 
ALTER TABLE T_message ADD CONSTRAINT FK_T_MESSAGE_MAIL_DEST FOREIGN KEY (M_mail_dest) REFERENCES T_utilisateur(U_mail); 

ALTER TABLE T_annonce ADD CONSTRAINT FK_T_ANNONCE_ENERGIE FOREIGN KEY (A_energie) REFERENCES T_energie(E_id_engie); 
ALTER TABLE T_annonce ADD CONSTRAINT FK_T_ANNONCE_TYPE FOREIGN KEY (A_type) REFERENCES T_typeMaison(T_type); 
ALTER TABLE T_annonce ADD CONSTRAINT FK_T_ANNONCE_AUTEUR FOREIGN KEY (A_auteur) REFERENCES T_utilisateur(U_mail); 

ALTER TABLE T_photo ADD CONSTRAINT FK_T_PHOTO_ANNONCE FOREIGN KEY (P_annonce) REFERENCES T_annonce(A_idannonce); 

-- CREATION DES TRIGGERS
DELIMITER //
CREATE TRIGGER before_delete_user BEFORE DELETE ON T_utilisateur FOR EACH ROW 
BEGIN
	DELETE FROM T_annonce WHERE A_auteur=OLD.U_mail;
END; //

DELIMITER //
CREATE TRIGGER before_delete_annonce BEFORE DELETE ON T_annonce FOR EACH ROW 
BEGIN
	DELETE FROM T_photo WHERE P_annonce=OLD.A_idannonce;
    DELETE FROM T_message WHERE M_idannonce=OLD.A_idannonce;
END; //


-- DONNEES DE BASE
INSERT INTO T_typeMaison VALUES ('T1', 'Une maison a une piece (un studio quoi)');
INSERT INTO T_typeMaison VALUES ('T2', 'Contient 2 pieces');
INSERT INTO T_typeMaison VALUES ('T3', 'Contient 3 pieces');
INSERT INTO T_typeMaison VALUES ('T4', 'Contient 4 pieces');
INSERT INTO T_typeMaison VALUES ('T5', 'Contient 5 pieces');
INSERT INTO T_typeMaison VALUES ('T6', 'Contient 6 pieces');


INSERT INTO T_utilisateur VALUES ('admin@admin.admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin', 'ad', 'min', TRUE);

INSERT INTO T_annonce VALUES (default, 'Studio Balkany', 350, 30, 'individuel', 25, 'Petit studio trop chere pour ce que c est.', '4 Rue Raoul Fallereau', 'Arles', '13200', null, 'T1', 2, 'admin@admin.admin');
INSERT INTO T_annonce VALUES (default, 'Appart Sebastien', 500, 120, 'individuel', 90, 'La légende raconte que des sardines danses en faisant tourner des serviettes toute les nuits.', 'Rue Mareshall Geoffre', 'Salon de Pce', '13200', null, 'T3', 2, 'admin@admin.admin');
INSERT INTO T_annonce VALUES (default, 'Maison Wish', 980, 120, 'individuel', 120, 'Une maison construite uniquement avec des matériaux achetés sur Wish.', 'Rue Mareshall Geoffre', 'Salon de Pce', '13200', null, 'T5', 2, 'admin@admin.admin');
INSERT INTO T_annonce VALUES (default, 'Chambre PotDeBeurre', 500, 120, 'individuel', 1, 'Chambre du celebre sorcier Henry Pot de Beurre.', 'Rue Mareshall Geoffre', 'Salon de Pce', '13200', null, 'T1', 2, 'admin@admin.admin');
INSERT INTO T_annonce VALUES (default, 'Le Manoir', 1200, 120, 'individuel', 500, 'Une grande maison pour tous les désirs.', 'Sur la coline', 'Montpellier ', '34000', null, 'T6', 2, 'admin@admin.admin');
INSERT INTO T_annonce VALUES (default, 'Studio 2', 500, 120, 'individuel', 90, 'La légende raconte que des sardines danses en faisant tourner des serviettes toute les nuits.', 'Rue Mareshall Geoffre', 'Salon de Pce', '13200', null, 'T3', 2, 'admin@admin.admin');
INSERT INTO T_annonce VALUES (default, 'Petite Maison Dans La Prairie', 450, 80, 'individuel', 50, 'Endroit ideal pour se reconnecter avec la nature. N est pas fibré.', 'La prairie', 'Guéret ', '23000', null, 'T2', 2, 'admin@admin.admin');
