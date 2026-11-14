SELECT   DISTINCT TRUNC(sale_date,'MM') month
            ,SUM(amount) OVER (PARTITION BY TRUNC(sale_date,'MM') ORDER BY TRUNC(sale_date,'MM'))sum_amount
FROM sales
WHERE TRUNC(sale_date,'DD') BETWEEN '01.01.2026' and TRUNC(SYSDATE,'MM')
ORDER BY sum_amount;