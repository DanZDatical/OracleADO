--liquibase formatted sql
--changeset dan:20210104-create-testdml-table labels:jira-123,release1.1.0
CREATE TABLE T_testdml(
  contact_name VARCHAR(50),
  testdml_rep VARCHAR(50),
  notes VARCHAR (355)
);
--rollback DROP TABLE T_testdml;

--changeset dan:20210105-create-anothertable-table labels:jira-123,release1.1.0
CREATE TABLE T_anothertable(
  contact_name VARCHAR(50),
  testdml_rep VARCHAR(50),
  notes VARCHAR (355)
);
--rollback DROP TABLE T_anothertable;

--changeset dan:20210105-create-randoobject-table labels:jira-130,release1.1.0
CREATE TABLE T_randoobject(
  contact_name VARCHAR(50),
  testdml_rep VARCHAR(50),
  notes VARCHAR (355)
);
--rollback DROP TABLE T_randoobject;

--changeset dan:20210105-create-anotherone-table labels:jira-130,release1.1.0
CREATE TABLE T_anotherone(
  contact_name VARCHAR(50),
  testdml_rep VARCHAR(50),
  notes VARCHAR (355)
);
--rollback DROP TABLE T_anotherone;

--changeset chuck:20210105-insert-a-row3 labels:jira-123,release1.1.0
INSERT INTO T_testdml (contact_name,testdml_rep,notes)
VALUES ('John Smith3','Jane Doe','Notes go here');

--rollback DELETE FROM T_testdml WHERE contact_name = 'John Smith3';

--changeset dan:20210322-create-a-procedure labels:jira-143,release1.1.0
create or replace PROCEDURE p_DemoExample(cid IN integer, num OUT integer)
AS
BEGIN
    SELECT count(*)
    INTO num
    FROM T_CUSTOMER c, T_BORROWING b, T_EXEMPLAR e, T_FILM f
    WHERE c.customer_id=cid
        and c.customer_id=b.customer_id
        and b.exemplar_id=e.exemplar_id
        and e.film_id=f.film_id
END;
--rollback DROP PROCEDURE p_DemoExample;

--changeset dan:20210322-create-a-view labels:jira-143,release1.1.0
CREATE OR REPLACE FORCE VIEW "V_EXAMPLE" ("NAME", "CITY", "TITLE", "DIRECTOR") AS 
SELECT DISTINCT c.name, c.address.city AS city, f.title, f.director
FROM T_CUSTOMER c, T_BORROWING b, T_EXEMPLAR e, T_FILM f
WHERE c.customer_id=b.customer_id 
and b.exemplar_id=e.exemplar_id 
and e.film_id=f.film_id
 ;

--rollback DROP VIEW "V_EXAMPLE";
