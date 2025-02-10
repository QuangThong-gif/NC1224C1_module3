-- Tạo cơ sở dữ liệu
create database test_quan_ly_truong_hoc;
-------------------------------------------------------
-- Tạo bảng giao_vien
use test_quan_ly_truong_hoc;
---------------------------------------------------------
-- Tạo bảng giao_vien
CREATE TABLE giao_vien (
    ma_gv CHAR(5) PRIMARY KEY,
    ho_ten_gv VARCHAR(255)
);
-------------------------------------------------------
-- Tạo bảng lop
CREATE TABLE lop (
    ma_lop CHAR(5) PRIMARY KEY,
    ten_lop VARCHAR(255),
    ma_gvcn CHAR(5),
    nam_hoc VARCHAR(50),
    FOREIGN KEY (ma_gvcn) REFERENCES giao_vien(ma_gv)
);
---------------------------------------------------------
--- Tạo bảng hoc_sinh
CREATE TABLE hoc_sinh (
    ma_hs CHAR(5) PRIMARY KEY,
    ho_ten_hs VARCHAR(255),
    ho_ten_ph VARCHAR(255),
    gioi_tinh VARCHAR(10),
    dia_chi VARCHAR(255),
    ma_lop CHAR(5),
    FOREIGN KEY (ma_lop) REFERENCES lop(ma_lop)
);
-----------------------------------------------------------
-- Tạo bảng mon_hoc
CREATE TABLE mon_hoc (
    ma_mh CHAR(5) PRIMARY KEY,
    ten_mh VARCHAR(255)
);
----------------------------------------------------------
-- Tạo bảng ket_qua_hoc_tap
CREATE TABLE ket_qua_hoc_tap (
    ma_hs CHAR(5),
    hoc_ky VARCHAR(10),
    ma_mh CHAR(5),
    diem_thi_giua_ky FLOAT,
    diem_thi_cuoi_ky FLOAT,
    ngay_gio_thi_cuoi_ky DATETIME,
    PRIMARY KEY (ma_hs, hoc_ky, ma_mh),
    FOREIGN KEY (ma_hs) REFERENCES hoc_sinh(ma_hs),
    FOREIGN KEY (ma_mh) REFERENCES mon_hoc(ma_mh)
);
-----------------------------------------------------------
-- Tạo bảng phu_trach_bo_mon
CREATE TABLE phu_trach_bo_mon (
    ma_gvpt CHAR(5),
    ma_lop CHAR(5),
    ma_mh CHAR(5),
    hoc_ky VARCHAR(10),
    PRIMARY KEY (ma_gvpt, ma_lop, ma_mh, hoc_ky),
    FOREIGN KEY (ma_gvpt) REFERENCES giao_vien(ma_gv),
    FOREIGN KEY (ma_lop) REFERENCES lop(ma_lop),
    FOREIGN KEY (ma_mh) REFERENCES mon_hoc(ma_mh)
);
-------------------------------------------------------------
SET foreign_key_checks = 0;
-------------------------------------------------------------
INSERT INTO giao_vien (ma_gv, ho_ten_gv)
VALUES ('GV001', 'Nguyễn Văn Anh'),
       ('GV002', 'Trần Quốc Bảo'),
       ('GV003', 'Lê Thị Lan'),
       ('GV004', 'Phạm Minh Đức'),
       ('GV005', 'Võ Văn Nghĩa'),
       ('GV006', 'Huỳnh Thị Hoa'),
       ('GV007', 'Nguyễn Hoàng Nam'),
       ('GV008', 'Trần Văn Khánh'),
       ('GV009', 'Lê Thị Mai'),
       ('GV010', 'Hoàng Xuân Thanh');
-------------------------------------------------------------------
INSERT INTO lop (ma_lop, ten_lop, ma_gvcn, nam_hoc)
VALUES ('L0001', 'Lớp 1A', 'GV001', '2022-2023'),
       ('L0002', 'Lớp 2A', 'GV003', '2022-2023'),
       ('L0003', 'Lớp 1B', 'GV002', '2022-2023'),
       ('L0004', 'Lớp 2B', 'GV005', '2022-2023'),
       ('L0005', 'Lớp 3A', 'GV004', '2022-2023'),
       ('L0006', 'Lớp 4A', 'GV006', '2022-2023'),
       ('L0007', 'Lớp 3B', 'GV008', '2022-2023'),
       ('L0008', 'Lớp 4B', 'GV010', '2022-2023'),
       ('L0009', 'Lớp 5A', 'GV007', '2022-2023'),
       ('L0010', 'Lớp 5B', 'GV009', '2022-2023');
--------------------------------------------------------------------------------------
INSERT INTO hoc_sinh (ma_hs, ho_ten_hs, ho_ten_ph, gioi_tinh, dia_chi, ma_lop)
VALUES ('HS001', 'Nguyễn Văn Minh', 'Nguyễn Hoàng Linh', 'Nam', 'Thanh Khê', 'L0001'),
       ('HS002', 'Trần Thị Mai', 'Trần Văn Tuyến', 'Nữ', 'Hải Châu', 'L0002'),
       ('HS003', 'Lê Tuấn Anh', 'Lê Văn Tường', 'Nam', 'Thanh Khê', 'L0001'),
       ('HS004', 'Phạm Thị Hoa', 'Phạm Văn Lợi', 'Nữ', 'Sơn Trà', 'L0003'),
       ('HS005', 'Võ Minh Tuấn', 'Võ Văn Đại', 'Nam', 'Liên Chiểu', 'L0004'),
       ('HS006', 'Huỳnh Thị Lan', 'Huỳnh Văn Sơn', 'Nữ', 'Cẩm Lệ', 'L0005'),
       ('HS007', 'Nguyễn Hoàng Nam', 'Nguyễn Văn Quang', 'Nam', 'Hòa Vang', 'L0006'),
       ('HS008', 'Trần Minh Trí', 'Trần Văn Hoàng', 'Nam', 'Hải Châu', 'L0007'),
       ('HS009', 'Lê Thị Thanh', 'Lê Văn Tâm', 'Nữ', 'Thanh Khê', 'L0008'),
       ('HS010', 'Hoàng Quốc Bảo', 'Hoàng Văn Lâm', 'Nam', 'Cẩm Lệ', 'L0009'),
		('HS011', 'Nguyễn Thị Thu', 'Nguyễn Văn Hùng', 'Nữ', 'Thanh Khê', 'L0001'),
		('HS012', 'Trần Minh Hiếu', 'Trần Văn Hoàn', 'Nam', 'Hải Châu', 'L0002'),
		('HS013', 'Lê Thị Bình', 'Lê Văn Tuấn', 'Nữ', 'Thanh Khê', 'L0001'),
		('HS014', 'Phạm Minh Tuấn', 'Phạm Văn Đông', 'Nam', 'Sơn Trà', 'L0003'),
		('HS015', 'Võ Thị Hoài', 'Võ Văn An', 'Nữ', 'Liên Chiểu', 'L0004'),
		('HS016', 'Huỳnh Văn Thanh', 'Huỳnh Thị Trang', 'Nam', 'Cẩm Lệ', 'L0005'),
		('HS017', 'Nguyễn Văn Hải', 'Nguyễn Thị Ngọc', 'Nam', 'Hòa Vang', 'L0006'),
		('HS018', 'Trần Thị Hương', 'Trần Văn Đạo', 'Nữ', 'Hải Châu', 'L0007'),
		('HS019', 'Lê Minh Quân', 'Lê Thị Thảo', 'Nam', 'Thanh Khê', 'L0008'),
		('HS020', 'Hoàng Văn Phú', 'Hoàng Thị Lệ', 'Nam', 'Cẩm Lệ', 'L0009'),
        ('HS021', 'Nguyễn Minh Huy', 'Nguyễn Thị Mai', 'Nam', 'Thanh Khê', 'L0001'),
		('HS022', 'Trần Thị Thảo', 'Trần Văn Tùng', 'Nữ', 'Hải Châu', 'L0002'),
		('HS023', 'Lê Văn Đức', 'Lê Thị Hương', 'Nam', 'Thanh Khê', 'L0001'),
		('HS024', 'Phạm Thị Hoa', 'Phạm Văn Trung', 'Nữ', 'Sơn Trà', 'L0003'),
		('HS025', 'Võ Minh Tuấn', 'Võ Thị Ngọc', 'Nam', 'Liên Chiểu', 'L0004'),
		('HS026', 'Huỳnh Văn Quý', 'Huỳnh Thị Lan', 'Nam', 'Cẩm Lệ', 'L0005'),
		('HS027', 'Nguyễn Thị Tâm', 'Nguyễn Văn Anh', 'Nữ', 'Hòa Vang', 'L0006'),
		('HS028', 'Trần Văn Hoàng', 'Trần Thị Bình', 'Nam', 'Hải Châu', 'L0007'),
		('HS029', 'Lê Minh Tuấn', 'Lê Văn Thanh', 'Nam', 'Thanh Khê', 'L0008'),
		('HS030', 'Hoàng Thị Ngân', 'Hoàng Văn Phương', 'Nữ', 'Cẩm Lệ', 'L0009'),
		('HS031', 'Nguyễn Minh Thuận', 'Nguyễn Thị Hoài', 'Nam', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0001'),
		('HS032', 'Trần Thanh Thảo', 'Trần Văn Quân', 'Nữ', 'Hải Châu, Đà Nẵng', 'L0002'),
		('HS033', 'Lê Thị Kim', 'Lê Văn Trọng', 'Nữ', 'Cẩm Lệ, Đà Nẵng', 'L0003'),
		('HS034', 'Phạm Văn Hoàng', 'Phạm Thị Hà', 'Nam', 'Sơn Trà, Đà Nẵng', 'L0004'),
		('HS035', 'Võ Thị Lan', 'Võ Văn Sơn', 'Nữ', 'Ngũ Hành Sơn, Đà Nẵng', 'L0005'),
		('HS036', 'Huỳnh Văn Nam', 'Huỳnh Thị Thanh', 'Nam', 'Thanh Khê, Đà Nẵng', 'L0006'),
		('HS037', 'Nguyễn Thị Hương', 'Nguyễn Văn Huy', 'Nữ', 'Hòa Vang, Đà Nẵng', 'L0007'),
		('HS038', 'Trần Văn Đức', 'Trần Thị Ngọc', 'Nam', 'Hải Châu, Đà Nẵng', 'L0008'),
		('HS039', 'Lê Văn Quyền', 'Lê Thị Thu', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0009'),
		('HS040', 'Hoàng Minh Tuấn', 'Hoàng Văn Hoa', 'Nam', 'Sơn Trà, Đà Nẵng', 'L0010'),
		('HS041', 'Trần Văn Hưng', 'Trần Thị Lan', 'Nam', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0001'),
		('HS042', 'Nguyễn Thị Hà', 'Nguyễn Văn Tâm', 'Nữ', 'Hải Châu, Đà Nẵng', 'L0002'),
		('HS043', 'Lê Minh Hoàng', 'Lê Thị Hoàng', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0003'),
		('HS044', 'Phạm Thị Quỳnh', 'Phạm Văn Trung', 'Nữ', 'Sơn Trà, Đà Nẵng', 'L0004'),
		('HS045', 'Võ Minh Quân', 'Võ Thị Lan', 'Nam', 'Ngũ Hành Sơn, Đà Nẵng', 'L0005'),
		('HS046', 'Huỳnh Văn Thanh', 'Huỳnh Thị Thảo', 'Nam', 'Thanh Khê, Đà Nẵng', 'L0006'),
		('HS047', 'Nguyễn Văn Hùng', 'Nguyễn Thị Hương', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0007'),
		('HS048', 'Trần Minh Tuấn', 'Trần Thị Phương', 'Nam', 'Hải Châu, Đà Nẵng', 'L0008'),
		('HS049', 'Lê Thị Bích', 'Lê Văn Trọng', 'Nữ', 'Cẩm Lệ, Đà Nẵng', 'L0009'),
		('HS050', 'Hoàng Văn Lâm', 'Hoàng Thị Thu', 'Nam', 'Sơn Trà, Đà Nẵng', 'L0010'),
        ('HS051', 'Trần Minh Quang', 'Trần Thị Ánh', 'Nam', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0001'),
		('HS052', 'Nguyễn Văn Khánh', 'Nguyễn Thị Hoa', 'Nam', 'Hải Châu, Đà Nẵng', 'L0002'),
		('HS053', 'Lê Thị Thủy', 'Lê Văn Huy', 'Nữ', 'Cẩm Lệ, Đà Nẵng', 'L0003'),
		('HS054', 'Phạm Minh Trí', 'Phạm Thị Ngọc', 'Nam', 'Sơn Trà, Đà Nẵng', 'L0004'),
		('HS055', 'Võ Thị Trang', 'Võ Văn Đức', 'Nữ', 'Ngũ Hành Sơn, Đà Nẵng', 'L0005'),
		('HS056', 'Huỳnh Minh Hoa', 'Huỳnh Thị Lan', 'Nam', 'Thanh Khê, Đà Nẵng', 'L0006'),
		('HS057', 'Nguyễn Văn Phúc', 'Nguyễn Thị Thu', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0007'),
		('HS058', 'Trần Thị Thảo', 'Trần Văn Tài', 'Nữ', 'Hải Châu, Đà Nẵng', 'L0008'),
		('HS059', 'Lê Văn Long', 'Lê Thị Ngọc', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0009'),
		('HS060', 'Hoàng Thị Hương', 'Hoàng Văn Đức', 'Nữ', 'Sơn Trà, Đà Nẵng', 'L0010'),
        ('HS061', 'Ngô Thị Kim', 'Ngô Văn Hải', 'Nữ', 'Sơn Trà, Đà Nẵng', 'L0001'),
		('HS062', 'Trương Văn Đạt', 'Trương Thị Nga', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0002'),
		('HS063', 'Phan Minh Tuấn', 'Phan Thị Mai', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0003'),
		('HS064', 'Lâm Thị Lan', 'Lâm Văn Đạt', 'Nữ', 'Hải Châu, Đà Nẵng', 'L0004'),
		('HS065', 'Trần Văn Hậu', 'Trần Thị Tuyết', 'Nam', 'Thanh Khê, Đà Nẵng', 'L0005'),
		('HS066', 'Võ Thị Hoàng', 'Võ Văn Long', 'Nữ', 'Ngũ Hành Sơn, Đà Nẵng', 'L0006'),
		('HS067', 'Huỳnh Minh Tuấn', 'Huỳnh Thị Thảo', 'Nam', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0007'),
		('HS068', 'Lý Thị Hương', 'Lý Văn Hiếu', 'Nữ', 'Sơn Trà, Đà Nẵng', 'L0008'),
		('HS069', 'Nguyễn Minh Đức', 'Nguyễn Thị Trang', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0009'),
		('HS070', 'Hoàng Văn Tùng', 'Hoàng Thị Phương', 'Nam', 'Hải Châu, Đà Nẵng', 'L0010'),
        ('HS071', 'Nguyễn Thị Trang', 'Nguyễn Văn Long', 'Nữ', 'Hòa Vang, Đà Nẵng', 'L0001'),
		('HS072', 'Trần Văn Đạt', 'Trần Thị Nga', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0002'),
		('HS073', 'Lê Minh Tuấn', 'Lê Thị Mai', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0003'),
		('HS074', 'Phạm Văn Thanh', 'Phạm Văn Đạt', 'Nam', 'Ngũ Hành Sơn, Đà Nẵng', 'L0004'),
		('HS075', 'Lâm Minh Hiếu', 'Lâm Văn Hải', 'Nam', 'Hải Châu, Đà Nẵng', 'L0005'),
		('HS076', 'Trương Minh Tuấn', 'Trương Thị Tuyết', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0006'),
		('HS077', 'Võ Văn Hậu', 'Võ Thị Hoàng', 'Nam', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0007'),
		('HS078', 'Huỳnh Thị Lan', 'Huỳnh Minh Tuấn', 'Nữ', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0008'),
		('HS079', 'Lý Văn Đạt', 'Lý Thị Hương', 'Nam', 'Sơn Trà, Đà Nẵng', 'L0009'),
		('HS080', 'Ngô Minh Trang', 'Ngô Thị Kim', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0010'),
        ('HS081', 'Trần Văn Hùng', 'Trần Thị Lan', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0001'),
		('HS082', 'Lê Thị Thảo', 'Lê Văn Minh', 'Nữ', 'Hải Châu, Đà Nẵng', 'L0002'),
		('HS083', 'Nguyễn Văn Long', 'Nguyễn Thị Hoài', 'Nam', 'Ngũ Hành Sơn, Đà Nẵng', 'L0003'),
		('HS084', 'Phạm Thị Hoa', 'Phạm Văn Đức', 'Nữ', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0004'),
		('HS085', 'Lâm Minh Tuấn', 'Lâm Văn Định', 'Nam', 'Sơn Trà, Đà Nẵng', 'L0005'),
		('HS086', 'Trương Thị Hồng', 'Trương Văn Thanh', 'Nữ', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0006'),
		('HS087', 'Võ Minh Hải', 'Võ Thị Thùy', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0007'),
		('HS088', 'Huỳnh Văn Đạt', 'Huỳnh Thị Thanh', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0008'),
		('HS089', 'Lý Minh Tuấn', 'Lý Thị Lan', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0009'),
		('HS090', 'Ngô Thị Hà', 'Ngô Văn Nam', 'Nữ', 'Hải Châu, Đà Nẵng', 'L0010'),
        ('HS091', 'Nguyễn Thị Trang', 'Nguyễn Văn Lâm', 'Nữ', 'Hải Châu, Đà Nẵng', 'L0001'),
		('HS092', 'Trần Minh Tâm', 'Trần Thị Hoài', 'Nam', 'Ngũ Hành Sơn, Đà Nẵng', 'L0002'),
		('HS093', 'Lê Thị Thuận', 'Lê Văn Đạt', 'Nữ', 'Cẩm Lệ, Đà Nẵng', 'L0003'),
		('HS094', 'Phạm Minh Tú', 'Phạm Văn Hưng', 'Nam', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0004'),
		('HS095', 'Lâm Thị Mỹ Duyên', 'Lâm Văn Thảo', 'Nữ', 'Sơn Trà, Đà Nẵng', 'L0005'),
		('HS096', 'Trương Minh Thanh', 'Trương Thị Hồng', 'Nam', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0006'),
		('HS097', 'Võ Minh Trí', 'Võ Thị Thảo', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0007'),
		('HS098', 'Huỳnh Thị Thùy Trang', 'Huỳnh Văn Tùng', 'Nữ', 'Cẩm Lệ, Đà Nẵng', 'L0008'),
		('HS099', 'Lý Văn Trường', 'Lý Thị Lan Anh', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0009'),
		('HS100', 'Ngô Văn Nam', 'Ngô Thị Hà', 'Nam', 'Hải Châu, Đà Nẵng', 'L0010');
-----------------------------------------------------------------------------------------------------------        
INSERT INTO mon_hoc (ma_mh, ten_mh)
VALUES 
    ('MH001', 'Toán học'),
    ('MH002', 'Ngữ văn'),
    ('MH003', 'Lịch sử'),
    ('MH004', 'Địa lý'),
    ('MH005', 'Sinh học'),
    ('MH006', 'Vật lí'),
    ('MH007', 'Hóa học'),
    ('MH008', 'Giáo dục công dân'),
    ('MH009', 'Thể dục'),
    ('MH010', 'Âm nhạc');
-------------------------------------------------------------------------------------------------------
INSERT INTO ket_qua_hoc_tap (ma_hs, hoc_ky, ma_mh, diem_thi_giua_ky, diem_thi_cuoi_ky, ngay_gio_thi_cuoi_ky)
VALUES 
    ('HS001', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 08:00:00'),
    ('HS002', 'Học kỳ 1', 'MH001', 7.0, 7.5, '2023-01-15 09:30:00'),
    ('HS003', 'Học kỳ 1', 'MH001', 6.5, 7.0, '2023-01-15 08:00:00'),
    ('HS004', 'Học kỳ 1', 'MH001', 8.0, 8.5, '2023-01-15 09:30:00'),
    ('HS005', 'Học kỳ 1', 'MH001', 9.0, 9.5, '2023-01-15 08:00:00'),
    ('HS006', 'Học kỳ 1', 'MH001', 7.5, 8.0, '2023-01-15 09:30:00'),
    ('HS007', 'Học kỳ 1', 'MH001', 6.0, 6.5, '2023-01-15 08:00:00'),
    ('HS008', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 09:30:00'),
    ('HS009', 'Học kỳ 1', 'MH001', 7.0, 7.5, '2023-01-15 08:00:00'),
    ('HS010', 'Học kỳ 1', 'MH001', 6.5, 7.0, '2023-01-15 09:30:00'),
    ('HS011', 'Học kỳ 1', 'MH001', 8.0, 8.5, '2023-01-15 08:00:00'),
    ('HS012', 'Học kỳ 1', 'MH001', 9.0, 9.5, '2023-01-15 09:30:00'),
    ('HS013', 'Học kỳ 1', 'MH001', 7.5, 8.0, '2023-01-15 08:00:00'),
    ('HS014', 'Học kỳ 1', 'MH001', 6.0, 6.5, '2023-01-15 09:30:00'),
    ('HS015', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 08:00:00'),
    ('HS016', 'Học kỳ 1', 'MH001', 7.0, 7.5, '2023-01-15 09:30:00'),
    ('HS017', 'Học kỳ 1', 'MH001', 6.5, 7.0, '2023-01-15 08:00:00'),
    ('HS018', 'Học kỳ 1', 'MH001', 8.0, 8.5, '2023-01-15 09:30:00'),
    ('HS019', 'Học kỳ 1', 'MH001', 9.0, 9.5, '2023-01-15 08:00:00'),
    ('HS020', 'Học kỳ 1', 'MH001', 7.5, 8.0, '2023-01-15 09:30:00'),
    ('HS021', 'Học kỳ 1', 'MH001', 6.0, 6.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS022 đến HS050)
    ('HS022', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS023 đến HS050)
    ('HS023', 'Học kỳ 1', 'MH001', 6.5, 7.0, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS024 đến HS050)
    ('HS024', 'Học kỳ 1', 'MH001', 8.0, 8.5, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS025 đến HS050)
    ('HS025', 'Học kỳ 1', 'MH001', 9.0, 9.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS026 đến HS050)
    ('HS026', 'Học kỳ 1', 'MH001', 7.5, 8.0, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS027 đến HS050)
    ('HS027', 'Học kỳ 1', 'MH001', 6.0, 6.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS028 đến HS050)
    ('HS028', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS029 đến HS050)
    ('HS029', 'Học kỳ 1', 'MH001', 7.0, 7.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS030 đến HS050)
    ('HS030', 'Học kỳ 1', 'MH001', 6.5, 7.0, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS031 đến HS050)
    ('HS031', 'Học kỳ 1', 'MH001', 8.0, 8.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS032 đến HS050)
    ('HS032', 'Học kỳ 1', 'MH001', 9.0, 9.5, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS033 đến HS050)
    ('HS033', 'Học kỳ 1', 'MH001', 7.5, 8.0, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS034 đến HS050)
    ('HS034', 'Học kỳ 1', 'MH001', 6.0, 6.5, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS035 đến HS050)
    ('HS035', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS036 đến HS050)
    ('HS036', 'Học kỳ 1', 'MH001', 7.0, 7.5, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS037 đến HS050)
    ('HS037', 'Học kỳ 1', 'MH001', 6.5, 7.0, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS038 đến HS050)
    ('HS038', 'Học kỳ 1', 'MH001', 8.0, 8.5, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS039 đến HS050)
    ('HS039', 'Học kỳ 1', 'MH001', 9.0, 9.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS040 đến HS050)
    ('HS040', 'Học kỳ 1', 'MH001', 7.5, 8.0, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS041 đến HS050)
    ('HS041', 'Học kỳ 1', 'MH001', 6.0, 6.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS042 đến HS050)
    ('HS042', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS043 đến HS050)
    ('HS043', 'Học kỳ 1', 'MH001', 7.0, 7.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS044 đến HS050)
    ('HS044', 'Học kỳ 1', 'MH001', 6.5, 7.0, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS045 đến HS050)
    ('HS045', 'Học kỳ 1', 'MH001', 8.0, 8.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS046 đến HS050)
    ('HS046', 'Học kỳ 1', 'MH001', 9.0, 9.5, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS047 đến HS050)
    ('HS047', 'Học kỳ 1', 'MH001', 7.5, 8.0, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS048 đến HS050)
    ('HS048', 'Học kỳ 1', 'MH001', 6.0, 6.5, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS049 đến HS050)
    ('HS049', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS050)
    ('HS050', 'Học kỳ 1', 'MH001', 7.0, 7.5, '2023-01-15 09:30:00');
-------------------------------------------------------------------------
INSERT INTO phu_trach_bo_mon (ma_gvpt, ma_lop, ma_mh, hoc_ky)
VALUES 
    ('GV001', 'L0001', 'MH001', 'Học kỳ 1'),
    ('GV002', 'L0003', 'MH002', 'Học kỳ 1'),
    ('GV003', 'L0002', 'MH003', 'Học kỳ 1'),
    ('GV004', 'L0004', 'MH004', 'Học kỳ 1'),
    ('GV005', 'L0005', 'MH005', 'Học kỳ 1'),
    ('GV006', 'L0006', 'MH006', 'Học kỳ 1'),
    ('GV007', 'L0007', 'MH007', 'Học kỳ 1'),
    ('GV008', 'L0008', 'MH008', 'Học kỳ 1'),
    ('GV009', 'L0009', 'MH009', 'Học kỳ 1'),
    ('GV010', 'L0010', 'MH010', 'Học kỳ 1'),
    ('GV001', 'L0001', 'MH001', 'Học kỳ 2'),
    ('GV002', 'L0003', 'MH002', 'Học kỳ 2'),
    ('GV003', 'L0002', 'MH003', 'Học kỳ 2'),
    ('GV004', 'L0004', 'MH004', 'Học kỳ 2'),
    ('GV005', 'L0005', 'MH005', 'Học kỳ 2'),
    ('GV006', 'L0006', 'MH006', 'Học kỳ 2'),
    ('GV007', 'L0007', 'MH007', 'Học kỳ 2'),
    ('GV008', 'L0008', 'MH008', 'Học kỳ 2'),
    ('GV009', 'L0009', 'MH009', 'Học kỳ 2'),
    ('GV010', 'L0010', 'MH010', 'Học kỳ 2');
--------------------------------------------------------------------------------    
SET foreign_key_checks = 1;
/*----------------------LIỆT KÊ THÔNG TIN----------------------------*/
/*---a. Toàn bộ thông tin giáo viên trong trường---*/
SELECT * FROM giao_vien;

/*---b. Họ tên học sinh, giới tính, họ tên phu huynh---*/
SELECT hs.ho_ten_hs, hs.gioi_tinh, hs.ho_ten_ph
FROM hoc_sinh hs;

/*---c.Tất cả học sinh của các lớp trong trường---*/
SELECT * FROM lop;

/*----------------------TRUY VẤN DỮ LIỆU HỌC SINH & LỚP HỌC----------------------------*/
/*---a. Những học sinh có giới tính Nam---*/
SELECT * FROM hoc_sinh
WHERE gioi_tinh = 'Nam';

/*---b. Những học sinh chưa có tên phụ huynh---*/
SELECT * FROM hoc_sinh
WHERE ho_ten_ph IS NULL;

/*---c.. Những lớp chưa có giáo viên chủ nhiệm---*/
SELECT * FROM lop
WHERE ma_gvcn IS NULL;

/*---d. Những học sinh chưa có lớp---*/
SELECT * FROM hoc_sinh
WHERE ma_lop IS NULL;

/*---e. Những học sinh nữ ở Thanh Khê---*/
SELECT * FROM hoc_sinh
WHERE gioi_tinh = 'Nữ' AND dia_chi LIKE '%Thanh Khê%';

/*---f. Những học sinh Nam ở Hải Châu hoặc học sinh nữ ở Thanh Khê---*/
SELECT * FROM hoc_sinh 
WHERE ( gioi_tinh = 'Nam' AND dia_chi LIKE '%Hải Châu%' ) OR ( gioi_tinh = 'Nữ' AND dia_chi LIKE '%Thanh Khê%' );

/*---g. Những học sinh Nam chưa có tên phụ huynh hoặc học sinh nữ chưa được phân lớp---*/
SELECT * FROM hoc_sinh
WHERE ( gioi_tinh = 'Nam' AND ho_ten_ph IS NULL ) OR ( gioi_tinh = 'Nữ' AND ma_lop IS NULL );

/*---h. Những học sinh Nam chưa được phân lớp và chưa có tên phụ huynh---*/
SELECT * FROM hoc_sinh
WHERE gioi_tinh = 'Nam' AND (ma_lop IS NULL OR ho_ten_ph IS NULL);

/*---i. Những mã môn học được dạy ở học kì 2---*/
SELECT DISTINCT ma_mh
FROM phu_trach_bo_mon
WHERE hoc_ky = 'Học kỳ 2';

/*----------------------LUYỆN TẬP VỀ LIKE----------------------------*/
/*---a. Những học sinh bắt đầu từ Nguyễn---*/
SELECT * FROM hoc_sinh 
WHERE ho_ten_hs LIKE 'Nguyễn%';

/*---b. Những học sinh có tên kết thúc bằng từ Nở---*/
SELECT * FROM hoc_sinh
WHERE ho_ten_hs LIKE '%Mai';

/*---c. Những học sinh có tên chứa chữ Thị---*/
SELECT * FROM hoc_sinh
WHERE ho_ten_hs LIKE '%Thị%';

/*---d. Những học sinh có tên chứa chữ Thị ở giữa ( không được ở đầu và ở cuối )---*/
SELECT * FROM hoc_sinh
WHERE ho_ten_hs LIKE '%Thị%' AND ho_ten_hs NOT LIKE 'Thị%' AND ho_ten_hs NOT LIKE '%Thị';

/*---e. Những học sinh có họ tên và độ dài 30 kí tự (kể cả khoảng trắng)---*/
SELECT * FROM hoc_sinh
WHERE LENGTH(ho_ten_hs) = 30;
 
/*---f. Những học sinh có họ tên và độ dài tối đa 30 kí tự---*/
SELECT * FROM hoc_sinh
WHERE LENGTH(ho_ten_hs) <= 30;

/*---g. Những học sinh có họ tên với độ dài tối đa là 30 ký tự và bắt đầu bằng ký tự 'N'---*/
SELECT * FROM hoc_sinh
WHERE LENGTH(ho_ten_hs) <= 30 AND ho_ten_hs LIKE 'N%';

/*---h. Những học sinh có họ tên bắt đầu bằng các kí tự: N,T,V---*/
SELECT * FROM hoc_sinh
WHERE ho_ten_hs LIKE 'N%' OR ho_ten_hs LIKE 'T%' OR ho_ten_hs LIKE 'V%';

/*---i. Những học sinh có họ tên hong được bắt đầu bằng các kí tự: N,T,V---*/
SELECT * FROM hoc_sinh
WHERE ho_ten_hs NOT LIKE 'N%' AND ho_ten_hs NOT LIKE 'T%' AND ho_ten_hs NOT LIKE 'V%';

/*---j. Những học sinh có tên với phần họ có đúng 4 kí tự---*/
SELECT * FROM hoc_sinh
WHERE LENGTH(SUBSTRING_INDEX(ho_ten_hs,' ', 1)) = 4;

/*----------------------LUYỆN TẬP VỀ DISTINCT----------------------------*/
-- Hãy liệt kê 
-- a. Họ tên của toàn bộ học sinh trong trường, nếu họ tên nào trùng nhau thì chỉ hiển thị 1 lần. 
SELECT DISTINCT ho_ten_hs 
FROM hoc_sinh;

-- b. Mã lớp của các lớp đã có học sinh học ở lớp đó. Nếu mã lớp nào trùng nhau thì chỉ hiển thị 1 lần. 
SELECT DISTINCT ma_lop 
FROM hoc_sinh;

-- c. Mã môn học của những môn học đã có ít nhất 1 giáo viên được phân công phụ trách rồi. (*) 
SELECT DISTINCT ma_mh 
FROM phu_trach_bo_mon
WHERE ma_mh IS NOT NULL;

-- d. Mã môn học của những môn học đã từng được tổ chức thì ít nhất 1 lần. 
SELECT DISTINCT ma_mh 
FROM ket_qua_hoc_tap;

-- e. Mã giáo viên của những giáo viên đã từng làm chủ nhiệm cho ít nhất 1 lớp nào đó.
SELECT DISTINCT ma_gvcn 
FROM lop;

/*----------------------LUYỆN TẬP VỀ ORDER BY----------------------------*/
-- Hãy liệt kê
-- a. Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp tăng dần theo họ tên học sinh. 
SELECT * FROM hoc_sinh
ORDER BY ho_ten_hs ASC;

-- b. Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp giảm dần theo địa chỉ. 
SELECT * FROM hoc_sinh
ORDER BY dia_chi DESC;

-- c. Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp tăng dần theo họ tên học sinh và giảm dần theo địa chỉ.
SELECT * FROM hoc_sinh
ORDER BY ho_ten_hs ASC, dia_chi DESC;
 
-- d. Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp tăng dần theo họ tên học sinh và tăng dần theo địa chỉ. 
SELECT * FROM hoc_sinh
ORDER BY ho_ten_hs ASC, dia_chi ASC;

-- e. Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp giảm dần theo họ tên học sinh, giảm dần theo địa chỉ. 
SELECT * FROM hoc_sinh
ORDER BY ho_ten_hs DESC, dia_chi DESC;

-- f. Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp giảm dần theo họ tên học sinh, giảm dần theo địa chỉ và tăng dần theo họ tên phụ huynh.
SELECT * FROM hoc_sinh
ORDER BY ho_ten_hs DESC, dia_chi DESC, ho_ten_ph ASC;

/*----------------------LUYỆN TẬP VỀ JOIN 2 BẢNG----------------------------*/
-- Hãy liệt kê
-- a. Mã học sinh, họ tên học sinh, giới tính, mã lớp, tên lớp, mã giáo viên chủ nhiệm của tất cả học sinh trong trường.
SELECT hs.ma_hs, hs.ho_ten_hs, hs.gioi_tinh, hs.ma_lop, lop.ten_lop, lop.ma_gvcn
FROM hoc_sinh hs
INNER JOIN lop ON hs.ma_lop = lop.ma_lop;

-- b. Mã học sinh, họ tên học sinh, học kỳ, mã môn học, điểm thi giữa kỳ, điểm thi cuối kỳ của tất cả học sinh và các môn học có kết quả tương ứng với từng học sinh trong trường.
SELECT hs.ma_hs, hs.ho_ten_hs, kq.hoc_ky, kq.ma_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky
FROM hoc_sinh hs
INNER JOIN ket_qua_hoc_tap kq ON hs.ma_hs = kq.ma_hs;

-- c. Mã giáo viên, họ tên giáo viên, mã lớp, mã môn học, học kỳ của những giáo viên đã được giao phụ trách ít nhất một môn học.
SELECT gv.ma_gv, gv.ho_ten_gv, ptbm.ma_lop, ptbm.ma_mh, ptbm.hoc_ky
FROM giao_vien gv
INNER JOIN phu_trach_bo_mon ptbm ON gv.ma_gv = ptbm.ma_gvpt;

-- d. Suy nghĩ về yêu cầu a: Nếu học sinh chưa được phân lớp thì liệu có liệt kê được học sinh đó không?
SELECT hs.ma_hs, hs.ho_ten_hs, hs.gioi_tinh, hs.ma_lop, lop.ten_lop, lop.ma_gvcn
FROM hoc_sinh hs
LEFT JOIN lop ON hs.ma_lop = lop.ma_lop;

-- e. Suy nghĩ về yêu cầu b: Nếu học sinh chưa có kết quả thi của môn nào cả thì liệu có liệt kê được học sinh đó không?
SELECT hs.ma_hs, hs.ho_ten_hs, kq.hoc_ky, kq.ma_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky
FROM hoc_sinh hs
LEFT JOIN ket_qua_hoc_tap kq ON hs.ma_hs = kq.ma_hs;

-- f. Suy nghĩ về yêu cầu c: Nếu giáo viên chưa phụ trách một môn nào cả thì liệu có liệt kê được giáo viên đó không?
SELECT gv.ma_gv, gv.ho_ten_gv, ptbm.ma_lop, ptbm.ma_mh, ptbm.hoc_ky
FROM giao_vien gv
LEFT JOIN phu_trach_bo_mon ptbm ON gv.ma_gv = ptbm.ma_gvpt;

/*----------------------LUYỆN TẬP VỀ JOIN NHIỀU BẢNG----------------------------*/
-- Hãy liệt kê
-- a. MaHS, HoTenHS, GioiTinh, MaLop, TenLop, NamHoc, MaGVCN, HoTenGV (chủ nhiệm) của học sinh trong trường.
SELECT hs.ma_hs, hs.ho_ten_hs, hs.gioi_tinh, hs.ma_lop, lop.ten_lop, lop.nam_hoc, lop.ma_gvcn, gv.ho_ten_gv 
AS ho_ten_gv_chu_nhiem
FROM hoc_sinh hs
JOIN lop ON hs.ma_lop = lop.ma_lop
JOIN giao_vien gv ON lop.ma_gvcn = gv.ma_gv;

-- b. MaHS, HoTenHS, HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy của học sinh và các môn học đã có kết quả tương ứng với từng học sinh trong trường.
SELECT kq.ma_hs, hs.ho_ten_hs, kq.hoc_ky, kq.ma_mh, mh.ten_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky
FROM ket_qua_hoc_tap kq
JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
JOIN mon_hoc mh ON kq.ma_mh = mh.ma_mh;

-- c. MaHS, HoTenHS, HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaLop, MaGV (phụ trách), HoTenGV (phụ trách) của học sinh và các môn học đã có kết quả tương ứng với từng học sinh trong trường.
SELECT kq.ma_hs, hs.ho_ten_hs, kq.hoc_ky, kq.ma_mh, mh.ten_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky, hs.ma_lop, lop.ma_gvcn, gv.ho_ten_gv 
AS ho_ten_gv_chu_nhiem
FROM ket_qua_hoc_tap kq
JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
JOIN mon_hoc mh ON kq.ma_mh = mh.ma_mh
JOIN lop ON hs.ma_lop = lop.ma_lop
JOIN giao_vien gv ON lop.ma_gvcn = gv.ma_gv;

-- d. MaHS, HoTenHS, MaLop, MaGVCN, HoTenGV (chủ nhiệm), HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaGV (phụ trách), HoTenGV (phụ trách) của học sinh và các môn học đã có kết quả tương ứng với từng học sinh trong trường.
SELECT kq.ma_hs, hs.ho_ten_hs, hs.ma_lop, lop.ma_gvcn, gv_chu_nhiem.ho_ten_gv 
AS ho_ten_gv_chu_nhiem, kq.hoc_ky, kq.ma_mh, mh.ten_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky, ptbm.ma_gvpt 
AS ma_gv_phu_trach, gv_phu_trach.ho_ten_gv 
AS ho_ten_gv_phu_trach
FROM ket_qua_hoc_tap kq
JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
JOIN lop ON hs.ma_lop = lop.ma_lop
JOIN giao_vien gv_chu_nhiem ON lop.ma_gvcn = gv_chu_nhiem.ma_gv
JOIN mon_hoc mh ON kq.ma_mh = mh.ma_mh
LEFT JOIN phu_trach_bo_mon ptbm ON ptbm.ma_mh = mh.ma_mh AND ptbm.ma_lop = hs.ma_lop AND ptbm.hoc_ky = kq.hoc_ky
LEFT JOIN giao_vien gv_phu_trach ON ptbm.ma_gvpt = gv_phu_trach.ma_gv;

-- e. MaHS, HoTenHS, MaLop, MaGVCN, HoTenGV (chủ nhiệm), HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaGV (phụ trách), HoTenGV (phụ trách) của những học sinh nữ với các môn học đã có kết quả thi cuối kỳ hoặc giữa kỳ được 9 điểm trở lên.
SELECT kq.ma_hs, hs.ho_ten_hs, hs.ma_lop, lop.ma_gvcn, gv_chu_nhiem.ho_ten_gv 
AS ho_ten_gv_chu_nhiem, kq.hoc_ky, kq.ma_mh, mh.ten_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky, ptbm.ma_gvpt 
AS ma_gv_phu_trach, gv_phu_trach.ho_ten_gv 
AS ho_ten_gv_phu_trach
FROM ket_qua_hoc_tap kq
JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
JOIN lop ON hs.ma_lop = lop.ma_lop
JOIN giao_vien gv_chu_nhiem ON lop.ma_gvcn = gv_chu_nhiem.ma_gv
JOIN mon_hoc mh ON kq.ma_mh = mh.ma_mh
LEFT JOIN phu_trach_bo_mon ptbm ON ptbm.ma_mh = mh.ma_mh AND ptbm.ma_lop = hs.ma_lop AND ptbm.hoc_ky = kq.hoc_ky
LEFT JOIN giao_vien gv_phu_trach ON ptbm.ma_gvpt = gv_phu_trach.ma_gv
WHERE (kq.diem_thi_giua_ky >= 9 OR kq.diem_thi_cuoi_ky >= 9)
AND hs.gioi_tinh = 'Nữ';

-- f. MaHS, HoTenHS, HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaLop, MaGV (phụ trách), HoTenGV (phụ trách) của học sinh và các môn học đã có kết quả tương ứng với từng học sinh trong trường. 
-- Chỉ hiển thị những môn học mà giáo viên phụ trách môn đó cũng chính là giáo viên chủ nhiệm của lớp.
SELECT kq.ma_hs, hs.ho_ten_hs, kq.hoc_ky, kq.ma_mh, mh.ten_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky, hs.ma_lop, lop.ma_gvcn, gv.ho_ten_gv 
AS ho_ten_gv_chu_nhiem
FROM ket_qua_hoc_tap kq
JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
JOIN lop ON hs.ma_lop = lop.ma_lop
JOIN giao_vien gv ON lop.ma_gvcn = gv.ma_gv
JOIN mon_hoc mh ON kq.ma_mh = mh.ma_mh
LEFT JOIN phu_trach_bo_mon ptbm ON lop.ma_gvcn = ptbm.ma_gvpt 
AND mh.ma_mh = ptbm.ma_mh 
AND kq.hoc_ky = ptbm.hoc_ky
WHERE ptbm.ma_gvpt IS NOT NULL;

-- g. MaMH, MaLop, HocKy của những môn học đã được thi cuối kỳ vào năm 2023.
SELECT kq.ma_mh, hs.ma_lop, kq.hoc_ky
FROM ket_qua_hoc_tap kq
JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
WHERE YEAR(kq.ngay_gio_thi_cuoi_ky) = 2023;

-- h. MaMH, MaLop, HocKy của những môn học đã được thi vào tháng 8 năm 2023.
SELECT kq.ma_mh, hs.ma_lop, kq.hoc_ky
FROM ket_qua_hoc_tap kq
JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
WHERE YEAR(kq.ngay_gio_thi_cuoi_ky) = 2023
AND MONTH(kq.ngay_gio_thi_cuoi_ky) = 8;

-- i. MaMH, MaLop, HocKy của những môn học đã được thi trước ngày 20 tháng 8 năm 2023.
SELECT kq.ma_mh, hs.ma_lop, kq.hoc_ky
FROM ket_qua_hoc_tap kq
JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
WHERE kq.ngay_gio_thi_cuoi_ky < '2023-01-15';

-- j. MaMH, MaLop, HocKy của những môn học đã được thi trước ngày 20 tháng 8 năm 2023 đúng 1 tuần.
SELECT kq.ma_mh, hs.ma_lop, kq.hoc_ky
FROM ket_qua_hoc_tap kq
JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
WHERE kq.ngay_gio_thi_cuoi_ky >= '2023-08-13'
AND kq.ngay_gio_thi_cuoi_ky < '2023-08-20';

-- k. MaMH, MaLop, HocKy của những môn học đã được thi sau ngày 20 tháng 8 năm 2023 đúng 21 ngày.
SELECT kq.ma_mh, hs.ma_lop, kq.hoc_ky
FROM ket_qua_hoc_tap kq
JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
WHERE kq.ngay_gio_thi_cuoi_ky >= '2023-09-10'
AND kq.ngay_gio_thi_cuoi_ky <= '2023-10-01';

-- l. MaMH, MaLop, HocKy của những môn học đã được thi trong khoảng từ ngày 10 đến ngày 20 tháng 8 năm 2023.
SELECT kq.ma_mh, hs.ma_lop, kq.hoc_ky
FROM ket_qua_hoc_tap kq
JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
WHERE kq.ngay_gio_thi_cuoi_ky >= '2023-08-10'
AND kq.ngay_gio_thi_cuoi_ky <= '2023-08-20';

-- m. MaMH, MaLop, HocKy của những môn học đã được thi trong khoảng từ 10 giờ 00 phút ngày 10 đến 20 giờ 30 phút ngày 20 tháng 8 năm 2023.
SELECT kq.ma_mh, hs.ma_lop, kq.hoc_ky
FROM ket_qua_hoc_tap kq
JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
WHERE kq.ngay_gio_thi_cuoi_ky >= '2023-08-10 10:00:00' AND kq.ngay_gio_thi_cuoi_ky <= '2023-08-20 20:30:00';
  
/*----------------------LUYỆN TẬP VỀ GROUP BY & HAVING----------------------------*/
-- a. Liệt kê những địa chỉ khác nhau trong bảng hoc_sinh (bằng 2 cách khác nhau).
SELECT DISTINCT dia_chi 
FROM hoc_sinh;

SELECT dia_chi
FROM hoc_sinh
GROUP BY dia_chi;

-- b. Liệt kê ho_ten_hs, gioi_tinh của các nhóm được phân nhóm theo ho_ten_hs và gioi_tinh trong bảng hoc_sinh.
SELECT ho_ten_hs, gioi_tinh
FROM hoc_sinh
GROUP BY ho_ten_hs, gioi_tinh;

-- c. Liệt kê ho_ten_hs của các nhóm được phân nhóm theo ho_ten_hs và gioi_tinh trong bảng hoc_sinh. Chú ý thử giải thích vì sao không liệt kê gioi_tinh mà vẫn không bị lỗi.
SELECT ho_ten_hs
FROM hoc_sinh
GROUP BY ho_ten_hs;

-- d. Liệt kê ma_mh, ten_mh, diem_thi_cuoi_ky của từng môn học chia theo từng mức điểm thi cuối kỳ. (Gợi ý: chỉ liệt kê những môn đã từng có học sinh thi cuối kỳ.)
SELECT kq.ma_mh, mh.ten_mh, kq.diem_thi_cuoi_ky
FROM ket_qua_hoc_tap kq
JOIN mon_hoc mh ON kq.ma_mh = mh.ma_mh
WHERE kq.diem_thi_cuoi_ky IS NOT NULL
GROUP BY kq.ma_mh, kq.diem_thi_cuoi_ky;

-- e. Liệt kê ma_gv, ten_gv của những giáo viên đã từng được phân công phụ trách ít nhất 1 môn học. Nếu ma_gv, ten_gv trùng lặp nhiều lần thì chỉ hiển thị ra 1 lần trong kết quả trả về.
SELECT DISTINCT gv.ma_gv, gv.ho_ten_gv
FROM giao_vien gv
JOIN phu_trach_bo_mon ptbm ON gv.ma_gv = ptbm.ma_gvpt;

-- f. Liệt kê tháng và năm của những tháng và năm đã có ít nhất 1 học sinh tham gia thi cuối kỳ (đã có diem_thi_cuoi_ky rồi).
SELECT MONTH(ktc.ngay_gio_thi_cuoi_ky) AS thang,
YEAR(ktc.ngay_gio_thi_cuoi_ky) AS nam
FROM ket_qua_hoc_tap ktc
WHERE ktc.diem_thi_cuoi_ky IS NOT NULL
GROUP BY thang, nam;

-- g. Liệt kê họ tên của những học sinh có địa chỉ ở Hải Châu và từng thi (giữa kỳ hoặc cuối kỳ) ít nhất 1 lần. Nếu họ tên trùng lặp thì chỉ hiển thị ra 1 lần trong kết quả trả về. Yêu cầu: Không được sử dụng từ khóa DISTINCT.
SELECT hs.ho_ten_hs
FROM hoc_sinh hs
JOIN ket_qua_hoc_tap kq ON hs.ma_hs = kq.ma_hs
WHERE hs.dia_chi = 'Hải Châu' AND kq.diem_thi_giua_ky IS NOT NULL OR kq.diem_thi_cuoi_ky IS NOT NULL
GROUP BY hs.ho_ten_hs;

/*----------------------LUYỆN TẬP VỀ HÀM GỘP + GROUP BY NÂNG CAO----------------------------*/
-- a. Liệt kê ho_ten_hs, gioi_tinh, dia_chi của các nhóm được phân nhóm theo ho_ten_hs và gioi_tinh trong bảng hoc_sinh. Thử suy nghĩ về nguyên nhân lỗi nếu có lỗi xảy ra (*).
SELECT ho_ten_hs, gioi_tinh, dia_chi
FROM hoc_sinh
GROUP BY ho_ten_hs, gioi_tinh, dia_chi;

-- b. Đếm số lượng học sinh là nam.
SELECT COUNT(*) AS soLuongNam
FROM hoc_sinh
WHERE gioi_tinh = 'Nam';

-- c. Đếm số lượng học sinh trong lớp có tên là Lớp 1A và lớp đó nằm trong năm học 2022-2023.
SELECT COUNT(*) AS soLuongHocSinh
FROM hoc_sinh hs
JOIN lop ON hs.ma_lop = lop.ma_lop
WHERE lop.ten_lop = 'Lớp 1A' AND lop.nam_hoc = '2022-2023';

-- d. Đếm số lớp đã phụ trách (có thể là 1 hoặc nhiều môn nào đó) của từng giáo viên.
SELECT gv.ma_gv, gv.ho_ten_gv, COUNT(ptbm.ma_mh) AS soLopPhuTrach
FROM giao_vien gv
LEFT JOIN phu_trach_bo_mon ptbm ON gv.ma_gv = ptbm.ma_gvpt
GROUP BY gv.ma_gv, gv.ho_ten_gv;

-- e. Đếm những môn học đã từng có học sinh thi giữa kỳ được 9 điểm trở lên (*). Gợi ý: làm theo 2 cách, 1 là dùng WHERE, 2 là dùng HAVING.
SELECT mh.ten_mh, COUNT(*) AS soLuongMonHoc
FROM mon_hoc mh
JOIN ket_qua_hoc_tap kq ON mh.ma_mh = kq.ma_mh
WHERE kq.diem_thi_giua_ky >=9
GROUP BY mh.ten_mh;

SELECT mh.ten_mh, COUNT(*) AS soLuongMonHoc
FROM mon_hoc mh
JOIN ket_qua_hoc_tap kq ON mh.ma_mh = kq.ma_mh
GROUP BY mh.ten_mh
HAVING MIN(kq.diem_thi_giua_ky) >= 9;

-- f. Đếm xem tương ứng với mỗi địa chỉ (của học sinh), số lượng học sinh đang ở mỗi địa chỉ là bao nhiêu em.
SELECT dia_chi, COUNT(*) AS soLuongHocSinh
FROM mon_hoc mh
JOIN hoc_sinh
GROUP BY dia_chi;

-- g. Liệt kê điểm thi cao nhất của từng môn học (dựa vào điểm thi cuối kỳ mà các học sinh đã từng thi).
SELECT mh.ten_mh, MAX(kq.diem_thi_cuoi_ky) AS diemThiCaoNhat
FROM mon_hoc mh
JOIN ket_qua_hoc_tap kq ON mh.ma_mh = kq.ma_mh
GROUP BY mh.ten_mh;

-- h. Liệt kê điểm thi trung bình của từng môn học (dựa vào điểm thi cuối kỳ mà các học sinh đã từng thi).
SELECT mh.ten_mh, AVG(kq.diem_thi_cuoi_ky) AS diemThiTrungBinh
FROM mon_hoc mh
JOIN ket_qua_hoc_tap kq ON mh.ma_mh = kq.ma_mh
GROUP BY mh.ten_mh;

-- i. Liệt kê những môn học có điểm thi trung bình cao nhất (dựa vào điểm thi cuối kỳ mà các học sinh đã từng thi).
-- Gợi ý: có trường hợp nhiều hơn 1 môn học có điểm thi trung bình cao nhất (**).
SELECT mh.ten_mh, AVG(kq.diem_thi_cuoi_ky) AS diemThiTrungBinh
FROM mon_hoc mh
JOIN ket_qua_hoc_tap kq ON mh.ma_mh = kq.ma_mh
GROUP BY mh.ten_mh
HAVING AVG(kq.diem_thi_cuoi_ky) = (
    SELECT MAX(diem_tb)
    FROM (
        SELECT AVG(diem_thi_cuoi_ky) AS diem_tb
        FROM ket_qua_hoc_tap
        GROUP BY ma_mh
    ) AS diem_tb_max
);
----------------
-- j. Tính điểm thi trung bình của từng học sinh trong trường. Chỉ tính điểm trung bình cho những học sinh đã từng thi cuối kỳ cho ít nhất 1 môn. Dựa vào cột điểm thi cuối kỳ để tính.
SELECT kq.ma_hs, hs.ho_ten_hs, AVG(kq.diem_thi_cuoi_ky) AS diemThiTrungBinh
FROM hoc_sinh hs
JOIN ket_qua_hoc_tap kq ON kq.ma_hs = hs.ma_hs
GROUP BY kq.ma_hs, hs.ho_ten_hs
HAVING COUNT(kq.diem_thi_cuoi_ky) >= 1;

-- k. Tìm học sinh có điểm thi trung bình các môn học cao nhất của lớp 1A trong năm học 2022-2023. Nếu có nhiều hơn 1 em thỏa mãn yêu cầu thì sẽ xét ưu tiên theo họ tên (sắp xếp theo tên A-Z, chỉ ưu tiên cho 1 em đứng trước trong danh sách).
-- Dựa vào cột điểm thi cuối kỳ để tính. (Gợi ý: tương tự câu i nhưng có thêm ORDER BY).
SELECT kq.ma_hs, hs.ho_ten_hs, AVG(kq.diem_thi_cuoi_ky) AS diemThiTrungBinh
FROM hoc_sinh hs
JOIN ket_qua_hoc_tap kq ON kq.ma_hs = hs.ma_hs
JOIN lop ON hs.ma_lop = lop.ma_lop
WHERE lop.ten_lop = 'Lớp 1A' AND lop.nam_hoc = '2022-2023'
GROUP BY kq.ma_hs, hs.ho_ten_hs
ORDER BY diemThiTrungBinh DESC, hs.ho_ten_hs ASC
LIMIT 1;

-- l. Tìm họ tên của những giáo viên đã từng dạy những học sinh có điểm trung bình cao nhất (xét trên dữ liệu của bất kể môn gì, chỉ tính điểm thi cuối kỳ của học kỳ 2). (***)
SELECT gv.ma_gv, gv.ho_ten_gv
FROM giao_vien gv
JOIN phu_trach_bo_mon ptbm ON gv.ma_gv = ptbm.ma_gvpt
JOIN mon_hoc mh ON ptbm.ma_mh = mh.ma_mh
JOIN ket_qua_hoc_tap kq ON mh.ma_mh = kq.ma_mh
WHERE kq.hoc_ky = 2
GROUP BY gv.ma_gv, gv.ho_ten_gv
HAVING AVG(kq.diem_thi_cuoi_ky) = (
    SELECT MAX(AVG(diem_thi_cuoi_ky))
    FROM ket_qua_hoc_tap
    WHERE hoc_ky = 2
    GROUP BY ma_hs
);
-------
/*----------------------LUYỆN TẬP VỀ SUBQUERY----------------------------*/
-- a. Học sinh chưa từng thi môn nào
SELECT ho_ten_hs
FROM hoc_sinh
WHERE ma_hs NOT IN (SELECT DISTINCT ma_hs FROM ket_qua_hoc_tap);

-- b. Giáo viên chưa từng phụ trách môn nào
SELECT ho_ten_gv
FROM giao_vien
WHERE ma_gv NOT IN (SELECT DISTINCT ma_gvpt FROM phu_trach_bo_mon);

-- c. Giáo viên chưa từng chủ nhiệm lớp nào
SELECT ho_ten_gv
FROM giao_vien
WHERE ma_gv NOT IN (SELECT DISTINCT ma_gvcn FROM lop);

-- d. Môn học chưa từng được tổ chức thi lần nào
SELECT ten_mh
FROM mon_hoc
WHERE ma_mh NOT IN (SELECT DISTINCT ma_mh FROM ket_qua_hoc_tap);

-- e. Đếm tương ứng với mỗi địa chỉ, số lượng học sinh đang ở mỗi địa chỉ là bao nhiêu em. Chỉ hiển thị kết quả cho từng địa chỉ có ít nhất 5 học sinh đang ở đó.
SELECT dia_chi, COUNT(*) AS so_luong
FROM hoc_sinh
GROUP BY dia_chi
HAVING so_luong >= 5;

-- f. Liệt kê điểm thi trung bình của từng môn học ( dựa vào điểm thi cuối kì của các học sinh đã thi ). Chỉ liệt kê những môn có điểm trung bình từ 5 đến 10.
SELECT mh.ten_mh, AVG(kq.diem_thi_cuoi_ky) AS diem_trung_binh
FROM mon_hoc mh
JOIN ket_qua_hoc_tap kq ON mh.ma_mh = kq.ma_mh
GROUP BY mh.ma_mh, mh.ten_mh
HAVING diem_trung_binh BETWEEN 5 AND 10;

-- g. Tính điểm trung bình của từng học sinh trong trường. Chỉ tính điểm trung bình cho những học sinh đã từng thi cuối kì cho ít nhất 1 môn. Dựa vào cột điểm cuối kì để tính. Chỉ hiển thị những học sinh có điểm cuối kì trên 8.
SELECT hs.ma_hs, hs.ho_ten_hs, AVG(kq.diem_thi_cuoi_ky) AS diem_trung_binh
FROM hoc_sinh hs
JOIN ket_qua_hoc_tap kq ON hs.ma_hs = kq.ma_hs
GROUP BY hs.ma_hs, hs.ho_ten_hs
HAVING diem_trung_binh > 8;

/*----------------------LUYỆN TẬP VỀ UNION----------------------------*/
-- a. Học sinh nam ở Thanh Khê và học sinh nữ ở Hải Châu
SELECT ho_ten_hs, gioi_tinh, dia_chi
FROM hoc_sinh
WHERE gioi_tinh = 'Nam' AND dia_chi LIKE '%Thanh Khê%'

UNION

SELECT ho_ten_hs, gioi_tinh, dia_chi
FROM hoc_sinh
WHERE gioi_tinh = 'Nữ' AND dia_chi LIKE '%Hải Châu%';

-- b. Họ tên của học sinh và giáo viên trong toàn trường
SELECT ho_ten_hs AS ho_ten, NULL AS nghe_nghiep, NULL AS ho_ten_gv
FROM hoc_sinh

UNION

SELECT NULL AS ho_ten, NULL AS nghe_nghiep, ho_ten_gv
FROM giao_vien;

-- c. Họ tên, nghề nghiệp của học sinh và giáo viên trong toàn trường (Nghề nghiệp bao gồm Học sinh và giáo viên)
SELECT ho_ten_hs AS ho_ten, 'Học sinh' AS nghe_nghiep
FROM hoc_sinh

UNION

SELECT ho_ten_gv AS ho_ten, 'Giáo viên' AS nghe_nghiep
FROM giao_vien;

-- d. Những học sinh đang học ở năm 2019-2020 và những học sinh chưa từng thi môn Toán và tiếng Việt
SELECT DISTINCT hs.ma_hs, hs.ho_ten_hs, hs.gioi_tinh, hs.dia_chi
FROM hoc_sinh hs
JOIN lop l ON hs.ma_lop = l.ma_lop
LEFT JOIN ket_qua_hoc_tap kq ON hs.ma_hs = kq.ma_hs
WHERE l.nam_hoc = '2022-2023'
AND (kq.ma_mh IS NULL OR (kq.ma_mh NOT IN ('Toán', 'Tiếng Việt')));

-- e. Thống kê điểm thi trung bình theo từng tháng trong năm 2019. Chỉ tính điểm trung bình dựa vào điểm thi các môn
SELECT MONTH(kq.ngay_gio_thi_cuoi_ky) AS thang,
       AVG((kq.diem_thi_cuoi_ky + COALESCE(kq.diem_thi_giua_ky, 0)) / 2) AS diem_tb
FROM ket_qua_hoc_tap kq
WHERE YEAR(kq.ngay_gio_thi_cuoi_ky) = 2023
GROUP BY thang
ORDER BY thang;

/*----------------------LUYỆN TẬP VỀ LEFT JOIN----------------------------*/
-- Hãy liệt kê:
-- a. ma_lop, ten_lop, ma_gvcn, ho_ten_gv (chủ nhiệm) của tất cả các lớp trong trường. (Gợi ý: tất cả các lớp nghĩa là kể cả những lớp chưa được phân công GVCN).
SELECT lop.ma_lop, lop.ten_lop, lop.ma_gvcn, giao_vien.ho_ten_gv
FROM lop
LEFT JOIN giao_vien ON lop.ma_gvcn = giao_vien.ma_gv;

-- b. ma_hs, ho_ten_hs, hoc_ky, ma_mh, ten_mh, diem_thi_giua_ky, diem_thi_cuoi_ky của tất cả học sinh trong trường.
SELECT hs.ma_hs, hs.ho_ten_hs, kq.hoc_ky, kq.ma_mh, mh.ten_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky
FROM hoc_sinh hs
LEFT JOIN ket_qua_hoc_tap kq ON hs.ma_hs = kq.ma_hs
LEFT JOIN mon_hoc mh ON kq.ma_mh = mh.ma_mh;

-- c. ma_hs, ho_ten_hs, ma_lop, ten_lop, ma_gvcn, ho_ten_gv (Chủ nhiệm) của tất cả học sinh trong trường. (Chú ý những trường hợp: học sinh chưa được phân lớp và lớp chưa được phân GVCN).
SELECT hs.ma_hs, hs.ho_ten_hs, lop.ma_lop, lop.ten_lop, lop.ma_gvcn, gv.ho_ten_gv
FROM hoc_sinh hs
LEFT JOIN lop ON hs.ma_lop = lop.ma_lop
LEFT JOIN giao_vien gv ON lop.ma_gvcn = gv.ma_gv;

-- d. ma_gv, ho_ten_gv, ma_lop, ten_lop, ma_mh, hoc_ky, ten_mh của tất cả giáo viên trong trường.
SELECT gv.ma_gv, gv.ho_ten_gv, ptbm.ma_lop, lop.ten_lop, ptbm.ma_mh, ptbm.hoc_ky, mh.ten_mh
FROM giao_vien gv
LEFT JOIN phu_trach_bo_mon ptbm ON gv.ma_gv = ptbm.ma_gvpt
LEFT JOIN mon_hoc mh ON ptbm.ma_mh = mh.ma_mh
LEFT JOIN lop ON ptbm.ma_lop = lop.ma_lop;

/*----------------------LUYỆN TẬP VỀ RIGHT JOIN----------------------------*/
-- Hãy liệt kê:
-- a. ma_lop, ten_lop, ma_gvcn, ho_ten_gv (chủ nhiệm) của tất cả các lớp trong trường. (Gợi ý: tất cả các lớp nghĩa là kể cả những lớp chưa được phân công GVCN).
SELECT lop.ma_lop, lop.ten_lop, lop.ma_gvcn, giao_vien.ho_ten_gv
FROM lop
RIGHT JOIN giao_vien ON lop.ma_gvcn = giao_vien.ma_gv;

-- b. ma_hs, ho_ten_hs, hoc_ky, ma_mh, ten_mh, diem_thi_giua_ky, diem_thi_cuoi_ky của tất cả học sinh trong trường.
SELECT hs.ma_hs, hs.ho_ten_hs, kq.hoc_ky, kq.ma_mh, mh.ten_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky
FROM hoc_sinh hs
RIGHT JOIN ket_qua_hoc_tap kq ON hs.ma_hs = kq.ma_hs
RIGHT JOIN mon_hoc mh ON kq.ma_mh = mh.ma_mh;

-- c. ma_hs, ho_ten_hs, ma_lop, ten_lop, ma_gvcn, ho_ten_gv (Chủ nhiệm) của tất cả học sinh trong trường. (Chú ý những trường hợp: học sinh chưa được phân lớp và lớp chưa được phân GVCN).
SELECT hs.ma_hs, hs.ho_ten_hs, lop.ma_lop, lop.ten_lop, lop.ma_gvcn, gv.ho_ten_gv
FROM hoc_sinh hs
RIGHT JOIN lop ON hs.ma_lop = lop.ma_lop
RIGHT JOIN giao_vien gv ON lop.ma_gvcn = gv.ma_gv;

-- d. ma_gv, ho_ten_gv, ma_lop, ten_lop, ma_mh, hoc_ky, ten_mh của tất cả giáo viên trong trường.
SELECT gv.ma_gv, gv.ho_ten_gv, ptbm.ma_lop, lop.ten_lop, ptbm.ma_mh, ptbm.hoc_ky, mh.ten_mh
FROM giao_vien gv
RIGHT JOIN phu_trach_bo_mon ptbm ON gv.ma_gv = ptbm.ma_gvpt
RIGHT JOIN mon_hoc mh ON ptbm.ma_mh = mh.ma_mh
RIGHT JOIN lop ON ptbm.ma_lop = lop.ma_lop;

/*----------------------LUYỆN TẬP VỀ FULL JOIN----------------------------*/
-- Hãy liệt kê:
-- a. ma_hs, ho_ten_hs, ma_lop, ten_lop của tất cả học sinh và tất cả các lớp trong trường. (Gợi ý: lớp chưa có học sinh và học sinh chưa được phân lớp đều phải được trả về kết quả).

-- b. ma_mh, ten_mh, ma_gv (phụ trách), ho_ten_gv (phụ trách) của tất cả những môn học và tất cả giáo viên trong trường. Kết quả trả về cần loại bỏ bớt những dòng trùng lặp (những dòng nào trùng nhau thì chỉ hiển thị kết quả 1 lần).

/*----------------------LUYỆN TẬP VỀ LIMIT----------------------------*/
-- a. Lấy danh sách học sinh trong lớp 1A, sắp xếp theo tên, bắt đầu từ kết quả thứ 11 và lấy 5 kết quả tiếp theo.

-- b. Lấy thông tin giáo viên phụ trách bộ môn trong Lớp 5A, sắp xếp theo tên môn học và lấy tối đa 5 kết quả, bắt đầu từ kết quả thứ 6.

/*----------------------LUYỆN TẬP VỀ EXISTS & IN----------------------------*/
-- a. Lấy danh sách các học sinh có kết quả thi môn Toán học trong học kỳ 1

-- b. Lấy danh sách các giáo viên chủ nhiệm có ít nhất một lớp học

-- c. Lấy thông tin các học sinh thuộc lớp 1A hoặc lớp 1B

-- d. Lấy thông tin các học sinh có điểm thi môn Toán học trong học kỳ 1 nằm trong danh sách (8.0, 8.5, 9.0)
