SELECT TRUNC(sale_date, 'month') month_sale
            ,SUM(amount)
FROM sales
GROUP BY TRUNC(sale_date, 'month')
ORDER BY month_sale;
