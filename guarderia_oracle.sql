--------------------------------------------------------
-- Archivo creado  - miércoles-marzo-31-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CUOTA_MENSUAL
--------------------------------------------------------

  CREATE TABLE "ANDRES"."CUOTA_MENSUAL" 
   (	"ID_MENSUALIDAD" VARCHAR2(10 BYTE), 
	"VALOR_MENSUALIDAD" FLOAT(126), 
	"COSTO_COMIDA" FLOAT(126), 
	"PAGADOR_ID" VARCHAR2(15 BYTE), 
	"NINO_ID" VARCHAR2(15 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "TEST" ;
--------------------------------------------------------
--  DDL for Table INGREDIENTE
--------------------------------------------------------

  CREATE TABLE "ANDRES"."INGREDIENTE" 
   (	"NOMBRE" VARCHAR2(50 BYTE), 
	"FECHA_CADUCIDAD" DATE, 
	"NINO_ID" VARCHAR2(15 BYTE), 
	"PLATO_ID" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "TEST" ;
--------------------------------------------------------
--  DDL for Table MENU
--------------------------------------------------------

  CREATE TABLE "ANDRES"."MENU" 
   (	"ID_MENU" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "TEST" ;
--------------------------------------------------------
--  DDL for Table NINO
--------------------------------------------------------

  CREATE TABLE "ANDRES"."NINO" 
   (	"ID_MATRICULA" VARCHAR2(15 BYTE), 
	"NOMBRE" VARCHAR2(50 BYTE), 
	"FECHA_INGRESO" DATE, 
	"COMIDAS_REALIZADAS" NUMBER(*,0), 
	"FECHA_NACIMIENTO" DATE, 
	"FECHA_BAJA" DATE, 
	"PERSONA_ID" VARCHAR2(15 BYTE), 
	"MENU_ID" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "TEST" ;
--------------------------------------------------------
--  DDL for Table PAGADOR
--------------------------------------------------------

  CREATE TABLE "ANDRES"."PAGADOR" 
   (	"DNI" VARCHAR2(15 BYTE), 
	"NUMERO_CUENTA" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "TEST" ;
--------------------------------------------------------
--  DDL for Table PERSONA
--------------------------------------------------------

  CREATE TABLE "ANDRES"."PERSONA" 
   (	"DNI" VARCHAR2(15 BYTE), 
	"NOMBRE" VARCHAR2(50 BYTE), 
	"DIRECCION" VARCHAR2(100 BYTE), 
	"TELEFONO" VARCHAR2(10 BYTE), 
	"PARENTEZCO" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "TEST" ;
--------------------------------------------------------
--  DDL for Table PLATO
--------------------------------------------------------

  CREATE TABLE "ANDRES"."PLATO" 
   (	"NOMBRE" VARCHAR2(50 BYTE), 
	"CANTIDAD" FLOAT(126), 
	"DESCRIPCION" VARCHAR2(100 BYTE), 
	"MENU_ID" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "TEST" ;
REM INSERTING into ANDRES.CUOTA_MENSUAL
SET DEFINE OFF;
REM INSERTING into ANDRES.INGREDIENTE
SET DEFINE OFF;
REM INSERTING into ANDRES.MENU
SET DEFINE OFF;
REM INSERTING into ANDRES.NINO
SET DEFINE OFF;
REM INSERTING into ANDRES.PAGADOR
SET DEFINE OFF;
REM INSERTING into ANDRES.PERSONA
SET DEFINE OFF;
REM INSERTING into ANDRES.PLATO
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index IDX_NINO_MENU
--------------------------------------------------------

  CREATE INDEX "ANDRES"."IDX_NINO_MENU" ON "ANDRES"."NINO" ("MENU_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TEST" ;
--------------------------------------------------------
--  DDL for Index IDX_INGREDIENTE_NINO
--------------------------------------------------------

  CREATE INDEX "ANDRES"."IDX_INGREDIENTE_NINO" ON "ANDRES"."INGREDIENTE" ("NINO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TEST" ;
--------------------------------------------------------
--  DDL for Index IDX_CUOTA_NINO
--------------------------------------------------------

  CREATE INDEX "ANDRES"."IDX_CUOTA_NINO" ON "ANDRES"."CUOTA_MENSUAL" ("NINO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TEST" ;
--------------------------------------------------------
--  DDL for Index IDX_NINO_PERSONA
--------------------------------------------------------

  CREATE INDEX "ANDRES"."IDX_NINO_PERSONA" ON "ANDRES"."NINO" ("PERSONA_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TEST" ;
--------------------------------------------------------
--  DDL for Index IDX_PLATO_MENU
--------------------------------------------------------

  CREATE INDEX "ANDRES"."IDX_PLATO_MENU" ON "ANDRES"."PLATO" ("MENU_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TEST" ;
--------------------------------------------------------
--  DDL for Index IDX_INGREDIENTE_PLATO
--------------------------------------------------------

  CREATE INDEX "ANDRES"."IDX_INGREDIENTE_PLATO" ON "ANDRES"."INGREDIENTE" ("PLATO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TEST" ;
--------------------------------------------------------
--  DDL for Index IDX_CUOTA_PAGADOR
--------------------------------------------------------

  CREATE INDEX "ANDRES"."IDX_CUOTA_PAGADOR" ON "ANDRES"."CUOTA_MENSUAL" ("PAGADOR_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TEST" ;
--------------------------------------------------------
--  Constraints for Table MENU
--------------------------------------------------------

  ALTER TABLE "ANDRES"."MENU" MODIFY ("ID_MENU" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."MENU" ADD PRIMARY KEY ("ID_MENU")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TEST"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CUOTA_MENSUAL
--------------------------------------------------------

  ALTER TABLE "ANDRES"."CUOTA_MENSUAL" MODIFY ("ID_MENSUALIDAD" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."CUOTA_MENSUAL" MODIFY ("VALOR_MENSUALIDAD" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."CUOTA_MENSUAL" MODIFY ("PAGADOR_ID" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."CUOTA_MENSUAL" MODIFY ("NINO_ID" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."CUOTA_MENSUAL" ADD PRIMARY KEY ("ID_MENSUALIDAD")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TEST"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PERSONA
--------------------------------------------------------

  ALTER TABLE "ANDRES"."PERSONA" MODIFY ("DNI" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."PERSONA" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."PERSONA" MODIFY ("PARENTEZCO" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."PERSONA" ADD PRIMARY KEY ("DNI")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TEST"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PLATO
--------------------------------------------------------

  ALTER TABLE "ANDRES"."PLATO" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."PLATO" MODIFY ("MENU_ID" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."PLATO" ADD PRIMARY KEY ("NOMBRE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TEST"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PAGADOR
--------------------------------------------------------

  ALTER TABLE "ANDRES"."PAGADOR" MODIFY ("DNI" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."PAGADOR" MODIFY ("NUMERO_CUENTA" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."PAGADOR" ADD PRIMARY KEY ("DNI")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TEST"  ENABLE;
--------------------------------------------------------
--  Constraints for Table NINO
--------------------------------------------------------

  ALTER TABLE "ANDRES"."NINO" MODIFY ("ID_MATRICULA" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."NINO" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."NINO" MODIFY ("FECHA_INGRESO" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."NINO" MODIFY ("FECHA_NACIMIENTO" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."NINO" MODIFY ("PERSONA_ID" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."NINO" MODIFY ("MENU_ID" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."NINO" ADD PRIMARY KEY ("ID_MATRICULA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TEST"  ENABLE;
--------------------------------------------------------
--  Constraints for Table INGREDIENTE
--------------------------------------------------------

  ALTER TABLE "ANDRES"."INGREDIENTE" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."INGREDIENTE" MODIFY ("NINO_ID" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."INGREDIENTE" MODIFY ("PLATO_ID" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."INGREDIENTE" ADD PRIMARY KEY ("NOMBRE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TEST"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CUOTA_MENSUAL
--------------------------------------------------------

  ALTER TABLE "ANDRES"."CUOTA_MENSUAL" ADD CONSTRAINT "FK_CUOTA_PAGADOR" FOREIGN KEY ("PAGADOR_ID")
	  REFERENCES "ANDRES"."PAGADOR" ("DNI") ENABLE;
  ALTER TABLE "ANDRES"."CUOTA_MENSUAL" ADD CONSTRAINT "FK_CUOTA_NINO" FOREIGN KEY ("NINO_ID")
	  REFERENCES "ANDRES"."NINO" ("ID_MATRICULA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table INGREDIENTE
--------------------------------------------------------

  ALTER TABLE "ANDRES"."INGREDIENTE" ADD CONSTRAINT "FK_INGREDIENTE_NINO" FOREIGN KEY ("NINO_ID")
	  REFERENCES "ANDRES"."NINO" ("ID_MATRICULA") ENABLE;
  ALTER TABLE "ANDRES"."INGREDIENTE" ADD CONSTRAINT "FK_INGREDIENTE_PLATO" FOREIGN KEY ("PLATO_ID")
	  REFERENCES "ANDRES"."PLATO" ("NOMBRE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table NINO
--------------------------------------------------------

  ALTER TABLE "ANDRES"."NINO" ADD CONSTRAINT "FK_NINO_PERSONA" FOREIGN KEY ("PERSONA_ID")
	  REFERENCES "ANDRES"."PERSONA" ("DNI") ENABLE;
  ALTER TABLE "ANDRES"."NINO" ADD CONSTRAINT "FK_NINO_MENU" FOREIGN KEY ("MENU_ID")
	  REFERENCES "ANDRES"."MENU" ("ID_MENU") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PAGADOR
--------------------------------------------------------

  ALTER TABLE "ANDRES"."PAGADOR" ADD CONSTRAINT "FK_PAGADOR_PERSONA" FOREIGN KEY ("DNI")
	  REFERENCES "ANDRES"."PERSONA" ("DNI") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PLATO
--------------------------------------------------------

  ALTER TABLE "ANDRES"."PLATO" ADD CONSTRAINT "FK_PLATO_MENU" FOREIGN KEY ("MENU_ID")
	  REFERENCES "ANDRES"."MENU" ("ID_MENU") ENABLE;
