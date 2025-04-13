-- pending_tables.sql (Updated)

-- 1. Drop indexes first (avoid errors if they exist)
DROP INDEX idx_book_title ON book;
DROP INDEX idx_customer_email ON customer;

-- 2. Create indexes 
CREATE INDEX idx_book_title ON book(title);
CREATE INDEX idx_customer_email ON customer(email);

-- 3. Analysis queries (unchanged)
SELECT a.first_name, a.last_name, COUNT(b.book_id) AS book_count
FROM author a
JOIN book_author ba ON a.author_id = ba.author_id
JOIN book b ON ba.book_id = b.book_id
GROUP BY a.author_id;

-- 1. Analyze Table Performance
ANALYZE TABLE book, author, customer;

-- 2. Add Composite Indexes for Common Joins
ALTER TABLE book_author 
ADD INDEX idx_author_book (author_id, book_id);

ALTER TABLE customer_address
ADD INDEX idx_customer_address (customer_id, address_id);

-- 3. Optimize Text Search (for title/author searches)
ALTER TABLE book 
ADD FULLTEXT INDEX ft_title (title);

ALTER TABLE author
ADD FULLTEXT INDEX ft_author_name (first_name, last_name);

-- 4. Cache Frequent Lookups
CREATE VIEW popular_books AS
SELECT b.book_id, b.title, COUNT(ol.line_id) AS orders
FROM book b
LEFT JOIN order_line ol ON b.book_id = ol.book_id
GROUP BY b.book_id
ORDER BY orders DESC
LIMIT 10;

-- 5. Kenyan-Specific Optimization
CREATE VIEW kenyan_customers AS
SELECT c.*, a.city, co.country_name
FROM customer c
JOIN customer_address ca ON c.customer_id = ca.customer_id
JOIN address a ON ca.address_id = a.address_id
JOIN country co ON a.country_id = co.country_id
WHERE co.country_code = 'KE';