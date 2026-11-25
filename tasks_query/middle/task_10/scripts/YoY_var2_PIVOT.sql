/*((Текущее значение - Значение год назад) / Значение год назад) * 100*/
WITH
sales_period AS
    (SELECT TRUNC(sale_date, 'YYYY') AS sale_date--все даты, имеющиеся в таблице sales
                ,amount
    FROM sales
    WHERE TRUNC(sale_date, 'YYYY') BETWEEN TRUNC(TO_DATE('01.01.2025', 'DD.MM.YYYY'), 'yyyy')  AND TRUNC(SYSDATE, 'YYYY')
)
, sum_in_period AS
    (SELECT *  FROM
            (SELECT sale_date,amount
             FROM sales_period )
    PIVOT(
          SUM(NVL(AMOUNT, 0))
            FOR sale_date IN ('01.01.2025' AS "01.01.2025",
            '01.01.2026' AS "01.01.2026" )
    )
)
SELECT ROUND((( "01.01.2026"- "01.01.2025")/NULLIF("01.01.2025", 0))*100) AS YoY
FROM sum_in_period;






