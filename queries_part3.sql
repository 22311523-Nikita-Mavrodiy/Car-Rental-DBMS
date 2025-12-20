SELECT
    rental_id,
    rental_date,
    rental_date + INTERVAL '1 month' AS one_month_after_rental
FROM rentals;

SELECT
    rental_id,
    total_amount,
    CASE
        WHEN total_amount < 100 THEN 'Low Cost'
        WHEN total_amount BETWEEN 100 AND 300 THEN 'Medium Cost'
        ELSE 'High Cost'
    END AS rental_price_category
FROM rentals;


SELECT
    rental_id,
    TO_CHAR(rental_date, 'DD Mon YYYY') AS formatted_rental_date
FROM rentals;
