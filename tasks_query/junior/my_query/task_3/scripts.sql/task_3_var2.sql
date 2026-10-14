/*Найти дубли клиентов по email.*/
/*Если надо вывести информацию о покупателях*/
WITH double_email
AS(
    SELECT email
                ,COUNT(email) cnt_email
    FROM customers
    GROUP BY email
    HAVING COUNT(email) > 1
)
, customers_id 
AS(SELECT email
                ,customer_id
    FROM customers
)
SELECT customer_id,cnt_email,dbl_em.email,cstm_id.email--проверяем email клиентов
FROM double_email dbl_em
            ,customers_id cstm_id
WHERE dbl_em.email = cstm_id.email;