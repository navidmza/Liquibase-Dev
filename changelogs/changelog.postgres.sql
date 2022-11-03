--liquibase formatted sql

--changeset SteveZ:5582471835439-1111
CREATE TABLE SALES3 (ID BIGINT, ITEM VARCHAR(255), QUANTITY int, AMOUNT FLOAT, CONSTRAINT SALES_PK PRIMARY KEY (ID));
--rollback DROP TABLE SALES;

--changeset JohnD:35824-2
INSERT INTO SALES3 (ID,ITEM, QUANTITY, AMOUNT) VALUES (1,'Leather sofa By Michellotti', 4, 5026.63);
--rollback DELETE FROM SALES WHERE ITEM='Leather sofa By Michellotti';

--changeset JohnD:3582471835439-6
INSERT INTO SALES3 (ID,ITEM, QUANTITY, AMOUNT) VALUES (2,'Round coffee table By Michellotti', 1, 800.23);
--rollback DELETE FROM SALES WHERE ITEM='Round coffee table By Michellotti';

