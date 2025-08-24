-- Drop the existing schema if it exists
DROP SCHEMA IF EXISTS library_management;

-- Create the Library Management Database
CREATE DATABASE library_management;

-- Select the library_management database to use
USE library_management;

-- Drop the books table if it exists
DROP TABLE IF EXISTS books;

-- Create the books table to store book details
CREATE TABLE books (
    ISBN VARCHAR(50) PRIMARY KEY,                -- ISBN as unique identifier for the book
    Book_title VARCHAR(255) NOT NULL,            -- Title of the book
    Category VARCHAR(100),                        -- Category/genre of the book
    Rental_Price DECIMAL(3,1),                    -- Rental price for the book
    Status BIT,                                  -- Availability status (1 = Yes, 0 = No)
    Author VARCHAR(255),                         -- Author's name
    Publisher VARCHAR(255)                       -- Publisher's name
);

-- Drop the Customer table if it exists
DROP TABLE IF EXISTS Customer;

-- Create the Customer table to store customer information
CREATE TABLE Customer (
    Customer_id VARCHAR(25) PRIMARY KEY,          -- Unique ID for each customer
    Customer_name VARCHAR(255) NOT NULL,          -- Customer's full name
    Customer_address VARCHAR(255),                 -- Address of the customer
    reg_date DATE                                 -- Date of customer registration
);

-- Drop the Branch table if it exists
DROP TABLE IF EXISTS Branch;

-- Create the Branch table to store branch details
CREATE TABLE Branch (
    Branch_no VARCHAR(20) PRIMARY KEY,             -- Unique branch number
    Manager_id VARCHAR(20),                         -- ID of branch manager
    Branch_address VARCHAR(50),                    -- Address of the branch
    Contact_no VARCHAR(20)                          -- Contact phone number of branch
);

-- Drop the Employee table if it exists (fix syntax 'TABLES' to 'TABLE')
DROP TABLE IF EXISTS Employee;

-- Create the Employee table to store employee details
CREATE TABLE Employee (
    Emp_id VARCHAR(20) PRIMARY KEY,                -- Employee ID as primary key
    Emp_name VARCHAR(50) NOT NULL,                  -- Employee name
    Position VARCHAR(50),                           -- Job position/title
    Salary DECIMAL(10,2),                           -- Salary of the employee
    Branch_no VARCHAR(10)                           -- Branch number employee belongs to
);

-- Drop the Issues table if it exists (fix syntax 'TABLES' to 'TABLE')
DROP TABLE IF EXISTS Issues;

-- Create the Issues table to record book issue transactions
CREATE TABLE Issues (
    Issue_Id VARCHAR(10) PRIMARY KEY,               -- Issue transaction ID
    Issued_cust VARCHAR(10) NOT NULL,                -- Customer ID who issued the book
    Issued_book_name VARCHAR(255) NOT NULL,          -- Name of the issued book
    Issue_date DATE,                                -- Date when the book was issued
    Isbn_book VARCHAR(20)                           -- ISBN of the issued book
);

-- Drop the Returns table if it exists
DROP TABLE IF EXISTS Returns;

-- Create the Returns table to record book return transactions
CREATE TABLE Returns (
    Return_id VARCHAR(10) PRIMARY KEY,              -- Return transaction ID
    Return_cust VARCHAR(10) NOT NULL,                 -- Customer ID who returned the book
    Return_book_name VARCHAR(255) NOT NULL,           -- Name of the returned book
    Return_date DATE,                               -- Date when the book was returned
    isbn_book2 VARCHAR(20)                          -- ISBN of the returned book
);

-- Insert sample data into books table
INSERT INTO books 
    (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
    ('978-0-09-957807-9', 'A Game of Thrones', 'Fantasy', 7.5, 1, 'George R.R. Martin', 'Bantam'),
    ('978-0-14-044930-3', 'The Histories', 'History', 5.5, 1, 'Herodotus', 'Penguin Classics'),
    ('978-0-14-118776-1', 'One Hundred Years of Solitude', 'Literary Fiction', 6.5, 1, 'Gabriel Garcia Marquez', 'Penguin Books'),
    ('978-0-141-44171-6', 'Jane Eyre', 'Classic', 4.0, 0, 'Charlotte Bronte', 'Penguin Classics'),
    ('978-0-19-280551-1', 'The Guns of August', 'History', 7.0, 1, 'Barbara W. Tuchman', 'Oxford University Press'),
    ('978-0-307-37840-1', 'The Alchemist', 'Fiction', 2.5, 1, 'Paulo Coelho', 'HarperOne'),
    ('978-0-307-58837-1', 'Sapiens: A Brief History of Humankind', 'History', 8.0, 0, 'Yuval Noah Harari', 'Harper Perennial'),
    ('978-0-330-25864-8', 'Animal Farm', 'Classic', 5.5, 1, 'George Orwell', 'Penguin Books'),
    ('978-0-375-41398-8', 'The Diary of a Young Girl', 'History', 6.5, 1, 'Anne Frank', 'Bantam'),
    ('978-0-393-05081-8', 'A People''s History of the United States', 'History', 9.0, 1, 'Howard Zinn', 'Harper Perennial'),
    ('978-0-393-91257-8', 'Guns, Germs, and Steel: The Fates of Human Societies', 'History', 7.0, 1, 'Jared Diamond', 'W. W. Norton & Company'),
    ('978-0-525-47535-5', 'The Great Gatsby', 'Classic', 8.0, 1, 'F. Scott Fitzgerald', 'Scribner'),
    ('978-0-553-29698-2', 'The Catcher in the Rye', 'Classic', 7.0, 1, 'J.D. Salinger', 'Little, Brown and Company'),
    ('978-0-679-76489-8', 'Harry Potter and the Sorcerer''s Stone', 'Fantasy', 7.0, 1, 'J.K. Rowling', 'Scholastic'),
    ('978-0-7432-4722-4', 'The Da Vinci Code', 'Mystery', 8.0, 1, 'Dan Brown', 'Doubleday'),
    ('978-0-7432-7357-1', '1491: New Revelations of the Americas Before Columbus', 'History', 6.5, 0, 'Charles C. Mann', 'Vintage Books');

-- Select all records from books
SELECT * FROM books;

-- Insert sample data into Customer table
INSERT INTO Customer 
    (Customer_id, Customer_name, Customer_address, reg_date) VALUES
    ('C101', 'Alice Johnson', '123 Main St', '2021-05-15'),
    ('C102', 'Bob Smith', '456 Elm St', '2021-06-20'),
    ('C103', 'Carol Davis', '789 Oak St', '2021-07-10'),
    ('C104', 'Dave Wilson', '567 Pine St', '2021-08-05'),
    ('C105', 'Eve Brown', '890 Maple St', '2021-09-25'),
    ('C106', 'Frank Thomas', '234 Cedar St', '2021-10-15'),
    ('C107', 'Grace Taylor', '345 Walnut St', '2021-11-20'),
    ('C108', 'Henry Anderson', '456 Birch St', '2021-12-10'),
    ('C109', 'Ivy Martinez', '567 Oak St', '2022-01-05'),
    ('C110', 'Jack Wilson', '678 Pine St', '2022-02-25');

-- Select all records from Customer
SELECT * FROM Customer;

-- Insert sample data into Branch table
INSERT INTO Branch
    (Branch_no, Manager_id, Branch_address, Contact_no) VALUES
    ('B001', 'M101', '123 Main St', '+919099988676'),
    ('B002', 'M102', '456 Elm St', '+919099988677'),
    ('B003', 'M103', '789 Oak St', '+919099988678'),
    ('B004', 'M104', '567 Pine St', '+919099988679'),
    ('B005', 'M105', '890 Maple St', '+919099988680');

-- Select all records from Branch
SELECT * FROM Branch;

-- Insert sample data into Employee table
INSERT INTO Employee
    (Emp_id, Emp_name, Position, Salary, Branch_no) VALUES
    ('E101', 'John Doe', 'Manager', 60000, 'B001'),
    ('E102', 'Jane Smith', 'Clerk', 45000, 'B001'),
    ('E103', 'Mike Johnson', 'Librarian', 55000, 'B001'),
    ('E104', 'Emily Davis', 'Assistant', 40000, 'B001'),
    ('E105', 'Sarah Brown', 'Assistant', 42000, 'B002'),
    ('E106', 'Michelle Ramirez', 'Assistant', 43000, 'B003'),
    ('E107', 'Michael Thompson', 'Manager', 62000, 'B002'),
    ('E108', 'Jessica Taylor', 'Clerk', 46000, 'B002'),
    ('E109', 'Daniel Anderson', 'Librarian', 57000, 'B002'),
    ('E110', 'Laura Martinez', 'Assistant', 41000, 'B004'),
    ('E111', 'Christopher Lee', 'Manager', 65000, 'B003');

-- Select all records from Employee
SELECT * FROM Employee;

-- Insert sample data into Issues table
INSERT INTO Issues 
    (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
    ('IS101', 'C101', 'The Catcher in the Rye', '2023-05-01', '978-0-553-29698-2'),
    ('IS102', 'C102', 'The Da Vinci Code', '2023-05-02', '978-0-7432-4722-4'),
    ('IS103', 'C103', '1491: New Revelations of the Americas Before Columbus', '2023-05-03', '978-0-7432-7357-1'),
    ('IS104', 'C104', 'Sapiens: A Brief History of Humankind', '2023-05-04', '978-0-307-58837-1'),
    ('IS105', 'C105', 'The Diary of a Young Girl', '2023-05-05', '978-0-375-41398-8');

-- Select all records from Issues
SELECT * FROM Issues;

-- Insert sample data into Returns table
INSERT INTO Returns 
    (Return_id, Return_cust, Return_book_name, Return_date, isbn_book2) VALUES
    ('RS101', 'C101', 'The Catcher in the Rye', '2023-06-06', '978-0-553-29698-2'),
    ('RS102', 'C102', 'The Da Vinci Code', '2023-06-07', '978-0-7432-4722-4'),
    ('RS103', 'C105', 'The Diary of a Young Girl', '2023-06-08', '978-0-375-41398-8'),
    ('RS104', 'C108', 'The Histories', '2023-06-09', '978-0-14-044930-3'),
    ('RS105', 'C110', 'A Game of Thrones', '2023-06-10', '978-0-09-957807-9');

-- Select all records from Returns
SELECT * FROM Returns;

/*
1. Get every book that is available right now (Status = 1).
2. List every client who signed up after January 1, 2022.
3. Display every worker in branch 'B002'.
4. Locate every book written by "George Orwell."
5. Provide the phone numbers, address for each branch.
6. List all of the rental prices for books in the "History" category, arranged from highest to lowest.
7. Get every customer arranged by the date of registration (newest first).
8. Show every employee who makes more than $50,000.
9. Display every book with the term "History" in the title.
10. List every branch on "Main St."
11. List every book that has been issued, together with the name of the customer and the date of issue.
12. Locate every book that has been borrowed but hasn't been returned yet.
13. Display each employee's name and branch address.
14. Show the total number of books that each customer has been supplied.
15. Enumerate every client who has checked out more than three books.
16. Determine how many books there are in each category overall.
17. Determine the average pay for each branch's staff.
18. Determine which branch employs the most people.
19. Determine the total number of books published in May 2023.
20. If every book was rented once, figure out the total rental income.
21. Look for clients who have never sent back a book after receiving one.
22. List workers who make more than the average income for all workers.
23. Locate the book that is issued the most frequently.
24. Display the branches without a manager assigned to them (Manager_id is null or not in Employee).
25. Show the number of consumers and the number of books they have issued so far (assuming none have been returned).
*/

-- Q1. Get every book that is available right now (Status = 1).
SELECT
	*
FROM
	books
WHERE
	Status = 1;
    
-- Q2. List every client who signed up after January 1, 2022.
SELECT
	*
FROM
	Customer
WHERE
	reg_date > '2022-01-01';
    
-- Q3. Display every worker in branch 'B002'.
SELECT
	*
FROM 
	Employee
WHERE
	Branch_no = 'B002';

-- Q4. Locate every book written by "George Orwell."
SELECT
	*
FROM
	books
WHERE
	Author = 'George Orwell';
	
-- Q5. Provide the phone numbers, address for each branch
SELECT
	Branch_no,
    Branch_address,
    Contact_no
FROM 
	Branch;
    
-- 	Q6. List all of the rental prices for books in the "History" category, arranged from highest to lowest.

SELECT
	Book_title,
	Rental_Price
FROM
	books
WHERE
	Category = 'History'
ORDER BY
	Rental_Price DESC;
    
-- Q7. Get every customer arranged by the date of registration (newest first)

SELECT 
	Customer_name,
    reg_date
FROM
	Customer
ORDER BY
	reg_date DESC;
    
-- Q8. Show every employee who makes more than $50,000
SELECT 
	* 
FROM 
	Employee 
WHERE 
Salary > 50000;

-- Q9. Display every book with the term "History" in the title.
SELECT 
	* 
FROM 
	books 
WHERE 
	Book_title LIKE '%History%';

-- Q10. List every branch on "Main St"
SELECT 
	* 
FROM 
	Branch 
WHERE 
	Branch_address LIKE '%Main St%';

-- Q11. List every book that has been issued, together with the name of the customer and the date of issue.
SELECT
	i.Issue_id,
    c.Customer_name,
	i.Issued_book_name,
    i.Issue_date
FROM
	Issues i
JOIN
	Customer c
ON
	c.Customer_Id = i.Issued_cust;
	
-- Q12. Locate every book that has been borrowed but hasn't been returned yet.
SELECT 
	i.Issue_Id, 
	i.Issued_book_name, 
	i.Issue_date, 
    i.Issued_cust
FROM 
	Issues i
LEFT JOIN 
	Returns r 
ON 
	i.Isbn_book = r.isbn_book2 AND i.Issued_cust = r.Return_cust
WHERE 
	r.Return_id IS NULL;


-- Q13. Display each employee's name and branch address.
SELECT
	e.Emp_name,
    b.Branch_address
FROM
	Employee e
JOIN
	branch b
ON
	e.Branch_no = b.Branch_no;
  

-- Q14. Show the total number of books that each customer has been supplied.
SELECT 
	Issued_cust, 
    COUNT(*) AS Books_Issued
FROM 
	Issues
GROUP BY 
	Issued_cust;

-- Q15. List every client who has checked out more than three books.
SELECT 
	Issued_cust, 
	COUNT(*) AS Total_Books
FROM 
	Issues
GROUP BY Issued_cust
HAVING 
	COUNT(*) > 3;

-- Q16. Determine how many books there are in each category overall.
SELECT
	Category,
    COUNT(*) AS Book_count
FROM
	books
GROUP BY
	Category;

-- Q17. Determine the average pay for each branch's staff.
SELECT
	Branch_no,
    ROUND(AVG(Salary),2) as Average_Salary_each_branch
FROM
	Employee
Group BY
	Branch_no;

-- Q18. Determine which branch employs the most people.
SELECT 
	Branch_no, 
	COUNT(*) AS Employee_Count
FROM 
	Employee
GROUP BY 
	Branch_no
ORDER BY 
	Employee_Count DESC
LIMIT 1;


-- Q19. Determine the total number of books published in May 2023.
SELECT 
	COUNT(*) AS Books_Issued_May_2023
FROM 
	Issues
WHERE 
	YEAR(Issue_date) = 2023 AND MONTH(Issue_date) = 5;
    
-- Q20. If every book was rented once, figure out the total rental income.
SELECT 
	SUM(Rental_Price) AS Total_Rental_Revenue 
FROM books;


-- Q21. Look for clients who have never sent back a book after receiving one.
SELECT DISTINCT 
	i.Issued_cust
FROM 
	Issues i
LEFT JOIN 
	Returns r 
ON i.Issued_cust = r.Return_cust AND i.Isbn_book = r.isbn_book2
WHERE 
	r.Return_id IS NULL;

-- Q22. List workers who make more than the average income for all workers.
SELECT 
	*
FROM 
	Employee
WHERE 
	Salary > (SELECT AVG(Salary) FROM Employee);
    
    
-- Q23. Locate the book that is issued the most frequently.
SELECT 
	Issued_book_name, 
	COUNT(*) AS Issue_Count
FROM 
	Issues
GROUP BY 
	Issued_book_name
ORDER BY 
	Issue_Count DESC
LIMIT 1;

-- Q24. Display the branches without a manager assigned to them (Manager_id is null or not in Employee).
SELECT 
    b.Branch_no, b.Branch_address
FROM
    Branch b
        LEFT JOIN
    Employee e ON b.Manager_id = e.Emp_id
WHERE
    b.Manager_id IS NULL OR e.Emp_id IS NULL;
    
-- Q25. Show the number of consumers and the number of books they have issued so far (assuming none have been returned).
SELECT 
    i.Issued_cust, COUNT(*) AS Currently_Issued_Books
FROM
    Issues i
        LEFT JOIN
    Returns r ON i.Issued_cust = r.Return_cust
        AND i.Isbn_book = r.isbn_book2
WHERE
    r.Return_id IS NULL
GROUP BY i.Issued_cust;

