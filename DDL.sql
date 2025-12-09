CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    driver_license VARCHAR(50) UNIQUE NOT NULL,
    created_at DATE DEFAULT CURRENT_DATE
);

CREATE TABLE CarCategories (
    category_id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    daily_price DECIMAL(10,2) NOT NULL CHECK (daily_price > 0)
);

CREATE TABLE Branches (
    branch_id INTEGER PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    address VARCHAR(150)
);

CREATE TABLE Cars (
    car_id INTEGER PRIMARY KEY,
    model VARCHAR(100) NOT NULL,
    brand VARCHAR(50) NOT NULL,
    year INTEGER CHECK (year >= 1990),
    mileage INTEGER CHECK (mileage >= 0),
    status VARCHAR(20) NOT NULL CHECK (status IN ('Available', 'Rented', 'Maintenance')) DEFAULT 'Available',
    category_id INTEGER NOT NULL,
    branch_id INTEGER NOT NULL,
    FOREIGN KEY (category_id) REFERENCES CarCategories(category_id),
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);

CREATE TABLE Employees (
    employee_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    position VARCHAR(50),
    branch_id INTEGER NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);

CREATE TABLE Rentals (
    rental_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    car_id INTEGER NOT NULL,
    employee_id INTEGER NOT NULL,
    rental_date DATE NOT NULL,
    return_date DATE NOT NULL,
    actual_return_date DATE,
    total_amount DECIMAL(10,2) CHECK (total_amount >= 0),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (car_id) REFERENCES Cars(car_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

CREATE TABLE Payments (
    payment_id INTEGER PRIMARY KEY,
    rental_id INTEGER NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
    method VARCHAR(20) NOT NULL CHECK (method IN ('Cash', 'Card')),
    FOREIGN KEY (rental_id) REFERENCES Rentals(rental_id)
);

CREATE TABLE Maintenance (
    maintenance_id INTEGER PRIMARY KEY,
    car_id INTEGER NOT NULL,
    maintenance_date DATE NOT NULL,
    description VARCHAR(200),
    cost DECIMAL(10,2) CHECK (cost >= 0),
    next_maintenance DATE,
    FOREIGN KEY (car_id) REFERENCES Cars(car_id)
);
