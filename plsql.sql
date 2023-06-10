--declare 
--<declarations section>
--begin
--<execute commands>
--exception
--exception handling
--end;
set serveroutput on
DECLARE
 message VARCHAR(70):='Furniture management system';
BEGIN
 DBMS_OUTPUT.put_line(message);
END;
/
--44 Find max price from furniture table
set serveroutput on
DECLARE
    max_price furniture.price%type;
BEGIN
    SELECT max(price) INTO max_price
    FROM furniture;
    dbms_output.put_line('Maximum price is: ' || max_price);
end;
/
--45 Declare and display the price of a specific furniture item: 




--46.Calculate the discounted price for a furniture item:
SET SERVEROUTPUT ON
DECLARE
    furniture_price furniture.price%TYPE;
    furniture_item furniture.furniture_name%TYPE := 'Sofa';
    discounted_price furniture.price%TYPE;
BEGIN
    SELECT price INTO furniture_price
    FROM furniture
    WHERE furniture_name = furniture_item;

    IF furniture_price < 300 THEN
        discounted_price := furniture_price;
    ELSIF furniture_price < 400 THEN
        discounted_price := furniture_price - (furniture_price * 0.25);
    ELSE
        discounted_price := furniture_price - (furniture_price * 0.35);
    END IF;

    DBMS_OUTPUT.PUT_LINE(furniture_item || ' Price: ' || furniture_price || ' Discounted Price: ' || ROUND(discounted_price, 2));
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/



show errors

-- 47.Calculate the discounted price for a furniture item:

SET SERVEROUTPUT ON

DECLARE
    furniture_price furniture.price%TYPE;
    furniture_name furniture.furniture_name%TYPE := 'Sofa';
    discounted_price furniture.price%TYPE;
BEGIN
    SELECT price INTO furniture_price
    FROM furniture
    WHERE furniture_name = furniture_name
    AND ROWNUM = 1;

    IF furniture_price < 300 THEN
        discounted_price := furniture_price;
    ELSIF furniture_price < 400 THEN
        discounted_price := furniture_price - (furniture_price * 0.25);
    ELSE
        discounted_price := furniture_price - (furniture_price * 0.35);
    END IF;

    DBMS_OUTPUT.PUT_LINE(furniture_name || ' Price: ' || furniture_price || ' Discounted Price: ' || ROUND(discounted_price, 2));
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No furniture found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/



-- 48.For Loop to calculate the total price of furniture items:

SET SERVEROUTPUT ON
DECLARE
    counter INTEGER := 1;
    val furniture.price%TYPE := 0;
    total furniture.price%TYPE := 0;
BEGIN
    FOR counter IN 1 .. 11 LOOP
        BEGIN
            SELECT price INTO val FROM furniture WHERE furniture_id = counter;
            total := total + val;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                -- Handle case when no data is found for a specific furniture_id
                DBMS_OUTPUT.PUT_LINE('No data found for furniture_id: ' || counter);
        END;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Total: ' || total);
END;
/



-- 49.While Loop to calculate the total price of furniture items:
SET SERVEROUTPUT ON
DECLARE
    row_count INTEGER;
    counter INTEGER := 1;
    val furniture.price%TYPE := 0;
    total furniture.price%TYPE := 0;
BEGIN
    SELECT COUNT(*) INTO row_count FROM furniture;

    WHILE counter <= row_count LOOP
        SELECT price INTO val FROM furniture WHERE furniture_id = counter;
        total := total + val;
        counter := counter + 1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Total: ' || total);
END;
/

-- 50.Cursor to print first 6 furniture
SET SERVEROUTPUT ON
DECLARE
    CURSOR furniture_cur IS SELECT furniture_name, price FROM furniture;
    furniture_info furniture_cur%ROWTYPE;
BEGIN
    OPEN furniture_cur;
    FOR i IN 1..6 LOOP
        FETCH furniture_cur INTO furniture_info;
        EXIT WHEN furniture_cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Furniture Name: ' || furniture_info.furniture_name || ', Price: ' || furniture_info.price);
    END LOOP;
    CLOSE furniture_cur;
END;
/
-- 51.Procedure with parameters
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE get_furniture(
    id furniture.furniture_id%TYPE
) IS
    furniture_name furniture.furniture_name%TYPE;
    price furniture.price%TYPE;
BEGIN
    SELECT furniture_name INTO furniture_name
    FROM furniture
    WHERE furniture_id = id;
    DBMS_OUTPUT.PUT_LINE('Furniture Name: ' || furniture_name);
END get_furniture;
/
SHOW ERRORS;

BEGIN
    get_furniture(8);
END;
/

-- 52.Procedure with no parameters
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE get_furniture IS
    id furniture.furniture_id%TYPE;
    furniture_name furniture.furniture_name%TYPE;
    price furniture.price%TYPE;
BEGIN
    id := 7;
    SELECT furniture_name, price INTO furniture_name, price
    FROM furniture
    WHERE furniture_id = id;
    DBMS_OUTPUT.PUT_LINE('Furniture Name: ' || furniture_name || ', Price: ' || price);
END;
/
SHOW ERRORS;

BEGIN
    get_furniture;
END;
/


--53. Function with no parameter
SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION total_sum RETURN NUMBER IS
    total furniture.price%TYPE;
BEGIN
    SELECT SUM(price) INTO total
    FROM furniture;
    RETURN total;
END;
/
SHOW ERRORS;

declare
    v_customer_name VARCHAR2(100) := 'Ankon';
    v_total_payment NUMBER;

begin
    select SUM(amount) into v_total_payment
    from payment p
    join customer c on c.customer_id = p.customer_id
    where c.first_name = v_customer_name;

    DBMS_OUTPUT.PUT_LINE('Total Payment for Customer ' || v_customer_name || ': ' || v_total_payment);
end;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE('Total Sum: ' || total_sum);
END;
/

-- 54.Function with parameter
SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION furniture_name(
    id furniture.furniture_id%TYPE
) RETURN furniture.furniture_name%TYPE IS
    furniture_name furniture.furniture_name%TYPE;
BEGIN
    SELECT furniture_name INTO furniture_name
    FROM furniture
    WHERE furniture_id = id;
    RETURN furniture_name;
END furniture_name;
/
SHOW ERRORS;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Furniture Name: ' || furniture_name(7));
END;
/

SET SERVEROUTPUT ON



SET SERVEROUTPUT ON

CREATE OR REPLACE FUNCTION get_order_payment_amount(
    p_order_id IN payment.order_id%TYPE
) RETURN NUMBER IS
    total_amount NUMBER;
BEGIN
    SELECT SUM(amount) INTO total_amount
    FROM payment
    WHERE order_id = p_order_id;
 
    RETURN total_amount;
END get_order_payment_amount;
/

-- Example usage
DECLARE
    v_order_id payment.order_id%TYPE := 123; -- Replace with the desired order ID
    v_total_payment NUMBER;
BEGIN
    v_total_payment := get_order_payment_amount(v_order_id);
    DBMS_OUTPUT.PUT_LINE('Total Payment for Order ' || v_order_id || ': ' || v_total_payment);
END;
/
