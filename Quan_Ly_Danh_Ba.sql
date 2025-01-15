CREATE DATABASE quan_ly_danh_ba;

USE quan_li_danh_ba;
-------------------------------------------------------
CREATE TABLE person (
	id_person INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);
-------------------------------------------------------
CREATE TABLE phone_number (
	id_phone_number INT PRIMARY KEY AUTO_INCREMENT,
    id_person INT,
    number VARCHAR(11) NOT NULL,
    FOREIGN KEY ( id_person ) REFERENCES person ( id_person )
);
-------------------------------------------------------
CREATE TABLE email (
	id_email INT PRIMARY KEY AUTO_INCREMENT,
    id_person INT,
    address_email VARCHAR(255) NOT NULL,
    FOREIGN KEY ( id_person ) REFERENCES person ( id_person )
);