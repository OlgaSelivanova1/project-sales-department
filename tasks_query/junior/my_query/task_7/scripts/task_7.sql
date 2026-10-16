/*Посчитать долю каждой категории в общей выручке.*/
/*Операция: Вычисление процентной доли от целого*/
/*Для начала выислим основную сумму(выручку всех покупок) и разобьем на сумму покупок по каждой категории*/
SELECT category_id
            ,SUM(amount) over () sum_amount
            ,SUM(amount) over (partition by category_id) sum_mnt_ctr
FROM sales
/
/*Во внешнем запросе вычисляем %-ую долю суммы каждой категории от общей суммы покупок*/
/*Применяем distinct для удаления дубликатов строк и round для округления суммы % до 2 после запятой*/
SELECT  DISTINCT category_id
             ,ROUND( ( (sum_mnt_ctr / sum_amount)* 100), 2) AS pct
FROM(
SELECT category_id
            ,SUM(amount) over () sum_amount
            ,SUM(amount) over (partition by category_id) sum_mnt_ctr
FROM sales
);