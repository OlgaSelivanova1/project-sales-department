/*Ќайти непрерывные периоды продаж без пропусков дат.*/
/*ѕри таком варианте с функцией LEAD мы увидем все даты, вход€щие в непрерывный диапазон*/
with tabl1 as(
/*¬ыведем уникальные строки дат продажи*/
SELECT distinct  product_id
            , trunc(sale_date, 'dd') start_day
        /*— помощью LEAD сделаем сдвиг даты на одну строку вниз по каждому продукту*/
            ,( LEAD(trunc(sale_date, 'dd'), 1) OVER(PARTITION BY product_id ORDER BY trunc(sale_date, 'dd')) 
              ) next_day_saled
FROM sales
)
SELECT product_id,start_day,next_day_saled
FROM tabl1
/*¬ыведем только те строки, где следующа€ дата продажи совпадает с дата первой продажи+1 день*/
WHERE next_day_saled = start_day+1
ORDER BY product_id,start_day;
/