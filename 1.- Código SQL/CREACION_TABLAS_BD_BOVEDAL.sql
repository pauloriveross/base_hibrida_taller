-- Generado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   en:        2026-11-23 11:16:10 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE CLIENTE_BOV 
    ( 
     id_cliente            RAW (16)  NOT NULL , 
     rut_cifrado           RAW (256)  NOT NULL , 
     rut_huella            RAW (32)  NOT NULL , 
     pnombre_cliente_cif   RAW (256)  NOT NULL , 
     snombre_cliente_cif   RAW (256) , 
     papellido_cliente_cif RAW (256)  NOT NULL , 
     sapellido_cliente_cif RAW (256) , 
     fecha_nac_cliente_cif RAW (256)  NOT NULL , 
     telefono_cliente_cif  RAW (256)  NOT NULL , 
     telefono_huella       RAW (32) , 
     correo_cliente_cif    RAW (256)  NOT NULL , 
     correo_huella         RAW (32)  NOT NULL 
    ) 
;

ALTER TABLE CLIENTE_BOV 
    ADD CONSTRAINT CLIENTE_BOV_PK PRIMARY KEY ( id_cliente ) ;

ALTER TABLE CLIENTE_BOV 
    ADD CONSTRAINT CLIENTE_BOV_RUT_HUELLA_UK UNIQUE ( rut_huella ) ;

ALTER TABLE CLIENTE_BOV 
    ADD CONSTRAINT CLIENTE_BOV_CORREO_HUELLA_UK UNIQUE ( correo_huella ) ;

CREATE TABLE FICHA_CLIENTE_BOV 
    ( 
     id_ficha          RAW (16)  NOT NULL , 
     id_cliente        RAW (16)  NOT NULL , 
     observaciones_cif RAW (512) 
    ) 
;

ALTER TABLE FICHA_CLIENTE_BOV 
    ADD CONSTRAINT FICHA_CLIENTE_BOV_PK PRIMARY KEY ( id_ficha ) ;

CREATE TABLE METRICA_CLI_BOV 
    ( 
     id_metrica                 RAW (16)  NOT NULL , 
     id_ficha                   RAW (16)  NOT NULL , 
     peso_cliente_cif           RAW (32)  NOT NULL , 
     estatura_cliente_cif       RAW (32)  NOT NULL , 
     medida_pecho_cliente_cif   RAW (32)  NOT NULL , 
     medida_cintura_cliente_cif RAW (32)  NOT NULL , 
     medida_cadera_cliente_cif  RAW (32)  NOT NULL , 
     medida_hombros_cliente_cif RAW (32)  NOT NULL , 
     medida_brazos_cliente_cif  RAW (32)  NOT NULL , 
     medida_muslos_cliente_cif  RAW (32)  NOT NULL , 
     medida_pantorillas_cif     RAW (32)  NOT NULL 
    ) 
;

ALTER TABLE METRICA_CLI_BOV 
    ADD CONSTRAINT METRICA_CLI_BOV_PK PRIMARY KEY ( id_metrica ) ;

CREATE TABLE PATOLOGIA_BOV 
    ( 
     id_patologia            RAW (16)  NOT NULL , 
     id_ficha                RAW (16)  NOT NULL , 
     nombre_patologia_cif    RAW (512)  NOT NULL , 
     tipo_patologia_cif      RAW (256)  NOT NULL , 
     grado_patologia_cif     RAW (256)  NOT NULL , 
     duracion_patologia_cif  RAW (256)  NOT NULL , 
     categoria_patologia_cif RAW (256)  NOT NULL 
    ) 
;

ALTER TABLE PATOLOGIA_BOV 
    ADD CONSTRAINT PATOLOGIA_BOV_PK PRIMARY KEY ( id_patologia ) ;

CREATE TABLE PREPARADOR_BOV 
    ( 
     id_preparador            RAW (16)  NOT NULL , 
     rut_prep_cifrado         RAW (256)  NOT NULL , 
     rut_prep_huella          RAW (32)  NOT NULL , 
     pnombre_preparador_cif   RAW (256)  NOT NULL , 
     snombre_preparador_cif   RAW (256) , 
     papellido_preparador_cif RAW (256)  NOT NULL , 
     sapellido_preparador_cif RAW (256) , 
     fecha_nac_preparador_cif RAW (256)  NOT NULL , 
     correo_preparador_cif    RAW (256)  NOT NULL , 
     correo_prep_huella       RAW (32)  NOT NULL , 
     telefono_preparador_cif  RAW (256)  NOT NULL , 
     telefono_prep_huella     RAW (32) 
    ) 
;

ALTER TABLE PREPARADOR_BOV 
    ADD CONSTRAINT PREPARADOR_BOV_PK PRIMARY KEY ( id_preparador ) ;

ALTER TABLE PREPARADOR_BOV 
    ADD CONSTRAINT PREP_BOV_RUT_HUELLA_UK UNIQUE ( rut_prep_huella ) ;

ALTER TABLE PREPARADOR_BOV 
    ADD CONSTRAINT PREP_BOV_CORREO_HUELLA_UK UNIQUE ( correo_prep_huella ) ;

CREATE TABLE PROGRESO_CLI_BOV 
    ( 
     id_progreso              RAW (16)  NOT NULL , 
     id_ficha                 RAW (16)  NOT NULL , 
     descripcion_progreso_cif RAW (512)  NOT NULL 
    ) 
;

ALTER TABLE PROGRESO_CLI_BOV 
    ADD CONSTRAINT PROGRESO_CLI_BOV_PK PRIMARY KEY ( id_progreso ) ;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             10
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
