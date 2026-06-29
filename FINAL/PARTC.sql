-- -- 16) Region and category summaries (GROUP BY) that should match the pivot outputs

-- -- Region summary: revenue, transaction count, and average order value by region
-- SELECT
--     CASE
--         WHEN TRIM(COALESCE(st.region, '')) = '' THEN 'Unspecified'
--         ELSE TRIM(st.region)
--     END AS region,
--     SUM(s.net_amount) AS total_net_revenue,
--     COUNT(s.transaction_id) AS total_transactions,
--     AVG(s.net_amount) AS average_order_value
-- FROM sales AS s
-- LEFT JOIN Store AS st
--     ON s.store_id = st.store_id
-- GROUP BY
--     CASE
--         WHEN TRIM(COALESCE(st.region, '')) = '' THEN 'Unspecified'
--         ELSE TRIM(st.region)
--     END
-- ORDER BY total_net_revenue DESC;

-- -- Interpretation: This summary shows which region is the main engine of revenue and how often it is generating transactions.
-- -- A region with both high total revenue and a strong average order value is likely a priority market for expansion, staffing, and promotion.

-- -- Category summary: revenue, transaction count, and average order value by product category
-- SELECT
--     CASE
--         WHEN TRIM(COALESCE(p.category, '')) = '' THEN 'Unspecified'
--         ELSE TRIM(p.category)
--     END AS category,
--     SUM(s.net_amount) AS total_net_revenue,
--     COUNT(s.transaction_id) AS total_transactions,
--     AVG(s.net_amount) AS average_order_value
-- FROM sales AS s
-- LEFT JOIN product AS p
--     ON s.product_id = p.product_id
-- GROUP BY
--     CASE
--         WHEN TRIM(COALESCE(p.category, '')) = '' THEN 'Unspecified'
--         ELSE TRIM(p.category)
--     END
-- ORDER BY total_net_revenue DESC;

-- -- Interpretation: This summary identifies which product categories drive the most revenue and whether they are producing healthy basket sizes.
-- -- Categories that lead in both revenue and average value are strong candidates for deeper merchandising, bundle offers, and inventory investment.

-- -- 17) Year-over-year revenue comparison (2024 vs 2025) and one HAVING query
-- SELECT 
--     CASE 
--         WHEN transaction_date LIKE '%2024%' THEN 2024
--         WHEN transaction_date LIKE '%2025%' THEN 2025
--     END AS sales_year,
--     SUM(net_amount) AS total_net_revenue
-- FROM sales
-- WHERE transaction_date LIKE '%2024%' OR transaction_date LIKE '%2025%'
-- GROUP BY 
--     CASE 
--         WHEN transaction_date LIKE '%2024%' THEN 2024
--         WHEN transaction_date LIKE '%2025%' THEN 2025
--     END
-- ORDER BY sales_year;

-- -- Interpretation: This comparison shows whether revenue is growing year over year and by how much, which is critical for judging business momentum.
-- -- A positive change indicates growth, while a strong percentage increase suggests the business is scaling faster than before and may warrant more capacity or marketing support.

-- -- HAVING query: categories with net revenue above ₱3,000,000
-- SELECT
--     CASE
--         WHEN TRIM(COALESCE(p.category, '')) = '' THEN 'Unspecified'
--         ELSE TRIM(p.category)
--     END AS category,
--     SUM(s.net_amount) AS net_revenue
-- FROM sales AS s
-- LEFT JOIN product AS p
--     ON s.product_id = p.product_id
-- GROUP BY
--     CASE
--         WHEN TRIM(COALESCE(p.category, '')) = '' THEN 'Unspecified'
--         ELSE TRIM(p.category)
--     END
-- HAVING SUM(s.net_amount) > 3000000
-- ORDER BY net_revenue DESC;

-- -- Interpretation: The HAVING query highlights the categories that are truly significant contributors to revenue rather than just being present in the data.
-- -- These categories deserve close attention because they are likely driving most of the business value and should remain the focus of inventory, sales, and promotional planning.

