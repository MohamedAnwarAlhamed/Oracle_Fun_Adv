SELECT NAME, VALUE
FROM V$PARAMETER
WHERE NAME='plsql_warnings'
--Modify the current session's warning settings 
/*
DBMS_WARNING.ADD_WARNING_SETTING_CAT
( WARNING CATEGORY IN VARCHAR2, WARNING VALUE IN VARCHAR2, SCOPE IN VARCHAR2)
*/
--now we can modify the setting
BEGIN 
DBMS_WARNING.ADD_WARNING_SETTING_CAT ('SEVERE', 'ENABLE', 'SESSION');
END;

--we can check the new value by
SELECT NAME, VALUE
FROM V$PARAMETER
    
--==============================================
--2
/*
DBMS_WARNING.ADD_WARNING_SETTING_NUM
(WARNING_NUMBER WARNING_VALUE IN VARCHAR2,SCOPE IN PLS_INTEGER, IN VARCHAR2);
*/

EXEC dbms_warning.add_warning_setting_num(6002, 'DISABLE', SESSION);

SELECT DBMS_WARNING.GET_WARNING_SETTING_NUM(6002)
FROM DUAL;

EXEC dbms warning
.
add warning setting_num (6002, 'ENABLE', 'SESSION');

SELECT DBMS_WARNING.GET_WARNING_SETTING_NUM (6002)
FROM DUAL;
--==============================================
--4
/*
DBMS_WARNING.GET_CATEGORY(WARNING NUMBER IN PLS_INTEGER)
RETURN VARCHAR2
*/
--SEVERE

SELECT DBMS_WARNING.GET_CATEGORY(5000)
FROM DUAL;
--==============================================
--5
/*
dbms_warning.get_warning_setting_cat (warning_category IN VARCHAR2) RETURN VARCHAR2
*/
SELECT DBMS_WARNING.GET_WARNING_SETTING_CAT('SEVERE')
FROM DUAL;

SELECT DBMS_WARNING.GET_WARNING_SETTING_CAT('INFORMATIONAL')
--==============================================
--6
--dbms_warning.get_warning_setting_num(warning_number IN PLS_INTEGER) 
--RETURN VARCHAR2
SELECT DBMS_WARNING.GET_WARNING_SETTING_NUM (5000)
FROM DUAL;
SELECT dbms_warning.get_warning_setting_num(6002)
FROM dual;

SELECT dbms_warning.get_warning_setting_num (7203)
FROM DUAL;
