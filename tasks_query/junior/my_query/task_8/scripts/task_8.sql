/* Вывести топ-10 клиентов по сумме покупок.*/
/*Операция МОДА: элемент с наибоьшим вхождений в рассматриваемый набор данных*/

/*Для начала найдем суммы покупок каждого клиента*/
SELECT SUM(amount) sum_amount_cst
             ,customer_id
FROM sales
GROUP BY customer_id;
/ 
/*Проранжируем каждую сумму DENSE_RANK() OVER (order by sum_amount_cst desc) AS rnk*/
SELECT customer_id
            ,sum_amount_cst
             ,DENSE_RANK() OVER (order by sum_amount_cst desc) AS rnk
FROM(
SELECT SUM(amount) sum_amount_cst
             ,customer_id
FROM sales
GROUP BY customer_id
);
/
/*Выведем топ-10 клиентов WHERE rnk <= 10*/
SELECT customer_id,sum_amount_cst
FROM(
            SELECT customer_id,sum_amount_cst
                         ,DENSE_RANK() OVER (order by sum_amount_cst desc) AS rnk
                          --,RANK() OVER (order by sum_amount_cst desc) AS rnk2
                          --  ,ROW_NUMBER () OVER (order by sum_amount_cst desc) AS rnk3
            FROM(
            SELECT SUM(amount) sum_amount_cst
                         ,customer_id
            FROM sales
            GROUP BY customer_id)
)
WHERE rnk <= 10
ORDER BY sum_amount_cst ASC,customer_id;
/
/*Из-за одинаковых сумм покупок ранжирование принимает клиентов за ОДНОГО*/
/*ЕСЛИ НАДО ПОЛУЧИТЬ СТРОГО 10*/
SELECT customer_id,sum_amount_cst
FROM(
            SELECT customer_id,sum_amount_cst
                         ,DENSE_RANK() OVER (order by sum_amount_cst desc) AS rnk
                          --,RANK() OVER (order by sum_amount_cst desc) AS rnk2
                          --  ,ROW_NUMBER () OVER (order by sum_amount_cst desc) AS rnk3
            FROM(
            SELECT SUM(amount) sum_amount_cst
                         ,customer_id
            FROM sales
            GROUP BY customer_id)
)
WHERE rnk <= 10
ORDER BY sum_amount_cst ASC,customer_id
FETCH FIRST 10 ROWS ONLY;