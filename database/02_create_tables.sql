CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    manager_name VARCHAR(100),
    location VARCHAR(100)
);
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    department_id INT,
    designation VARCHAR(100),
    salary DECIMAL(10, 2),
    join_date DATE,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);
CREATE TABLE Projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100),
    budget DECIMAL(12, 2),
    start_date DATE,
    end_date DATE,
    status VARCHAR(30)
);
CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    attendance_date DATE,
    check_in TIME,
    check_out TIME,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);
CREATE TABLE Payroll (
    payroll_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    basic_salary DECIMAL(10, 2),
    bonus DECIMAL(10, 2),
    tax DECIMAL(10, 2),
    net_salary DECIMAL(10, 2),
    salary_month DATE,
    FOREIGN KEY(employee_id) REFERENCES Employees(employee_id)
);
CREATE TABLE Employee_Leaves (
    leave_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    leave_type VARCHAR(50),
    start_date DATE,
    end_date DATE,
    reason TEXT,
    status ENUM('Pending', 'Approved', 'Rejected'),
    FOREIGN KEY(employee_id) REFERENCES Employees(employee_id)
);
CREATE TABLE Performance (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    review_date DATE,
    rating INT CHECK(
        rating BETWEEN 1 AND 5
    ),
    comments TEXT,
    FOREIGN KEY(employee_id) REFERENCES Employees(employee_id)
);