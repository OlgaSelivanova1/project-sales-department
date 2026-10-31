/*Найти топ-3 товара по выручке внутри каждой категории.*/
SELECT category_id, product_id,sum_amount
FROM(
SELECT SUM(amount) sum_amount
            ,category_id, product_id
            ,ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY SUM(amount) DESC) rwn
FROM sales
GROUP BY category_id, product_id
)
WHERE rwn <=3
ORDER BY sum_amount DESC;