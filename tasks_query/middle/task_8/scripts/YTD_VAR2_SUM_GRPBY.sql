SELECT   TRUNC(sale_date,'MM') month
            ,SUM(amount) sum_amount
FROM sales
WHERE TRUNC(sale_date,'DD') BETWEEN '01.01.2026' and TRUNC(SYSDATE,'MM')
GROUP BY  TRUNC(sale_date,'MM')
ORDER BY sum_amount;