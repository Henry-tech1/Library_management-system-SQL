CREATE DATABASE IF NOT EXISTS Library_management_system;
USE Library_management_system;
CREATE TABLE IF NOT EXISTS books (
  book_ID VARCHAR(10) PRIMARY KEY,
  Title VARCHAR(100),
  Author VARCHAR(100),
  Category VARCHAR(100),
  Cabinet INT,
  Rack INT,
  `Row` INT,
  Signal_Strength INT,
  `Timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  Status VARCHAR(100) DEFAULT 'Available'
);
CREATE TABLE IF NOT EXISTS students (
  student_id INT PRIMARY KEY,
  student_name VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS borrowed_books (
  borrow_id INT AUTO_INCREMENT PRIMARY KEY,
  b_book_ID VARCHAR(10),
  b_student_id INT,
  borrowed_date DATETIME,
  due_date DATETIME,
  return_date DATETIME DEFAULT NULL,
  FOREIGN KEY (b_book_ID) REFERENCES books(book_ID),
  FOREIGN KEY (b_student_id) REFERENCES students(student_id)
);
-- A. Track Currently Borrowed Books
SELECT * FROM books
JOIN borrowed_books ON b_book_ID = book_ID
WHERE return_date IS NULL;

-- B. List Overdue Books
SELECT * FROM borrowed_books
WHERE due_date < CURDATE();

-- C. Return a Book
UPDATE books 
SET Status = 'Available' 
WHERE book_ID = '001';

--  D. List All Borrow History
SELECT borrow_id, b_book_ID, b_student_id, borrowed_date, due_date, return_date 
FROM borrowed_books
JOIN books ON b_book_ID = book_ID
JOIN students ON b_student_id = student_id;