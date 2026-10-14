/*Составной индекс для быстрого поиска по полям с ID*/
CREATE INDEX idx_sales$tbl_id$column ON sales(sale_id,customer_id,product_id,category_id);