--liquibase formatted sql
--changeset chuck:20200710-create-another-table

CREATE TABLE anothertable(
  contact_name VARCHAR(50),
  anothertable VARCHAR(50),
  notes VARCHAR (355)
);
--rollback DROP TABLE anothertable;