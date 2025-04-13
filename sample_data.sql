-- sample_data.sql
USE BookStore;

-- Clear existing data (optional)
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE customer_address;
TRUNCATE TABLE customer;
TRUNCATE TABLE address;
TRUNCATE TABLE address_status;
TRUNCATE TABLE country;
TRUNCATE TABLE book_author;
TRUNCATE TABLE book;
TRUNCATE TABLE author;
TRUNCATE TABLE publisher;
TRUNCATE TABLE book_language;
SET FOREIGN_KEY_CHECKS = 1;

-- Book Languages
INSERT INTO book_language (language_id, language_name) VALUES 
(1, 'English'),
(2, 'French'),
(3, 'Swahili'),
(4, 'Spanish'),
(5, 'German');

-- Publishers
INSERT INTO publisher (publisher_id, name, contact_email) VALUES 
(101, 'Penguin Random House', 'contact@penguin.com'),
(102, 'HarperCollins', 'info@harpercollins.com'),
(103, 'Macmillan', 'support@macmillan.com'),
(104, 'Tech Publications', 'hello@techpub.com'),
(105, 'African Writers Press', 'awp@africanwriters.org');

-- Authors
INSERT INTO author (author_id, first_name, last_name) VALUES 
(201, 'Ngũgĩ', 'wa Thiong''o'),
(202, 'Chimamanda', 'Adichie'),
(203, 'James', 'Clear'),
(204, 'Marie', 'Kondo'),
(205, 'Stephen', 'King');

-- Books
INSERT INTO book (book_id, title, isbn, language_id, publisher_id, publication_date, price) VALUES 
(1001, 'Atomic Habits', '9780735211292', 1, 101, '2018-10-16', 14.99),
(1002, 'The Life-Changing Magic of Tidying Up', '9781607747307', 1, 102, '2014-10-14', 12.50),
(1003, 'Wizard of the Crow', '9780099521127', 1, 105, '2006-08-01', 18.99),
(1004, 'Americanah', '9780007356348', 1, 102, '2013-05-14', 15.75),
(1005, 'The Shining', '9780307743657', 1, 103, '1977-01-28', 9.99);

-- Book-Author Relationships
INSERT INTO book_author (book_id, author_id) VALUES 
(1001, 203),
(1002, 204),
(1003, 201),
(1004, 202),
(1005, 205);

-- Countries
INSERT INTO country (country_id, country_name, country_code) VALUES 
(1, 'Kenya', 'KE'),
(2, 'United States', 'US'),
(3, 'United Kingdom', 'GB'),
(4, 'Nigeria', 'NG'),
(5, 'South Africa', 'ZA');

-- Address Statuses
INSERT INTO address_status (status_id, status_value) VALUES 
(1, 'Current'),
(2, 'Previous'),
(3, 'Work'),
(4, 'Billing');

-- Addresses
INSERT INTO address (address_id, street_number, street_name, city, postal_code, country_id) VALUES 
(501, '17', 'Moi Avenue', 'Nairobi', '00100', 1),
(502, '42', 'Main Street', 'New York', '10001', 2),
(503, '5', 'Oxford Road', 'London', 'W1D 1BS', 3),
(504, '21', 'Marina Road', 'Lagos', '101241', 4),
(505, '9', 'Long Street', 'Cape Town', '8001', 5);

-- Customers
INSERT INTO customer (customer_id, first_name, last_name, email, phone, registration_date) VALUES 
(10001, 'Amani', 'Juma', 'amani@example.com', '+254712345678', '2023-01-15 09:30:00'),
(10002, 'John', 'Smith', 'john.smith@example.com', '+12025551234', '2023-02-20 14:15:00'),
(10003, 'Priya', 'Patel', 'priya@example.com', '+447700900123', '2023-03-10 11:45:00'),
(10004, 'Chinedu', 'Okafor', 'chinedu@example.com', '+2348012345678', '2023-04-05 16:20:00'),
(10005, 'Nomsa', 'Dlamini', 'nomsa@example.com', '+27821234567', '2023-05-12 10:00:00');

-- Customer Addresses
INSERT INTO customer_address (customer_id, address_id, status_id) VALUES 
(10001, 501, 1),
(10002, 502, 1),
(10003, 503, 1),
(10004, 504, 1),
(10005, 505, 1);

-- KENYAN-SPECIFIC DATA ADDITIONS
-- Adding to existing sample_data.sql

-- Kenyan Publishers
INSERT INTO publisher (publisher_id, name, contact_email) VALUES 
(106, 'East African Educational Publishers', 'info@eaep.co.ke'),
(107, 'Kwani Trust', 'submissions@kwani.org'),
(108, 'Longhorn Kenya', 'customercare@longhornpublishers.com'),
(109, 'Jomo Kenyatta Foundation', 'jkf@jkfoundation.ac.ke'),
(110, 'Storymoja Publishers', 'hello@storymojaafrica.co.ke');

-- Kenyan Authors
INSERT INTO author (author_id, first_name, last_name) VALUES 
(206, 'Grace', 'Ogot'),
(207, 'Meja', 'Mwangi'),
(208, 'Binyavanga', 'Wainaina'),
(209, 'Yvonne', 'Adhiambo'),
(210, 'Mwenda', 'Mbatiah');

-- Kenyan Books
INSERT INTO book (book_id, title, isbn, language_id, publisher_id, publication_date, price) VALUES 
(1006, 'The River and the Source', '9789966464488', 1, 106, '1994-01-01', 12.99),
(1007, 'Kill Me Quick', '9789966464648', 1, 106, '1973-01-01', 10.50),
(1008, 'One Day I Will Write About This Place', '9781846554132', 1, 107, '2011-01-01', 15.99),
(1009, 'Dust', '9789966251644', 1, 108, '2007-01-01', 11.25),
(1010, 'Unbounded', '9789966251675', 1, 110, '2015-01-01', 13.75);

-- Book-Author Relationships (Kenyan)
INSERT INTO book_author (book_id, author_id) VALUES 
(1006, 206),
(1007, 207),
(1008, 208),
(1009, 209),
(1010, 210);

-- Kenyan Counties (Additional Addresses)
INSERT INTO address (address_id, street_number, street_name, city, postal_code, country_id) VALUES 
(506, 'P.O Box 4532', 'Kenyatta Avenue', 'Nairobi', '00100', 1),
(507, '14', 'Mfangano Street', 'Nairobi', '00100', 1),
(508, '23', 'Oginga Odinga Street', 'Kisumu', '40100', 1),
(509, '56', 'Kenyatta Street', 'Mombasa', '80100', 1),
(510, '8', 'Koinange Street', 'Nakuru', '20100', 1);

-- Kenyan Customers
INSERT INTO customer (customer_id, first_name, last_name, email, phone, registration_date) VALUES 
(10006, 'Wanjiru', 'Kamau', 'wanjiru.k@example.com', '+254722000111', '2023-06-01 08:45:00'),
(10007, 'Omondi', 'Otieno', 'omondi.o@example.com', '+254733112233', '2023-06-15 10:30:00'),
(10008, 'Akeyo', 'Atieno', 'akeyo.a@example.com', '+254711223344', '2023-07-05 14:15:00'),
(10009, 'Mutiso', 'Mwikali', 'mutiso.m@example.com', '+254744556677', '2023-07-20 16:00:00'),
(10010, 'Kipchoge', 'Rono', 'kipchoge.r@example.com', '+254755667788', '2023-08-10 09:30:00');

-- Kenyan Customer Addresses
INSERT INTO customer_address (customer_id, address_id, status_id) VALUES 
(10006, 506, 1),
(10007, 507, 1),
(10008, 508, 1),
(10009, 509, 1),
(10010, 510, 1);

-- Kenyan-Specific Book Languages
INSERT INTO book_language (language_id, language_name) VALUES 
(6, 'Kiswahili'),
(7, 'Kikuyu'),
(8, 'Dholuo'),
(9, 'Luhya'),
(10, 'Kalenjin');

-- Verification Query for Kenyan Data
SELECT 'Kenyan data loaded successfully!' AS message;

-- Verification Query (optional)
SELECT 'Data loaded successfully!' AS message;