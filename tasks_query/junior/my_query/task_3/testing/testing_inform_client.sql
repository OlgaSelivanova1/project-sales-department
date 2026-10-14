/*Найти дубли клиентов по email.*/
SELECT email
            ,customer_id--выводим инфу о клиентах
            ,COUNT(email) cnt_email
FROM customers
GROUP BY email,customer_id
HAVING COUNT(email) > 1;