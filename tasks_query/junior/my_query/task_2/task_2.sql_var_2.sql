/*Посчитать количество заказов и уникальных клиентов по дням*/
WITH qnt_client
AS    (SELECT COUNT(quantity) cnt_qnt
                        ,customer_id uniq_client
                        ,TRUNC(sale_date, 'day') sale_date
            FROM sales
            GROUP BY customer_id
                        ,TRUNC(sale_date, 'day')
            ORDER BY sale_date
),
client_date AS
        (SELECT uniq_client--,cnt_qnt
                       ,LISTAGG( sale_date, ',') WITHIN GROUP (ORDER BY sale_date) sale_date
            FROM qnt_client
        GROUP BY uniq_client
)
SELECT  client_date.uniq_client,client_date.sale_date,SUM(cnt_qnt) sum_qnt_all
FROM client_date,qnt_client
WHERE client_date.uniq_client = qnt_client.uniq_client
GROUP BY client_date.uniq_client,client_date.sale_date
ORDER BY client_date.sale_date DESC;