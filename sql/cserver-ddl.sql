CREATE TABLE CONFIGSERVER.PROPERTIES (
    ID NUMBER GENERATED ALWAYS AS IDENTITY ( START WITH 1 CACHE 20 ) ,
    APPLICATION VARCHAR2 (4000) ,
    PROFILE     VARCHAR2 (4000) ,
    LABEL       VARCHAR2 (4000) ,
    PROP_KEY    VARCHAR2 (4000) NOT NULL,
    VALUE       CLOB NOT NULL,
    CREATED_ON  TIMESTAMP DEFAULT SYSDATE NOT NULL,
    CREATED_BY  VARCHAR2 (100) DEFAULT COALESCE(
        REGEXP_SUBSTR(SYS_CONTEXT('USERENV','CLIENT_IDENTIFIER'),'^[^:]*'),
        SYS_CONTEXT('USERENV','SESSION_USER')) NOT NULL,
    UPDATED_ON  TIMESTAMP ,
    UPDATED_BY  VARCHAR2 (100)
) LOGGING;

ALTER TABLE CONFIGSERVER.PROPERTIES
    ADD CONSTRAINT PROPERTIES_PK PRIMARY KEY ( ID )
        USING INDEX LOGGING ;