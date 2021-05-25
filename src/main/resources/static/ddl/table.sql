CREATE SEQUENCE seq_rmboard;

CREATE TABLE rmboard(
    res_num NUMBER(10),
    res_name VARCHAR2(20) NOT NULL,
    tel_number VARCHAR2(20) NOT NULL,
    menus VARCHAR2(2000),
    category VARCHAR2(20) NOT NULL,
    CONSTRAINT pk_rmboard PRIMARY KEY (res_num)
);

--ALTER TABLE rmboard MODIFY(res_name VARCHAR2(50));
--ALTER TABLE rmboard MODIFY(tel_number VARCHAR2(50));
--ALTER TABLE rmboard ADD(category VARCHAR2(20) NOT NULL);


SELECT * FROM rmboard ORDER BY res_num;

--TRUNCATE TABLE rmboard;