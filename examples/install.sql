-- create the database schema for the generic demo application

CREATE TABLE object_type(
  object_type_id   INTEGER GENERATED ALWAYS AS IDENTITY,
  object_type_name VARCHAR2(30) NOT NULL,
  object_schema    CLOB NOT NULL,   -- JSON not supported by APEX
  CONSTRAINT object_type_pk PRIMARY KEY (object_type_id),
  CONSTRAINT object_type_un UNIQUE(object_type_name),
  CONSTRAINT object_type_ck1 CHECK ( object_schema IS JSON )
);

CREATE TABLE cardinality(
  cardinality_id INTEGER NOT NULL,
  cardinality_name VARCHAR2(30) NOT NULL,
  CONSTRAINT cardinality_pk PRIMARY key(cardinality_id)
);

CREATE TABLE relation_type(
  relation_type_id    INTEGER GENERATED ALWAYS AS IDENTITY,
  relation_type_name  VARCHAR2(30) NOT NULL,
  from_object_type_id INTEGER NOT NULL,
  from_cardinality_id INTEGER NOT NULL,
  to_object_type_id   INTEGER NOT NULL,
  to_cardinality_id   INTEGER NOT NULL,
  relation_schema     CLOB NOT NULL,   -- JSON not supported by APEX
  CONSTRAINT relation_type_pk PRIMARY KEY (relation_type_id),
  CONSTRAINT relation_type_un UNIQUE(relation_type_name),
  CONSTRAINT relation_type_ck1 CHECK ( relation_schema IS JSON )
);

CREATE TABLE object(
  object_id      INTEGER GENERATED ALWAYS AS IDENTITY,
  object_type_id INTEGER NOT NULL,
  object_name    VARCHAR2(30) NOT NULL,
  created_at     DATE DEFAULT CURRENT_DATE NOT NULL,
  data           CLOB,   -- JSON not supported by APEX
  CONSTRAINT object_pk PRIMARY KEY (object_id),
  CONSTRAINT object_ck1 CHECK ( data IS JSON )
);

CREATE TABLE relation(
  relation_id         INTEGER GENERATED ALWAYS AS IDENTITY,
  created_at          DATE DEFAULT CURRENT_DATE NOT NULL,
  relation_type_id    INTEGER NOT NULL,
  from_object_id      INTEGER NOT NULL,
  to_object_id        INTEGER NOT NULL,
  data                CLOB,   -- JSON not supported by APEX
  CONSTRAINT relation_pk PRIMARY KEY (relation_id),
  CONSTRAINT relation_ck1 CHECK ( data IS JSON )
);

ALTER TABLE relation_type ADD CONSTRAINT relation_type_fk1 FOREIGN KEY(from_object_type_id) REFERENCING object_type;
ALTER TABLE relation_type ADD CONSTRAINT relation_type_fk2 FOREIGN KEY(to_object_type_id) REFERENCING object_type;
ALTER TABLE relation_type ADD CONSTRAINT relation_type_fk3 FOREIGN KEY(from_cardinality_id) REFERENCING cardinality;
ALTER TABLE relation_type ADD CONSTRAINT relation_type_fk4 FOREIGN KEY(to_cardinality_id) REFERENCING cardinality;

ALTER TABLE object ADD CONSTRAINT object_fk1 FOREIGN KEY(object_type_id) REFERENCING object_type;

ALTER TABLE relation ADD CONSTRAINT relation_fk1 FOREIGN KEY(relation_type_id) REFERENCING relation_type;

ALTER TABLE relation ADD CONSTRAINT relation_fk2 FOREIGN key(from_objecT_id) REFERENCING OBJECT;

ALTER TABLE relation ADD CONSTRAINT relation_fk3 FOREIGN key(to_objecT_id) REFERENCING OBJECT;

exit;