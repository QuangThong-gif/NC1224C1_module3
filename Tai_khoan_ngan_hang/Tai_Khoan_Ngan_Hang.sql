CREATE DATABASE tai_khoan_ngan_hang;

USE tai_khoan_ngan_hang;
--------------------------------------------------
CREATE TABLE client (
	id_client INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);
--------------------------------------------------
CREATE TABLE account (
	id_account INT PRIMARY KEY AUTO_INCREMENT,
    id_client INT UNIQUE,
    account_balance DECIMAL (15, 2) NOT NULL,
    FOREIGN KEY ( id_client ) REFERENCES client ( id_client )
);