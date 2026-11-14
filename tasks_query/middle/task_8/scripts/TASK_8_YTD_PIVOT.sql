SELECT * FROM
(
  SELECT   TRUNC(sale_date,'MM') month,amount
    FROM sales
    WHERE TRUNC(sale_date,'DD') BETWEEN '01.01.2026' and TRUNC(SYSDATE,'MM')
)
PIVOT
(
  SUM(amount) 
  FOR month  IN ('01.01.2026' as "Январь 2026"
                            ,'01.02.2026' as "Февраль 2026"
                           ,'01.03.2026' as "Март 2026"
                            ,'01.04.2026' as "Апрель 2026"
                            ,'01.05.2026' as "Май 2026"
                            ,'01.06.2026' as "Июнь 2026"
                            ,'01.07.2026' as "Июль 2026"
                             ,'01.08.2026' as "Август 2026"
                             ,'01.09.2026' as "Сентябрь 2026"
                             ,'01.10.2026' as "Октябрь 2026"
                             ,'01.11.2026' as "Ноябрь 2026" )
)
ORDER BY 2 ASC;
/
SELECT  TRUNC(sale_date,'MM') month,amount
    FROM sales
    WHERE TRUNC(sale_date,'DD') BETWEEN '01.01.2026' and TRUNC(SYSDATE,'MM');