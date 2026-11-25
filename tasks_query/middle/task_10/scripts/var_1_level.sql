WITH all_months_in2year AS(
SELECT start_pre_4yoy, end_pre_4yoy
            /*выводим все месяцы в 2 годах, даже когда не было продаж*/
              , add_months(start_pre_4yoy, LEVEL-1) all_month_2year
               ,start_now_4yoy
              ,end_now_4yoy
FROM(/*Первый запрос: находим начало.конец периода, который берем за расчет*/
        SELECT /*чтобы в выборку попал именно первый месяц прошлого года*/
                    /*Находим период, который был первым месяцем начала финансового отчета*/
                    add_months(max(trunc(sale_date, 'yyyy')), -12) start_pre_4yoy
                    /*Находим период, который был год назад, выводим  месяц для конечного выбора периода в расчетах*/
                   ,add_months(TRUNC(sysdate, 'mm'),-12) end_pre_4yoy
                    /*Находим период, который был первым в текущем отчетном периоде*/
                    ,TRUNC(sysdate, 'YYYY') start_now_4yoy
                    /*Находим период, который является текущим месяцем на момент расчета(в зависимости от поставленной задачи периоды могут корректироваться)*/
                   ,TRUNC(sysdate, 'mm') end_now_4yoy                  
        FROM sales
        )
        CONNECT BY LEVEL <= MONTHS_BETWEEN(end_now_4yoy,start_pre_4yoy)+1
),
div_periods AS
    (SELECT all_month_2year sale_date
                ,(CASE WHEN  TRUNC(SALE_DATE, 'MM') >= start_pre_4yoy 
                                        AND TRUNC(SALE_DATE, 'MM')  <=  end_pre_4yoy
                        THEN COALESCE( amount,0) ELSE 0 END
                ) AS amount_2025
                ,(CASE WHEN  TRUNC(SALE_DATE, 'MM') >= start_now_4yoy 
                                    AND TRUNC(SALE_DATE, 'MM')  <=  end_now_4yoy
                        THEN COALESCE( amount,0) ELSE 0 END
                ) AS amount_2026
    FROM all_months_in2year
LEFT JOIN SALES
    ON  TRUNC(sales.sale_date,'MM') = all_month_2year 
     AND TRUNC(sales.sale_date,'MM') < ADD_MONTHS(end_now_4yoy, 1)

)
SELECT ROUND(( (amount_2026 - amount_2025) / amount_2025*100),0) AS YoY
FROM(
    SELECT SUM(amount_2026) amount_2026 ,SUM(amount_2025) amount_2025
    FROM div_periods
);
