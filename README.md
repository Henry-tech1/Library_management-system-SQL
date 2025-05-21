# Library Management System

## Overview

The Library Management System is designed to manage books, students, and book borrowing processes efficiently. It allows librarians to track book availability, manage student records, and monitor borrowed books.

## Database Schema

### Tables

1. **books**
   - `book_ID`: Unique identifier for each book (Primary Key).
   - `Title`: Title of the book.
   - `Author`: Author of the book.
   - `Category`: Category of the book.
   - `Cabinet`: Cabinet number where the book is stored.
   - `Rack`: Rack number where the book is stored.
   - `Row`: Row number where the book is stored.
   - `Signal_Strength`: Signal strength for tracking the book.
   - `Timestamp`: Timestamp when the book record was created.
   - `Status`: Status of the book (e.g., Available, Borrowed).

2. **students**
   - `student_id`: Unique identifier for each student (Primary Key).
   - `student_name`: Name of the student.

3. **borrowed_books**
   - `borrow_id`: Unique identifier for each borrow record (Primary Key, Auto Increment).
   - `b_book_ID`: Book ID associated with the borrow record (Foreign Key).
   - `b_student_id`: Student ID associated with the borrow record (Foreign Key).
   - `borrowed_date`: Date when the book was borrowed.
   - `due_date`: Due date for returning the book.
   - `return_date`: Date when the book was returned (NULL if not returned yet).

## SQL Queries

### A. Track Currently Borrowed Books

To track books that are currently borrowed and not yet returned:

```sql
SELECT * FROM books
JOIN borrowed_books ON b_book_ID = book_ID
WHERE return_date IS NULL;

### B. List Overdue Books

To list books that are overdue:
SELECT * FROM borrowed_books
WHERE due_date < CURDATE();

### C. Return a Book
To update the status of a book when it is returned:

UPDATE books
SET Status = 'Available'
WHERE book_ID = '001';

### D. List All Borrow History
To list the complete borrow history:

SELECT borrow_id, b_book_ID, b_student_id, borrowed_date, due_date, return_date
FROM borrowed_books
JOIN books ON b_book_ID = book_ID
JOIN students ON b_student_id = student_id;


## Usage

### Create the Database and Tables:

Run the SQL scripts to create the database and tables.

### Insert Data:

Populate the tables with book and student data.

### Manage Borrowed Books:

Use the provided queries to track borrowed books, list overdue books, return books, and view borrow history.

## Contributing
Contributions are welcome! Please fork the repository and submit a pull request with your changes.
