
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
