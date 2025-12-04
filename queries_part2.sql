SELECT SUM(total_amount) AS total_revenue
FROM rentals;

SELECT AVG(total_amount) AS avg_rental_price
FROM rentals;


SELECT 
    MIN(daily_price) AS cheapest_category,
    MAX(daily_price) AS most_expensive_category
FROM carcategories;


SELECT branch_id, COUNT(*) AS total_cars
FROM cars
GROUP BY branch_id
HAVING COUNT(*) > 3;


SELECT first_name, last_name
FROM customers
WHERE first_name LIKE 'A%';


SELECT *
FROM rentals
WHERE rental_date >= CURRENT_DATE - INTERVAL '30 days';


SELECT first_name, last_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM rentals
    JOIN cars ON rentals.car_id = cars.car_id
    WHERE cars.category_id = (
        SELECT category_id FROM carcategories WHERE name = 'SUV'
    )
);

SELECT *
FROM cars
WHERE status = 'available'
  AND mileage < (
        SELECT AVG(mileage)
        FROM cars
    );