CREATE DATABASE Shippingdata;
USE Shippingdata;
CREATE TABLE ShippingData (shipping_id INT PRIMARY KEY, ship_mode VARCHAR(25), sales DECIMAL(8, 2), profit DECIMAL(8, 2), surcharge DECIMAL(4, 2),total_cost DECIMAL(10, 2));
INSERT INTO ShippingData (shipping_id, ship_mode, sales, profit, surcharge, total_cost) VALUES 
(1, 'Same Day', 100, 20, 0.2, 84),
(2, 'First Class', 150, 30, 0.1, 123),
(3, 'Standard Class', 200, 40, 0.05, 190);
SELECT * from Shippingdata;
SELECT
    *,
    CASE
        WHEN ship_mode = 'Same Day' THEN 0.2
        WHEN ship_mode = 'First Class' THEN 0.1
        WHEN ship_mode = 'Standard Class' THEN 0.05
        ELSE 0
    END AS surcharge,
    (sales - profit) * (1 + 
        CASE
            WHEN ship_mode = 'Same Day' THEN 0.2
            WHEN ship_mode = 'First Class' THEN 0.1
            WHEN ship_mode = 'Standard Class' THEN 0.05
            ELSE 0
        END
    ) AS total_cost
FROM Shippingdata;
