
CREATE TABLE T_annonce (
    A_idannonce      INTEGER PRIMARY KEY AUTOINCREMENT,
    A_titre          VARCHAR,
    A_cout_loyer     DECIMAL,
    A_cout_charges   DECIMAL,
    A_type_chauffage VARCHAR,
    A_superfice      DECIMAL,
    A_description    VARCHAR,
    A_adresse        VARCHAR,
    A_ville          VARCHAR,
    A_CP             INTEGER
);

CREATE TABLE T_typeMaison (
    T_type        VARCHAR PRIMARY KEY,
    T_description VARCHAR
);

CREATE TABLE T_energie (
    E_id_engie    INTEGER PRIMARY KEY AUTOINCREMENT,
    E_description VARCHAR
);

CREATE TABLE T_utilisateur (
    U_mail   VARCHAR PRIMARY KEY,
    U_mdp    VARCHAR,
    U_pseudo VARCHAR,
    U_nom,
    U_prenom
);

CREATE TABLE T_message (
    A_idannonce         INTEGER REFERENCES T_annonce (A_idannonce),
    U_mail              VARCHAR REFERENCES T_utilisateur (U_mail),
    M_dateheure_message DATE,
    M_texte_message     VARCHAR
);

CREATE TABLE T_photo (
    P_idphoto INTEGER PRIMARY KEY AUTOINCREMENT,
    P_titre   VARCHAR,
    P_nom     VARCHAR
);

