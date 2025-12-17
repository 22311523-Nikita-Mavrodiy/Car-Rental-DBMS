-- ============================================
-- ADDITIONAL SQL QUERIES
-- ============================================

-- Query 8: SUM, COUNT, AVG aggregations on rentals
SELECT 
    SUM(total_amount) AS total_revenue,
    COUNT(*) AS total_rentals,
    ROUND(AVG(total_amount), 2) AS avg_rental_price
FROM rentals;

-- Query 9: AVG with additional statistics
SELECT 
    AVG(total_amount * 1.0) AS avg_rental_price,
    ROUND(AVG(total_amount), 2) AS avg_rental_price_rounded,
    MIN(total_amount) AS cheapest_rental,
    MAX(total_amount) AS most_expensive_rental
FROM rentals;

-- Query 10: Car categories with price classification
SELECT 
    name AS category_name,
    daily_price,
    CASE 
        WHEN daily_price = (SELECT MIN(daily_price) FROM carcategories) THEN 'Lowest Price'
        WHEN daily_price = (SELECT MAX(daily_price) FROM carcategories) THEN 'Highest Price'
        ELSE 'Medium Price'
    END AS price_category,
    ROUND(daily_price * 0.8, 2) AS suggested_weekly_discount,
    ROUND(daily_price * 30, 2) AS estimated_monthly_income
FROM carcategories
ORDER BY daily_price;

-- Query 11: GROUP BY with HAVING and CASE statements
SELECT 
    b.branch_name,
    COUNT(c.car_id) AS total_cars,
    SUM(CASE WHEN c.status = 'Available' THEN 1 ELSE 0 END) AS available_cars,
    SUM(CASE WHEN c.status = 'Rented' THEN 1 ELSE 0 END) AS rented_cars,
    SUM(CASE WHEN c.status = 'Maintenance' THEN 1 ELSE 0 END) AS maintenance_cars
FROM branches b
LEFT JOIN cars c ON b.branch_id = c.branch_id
GROUP BY b.branch_id, b.branch_name
HAVING COUNT(c.car_id) >= 2
ORDER BY total_cars DESC;

-- Query 12: LIKE operator for pattern matching
SELECT first_name, last_name, email, phone
FROM customers
WHERE first_name LIKE 'A%' OR first_name LIKE 'a%'
ORDER BY first_name;

-- Query 13: Date filtering with SQLite DATE function
SELECT * 
FROM rentals
WHERE rental_date >= DATE('now', '-30 days');

-- Query 14: Subquery with IN clause
SELECT first_name, last_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM rentals
    WHERE car_id IN (5, 6)
);

-- Query 15: Subquery in WHERE clause
SELECT *
FROM cars
WHERE status = 'Available'
  AND mileage < (SELECT AVG(mileage) FROM cars);
