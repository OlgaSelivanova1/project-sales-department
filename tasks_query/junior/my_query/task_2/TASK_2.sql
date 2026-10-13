/*Посчитать количество заказов и уникальных клиентов по дням*/
SELECT COUNT(quantity) cnt_qnt
            ,customer_id uniq_client
            ,TRUNC(sale_date, 'day') sale_date
FROM sales
GROUP BY customer_id
            ,TRUNC(sale_date, 'day')
ORDER BY sale_date;