CREATE DATABASE zoo_db;

USE zoo_db;

CREATE TABLE animals (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) UNIQUE NOT NULL,
    animal_type VARCHAR(255) NOT NULL,
    age SMALLINT NOT NULL
);

INSERT INTO animals (name, animal_type, age) VALUES
('Buddy', 'Dog', 3),
('Milo', 'Cat', 2),
('Charlie', 'Dog', 5),
('Max', 'Dog', 4),
('Luna', 'Cat', 1),
('Bella', 'Dog', 6),
('Lucy', 'Cat', 3),
('Daisy', 'Rabbit', 2),
('Rocky', 'Dog', 7),
('Coco', 'Parrot', 4),
('Oscar', 'Cat', 5),
('Ruby', 'Dog', 2),
('Simba', 'Lion', 8),
('Nala', 'Lion', 7),
('Jack', 'Monkey', 6),
('Lily', 'Dog', 3),
('Toby', 'Dog', 9),
('Molly', 'Cat', 4),
('Leo', 'Tiger', 6),
('Zoe', 'Dog', 2),
('Chloe', 'Cat', 3),
('Buster', 'Dog', 5),
('Pepper', 'Cat', 2),
('Shadow', 'Dog', 8),
('Ginger', 'Cat', 1),
('Sam', 'Horse', 10),
('Ellie', 'Elephant', 15),
('George', 'Giraffe', 12),
('Hazel', 'Rabbit', 3),
('Oliver', 'Cat', 4);

-- SELECT dưới 10 tuổi
SELECT * FROM animals WHERE age < 10;

-- SELECT trong khoảng từ 3 - 10 tuổi
SELECT * FROM animals WHERE age BETWEEN 3 AND 10;

SELECT * FROM animals WHERE age >= 3 AND age <= 10;

-- SELECT động vật khác chó
SELECT * FROM animals WHERE animal_type NOT IN ('Dog');

SELECT * FROM animals WHERE animal_type != 'Dog';

SELECT * FROM animals WHERE animal_type <> 'Dog';

-- SELECT các loài động vật là chó, mèo, hổ
SELECT * FROM animals WHERE animal_type IN ('DOG', 'cat', 'tiger');

SELECT * FROM animals 
WHERE animal_type = 'DOG' 
OR animal_type = 'cat' 
OR animal_type = 'TIGER';

-- SELECT động vật bắt đầu bằng M
SELECT * FROM animals WHERE name LIKE '%M%';

-- SELECT động vật có tuổi bắt đầu là 1
SELECT * FROM animals WHERE age NOT LIKE '%1%';

-- SELECT động vật là chó và sắp xếp tăng dần theo tuổi
SELECT * FROM animals WHERE animal_type = 'Dog' ORDER BY age ASC;

-- SELECT động vật lớn hơn 3 tuổi, sắp xếp loài theo bảng chữ cái, 
-- nếu trùng loài thì sắp xếp theo tuổi tăng dần
SELECT * FROM animals WHERE age > 3 ORDER BY animal_type ASC, age ASC;

-- SELECT động vật, sắp xếp theo chữ cái, phân trang mỗi trang 6 loài,
-- Lấy trang thứ 3
SELECT * FROM animals ORDER BY name ASC LIMIT 6 OFFSET 12;

SELECT * FROM animals ORDER BY name ASC;

-- Kiểm tra nếu như động vật là chó lớn hơn 5 tuổi thì hiển thị Trưởng thành
-- Còn lại hiển thị Trẻ trâu
SELECT *,
CASE
	WHEN age > 5 THEN 'Trưởng thành'
    ELSE 'Trẻ trâu'
END as status FROM animals 
WHERE animal_type = 'Dog';

SHOW FULL COLUMNS FROM animals;