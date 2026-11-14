/*Сделать PIVOT: выручка по кварталам в разрезе товаров.*/
/*Кросс-табличный отчет*/
SELECT product_id,
            NVL(I, 0) AS I,
            NVL(II, 0) AS II,
            NVL(III, 0) AS III,
            NVL(IV, 0) AS IV
FROM ( SELECT product_id,amount
           ,TO_CHAR(sale_date, 'Q') AS qrt
         FROM SALES
        WHERE EXTRACT(YEAR FROM sale_date) = '2026')
PIVOT ( 
    SUM(amount)
    FOR qrt IN (
        '1' AS I,
        '2' AS II,
        '3' AS III,
        '4' AS IV
    )
)
;