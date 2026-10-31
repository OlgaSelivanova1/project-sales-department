/*ѕосчитать накопительную выручку по дн€м.*/
SELECT SUM(amount)sum_amount
            ,TRUNC(sale_date, 'dd') day
FROM sales
GROUP BY TRUNC(sale_date, 'dd')
ORDER BY TRUNC(sale_date, 'dd') ASC;
