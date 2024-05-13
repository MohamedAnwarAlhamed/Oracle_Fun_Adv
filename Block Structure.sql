BEGIN
    dbms_output.put_line ('my first anonyms block');
END;
--==============================================
 --we will do same Exercise USING sql*plus
BEGIN
    dbms_output.put_line ('this the first line');
    dbms_output.put_line ('this is the second line');
END;
--==============================================
DECLARE
BEGIN
    dbms_output.put_line ('hello world');
END;
--==============================================
DECLARE
    N NUMBER DEFAULT 5;
    V VARCHAR2 (100) DEFAULT 'hello world';
BEGIN
    dbms_output.put_line(N);
    dbms_output.put_line(V);
    dbms_output.put_line(N ||' ' || V);
END;
--==============================================
@F:\test.sql
--==============================================
DECLARE
    v_global VARCHAR2(100):='this is a global variable';
BEGIN
    DECLARE
        v_local VARCHAR2(100):='this is a local variable';
    BEGIN
        dbms_output.put_line(v_global);
        dbms_output.put_line (v_local);
    END;

    dbms_output.put_line(v_global);
  --dbms_output.put_line (v_local); you can not do this
END;
--==============================================
--insert new department called test with ID=1
DECLARE
    vsal employees.salarystype;
    v_new_sal employees.salarystype;
BEGIN
    SELECT salary INTO vsal FROM employees WHERE employee_id=100;
    dbms_output.put_line('the old salary is '||v_sal);
    v_new_sal:=v_sal+100;
    UPDATE employees
    SET
        salary=v_new_sal
    WHERE
        employee_id=100 || dbms_output.put_line('the new salary is '||v_new_sal);
    INSERT INTO departments (department_id,department_name,manager_id,location_id) 
    VALUES (1,'test',NULL,NULL);
END;
--==============================================
BEGIN
    <<OUTER>>
    DECLARE
        v_father_name VARCHAR2(100):='khaled';
        v_birthday    DATE:='26-Jul-1981';
    BEGIN
        DECLARE
            v_child    VARCHAR2(100):='Layal';
            v_birthday DATE:='5-Apr-2013';
        BEGIN
            dbms_output.put_line('the father name is ' ||v_father_name);
            dbms_output.put_line('the father birthday is '||outer.v_birthday);
            dbms_output.put_line('the child name is '||v_child);
            dbms_output.put_line('the child birthday is '||v_birthday);
        END;
    END;
END;
--==============================================

