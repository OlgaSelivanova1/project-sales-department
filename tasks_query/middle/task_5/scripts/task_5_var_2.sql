/*Ќайти непрерывные периоды продаж без пропусков дат.*/
/*ѕри таком варианте с функцией ROW_NUMBER мы увидем  только мин-макс значени€ каждого диапазона дат покупок по каждому товару*/
with unique_date as(
SELECT DISTINCT product_id
            , trunc(sale_date, 'dd') start_saled             
FROM sales
), rw_date AS
   ( SELECT product_id,start_saled
                ,start_saled - TO_CHAR(ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY start_saled)) rw
    FROM unique_date
)
SELECT product_id
            ,MIN(start_saled) start_saled
            ,MAX(start_saled) end_saled
FROM rw_date
GROUP BY product_id,rw
HAVING COUNT(rw) > 1
ORDER BY product_id,start_saled;