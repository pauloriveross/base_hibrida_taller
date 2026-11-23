
--==============================================================================
--CREACION DE TABLAS BASE DE DATOS OPERACIONAL 
--==============================================================================
CREATE TABLE agenda_op (
    id_agenda              RAW(16) NOT NULL,
    fecha_agendar          DATE NOT NULL,
    hora_agendar           INTERVAL DAY(9) TO SECOND(0) NOT NULL,
    estado_agendar         VARCHAR2(30) NOT NULL,
    prep_fisico_op_id_prep RAW(16) NOT NULL,
    cliente_op_id_cliente  RAW(16) NOT NULL
);

ALTER TABLE agenda_op ADD CONSTRAINT agenda_op_pk PRIMARY KEY ( id_agenda );

CREATE TABLE bloq_horario_op (
    id_bloque           RAW(16) NOT NULL,
    dia_bloque          DATE NOT NULL,
    hora_bloque         INTERVAL DAY(9) TO SECOND(0) NOT NULL,
    agenda_op_id_agenda RAW(16)
);

ALTER TABLE bloq_horario_op ADD CONSTRAINT bloq_horario_op_pk PRIMARY KEY ( id_bloque );

CREATE TABLE centro_dep_op (
    id_centro                     RAW(16) NOT NULL,
    nombre_centro                 VARCHAR2(100) NOT NULL,
    rut_centro                    VARCHAR2(13) NOT NULL,
    dir_centro                    VARCHAR2(100) NOT NULL,
    comuna_op_id_comuna           RAW(16) NOT NULL,
    comuna_op_ciudad_op_id_ciudad RAW(16) NOT NULL
);

ALTER TABLE centro_dep_op ADD CONSTRAINT centro_dep_op_pk PRIMARY KEY ( id_centro );

CREATE TABLE ciudad_op (
    id_ciudad           RAW(16) NOT NULL,
    nombre_ciudad       VARCHAR2(50) NOT NULL,
    region_op_id_region RAW(16) NOT NULL
);

ALTER TABLE ciudad_op ADD CONSTRAINT ciudad_op_pk PRIMARY KEY ( id_ciudad );

CREATE TABLE cliente_op (
    id_cliente                    RAW(16) NOT NULL,
    anio_nac_cli                  DATE NOT NULL,
    comuna_op_id_comuna           RAW(16) NOT NULL,
    comuna_op_ciudad_op_id_ciudad RAW(16) NOT NULL
);

ALTER TABLE cliente_op ADD CONSTRAINT cliente_op_pk PRIMARY KEY ( id_cliente );

CREATE TABLE comuna_op (
    id_comuna           RAW(16) NOT NULL,
    nombre_comuna       VARCHAR2(50) NOT NULL,
    ciudad_op_id_ciudad RAW(16) NOT NULL
);

ALTER TABLE comuna_op ADD CONSTRAINT comuna_op_pk PRIMARY KEY ( id_comuna,
                                                                ciudad_op_id_ciudad );

CREATE TABLE cont_cli_op (
    id_contrato     RAW(16) NOT NULL,
    fecha_ini_con   DATE NOT NULL,
    fecha_fin_con   DATE NOT NULL,
    estado_contrato VARCHAR2(30) NOT NULL,
    plan_op_id_plan RAW(16) NOT NULL
);

ALTER TABLE cont_cli_op ADD CONSTRAINT cont_cli_op_pk PRIMARY KEY ( id_contrato );

CREATE TABLE contener (
    rutina_op_id_rutina       RAW(16) NOT NULL,
    ejercicio_op_id_ejercicio RAW(16) NOT NULL
);

ALTER TABLE contener ADD CONSTRAINT contener_pk PRIMARY KEY ( rutina_op_id_rutina,
                                                              ejercicio_op_id_ejercicio );

CREATE TABLE definir (
    prep_fisico_op_id_preparador RAW(16) NOT NULL,
    bloque_horario_op_id_bloque  RAW(16) NOT NULL
);

ALTER TABLE definir ADD CONSTRAINT definir_pk PRIMARY KEY ( prep_fisico_op_id_preparador,
                                                            bloque_horario_op_id_bloque );

CREATE TABLE ejercicio_op (
    id_ejercicio     RAW(16) NOT NULL,
    nombre_ejercicio VARCHAR2(50) NOT NULL,
    desc_ejercicio   VARCHAR2(100) NOT NULL,
    reps_ejercicio   NUMBER(2) NOT NULL,
    peso_ejercicio   NUMBER(3)
);

ALTER TABLE ejercicio_op ADD CONSTRAINT ejercicio_op_pk PRIMARY KEY ( id_ejercicio );

CREATE TABLE factura_op (
    id_factura      RAW(16) NOT NULL,
    fecha_emision   DATE NOT NULL,
    total_factura   NUMBER(6) NOT NULL,
    pago_op_id_pago RAW(16) NOT NULL
);

CREATE UNIQUE INDEX factura_op__idx ON
    factura_op (
        pago_op_id_pago
    ASC );

ALTER TABLE factura_op ADD CONSTRAINT factura_op_pk PRIMARY KEY ( id_factura );

CREATE TABLE ficha_cliente_op (
    id_ficha              RAW(16) NOT NULL,
    fecha_creacion        DATE NOT NULL,
    fecha_observacion     DATE,
    cliente_op_id_cliente RAW(16) NOT NULL
);

ALTER TABLE ficha_cliente_op ADD CONSTRAINT ficha_cliente_op_pk PRIMARY KEY ( id_ficha );

CREATE TABLE met_pago_cli_op (
    id_met_pago      RAW(16) NOT NULL,
    nombre_met_pago  VARCHAR2(30) NOT NULL,
    desc_metodo_pago VARCHAR2(50) NOT NULL
);

ALTER TABLE met_pago_cli_op ADD CONSTRAINT met_pago_cli_op_pk PRIMARY KEY ( id_met_pago );

CREATE TABLE ofrecer (
    prep_fisico_op_id_preparador RAW(16) NOT NULL,
    plan_op_id_plan              RAW(16) NOT NULL
);

ALTER TABLE ofrecer ADD CONSTRAINT ofrecer_pk PRIMARY KEY ( prep_fisico_op_id_preparador,
                                                            plan_op_id_plan );

CREATE TABLE pago_op (
    id_pago                     RAW(16) NOT NULL,
    monto_pago                  NUMBER(6) NOT NULL,
    fecha_pago                  DATE NOT NULL,
    estado_pago                 VARCHAR2(50) NOT NULL,
    cont_cli_op_id_contrato     RAW(16) NOT NULL,
    met_pago_cli_op_id_met_pago RAW(16) NOT NULL
);

ALTER TABLE pago_op ADD CONSTRAINT pago_op_pk PRIMARY KEY ( id_pago );

CREATE TABLE pais_op (
    id_pais     RAW(16) NOT NULL,
    nombre_pais VARCHAR2(60) NOT NULL
);

ALTER TABLE pais_op ADD CONSTRAINT pais_op_pk PRIMARY KEY ( id_pais );

CREATE TABLE plan_op (
    id_plan               RAW(16) NOT NULL,
    nombre_plan           VARCHAR2(50) NOT NULL,
    precio_plan           NUMBER(5) NOT NULL,
    duracion_plan         VARCHAR2(50) NOT NULL,
    descripcion_plan      VARCHAR2(150) NOT NULL,
    cliente_op_id_cliente RAW(16) NOT NULL
);

ALTER TABLE plan_op ADD CONSTRAINT plan_op_pk PRIMARY KEY ( id_plan );

CREATE TABLE prep_fisico_op (
    id_prep                       RAW(16) NOT NULL,
    anio_nac_prep                 DATE NOT NULL,
    especialidad_prep             VARCHAR2(150) NOT NULL,
    comuna_op_id_comuna           RAW(16) NOT NULL,
    comuna_op_ciudad_op_id_ciudad RAW(16) NOT NULL
);

ALTER TABLE prep_fisico_op ADD CONSTRAINT preparador_fisico_op_pk PRIMARY KEY ( id_prep );

CREATE TABLE region_op (
    id_region       RAW(16) NOT NULL,
    nombre_region   VARCHAR2(50) NOT NULL,
    pais_op_id_pais RAW(16) NOT NULL
);

ALTER TABLE region_op ADD CONSTRAINT region_op_pk PRIMARY KEY ( id_region );

CREATE TABLE rutina_op (
    id_rutina              RAW(16) NOT NULL,
    nombre_rutina          VARCHAR2(50) NOT NULL,
    prep_fisico_op_id_prep RAW(16) NOT NULL,
    cliente_op_id_cliente  RAW(16)
);

ALTER TABLE rutina_op ADD CONSTRAINT rutina_op_pk PRIMARY KEY ( id_rutina );

CREATE TABLE sesion_entre_op (
    id_sesion           RAW(16) NOT NULL,
    fecha_sesion        DATE NOT NULL,
    duracion_sesion     INTERVAL DAY(9) TO SECOND(0) NOT NULL,
    rutina_op_id_rutina RAW(16) NOT NULL,
    agenda_op_id_agenda RAW(16) NOT NULL
);

ALTER TABLE sesion_entre_op ADD CONSTRAINT sesion_entre_op_pk PRIMARY KEY ( id_sesion );

ALTER TABLE agenda_op
    ADD CONSTRAINT agenda_op_cliente_op_fk FOREIGN KEY ( cliente_op_id_cliente )
        REFERENCES cliente_op ( id_cliente );

ALTER TABLE agenda_op
    ADD CONSTRAINT agenda_op_prep_fisico_op_fk FOREIGN KEY ( prep_fisico_op_id_prep )
        REFERENCES prep_fisico_op ( id_prep );

ALTER TABLE bloq_horario_op
    ADD CONSTRAINT bloq_horario_op_agenda_op_fk FOREIGN KEY ( agenda_op_id_agenda )
        REFERENCES agenda_op ( id_agenda );

ALTER TABLE centro_dep_op
    ADD CONSTRAINT centro_dep_op_comuna_op_fk FOREIGN KEY ( comuna_op_id_comuna,
                                                            comuna_op_ciudad_op_id_ciudad )
        REFERENCES comuna_op ( id_comuna,
                               ciudad_op_id_ciudad );

ALTER TABLE ciudad_op
    ADD CONSTRAINT ciudad_op_region_op_fk FOREIGN KEY ( region_op_id_region )
        REFERENCES region_op ( id_region );

ALTER TABLE cliente_op
    ADD CONSTRAINT cliente_op_comuna_op_fk FOREIGN KEY ( comuna_op_id_comuna,
                                                         comuna_op_ciudad_op_id_ciudad )
        REFERENCES comuna_op ( id_comuna,
                               ciudad_op_id_ciudad );

ALTER TABLE comuna_op
    ADD CONSTRAINT comuna_op_ciudad_op_fk FOREIGN KEY ( ciudad_op_id_ciudad )
        REFERENCES ciudad_op ( id_ciudad );

ALTER TABLE cont_cli_op
    ADD CONSTRAINT cont_cli_op_plan_op_fk FOREIGN KEY ( plan_op_id_plan )
        REFERENCES plan_op ( id_plan );

ALTER TABLE contener
    ADD CONSTRAINT contener_ejercicio_op_fk FOREIGN KEY ( ejercicio_op_id_ejercicio )
        REFERENCES ejercicio_op ( id_ejercicio );

ALTER TABLE contener
    ADD CONSTRAINT contener_rutina_op_fk FOREIGN KEY ( rutina_op_id_rutina )
        REFERENCES rutina_op ( id_rutina );

ALTER TABLE definir
    ADD CONSTRAINT definir_bloque_horario_op_fk FOREIGN KEY ( bloque_horario_op_id_bloque )
        REFERENCES bloq_horario_op ( id_bloque );

ALTER TABLE definir
    ADD CONSTRAINT definir_prep_fisico_op_fk FOREIGN KEY ( prep_fisico_op_id_preparador )
        REFERENCES prep_fisico_op ( id_prep );

ALTER TABLE factura_op
    ADD CONSTRAINT factura_op_pago_op_fk FOREIGN KEY ( pago_op_id_pago )
        REFERENCES pago_op ( id_pago );

ALTER TABLE ficha_cliente_op
    ADD CONSTRAINT ficha_cliente_op_cliente_op_fk FOREIGN KEY ( cliente_op_id_cliente )
        REFERENCES cliente_op ( id_cliente );

ALTER TABLE ofrecer
    ADD CONSTRAINT ofrecer_plan_op_fk FOREIGN KEY ( plan_op_id_plan )
        REFERENCES plan_op ( id_plan );

ALTER TABLE ofrecer
    ADD CONSTRAINT ofrecer_prep_fisico_op_fk FOREIGN KEY ( prep_fisico_op_id_preparador )
        REFERENCES prep_fisico_op ( id_prep );

ALTER TABLE pago_op
    ADD CONSTRAINT pago_op_cont_cli_op_fk FOREIGN KEY ( cont_cli_op_id_contrato )
        REFERENCES cont_cli_op ( id_contrato );

ALTER TABLE pago_op
    ADD CONSTRAINT pago_op_met_pago_cli_op_fk FOREIGN KEY ( met_pago_cli_op_id_met_pago )
        REFERENCES met_pago_cli_op ( id_met_pago );

ALTER TABLE plan_op
    ADD CONSTRAINT plan_op_cliente_op_fk FOREIGN KEY ( cliente_op_id_cliente )
        REFERENCES cliente_op ( id_cliente );

ALTER TABLE prep_fisico_op
    ADD CONSTRAINT prep_fisico_op_comuna_op_fk FOREIGN KEY ( comuna_op_id_comuna,
                                                             comuna_op_ciudad_op_id_ciudad )
        REFERENCES comuna_op ( id_comuna,
                               ciudad_op_id_ciudad );

ALTER TABLE region_op
    ADD CONSTRAINT region_op_pais_op_fk FOREIGN KEY ( pais_op_id_pais )
        REFERENCES pais_op ( id_pais );

ALTER TABLE rutina_op
    ADD CONSTRAINT rutina_op_cliente_op_fk FOREIGN KEY ( cliente_op_id_cliente )
        REFERENCES cliente_op ( id_cliente );

ALTER TABLE rutina_op
    ADD CONSTRAINT rutina_op_prep_fisico_op_fk FOREIGN KEY ( prep_fisico_op_id_prep )
        REFERENCES prep_fisico_op ( id_prep );

ALTER TABLE sesion_entre_op
    ADD CONSTRAINT sesion_entre_op_agenda_op_fk FOREIGN KEY ( agenda_op_id_agenda )
        REFERENCES agenda_op ( id_agenda );

ALTER TABLE sesion_entre_op
    ADD CONSTRAINT sesion_entre_op_rutina_op_fk FOREIGN KEY ( rutina_op_id_rutina )
        REFERENCES rutina_op ( id_rutina );



