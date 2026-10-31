WITH 
 new_summnt_month 
            AS (SELECT sale_month
                ,sum_mnt
                , LEAD(sum_mnt, 1) OVER (ORDER BY sale_month ASC) new_month_sum--получаем значение из следующей строки(текущего мес€ца)
                FROM(
                            SELECT SUM(amount) sum_mnt, TRUNC(sale_date, 'mm') sale_month
                            FROM sales
                            GROUP BY TRUNC(sale_date, 'mm')
                            ORDER BY TRUNC(sale_date, 'mm') ASC)
), 
diff_sum_month as
                    (SELECT  sale_month
                                    ,new_month_sum
                                    ,sum_mnt
                                    ,coalesce((new_month_sum - sum_mnt),0) diff
                    FROM new_summnt_month
                   WHERE sale_month < TRUNC(SYSDATE, 'MM')--убираем текущий мес€ц
)
SELECT sale_month--предыдущий мес€ц
            ,new_month_sum--сумма в текущем мес€це
            ,sum_mnt--сумма в прошлом мес€це
           -- ѕримен€ем формулу: (разница/текущее)*100
            ,ROUND(NULLIF((diff / new_month_sum),0)*100, 0) percent_diff--округл€ем процент до целого
FROM diff_sum_month;