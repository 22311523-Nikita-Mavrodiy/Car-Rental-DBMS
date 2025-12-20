INSERT INTO customers (customer_id, first_name, last_name, email, phone, driver_license, created_at) VALUES
(1, 'John', 'Smith', 'john@mail.com', '55510001', 'DL1001', NOW()),
(2, 'Emma', 'Stone', 'emma@mail.com', '55510002', 'DL1002', NOW()),
(3, 'Adam', 'Brown', 'adam@mail.com', '55510003', 'DL1003', NOW()),
(4, 'Layla', 'Haddad', 'layla@mail.com', '55510004', 'DL1004', NOW()),
(5, 'Karim', 'Said', 'karim@mail.com', '55510005', 'DL1005', NOW()),
(6, 'Aisha', 'Noor', 'aisha@mail.com', '55510006', 'DL1006', NOW()),
(7, 'David', 'White', 'david@mail.com', '55510007', 'DL1007', NOW()),
(8, 'Nina', 'Keller', 'nina@mail.com', '55510008', 'DL1008', NOW()),
(9, 'Mert', 'Yilmaz', 'mert@mail.com', '55510009', 'DL1009', NOW()),
(10, 'Chloe', 'Taylor', 'chloe@mail.com', '55510010', 'DL1010', NOW());


INSERT INTO branches (branch_id, branch_name, city, address) VALUES
(1, 'Central Branch', 'Nicosia', '123 Main Street'),
(2, 'Airport Branch', 'Larnaca', 'Larnaca Airport Road'),
(3, 'Harbor Branch', 'Kyrenia', 'Harbor Avenue 45'),
(4, 'City Mall Branch', 'Famagusta', 'City Mall, Level 1');

INSERT INTO carcategories (category_id, name , daily_price)
VALUES
(1, 'Economy',30),
(2, 'SUV',50),
(3, 'Luxury',120),
(4,'Electric',90);


INSERT INTO cars (car_id, model, brand, year, mileage, status, category_id, branch_id) VALUES
(1, 'Corolla', 'Toyota', 2020, 45000, 'Available', 1, 1),
(2, 'Yaris', 'Toyota', 2021, 28000, 'Available', 1, 2),
(3, 'Civic', 'Honda', 2019, 62000, 'Maintenance', 2, 1),
(4, 'Elantra', 'Hyundai', 2022, 15000, 'Available', 2, 3),
(5, 'Sportage', 'Kia', 2021, 35000, 'Rented', 3, 2),
(6, 'Rav4', 'Toyota', 2020, 50000, 'Available', 3, 1),
(7, 'X5', 'BMW', 2022, 20000, 'Available', 4, 4),
(8, 'A6', 'Audi', 2021, 25000, 'Rented', 4, 1),
(9, 'Accord', 'Honda', 2020, 40000, 'Available', 2, 3),
(10, 'Camry', 'Toyota', 2023, 10000, 'Available', 2, 4);


INSERT INTO employees (employee_id, first_name, last_name, position, branch_id) VALUES
(1, 'Nikos', 'Georgiou', 'Manager', 1),
(2, 'Sara', 'Hassan', 'Agent', 1),
(3, 'Ali', 'Khan', 'Agent', 2),
(4, 'Maria', 'Lopez', 'Technician', 3),
(5, 'Omer', 'Demir', 'Agent', 4),
(6, 'Linda', 'Brown', 'Manager', 2);

INSERT INTO rentals (rental_id, customer_id, car_id, employee_id, rental_date, return_date, actual_return_date, total_amount)
VALUES
(1, 1, 1, 2, '2025-01-01', '2025-01-05', '2025-01-05', 120),
(2, 2, 5, 3, '2025-02-10', '2025-02-15', NULL, 300),
(3, 3, 8, 1, '2025-03-01', '2025-03-07', '2025-03-07', 700),
(4, 4, 2, 2, '2025-03-12', '2025-03-15', NULL, 90),
(5, 5, 4, 4, '2025-04-01', '2025-04-05', '2025-04-04', 160),
(6, 6, 6, 1, '2025-04-10', '2025-04-14', '2025-04-14', 240),
(7, 7, 9, 5, '2025-04-20', '2025-04-25', '2025-04-24', 200),
(8, 8, 10, 6, '2025-05-01', '2025-05-03', NULL, 80),
(9, 9, 3, 4, '2025-05-05', '2025-05-10', NULL, 200),
(10, 10, 7, 3, '2025-05-10', '2025-05-14', NULL, 480);


INSERT INTO payments (payment_id, rental_id, payment_date, amount, method) VALUES
(1, 1, '2025-01-05', 120, 'Cash'),
(2, 3, '2025-03-07', 700, 'Card'),
(3, 5, '2025-04-04', 160, 'Card'),
(4, 6, '2025-04-14', 240, 'Cash'),
(5, 7, '2025-04-24', 200, 'Card'),
(6, 8, '2025-05-02', 40, 'Card'),
(7, 2, '2025-02-10', 100, 'Cash'),
(8, 9, '2025-05-06', 100, 'Cash'),
(9, 10, '2025-05-11', 480, 'Card'),
(10, 4, '2025-03-12', 90, 'Cash');


INSERT INTO maintenance (maintenance_id, car_id, maintenance_date, description, cost, next_maintenance) VALUES
(1, 3, '2025-01-15', 'Oil change', 50, '2025-04-15'),
(2, 6, '2025-01-20', 'Engine check', 150, '2025-06-20'),
(3, 1, '2025-02-05', 'Tire replacement', 200, '2025-09-05'),
(4, 9, '2025-02-10', 'Brake check', 80, '2025-05-10'),
(5, 4, '2025-03-01', 'Filter change', 40, '2025-06-01'),
(6, 10, '2025-03-12', 'Battery replacement', 120, '2025-09-12'),
(7, 2, '2025-04-01', 'Full inspection', 300, '2025-10-01'),
(8, 5, '2025-04-11', 'Suspension repair', 250, '2025-09-11'),
(9, 7, '2025-04-25', 'Oil change', 60, '2025-07-25'),
(10, 8, '2025-05-01', 'Transmission check', 350, '2025-11-01');

UPDATE cars
SET status = 'Available'
WHERE car_id=4;


DELETE FROM payments
WHERE  payment_id = 10;
