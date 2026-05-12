USE zoo_db;

SELECT * FROM animals;

INSERT INTO animals VALUES
(45, 'E', 'Tiger', 5, NULL),
(42, 'D', 'Dog', 3, NULL),
(44, 'K', 'Cat', 10, NULL);

SELECT name FROM animals;

-- -> Rows fetched before execution  (cost=0..0 rows=1) 
-- (actual time=400e-6..500e-6 rows=1 loops=1)

-- -> Rows fetched before execution  (cost=0..0 rows=1) 
-- (actual time=300e-6..500e-6 rows=1 loops=1)

-- -> Covering index scan on animals using name  (cost=4.25 rows=40) 
-- (actual time=0.102..0.182 rows=40 loops=1)

-- -> Covering index scan on animals using name  (cost=4.25 rows=40) 
-- (actual time=0.0813..0.107 rows=40 loops=1)

-- -> Rows fetched before execution  (cost=0..0 rows=1)
-- (actual time=500e-6..500e-6 rows=1 loops=1)
 
CREATE INDEX animal_name_index ON animals(name);

EXPLAIN ANALYZE
SELECT * FROM animals WHERE name = 'Molly';

DROP INDEX animal_name_index ON animals;

-- Tạo view
CREATE VIEW animal_view AS
SELECT id, name, animal_type FROM animals;