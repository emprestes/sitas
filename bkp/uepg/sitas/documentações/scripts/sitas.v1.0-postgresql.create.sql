--
-- Structure for table "public"."escolaridade" : 
--

CREATE TABLE "public"."escolaridade" (
  "id_escolaridade" SERIAL, 
  "nm_escolaridade" VARCHAR(50) NOT NULL, 
  CONSTRAINT "escolaridade_pkey" PRIMARY KEY("id_escolaridade")
) WITH OIDS;

--
-- Structure for table "public"."estado_civil" : 
--

CREATE TABLE "public"."estado_civil" (
  "id_estado_civil" SERIAL, 
  "nm_estado_civil" VARCHAR(50) NOT NULL, 
  CONSTRAINT "estado_civil_pkey" PRIMARY KEY("id_estado_civil")
) WITH OIDS;

--
-- Structure for table "public"."pessoa" : 
--

CREATE TABLE "public"."pessoa" (
  "id_pessoa" SERIAL, 
  "pn_pessoa" VARCHAR(50) NOT NULL, 
  "un_pessoa" VARCHAR(50) NOT NULL, 
  CONSTRAINT "pessoa_pkey" PRIMARY KEY("id_pessoa")
) WITH OIDS;

--
-- Structure for table "public"."pessoa_fisica" : 
--

CREATE TABLE "public"."pessoa_fisica" (
  "id_pessoa" INTEGER NOT NULL, 
  "id_sexo" CHAR(1) NOT NULL, 
  "id_estado_civil" INTEGER NOT NULL, 
  "id_escolaridade" INTEGER NOT NULL, 
  "id_profissao" INTEGER NOT NULL, 
  "nr_rg" VARCHAR(30) NOT NULL, 
  "nr_cpf" VARCHAR(30) NOT NULL, 
  "dt_nascimento" DATE NOT NULL, 
  CONSTRAINT "pessoa_fisica_pkey" PRIMARY KEY("id_pessoa"), 
  CONSTRAINT "pessoa_fisica_fk" FOREIGN KEY ("id_pessoa")
    REFERENCES "public"."pessoa"("id_pessoa")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE, 
  CONSTRAINT "pessoa_fisica_fk1" FOREIGN KEY ("id_sexo")
    REFERENCES "public"."sexo"("id_sexo")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE, 
  CONSTRAINT "pessoa_fisica_fk2" FOREIGN KEY ("id_estado_civil")
    REFERENCES "public"."estado_civil"("id_estado_civil")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE, 
  CONSTRAINT "pessoa_fisica_fk3" FOREIGN KEY ("id_escolaridade")
    REFERENCES "public"."escolaridade"("id_escolaridade")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE, 
  CONSTRAINT "pessoa_fisica_fk4" FOREIGN KEY ("id_profissao")
    REFERENCES "public"."profissao"("id_profissao")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE
) WITH OIDS;

--
-- Structure for table "public"."profissao" : 
--

CREATE TABLE "public"."profissao" (
  "id_profissao" SERIAL, 
  "nm_profissao" VARCHAR(50) NOT NULL, 
  CONSTRAINT "profissao_pkey" PRIMARY KEY("id_profissao")
) WITH OIDS;

--
-- Structure for table "public"."sexo" : 
--

CREATE TABLE "public"."sexo" (
  "id_sexo" CHAR(1) NOT NULL, 
  "nm_sexo" VARCHAR(15) NOT NULL, 
  CONSTRAINT "sexo_pkey" PRIMARY KEY("id_sexo")
) WITH OIDS;

