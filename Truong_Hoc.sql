CREATE DATABASE school;

USE school;
-----------------------------------------------
CREATE TABLE teacher (
	id_teacher INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);
-----------------------------------------------
CREATE TABLE student (
	id_student INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    id_teacher INT,
    FOREIGN KEY ( id_teacher ) REFERENCES teacher ( id_teacher )
);