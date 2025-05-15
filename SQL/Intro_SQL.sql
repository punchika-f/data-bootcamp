-- 1. CREATE TABLE
CREATE TABLE employee (
  id INT UNIQUE,
  name TEXT,
  department TEXT,
  position TEXT,
  salary REAL
);

-- 2. CREATE VIEW
CREATE VIEW total_billing_VAT AS
SELECT
		invoicedate,
    billingaddress,
    billingcity,
    total,
    ROUND(total * 0.07, 2) AS VAT
FROM invoices
WHERE invoicedate <= '2009-01-31'

-- 3. INSERT DATA
INSERT into employee VALUES
	(1, 'David', 'Marketing', 'CEO', 100000),
  (2, 'Mary', 'Marketing', 'VP', 85000),
  (3, 'John', 'Sales', 'Manager', 60000);

-- 4. FILTER DATA (WHERE)
-- 4.1 LIKE
SELECT * FROM customers
WHERE email LIKE '%@gmail.com';

SELECT firstname, lastname, country, email, phone FROM customers
WHERE phone LIKE '%99%';

SELECT * FROM customers
WHERE firstname LIKE 'J_hn';

SELECT firstname, lastname, country, email, phone FROM customers
WHERE firstname LIKE 'leon__';
-- 4.2 AND
SELECT * FROM employee
WHERE department = 'Marketing' AND salary > 90000;
-- 4.3 OR / IN
เขียนได้ 2 แบบ
SELECT * FROM employee
WHERE department = 'Marketing' OR department = 'IT';

SELECT * from employee
WHERE department IN ('Marketing', 'IT');
-- 4.4 BETWEEN
SELECT * FROM customers
WHERE customerid BETWEEN 5 AND 10;

SELECT invoicedate from invoices
WHERE invoicedate BETWEEN '2009-01-01 00:00:00' AND '2009-01-31 00:00:00';

-- 5. JOIN DATA USING WHERE
SELECT  
		artists.ArtistId,
    artists.Name as artist_name,
    albums.Title AS album_name,
    tracks.Name AS song_name
FROM artists, albums, tracks
WHERE artists.ArtistId = albums.ArtistId
	AND albums.AlbumId = tracks.AlbumId
	AND artists.ArtistId IN (8,100,120);

-- 6. CREATE NEW COLUMN
-- สร้างจากข้อมูลเดิมที่มีอยู่แล้ว
SELECT 
		name, 
    salary,
    salary * 1.15 AS new_salary,
    LOWER(name) || '@company.com' AS company_email
FROM employee;
-- สร้าง column ใหม่เลย (ALTER)
-- ALTER TABLE employee RENAME to MyEmployee;

/* ALTER TABLE MyEmployee
ADD email TEXT; */

๊ีUPDATE MyEmployee
SET email = 'ceo@company.com'
WHERE id = 1;

SELECT * FROM MyEmployee;

-- 7. UPDATE DATA
UPDATE employee
SET salary = 84000
WHERE id = 4;

SELECT * from employee;

-- 8. DELETE DATA
DELETE FROM employee
WHERE id IN (2, 4, 5) ;

SELECT * from employee ;

-- 9. COPY TABLE
CREATE TABLE MyEmployee_Backup AS
	SELECT * FROM MyEmployee;

-- 10. DROP (DELETE TABLE)
/* CREATE table MyEmployee_Backup AS
	SELECT * FROM MyEmployee; */

DROP TABLE MyEmployee_Backup;

