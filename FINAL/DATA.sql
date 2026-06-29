-- SELECT 
--     st.region,
--     SUM(s.net_amount) AS total_net_revenue,
--     COUNT(s.transaction_id) AS total_transactions,
--     AVG(s.net_amount) AS average_order_value
-- FROM sales s
-- LEFT JOIN Store st ON s.store_id = st.store_id
-- GROUP BY st.region;

-- SELECT 
--     TRIM(p.category) AS clean_category,
--     SUM(s.net_amount) AS total_net_revenue,
--     COUNT(s.transaction_id) AS total_transactions,
--     AVG(s.net_amount) AS average_order_value
-- FROM sales s
-- LEFT JOIN product p ON s.product_id = p.product_id
-- GROUP BY TRIM(p.category);

-- SELECT 
--     TRIM(p.category) AS clean_category,
--     SUM(s.net_amount) AS total_net_revenue
-- FROM sales s
-- LEFT JOIN product p ON s.product_id = p.product_id
-- GROUP BY TRIM(p.category)
-- HAVING SUM(s.net_amount) > 3000000;



-- -- (a) All Luzon sales sorted by net_amount descending
-- SELECT s.*
-- FROM sales AS s
-- JOIN Store AS st ON s.store_id = st.store_id
-- WHERE st.region = 'Luzon'
-- ORDER BY s.net_amount DESC;

-- -- (b) Sales with net_amount between 100 and 500
-- SELECT *
-- FROM sales
-- WHERE net_amount BETWEEN 100 AND 500;

-- -- (c) Sales from three named stores
-- SELECT s.*, st.store_name
-- FROM sales AS s
-- JOIN Store AS st ON s.store_id = st.store_id
-- WHERE st.store_name IN ('Bahaghari Quezon City', 'Bahaghari Makati', 'Bahaghari Manila');

-- -- (d) Products whose names contain a pattern
-- SELECT p.*
-- FROM product AS p
-- WHERE p.product_name LIKE '%Coffee%';
