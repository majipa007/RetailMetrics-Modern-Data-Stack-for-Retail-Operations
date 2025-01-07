-- procedure for recording sale

CREATE OR REPLACE PROCEDURE record_sale(
    p_store_id INT, 
    p_customer_id INT, 
    p_employee_id INT, 
    p_product_list JSON
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_sale_id INT;
    v_product JSON;
    v_product_id INT;
    v_quantity INT;
    v_total DECIMAL(10, 2) := 0; -- Initialize total to zero
BEGIN
    -- Insert sale record and get sale_id
    INSERT INTO sale (store_id, customer_id, employee_id, sale_date, total_amount)
    VALUES (p_store_id, p_customer_id, p_employee_id, CURRENT_DATE, 0.00) 
    RETURNING sale_id INTO v_sale_id;

    -- Loop through each product in the product_list
    FOR v_product IN SELECT * FROM json_array_elements(p_product_list)
    LOOP
        v_product_id := v_product->>'product_id';
        v_quantity := (v_product->>'quantity')::INT;

        -- Check inventory before processing the sale item
        IF (SELECT quantity FROM inventory WHERE store_id = p_store_id AND product_id = v_product_id) < v_quantity THEN
            RAISE EXCEPTION 'Insufficient stock for product_id: %', v_product_id;
        END IF;

        -- Insert into sale_item
        INSERT INTO sale_item (sale_id, product_id, quantity, price)
        VALUES (v_sale_id, v_product_id, v_quantity, (SELECT price FROM product WHERE product_id = v_product_id));

        -- Calculate total price for this product
        v_total := v_total + (SELECT price FROM product WHERE product_id = v_product_id) * v_quantity;

        -- Update inventory (deduct stock)
        UPDATE inventory
        SET quantity = quantity - v_quantity
        WHERE store_id = p_store_id AND product_id = v_product_id;
    END LOOP;

    -- Update the total value in the sale record
    UPDATE sale
    SET total_amount = v_total
    WHERE sale_id = v_sale_id;  -- Use sale_id to identify the correct sale

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;  -- Rollback on error
        RAISE NOTICE 'Transaction failed. Rolled back: %', SQLERRM; -- Log the error message
END;
$$;


-- CALL record_sale(
--     1,  -- p_store_id (replace with a valid store ID)
--     2,  -- p_customer_id (replace with a valid customer ID)
--     3,  -- p_employee_id (replace with a valid employee ID)
--     '[{"product_id": 1, "quantity": 2}, {"product_id": 2, "quantity": 1}]'  -- p_product_list
-- );


-- procedure for adding product to inventory

CREATE OR REPLACE PROCEDURE add_to_inventory(
	p_store_id int, 
	p_product_id int, 
	p_quantity int
)
LANGUAGE plpgsql
AS $$
BEGIN
	-- checking if the product exists
	IF EXISTS (SELECT 1 FROM inventory where store_id = p_store_id AND product_id = p_product_id) THEN
		UPDATE inventory 
		SET quantity = quantity + p_quantity
		WHERE store_id = p_store_id AND product_id = p_product_id;
	ELSE
		INSERT INTO inventory (store_id, product_id, quantity)
		VALUES (p_store_id, p_product_id, p_quantity);
	END IF;
END;
$$;


-- CALL add_to_inventory(
-- 1, --p_store_id
-- 2, --p_product_id
-- 100 --p_quantity
-- );
select * from inventory;