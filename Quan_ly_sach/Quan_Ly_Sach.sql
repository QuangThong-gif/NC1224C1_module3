CREATE DATABASE quan_li_sach;

USE quan_li_sach;
-----------------------------------------------------------------------------
CREATE TABLE tac_gia (
	id_tac_gia INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);
-----------------------------------------------------------------------------
CREATE TABLE sach (
	id_sach INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    price DECIMAL NULL,
    id_tac_gia INT,
    FOREIGN KEY (id_tac_gia) REFERENCES tac_gia (id_tac_gia)
);
-----------------------------------------------------------------------------
CREATE TABLE nhan_vien (
	id_nhan_vien INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NULL
);
-----------------------------------------------------------------------------
CREATE TABLE nhan_vien_ban_sach (
	id_nhan_vien INT, 
    id_sach INT,
    PRIMARY KEY (id_nhan_vien, id_sach),
    FOREIGN KEY (id_nhan_vien) REFERENCES nhan_vien (id_nhan_vien),
    FOREIGN KEY (id_sach) REFERENCES sach (id_sach)
);