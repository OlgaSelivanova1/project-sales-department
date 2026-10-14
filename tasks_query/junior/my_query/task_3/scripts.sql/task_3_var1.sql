/*Найти дубли клиентов по email.*/
SELECT email
            ,COUNT(email) cnt_email
FROM customers
GROUP BY email
HAVING COUNT(email) > 1;