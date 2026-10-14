/*Посчитать средний чек по месяцам.*/
SELECT ROUND(avg_amount, 2)
            ,mm_sales
FROM(
SELECT AVG(amount) avg_amount
            ,trunc(sale_date, 'month') mm_sales
FROM sales
GROUP BY trunc(sale_date, 'month')
)
ORDER BY  mm_sales DESC,avg_amount ;
/
/*CTE*/
WITH T1 AS(
SELECT AVG(amount) avg_amount
            ,trunc(sale_date, 'month') mm_sales
FROM sales
GROUP BY trunc(sale_date, 'month')
)
SELECT ROUND(avg_amount, 2)
            ,mm_sales
FROM T1
ORDER BY  mm_sales DESC,avg_amount ;
/
/*Проверка суммы по месяцам*/
SELECT ROUND((sum_amount/cnt_row), 2) avg_amount
            ,mm_sales
FROM(
    SELECT SUM(amount) sum_amount
                    ,COUNT(*) cnt_row
                    ,trunc(sale_date, 'month') mm_sales
    FROM sales
    GROUP BY trunc(sale_date, 'month')
)
ORDER BY  mm_sales DESC,avg_amount ;