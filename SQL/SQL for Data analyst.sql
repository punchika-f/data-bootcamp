-- 1. CASE WHEN (IFS)
SELECT 
	company ,
    CASE
    	WHEN company IS NOT NULL THEN 'Corporate'
      ELSE 'End Customer'
    END AS segment
from customers;

-- 2. WORKING WITH DATE
SELECT 
	invoicedate,
    CAST(STRFTIME('%Y', invoicedate)AS INT) AS year,
    STRFTIME('%m', invoicedate) AS month,
    STRFTIME('%d', invoicedate) AS day,
    STRFTIME('%Y-%m', invoicedate) AS year_month
from invoices
WHERE year = 2011;

-- 3. SELECT DATA FROM MULTIPLE TABLE
SELECT * FROM artists
JOIN albums 
ON artists.Artistid = albums.ArtistId
WHERE artists.ArtistId = 50;

-- 4. MULTIPLE JOIN
SELECT 
		art.ArtistId,
    art.Name,
    alb.Title,
    tra.Name,
    tra.Composer
FROM artists AS art
JOIN albums AS alb
	ON art.ArtistId = alb.ArtistId
JOIN tracks AS tra
	ON alb.AlbumId = tra.AlbumId
WHERE art.name = 'Aerosmith';

-- 5. RANDOM ROWS
SELECT name, RANDOM() 
from tracks
order BY RANDOM() DESC
LIMIT 10;

-- 6. COALESCE
-- missing values / NULL
SELECT 
	company,
    COALESCE(company, 'End customer') AS 'Company clean',
    CASE WHEN company IS NULL THEN 'End customer'
    	ELSE 'Corporate'
    END AS 'Company clean 2'
from customers;

-- 7. Aggregate function
SELECT 
		ROUND(AVG(milliseconds),2) avg_milli,
    SUM(milliseconds) sum_miili,
    MIN(milliseconds) min_miili,
    MAX(milliseconds) max_miili,
    COUNT(milliseconds) count_miili
FROM tracks;

-- 8. COUNT DISTINCT
-- นับแบบไม่นับตัวที่ซ้ำกัน
SELECT COUNT(DISTINCT country), COUNT(*) FROM customers;

-- 9. GROUP BY
SELECT
		genres.name,
    COUNT(*) AS count_sonds
FROM genres, tracks
WHERE genres.GenreId = tracks.GenreId
GROUP BY genres.Name;

-- 10. HAVING
SELECT
		genres.name,
    COUNT(*) AS count_sonds
FROM genres, tracks
WHERE genres.GenreId = tracks.GenreId
GROUP BY genres.Name
HAVING COUNT(*) >= 100;

-- 11. ORDER BY
SELECT 
	genres.Name,
	COUNT(*)
FROM genres, tracks
WHERE genres.GenreId = tracks.GenreId
GROUP by genres.Name
ORDER BY COUNT(*) DESC LIMIT 5;

-- 12. INTERSECT
-- โชว์ค่าที่มีเหมือนกันใน 2 ตาราง
SELECT id FROM book_shop
INTERSECT
SELECT id FROM favorite_book;

-- 13. EXCEPT
-- โชว์ค่าที่มีในตาราง 1 แต่ไม่มีใน 2
SELECT id FROM book_shop
EXCEPT
SELECT id FROM favorite_book;

-- 14. UNION
-- No duplicate
SELECT * FROM book_shop
UNION
SELECT * FROM book_shop_new;
-- with duplicate
SELECT * FROM book_shop
UNION ALL
SELECT * FROM book_shop_new;

-- 15. SUBQUERIES (WITH ….. AS)
WITH usa_cus AS (
	SELECT * FROM customers
  	WHERE country = 'USA'
), -- ตัวแปรที่ 1
		invoice_y2009 as (
	SELECT * from invoices
  	where invoicedate BETWEEN '2009-01-01' and '2009-12-31'
) -- ตัวแปรที่ 2

SELECT SUM(total) AS total_revenue_y2009
from usa_cus A, invoice_y2009 B
WHERE A.customerid = B.customerid;

-- 16. Stored Procedure
CREATE PROCEDURE SelectAllCustomers @City nvarchar(30), @PostalCode nvarchar(10)
AS
SELECT * FROM Customers WHERE City = @City AND PostalCode = @PostalCode
GO;
