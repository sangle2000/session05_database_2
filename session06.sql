USE zoo_db;

SELECT * FROM animals;

-- Gom nhóm theo animal type
SELECT COUNT(animal_type) total_animal_type FROM animals
GROUP BY animal_type;

-- Tính tổng các loài động vật hiện có trong sở thú
SELECT COUNT(*) total_animal FROM animals;

-- Thêm một cột note
ALTER TABLE animals
ADD note TEXT;

-- Cập nhật note cho 5 loài động vật (1, 13, 24, 28, 30)
UPDATE animals
SET note = CASE
	WHEN id = 1 THEN 'Bị bệnh'
    WHEN id = 13 THEN 'Già'
    WHEN id = 24 THEN 'Sắp kết hôn'
    WHEN id = 28 THEN 'Ly hôn'
    WHEN id = 30 THEN 'Single mom'
END WHERE id IN (1, 13, 24, 28, 30);

SELECT COUNT(note) FROM animals GROUP BY name;

-- Lấy ra tuổi cao nhất và thấp nhất
SELECT MAX(age) max_age, MIN(age) min_age FROM animals;

SELECT AVG(age) avg_age FROM animals;

SELECT AVG(age) avg_age FROM animals GROUP BY animal_type;

SELECT animal_type, COUNT(animal_type) count_animal_type 
FROM animals 
GROUP BY animal_type HAVING count_animal_type > 1;

SELECT *
FROM animals
HAVING age > 5;

CREATE TABLE animal_details (
	id INT PRIMARY KEY AUTO_INCREMENT,
    status ENUM ('Khoẻ', 'Bệnh'),
    animal_id INT NOT NULL,
    FOREIGN KEY (animal_id) REFERENCES animals(id) ON DELETE CASCADE
);

CREATE TABLE animal_histories(
	id INT PRIMARY KEY AUTO_INCREMENT,
    animal_id INT NOT NULL,
    leave_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO animal_details (status, animal_id) VALUES 
	('Khoẻ', 2),
    ('Bệnh', 5),
    ('Khoẻ', 12),
    ('Khoẻ', 20);
    
INSERT INTO animal_histories (animal_id) VALUES 
	(3),
    (6),
    (25),
    (30);
    
SELECT * FROM animal_details;

SELECT * FROM animal_histories;

SELECT *
FROM animals
JOIN animal_details
ON animals.id = animal_details.animal_id;

SELECT * FROM animals
JOIN animal_histories
ON animals.id = animal_histories.animal_id;