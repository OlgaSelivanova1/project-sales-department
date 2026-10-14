/*Вывести список товаров, которые ни разу не продавались.*/
/*Первый вариантб более быстрый по поиску*/
SELECT product_id,product_name
FROM products prdt
WHERE 
    NOT EXISTS(SELECT  1 FROM sales WHERE prdt.product_id = sales.product_id);
/
/*Второй вариант, рабочий, но не такой быстрый*/
SELECT product_id,product_name
FROM products
WHERE product_id
    NOT IN(SELECT  product_id FROM sales);
