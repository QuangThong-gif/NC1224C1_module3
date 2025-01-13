CREATE DATABASE quan_li_cua_hang;

USE quan_li_cua_hang;

CREATE TABLE product(
	id_product INT AUTO_INCREMENT PRIMARY KEY,
    name_product VARCHAR(255) NOT NULL,
    description VARCHAR(255) NULL,
    price DECIMAL NULL,
    stock INT NULL 
);

INSERT INTO product (id_product, name_product, description, price, stock)
VALUES
	(1,"Iphone 14", "14 promax", 16900000, 39),
    (2,"Laptop MSI", "Siêu đẹp...", 26900000, 29),
    (3,"Ipone 5", "Bị đẹp...", 7000000, 40),
    (4,"Laptop Sámung", "Siêu bền", 46900000, 9);

/*---TRUY VẤN DỮ LIỆU---*/
/*------Liệt kê toàn bộ thông tin product-------*/
SELECT * FROM product;
/*------Liệt kê id, name, price của toàn bộ sản phẩm-------*/
SELECT id_product, name_product, price FROM product;
/*------Liệt kê id, name, price của toàn bộ sản phẩm dưới 10 triệu-------*/
SELECT id_product, name_product, price 
FROM product 
WHERE price < 10000000;

/*---CẬP NHẬT DỮ LIỆU---*/
/*---b. Sử dụng lệnh mà không có điều kiện WHERE---*/
set sql_safe_updates = 0;

UPDATE product
SET price = 15000000;
/*---c. Sử dụng lệnh có điều kiện WHERE---*/
UPDATE product
SET price = 16000000
WHERE id_product = 3;

set sql_safe_updates = 1;

/*---CHỈNH SỬA BẢNG---*/
/*---a. Thêm trường Barcode với tất cả dữ liệu từ trước là NULL---*/
ALTER TABLE product 
ADD COLUMN barcode VARCHAR(255) NULL;
/*---b. Thêm trường Warranty với giá trị mặc định là 6 tháng---*/ 
ALTER TABLE product 
ADD COLUMN warranty VARCHAR(255) DEFAULT '6 tháng';

/*---XOÁ DỮ LIỆU---*/
/*---b. Sử dụng lệnh mà không có điều kiện WHERE---*/
set sql_safe_updates = 0;

DELETE FROM product;
/*---b. Sử dụng lệnh mà có điều kiện WHERE---*/
DELETE FROM product
WHERE id_product = 2;

set sql_safe_updates = 1;

/*---XOÁ BẢNG---*/
DROP table product;

/*---XOÁ CƠ SỞ DỮ LIỆU---*/
/*---a. Xóa mà không có điều kiện---*/
DROP DATABASE quan_li_cua_hang;

/*---b.Xóa bằng cách kiểm tra database đã tồn tại chưa rồi tiến hành xóa---*/
DROP DATABASE IF EXISTS quan_li_cua_hang;










    
    

