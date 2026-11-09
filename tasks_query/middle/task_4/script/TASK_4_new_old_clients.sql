/*Разделить клиентов на новых и старых(возвращающихся) по месяцам*/
WITH clients_status AS
(
    SELECT customer_id
            ,sale_moths
            /*Подсчитаем количество строк по клиентам*/
            /*Таким образом, вычислим, кто делал покупку в нескольких последовательных месяцах*/
            ,COUNT(*) OVER (PARTITION BY customer_id) cnt_row_clnts
    FROM(
    /*Для начала выведем покупателей и месяцы покупок*/
            SELECT DISTINCT customer_id
           /* Округлим дату типа timestamp до месяца*/
                        ,TRUNC(sale_date, 'MM') sale_moths
            FROM sales
            /*Выберем период(пусть будет с 09 по 11)*/
            WHERE TRUNC(sale_date, 'MM') >= ADD_MONTHS(TRUNC(sysdate, 'MM'), - 2)
)
    ORDER BY customer_id,sale_moths
)
SELECT customer_id
            ,sale_moths
            /*Переименуем столбец cnt_row_clnts в status и писвоим согласно количеству строк по каждому клиенту*/
            ,(CASE WHEN cnt_row_clnts > 1 THEN  'Старый клиент' ELSE  'Новый клиент' END) status
FROM clients_status;