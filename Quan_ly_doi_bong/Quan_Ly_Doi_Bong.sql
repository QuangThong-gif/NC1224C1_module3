CREATE DATABASE ung_dung_quan_li_doi_bong;

USE ung_dung_quan_li_doi_bong;
-----------------------------------------------------
CREATE TABLE coach (
	id_coach INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    date_of_birth DATE
);
---------------------------------------------------------
CREATE TABLE team (
	id_team INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    id_coach INT,
    FOREIGN KEY ( id_coach ) REFERENCES coach ( id_coach )
);
----------------------------------------------------------
CREATE TABLE player (
	id_player INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    date_of_birth DATE,
    id_team INT,
    FOREIGN KEY ( id_team ) REFERENCES team ( id_team )
);
-----------------------------------------------------
CREATE TABLE location (
	id_location INT PRIMARY KEY AUTO_INCREMENT,
    location VARCHAR(50) NOT NULL
);
-----------------------------------------------------------
CREATE TABLE competition (
    id_competition INT PRIMARY KEY AUTO_INCREMENT,
    team_a INT NOT NULL,
    team_b INT NOT NULL,
    match_date_time TIMESTAMP,
    FOREIGN KEY (team_a) REFERENCES team (id_team),
    FOREIGN KEY (team_b) REFERENCES team (id_team),
    CHECK (team_a != team_b)
);
------------------------------------------------------------
CREATE TABLE player_position (
	id_player INT,
    id_location INT,
    PRIMARY KEY ( id_player, id_location ),
    FOREIGN KEY ( id_player ) REFERENCES player ( id_player ),
    FOREIGN KEY ( id_location ) REFERENCES location ( id_location )
);
-----------------------------------------------------------
CREATE TABLE player_match (
	id_player INT,
    id_competition INT,
    PRIMARY KEY ( id_player, id_competition ),
    FOREIGN KEY ( id_player ) REFERENCES player ( id_player ),
    FOREIGN KEY ( id_competition ) REFERENCES competition ( id_competition )
);
