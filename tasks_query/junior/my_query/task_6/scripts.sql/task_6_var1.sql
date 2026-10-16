/*Ќайти клиентов, которые не совершали покупок последние N дней*/
/*«а n-дней возьмем 30 дней*/
/*–азбивка задачи*/
/*ƒл€ начала вычислим последние 30 дней использу€ стандартный оператор вычитани€*/
SELECT (sysdate - 30) min_date
             ,sysdate max_date
FROM sales;
/
/*выберем клиентов, которые вход€т в эти дни покупок*/
SELECT customer_id,sale_date
FROM sales
WHERE sale_date BETWEEN (sysdate - 30) AND sysdate;
/*¬ыведем всех клиентов из customers.tbl*/
SELECT customer_id
FROM customers;
/*«ададим проверку на равенство вхождени€ в период и отсечем клиентов,совершивших покупки за последние 30 дней*/
SELECT customer_id
FROM customers cstm
WHERE NOT EXISTS(SELECT 1
                                    FROM sales
                                    WHERE sale_date BETWEEN (sysdate - 30) AND sysdate
and cstm.customer_id = sales.customer_id
);