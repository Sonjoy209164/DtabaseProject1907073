alter table furniture add discount number(6,3);
CREATE OR REPLACE TRIGGER update_discount
BEFORE INSERT OR UPDATE ON furniture
FOR EACH ROW
BEGIN
    IF :NEW.price < 500 THEN
        :NEW.discount := 0.1; -- 10% discount for price < 500
    ELSIF :NEW.price < 1000 THEN
        :NEW.discount := 0.2; -- 20% discount for price < 1000
    ELSE
        :NEW.discount := 0.3; -- 30% discount for price >= 1000
    END IF;
END;
/


SELECT *FROM furniture;

INSERT INTO furniture (furniture_id, furniture_name, category_id, brand, price) VALUES (11, 'bed', 5, 'RFL', 1500);
 
 update furniture 
set price=1200 where 
FURNITURE_ID=1;

 update furniture 
set price=500 where 
FURNITURE_ID=2;

 update furniture 
set price=800 where 
FURNITURE_ID=3;

 update furniture 
set price=600 where 
FURNITURE_ID=4;

 update furniture 
set price=700 where 
FURNITURE_ID=5;

 update furniture 
set price=900 where 
FURNITURE_ID=7;

