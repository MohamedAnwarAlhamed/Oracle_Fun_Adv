--here will learn the GLOBAL TEMPORARY TABLE
--http://uae.souq.com
--it is a table that hold data that exist only for the duration of the transction (session)
--each session can see and modify only its data
DROP TABLE CART;

CREATE GLOBAL TEMPORARY TABLE CART (
    ITEM NO NUMBER,
    QTY NUMBER
) ON COMMIT DELETE ROWS;

INSERT INTO CART VALUES (1, 10);

INSERT INTO CART VALUES (2,4);

SELECT *
FROM CART;

COMMIT;

SELECT *
FROM CART;

--=============================================================
CREATE GLOBAL TEMPORARY TABLE (
    ITEM NO NUMBER,
    QTY NUMBER
) ON COMMIT PRESERVE ROWS;

INSERT INTO CART2 VALUES (1,10);

INSERT INTO CART2 VALUES (2,13);

INSERT INTO CART2 VALUES (3,1);

COMMIT;

SELECT *
FROM CART2;