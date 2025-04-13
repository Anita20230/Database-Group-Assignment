-- View Kenyan Authors & Their Books
SELECT 
    a.author_id, 
    CONCAT(a.first_name, ' ', a.last_name) AS author_name,
    b.title, 
    b.price
FROM author a
JOIN book_author ba ON a.author_id = ba.author_id
JOIN book b ON ba.book_id = b.book_id
WHERE a.author_id BETWEEN 201 AND 210;  -- Kenyan author ID range

-- View Kenyan Customers & Addresses
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    a.street_name, 
    a.city,
    co.country_name
FROM customer c
JOIN customer_address ca ON c.customer_id = ca.customer_id
JOIN address a ON ca.address_id = a.address_id
JOIN country co ON a.country_id = co.country_id
WHERE co.country_code = 'KE';

-- View Kenyan Publishers' Books
SELECT 
    p.name AS publisher,
    b.title,
    bl.language_name
FROM publisher p
JOIN book b ON p.publisher_id = b.publisher_id
JOIN book_language bl ON b.language_id = bl.language_id
WHERE p.publisher_id BETWEEN 106 AND 110;  -- Kenyan publisher IDs

-- View Orders from Kenyan Customers
SELECT 
    c.first_name,
    co.order_id,
    b.title,
    sm.method_name AS shipping_method
FROM cust_order co
JOIN customer c ON co.customer_id = c.customer_id
JOIN order_line ol ON co.order_id = ol.order_id
JOIN book b ON ol.book_id = b.book_id
JOIN shipping_method sm ON co.shipping_method_id = sm.method_id
WHERE c.customer_id BETWEEN 10006 AND 10010;  -- Kenyan customer IDs


