REM INSERTING into RELATION_TYPE
SET DEFINE OFF;
Insert into RELATION_TYPE (RELATION_TYPE_ID,RELATION_TYPE_NAME,FROM_OBJECT_TYPE_ID,FROM_CARDINALITY_ID,TO_OBJECT_TYPE_ID,TO_CARDINALITY_ID,RELATION_SCHEMA) values ('1','booking','6','3','5','3','{
  "type":  "object",
  "properties": {
     "checkin":      { "type":  "string", "format":  "date"},
     "checkout":   { "type":  "string", "format":  "date"},
     "checkedin":  { "type":  "boolean"}, 
      "room": {"type": "string"}
  },
  "required": ["checkin", "checkout"]
}');
Insert into RELATION_TYPE (RELATION_TYPE_ID,RELATION_TYPE_NAME,FROM_OBJECT_TYPE_ID,FROM_CARDINALITY_ID,TO_OBJECT_TYPE_ID,TO_CARDINALITY_ID,RELATION_SCHEMA) values ('2','Server->Switch','1','3','2','4','{"type": "object",
  "properties": {
    "port": { "type": "integer"}
  }
}');
Insert into RELATION_TYPE (RELATION_TYPE_ID,RELATION_TYPE_NAME,FROM_OBJECT_TYPE_ID,FROM_CARDINALITY_ID,TO_OBJECT_TYPE_ID,TO_CARDINALITY_ID,RELATION_SCHEMA) values ('3','Switch->Switch','2','3','2','3','{}');
Insert into RELATION_TYPE (RELATION_TYPE_ID,RELATION_TYPE_NAME,FROM_OBJECT_TYPE_ID,FROM_CARDINALITY_ID,TO_OBJECT_TYPE_ID,TO_CARDINALITY_ID,RELATION_SCHEMA) values ('4','Printer->Switch','3','3','2','2','{"type": "object",
  "properties": {
    "port": { "type": "integer"}
  }
}');
Insert into RELATION_TYPE (RELATION_TYPE_ID,RELATION_TYPE_NAME,FROM_OBJECT_TYPE_ID,FROM_CARDINALITY_ID,TO_OBJECT_TYPE_ID,TO_CARDINALITY_ID,RELATION_SCHEMA) values ('5','Server owned by','1','3','6','2','{}');
Insert into RELATION_TYPE (RELATION_TYPE_ID,RELATION_TYPE_NAME,FROM_OBJECT_TYPE_ID,FROM_CARDINALITY_ID,TO_OBJECT_TYPE_ID,TO_CARDINALITY_ID,RELATION_SCHEMA) values ('6','Server->Admin','1','4','6','3','{}');

COMMIT;