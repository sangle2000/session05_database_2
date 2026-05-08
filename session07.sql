USE zoo_db;

SELECT * FROM animals;

SELECT * FROM animal_details;

SELECT AVG(age) FROM animals;

INSERT INTO animals (name, animal_type, age, note) VALUES
('VanTruong', 'Tiger', 20, 'Hơi già'),
('Messi', 'Tiger', 30, 'Nổi tiếng'),
('XuanThien', 'Tiger', 18, 'Ueueueue'),
('VanKhiem', 'Tiger', 12, 'Chibi');

-- Lấy ra các con vật có tuổi lớn hơn tuổi trung bình
SELECT * FROM animals WHERE age >
(SELECT AVG(age) FROM animals);

-- Lấy ra trung bình tuổi của loài chó
SELECT id, animal_type, age FROM animals WHERE animal_type = 'Dog';

SELECT AVG(age), animal_type
FROM (SELECT id, animal_type, age FROM animals WHERE animal_type = 'Dog') animal_dog
GROUP BY animal_type;

SHOW FULL COLUMNS FROM animals;

ALTER TABLE animals CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin;

-- Viết truy vấn trích xuất thông tin (id, name, age) của cá thể có độ tuổi (age) 
-- cao nhất trong toàn bộ hệ thống lưu trữ.
SELECT id, name, age FROM animals 
WHERE age = (SELECT MAX(age) FROM animals);

-- Viết truy vấn tìm tất cả các record có độ tuổi lớn hơn độ tuổi trung bình của 
-- toàn bộ các cá thể có trong bảng animals.
SELECT id, name, age FROM animals 
WHERE age > (SELECT AVG(age) FROM animals);

-- Giả sử có một cá thể mang tên "Leo". Hãy viết truy vấn tìm tất cả các 
-- cá thể khác (hiển thị id, name, age) có cùng animal_type với cá thể "Leo" này.
-- 1. Tìm animal_type của "Leo"
SELECT animal_type FROM animals WHERE name = 'Leo';

-- 2. Tìm các cá thể khác có cùng animal_type là Tiger
SELECT id, name, age FROM animals WHERE animal_type IN ('Tiger');

-- 3. Thay Tiger bằng câu truy vấn lồng
SELECT id, name, age FROM animals 
WHERE animal_type IN (SELECT animal_type FROM animals WHERE name = 'Leo');

-- Hiển thị ra name, age của từng cá thể, đồng thời tạo thêm một 
-- cột tính toán (Calculated Column) hiển thị khoảng cách giữa tuổi của cá thể đó 
-- so với tuổi trung bình của toàn hệ thống.
-- 1. Tính tuổi trung bình
SELECT AVG(age) FROM animals;

-- 2. Hiển thị khoảng cách tuổi 6.8235
SELECT age, FLOOR(ABS(age - (SELECT AVG(age) FROM animals))) da FROM animals;

-- 3. Hiển thị những thông tin name, age, calculated
SELECT 
	name, 
	age, 
	FLOOR(ABS(age - (SELECT AVG(age) FROM animals))) calculated
FROM animals;

-- Đây là bài toán thực tế thường gặp: Viết truy vấn xuất ra thông tin 
-- của những cá thể có độ tuổi cao nhất trong từng nhóm animal_type tương ứng.
-- 1. Tìm độ tuổi cao nhất trong từng nhóm animal_type
SELECT animal_type, MAX(age) FROM animals GROUP BY animal_type;

-- 2. Truy xuất ra thông tin của những cá thể tương ứng (Dog)
SELECT animals.id, animals.name, animals.age, animals.animal_type, animals.note 
FROM animals 
JOIN 
	(SELECT animal_type, MAX(age) max_age FROM animals GROUP BY animal_type) 
    max_age_of_type
ON animals.animal_type = max_age_of_type.animal_type 
AND animals.age = max_age_of_type.max_age;