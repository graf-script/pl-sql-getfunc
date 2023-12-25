
/
CREATE FUNCTION get_location_city(p_location_id IN NUMBER) RETURN VARCHAR2 IS
    v_city_title VARCHAR2(100);
BEGIN
    
    SELECT l.city
    INTO v_city_title
    FROM locations l
    WHERE l.location_id = p_location_id;

    RETURN v_city_title;

END get_location_city;
/

SELECT d.department_name, d.department_id, get_location_city(location_id) city, sysdate FROM departments d;
/
CREATE FUNCTION get_postal_code(p_location_id IN NUMBER) RETURN VARCHAR2 IS
    v_postal_code VARCHAR2(100);
BEGIN
    
    SELECT l.postal_code
    INTO v_postal_code
    FROM locations l
    WHERE l.location_id = p_location_id AND l.postal_code IS NOT NULL;

    RETURN v_postal_code;

END get_postal_code;
/

SELECT d.department_name, d.department_id, get_postal_code(location_id) post_code, sysdate FROM departments d;


DROP FUNCTION get_postal_code;

SELECT * FROM employees;
SELECT * FROM countries;
SELECT * FROM locations;
