-- EXERCISE 01

CREATE DATABASE IF NOT EXISTS sql_qlct;
USE sql_qlct;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


-- TABLE ARCHITECT

CREATE TABLE IF NOT EXISTS architect (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    birthday INT(4),
    sex TINYINT(1) DEFAULT 0 COMMENT '1: Nam - 0: Nu',
    place VARCHAR(255),
    address VARCHAR(255)
);

INSERT INTO architect (id, name, birthday, sex, place, address) VALUES
(1, 'le thanh tung', 1956, 1, 'tp hcm', '25 duong 3/2 tp bien hoa'),
(2, 'le kim dung', 1952, 0, 'ha noi', '18/5 phan van tri tp can tho'),
(3, 'nguyen anh thu', 1970, 0, 'new york', 'khu 2 dhct tp can tho'),
(4, 'nguyen song do quyen', 1970, 0, 'can tho', '73 tran hung dao tp hcm'),
(5, 'truong minh thai', 1950, 1, 'paris france', '12/2/5 tran phu tp hanoi');


-- TABLE CONTRACTOR

CREATE TABLE IF NOT EXISTS contractor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    phone VARCHAR(45),
    address VARCHAR(255)
);

INSERT INTO contractor (id, name, phone, address) VALUES
(1, 'cty xd so 6', '567456', '5 phan chu trinh'),
(2, 'phong dich vu so xd', '206481', '2 le van sy'),
(3, 'le van son', '028374', '12 tran nhan ton'),
(4, 'tran khai hoan', '658432', '20 nguyen thai hoc');


-- TABLE HOST

CREATE TABLE IF NOT EXISTS host (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255)
);

INSERT INTO host (id, name, address) VALUES
(1, 'so t mai du lich', '54 xo viet nghe tinh'),
(2, 'so van hoa thong tin', '101 hai ba trung'),
(3, 'so giao duc', '29 duong 3/2'),
(4, 'dai hoc can tho', '56 duong 30/4'),
(5, 'cty bitis', '29 phan dinh phung'),
(6, 'nguyen thanh ha', '45 de tham'),
(7, 'phan thanh liem', '48/6 huynh thuc khan');


-- TABLE WORKER

CREATE TABLE IF NOT EXISTS worker (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45),
    birthday INT(4),
    year INT(4),
    skill VARCHAR(45)
);

INSERT INTO worker (id, name, birthday, year, skill) VALUES
(1, 'nguyen thi suu', 1945, 1960, 'ho'),
(2, 'vi chi a', 1966, 1987, 'moc'),
(3, 'le manh quoc', 1956, 1971, 'son'),
(4, 'vo van chin', 1940, 1952, 'dien'),
(5, 'le quyet thang', 1954, 1974, 'han'),
(6, 'nguyen hong van', 1950, 1970, 'dien'),
(7, 'dang van son', 1948, 1965, 'dien');


-- TABLE BUILDING

CREATE TABLE IF NOT EXISTS building (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    cost FLOAT,
    start DATE,
    host_id INT NOT NULL,
    contractor_id INT NOT NULL,

    CONSTRAINT fk_building_host
        FOREIGN KEY (host_id)
        REFERENCES host(id),

    CONSTRAINT fk_building_contractor
        FOREIGN KEY (contractor_id)
        REFERENCES contractor(id)
);

INSERT INTO building
(id, name, address, city, cost, start, host_id, contractor_id)
VALUES
(1, 'khach san quoc te', '5 nguyen an ninh', 'can tho', 450, '1994-12-13', 1, 1),
(2, 'cong vien thieu nhi', '100 nguyen thai hoc', 'can tho', 200, '1994-05-08', 2, 1),
(3, 'hoi cho nong nghiep', 'bai cat', 'vinh long', 1000, '1994-06-10', 1, 1),
(4, 'truong mg mang non', '48 cm thang 8', 'can tho', 30, '1994-07-10', 3, 3),
(5, 'khoa trong trot dhct', 'khu ii dhct', 'can tho', 3000, '1994-06-19', 4, 3),
(6, 'van phong bitis', '25 phan dinh phung', 'ha noi', 40, '1994-05-10', 5, 3),
(7, 'nha rieng 1', '124/5 nguyen trai', 'tp hcm', 65, '1994-11-15', 6, 2),
(8, 'nha rieng 2', '76 chau van liem', 'ha noi', 200, '1994-06-09', 7, 4);


-- TABLE DESIGN

CREATE TABLE IF NOT EXISTS design (
    building_id INT NOT NULL,
    architect_id INT NOT NULL,
    benefit FLOAT,

    PRIMARY KEY (building_id, architect_id),

    CONSTRAINT fk_design_building
        FOREIGN KEY (building_id)
        REFERENCES building(id),

    CONSTRAINT fk_design_architect
        FOREIGN KEY (architect_id)
        REFERENCES architect(id)
);

INSERT INTO design (building_id, architect_id, benefit) VALUES
(1, 1, 25),
(1, 5, 12),
(2, 4, 6),
(3, 3, 12),
(4, 2, 20),
(5, 5, 30),
(6, 2, 40),
(6, 5, 27),
(7, 1, 10),
(8, 2, 18);


-- TABLE WORK

CREATE TABLE IF NOT EXISTS work (
    building_id INT NOT NULL,
    worker_id INT NOT NULL,
    date DATE,
    total INT(4),

    PRIMARY KEY (building_id, worker_id),

    CONSTRAINT fk_work_building
        FOREIGN KEY (building_id)
        REFERENCES building(id),

    CONSTRAINT fk_work_worker
        FOREIGN KEY (worker_id)
        REFERENCES worker(id)
);

INSERT INTO work (building_id, worker_id, date, total) VALUES
(1, 1, '1994-12-15', 5),
(1, 3, '1994-12-18', 6),
(1, 6, '1994-09-14', 7),
(2, 1, '1994-05-08', 20),
(2, 4, '1994-05-10', 10),
(2, 5, '1994-12-16', 5),
(3, 4, '1994-10-06', 10),
(3, 7, '1994-10-06', 18),
(4, 1, '1994-09-07', 20),
(4, 6, '1994-05-12', 7);


-- EXERCISE 02

-- building.host_id -> host.id
-- building.contractor_id -> contractor.id
-- design.building_id -> building.id
-- design.architect_id -> architect.id
-- work.building_id -> building.id
-- work.worker_id -> worker.id


-- EXERCISE 03

-- 1
SELECT * FROM architect;

-- 2
SELECT name, sex
FROM architect;

-- 3
SELECT DISTINCT birthday
FROM architect;

-- 4
SELECT name, birthday
FROM architect
ORDER BY birthday ASC;

-- 5
SELECT name, birthday
FROM architect
ORDER BY birthday DESC;

-- 6
SELECT *
FROM building
ORDER BY cost ASC, city ASC;


-- EXERCISE 04

-- 1
SELECT *
FROM architect
WHERE name = 'le thanh tung';

-- 2
SELECT name, birthday
FROM worker
WHERE skill = 'han'
   OR skill = 'dien';

-- 3
SELECT name
FROM worker
WHERE (skill = 'han' OR skill = 'dien')
  AND birthday > 1948;

-- 4
SELECT *
FROM worker
WHERE birthday + 20 > year;

-- 5 - Cach 1
SELECT *
FROM worker
WHERE birthday = 1945
   OR birthday = 1940
   OR birthday = 1948;

-- 5 - Cach 2
SELECT *
FROM worker
WHERE birthday IN (1945, 1940, 1948);

-- 6 - Cach 1
SELECT *
FROM building
WHERE cost >= 200
  AND cost <= 500;

-- 6 - Cach 2
SELECT *
FROM building
WHERE cost BETWEEN 200 AND 500;

-- 7
SELECT *
FROM architect
WHERE name LIKE 'nguyen%';

-- 8
SELECT *
FROM architect
WHERE name LIKE '% anh %';

-- 9
SELECT *
FROM architect
WHERE name LIKE '% th_';

-- 10
SELECT *
FROM contractor
WHERE phone IS NULL;