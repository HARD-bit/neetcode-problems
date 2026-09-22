-- Write your query below
SELECT *
FROM (
SELECT sale_date, sold_num - LEAD(sold_num) OVER(PARTITION BY sale_date ORDER BY fruit) AS diff
FROM sales
) AS t
WHERE diff IS NOT NULL