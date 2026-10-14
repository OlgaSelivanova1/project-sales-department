ALTER TABLE products
ADD (
        customer_id NUMBER,
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);
