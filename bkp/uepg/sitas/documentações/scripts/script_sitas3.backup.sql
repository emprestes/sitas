-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-------------------------------     UNIVERSIDADE ESTADUAL DE PONTA GROSSA     -------------------------------
-------------------------------         BACHARELADO EM INFORMATICA            -------------------------------
-------------------------------           DISCIPLINA DE PROJETO               -------------------------------
-------------------------------------------------------------------------------------------------------------
--ALUNOS: ALEX VAN & EDSON MARCIO      ----------------------------------------------------------------------
--SCRIPT DO BANCO DE DADOS PJTO_SITAS  ----------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-------------------------------------
---  APAGAR AS TABELAS DO BANCO  ----
-------------------------------------
 DROP TABLE UtilizaAmostra;
 DROP TABLE Trabalha; 
 DROP TABLE Toma;
 DROP TABLE NaoGosta;
 DROP TABLE RespBasicos;
 DROP TABLE RespOrdenacao;
 DROP TABLE RespTriangular;
 DROP TABLE GabaritoTriangular;
 DROP TABLE GabaritoGostos;
 DROP TABLE GabaritoOrdenacao;
 DROP TABLE Selecionado;
 DROP TABLE Triangular;
 DROP TABLE GostosBasicos;
 DROP TABLE Ordenacao;
 DROP TABLE RespondePergunta;
 DROP TABLE Pergunta;
 DROP TABLE Medicamento;
 DROP TABLE Amostra;
 DROP TABLE Produto;
 DROP TABLE Resultado;
 DROP TABLE Teste;
 DROP TABLE Fone;
 DROP TABLE PessoaEmpresa;
 DROP TABLE PessoaJulgador;
 DROP TABLE Pessoa;
 DROP TABLE Cidade;
 DROP TABLE Uf;
 DROP TABLE EstadoCivil;
 DROP TABLE TABELAGOSTOBASICO;
 DROP TABLE TABELATRIANGULAR;
 DROP TABLE TABELAORDENACAO_P1;
 DROP TABLE TABELAORDENACAO_P5;
 
----------------------------------------------------------------
------------------------ TABELA AMOSTRA ------------------------
----------------------------------------------------------------
CREATE TABLE Amostra (
        cod_amostra          SERIAL NOT NULL,
	nome                 VARCHAR(30) NULL,
        cod_produto          INTEGER NULL,
	desc_concentracao    TEXT NULL,
        ativo                BOOLEAN NOT NULL DEFAULT TRUE        
 );

 ALTER TABLE Amostra
        ADD PRIMARY KEY  (cod_amostra);
 

----------------------------------------------------------------
---------------------- TABELA CIDADE ---------------------------
----------------------------------------------------------------
 CREATE TABLE Cidade (
        cod_cidade           SERIAL NOT NULL,
        cod_uf               INTEGER NOT NULL,
        nome                 VARCHAR(80) NULL
 );

 ALTER TABLE Cidade
        ADD PRIMARY KEY  (cod_cidade);

----------------------------------------------------------------
---------------------- TABELA ESTADOCIVIL ----------------------
---------------------------------------------------------------- 
CREATE TABLE EstadoCivil (
        cod_civil            SERIAL NOT NULL,
        descricao            VARCHAR(20) NULL
 );

 
 ALTER TABLE EstadoCivil
        ADD PRIMARY KEY (cod_civil);

----------------------------------------------------------------
------------------------- TABELA FONE --------------------------
---------------------------------------------------------------- 
CREATE TABLE Fone (
        cod_pessoa           INTEGER NOT NULL,
        ddd                  INTEGER NOT NULL,
        fone                 INTEGER NOT NULL,
        descricao            VARCHAR(50) NULL
 );
  
 ALTER TABLE Fone
        ADD PRIMARY KEY (cod_pessoa, ddd, fone);

 ALTER TABLE Fone
	ADD CONSTRAINT chk_ddd_empresa
	CHECK ( char_length(ddd) = 3 ); 
 
 ALTER TABLE Fone
	ADD CONSTRAINT chk_fone_empresa
	CHECK ( char_length(fone) > 5 AND char_length(fone) < 13 );

----------------------------------------------------------------
------------------------ TABELA PESSOA -------------------------
----------------------------------------------------------------  
 CREATE TABLE Pessoa (
        cod_pessoa           SERIAL NOT NULL,
        nome                 VARCHAR(50) NOT NULL,
        rua                  VARCHAR(80) NULL,
        numero               INTEGER NULL,
        bairro               VARCHAR(50) NULL,
        cep                  INTEGER NULL,
        email                VARCHAR(100) NULL,
        cod_cidade           INTEGER NOT NULL,        
        ativo                BOOLEAN NOT NULL DEFAULT TRUE
 );

 ALTER TABLE Pessoa
        ADD PRIMARY KEY (cod_pessoa);

 ALTER TABLE Pessoa
	ADD CONSTRAINT chk_cep
	CHECK ( char_length(cep) = 8);


----------------------------------------------------------------
--------------------- TABELA TESTE -----------------------------
----------------------------------------------------------------
 CREATE TABLE Teste (
        cod_teste            BIGSERIAL NOT NULL,
	cod_pessoa_julgador  INTEGER NULL REFERENCES pessoa (cod_pessoa) ON DELETE SET NULL,
        cod_pessoa_empresa   INTEGER NOT NULL,
        nome                 VARCHAR(30) NULL,
        objetivo             TEXT NULL,
        descricao            TEXT NULL,
        instrucao            TEXT NULL,
        em_aberto            BOOLEAN DEFAULT TRUE NOT NULL,
        data_criacao         DATE DEFAULT current_date NOT NULL,
        data_fechamento      DATE DEFAULT NULL,
        repeticoes           INTEGER NULL,
        material             TEXT NULL
 );
 
 ALTER TABLE Teste
        ADD PRIMARY KEY  (cod_teste);
----------------------------------------------------------------
------------------ TABELA SELECIONADO --------------------------
---------------------------------------------------------------- 
 CREATE TABLE Selecionado (
        cod_pessoa_julgador  INTEGER NOT NULL REFERENCES pessoa (cod_pessoa) ON DELETE CASCADE,
        cod_teste            BIGINT NOT NULL REFERENCES teste (cod_teste) ON DELETE CASCADE,
	ativo 		     BOOLEAN NOT NULL DEFAULT TRUE
 );
 
 ALTER TABLE Selecionado
        ADD PRIMARY KEY (cod_pessoa_julgador, cod_teste);



----------------------------------------------------------------
----------------- TABELA GABARITOGOSTOS ------------------------
---------------------------------------------------------------- 
 CREATE TABLE GabaritoGostos (
        cod_gabarito_gostos  BIGSERIAL UNIQUE NOT NULL,
        cod_teste            BIGINT NOT NULL REFERENCES teste (cod_teste) ON DELETE CASCADE,
        numero               INTEGER NULL,
        cod_pessoa_julgador  INTEGER NULL REFERENCES pessoa (cod_pessoa) ON DELETE CASCADE,
        amostra              VARCHAR(20) NULL
 );

 
 ALTER TABLE GabaritoGostos
        ADD PRIMARY KEY  ( cod_gabarito_gostos, cod_teste );

 
----------------------------------------------------------------
---------------- TABELA GABARITOORDENACAO ----------------------
----------------------------------------------------------------  
 CREATE TABLE GabaritoOrdenacao (
        cod_gabarito_ordenacao BIGSERIAL UNIQUE NOT NULL,
        cod_teste            BIGINT NOT NULL REFERENCES teste (cod_teste) ON DELETE CASCADE,
	cod_pessoa_julgador  INTEGER NULL REFERENCES pessoa (cod_pessoa) ON DELETE CASCADE,
        numero1              INTEGER NULL,
        numero2              INTEGER NULL,
        numero3              INTEGER NULL,
        numero4              INTEGER NULL,
        numero5              INTEGER NULL,
        amostra1             INTEGER NULL,
        amostra2             INTEGER NULL,
        amostra3             INTEGER NULL,
        amostra4             INTEGER NULL,
        amostra5             INTEGER NULL
 );

 
 
 ALTER TABLE GabaritoOrdenacao
        ADD PRIMARY KEY  (cod_gabarito_ordenacao, 
               cod_teste);

 
----------------------------------------------------------------
---------------- TABELA GABARITOTRIANGULAR ---------------------
----------------------------------------------------------------  
 CREATE TABLE GabaritoTriangular (
        cod_gabarito_tri     BIGSERIAL UNIQUE NOT NULL,
        cod_teste            BIGINT NOT NULL REFERENCES teste (cod_teste) ON DELETE CASCADE,
	cod_pessoa_julgador  INTEGER NULL REFERENCES pessoa (cod_pessoa) ON DELETE CASCADE,
        numero1              INTEGER NULL,
        numero2              INTEGER NULL,
        numero3              INTEGER NULL,
        amostra1             INTEGER NULL,
        amostra2             INTEGER NULL,
        amostra3             INTEGER NULL
 );

 
 
 ALTER TABLE GabaritoTriangular
        ADD PRIMARY KEY  (cod_gabarito_tri, cod_teste);

 
----------------------------------------------------------------
------------------- TABELA GOSTOSBASICOS -----------------------
---------------------------------------------------------------- 
 CREATE TABLE GostosBasicos (
        cod_teste            INTEGER NOT NULL REFERENCES teste (cod_teste) ON DELETE CASCADE
 );
 
 ALTER TABLE GostosBasicos
        ADD PRIMARY KEY  (cod_teste);

----------------------------------------------------------------
-------------------- TABELA MEDICAMENTO ------------------------
----------------------------------------------------------------  
 CREATE TABLE Medicamento (
        cod_medicamento      SERIAL NOT NULL,
        nome                 VARCHAR(30) NULL,
        composto_ativo       VARCHAR(80) NULL
 );

 ALTER TABLE Medicamento
        ADD PRIMARY KEY  (cod_medicamento);

 

----------------------------------------------------------------
-------------------- TABELA NAOGOSTA ---------------------------
----------------------------------------------------------------  
 CREATE TABLE NaoGosta (
        cod_pessoa_julgador  INTEGER NOT NULL REFERENCES pessoa (cod_pessoa) ON DELETE CASCADE,
        cod_produto          INTEGER NOT NULL
 );

 ALTER TABLE NaoGosta
        ADD PRIMARY KEY (cod_pessoa_julgador, 
               cod_produto);
 
----------------------------------------------------------------
--------------------- TABELA ORDENACAO -------------------------
----------------------------------------------------------------  
 CREATE TABLE Ordenacao (
        cod_teste            INTEGER NOT NULL REFERENCES teste (cod_teste) ON DELETE CASCADE
 );

 ALTER TABLE Ordenacao
        ADD PRIMARY KEY  (cod_teste);

 
----------------------------------------------------------------
-------------------- TABELA PERGUNTA ---------------------------
---------------------------------------------------------------- 
 CREATE TABLE Pergunta (
        cod_pergunta         SERIAL NOT NULL,
        pergunta             TEXT NULL,
        cod_pessoa_julgador  INTEGER NOT NULL REFERENCES pessoa (cod_pessoa) ON DELETE CASCADE,
        data_criacao         DATE DEFAULT current_date NOT NULL );

 ALTER TABLE Pergunta
        ADD PRIMARY KEY  (cod_pergunta);


----------------------------------------------------------------
-------------------- TABELA PESSOAEMPRESA ----------------------
----------------------------------------------------------------
CREATE TABLE PessoaEmpresa (
        cod_pessoa_empresa   INTEGER NOT NULL REFERENCES pessoa (cod_pessoa) ON DELETE CASCADE,
        ramo                 VARCHAR(50) NULL
 );

 ALTER TABLE PessoaEmpresa
        ADD PRIMARY KEY (cod_pessoa_empresa);

----------------------------------------------------------------
-------------------- TABELA PESSOAJULGADOR ---------------------
----------------------------------------------------------------
 CREATE TABLE PessoaJulgador (
        cod_pessoa_julgador  INTEGER NOT NULL REFERENCES pessoa (cod_pessoa) ON DELETE CASCADE,
        data_nascimento      DATE NOT NULL,
        cod_civil            INTEGER NOT NULL,
        sexo                 CHAR(1) NOT NULL,
        login                VARCHAR(8) NOT NULL UNIQUE,
        senha                VARCHAR(8) NOT NULL,
        e_coordenador        BOOLEAN NULL,
	faixa_salarial_familiar MONEY NULL
 );

 
 ALTER TABLE PessoaJulgador
        ADD PRIMARY KEY (cod_pessoa_julgador);

 ALTER TABLE PessoaJulgador
	ADD CONSTRAINT chk_data_nascimento
	CHECK((date_part('year', current_timestamp)
		- date_part('year', data_nascimento)) > 10);

----------------------------------------------------------------
------------------------ TABELA PRODUTO ------------------------
---------------------------------------------------------------- 
 CREATE TABLE Produto (
        cod_produto          SERIAL NOT NULL,
        nome                 VARCHAR(30) NULL,
        ativo                BOOLEAN NOT NULL DEFAULT TRUE
 );
 
 ALTER TABLE Produto
        ADD PRIMARY KEY  (cod_produto);

 
----------------------------------------------------------------
-------------------- TABELA RESPBASICOS ------------------------
----------------------------------------------------------------  
 CREATE TABLE RespBasicos (
        cod_gabarito_gostos  BIGINT NOT NULL REFERENCES gabaritogostos (cod_gabarito_gostos) ON DELETE CASCADE,
        cod_teste            BIGINT NOT NULL,
        num                  INTEGER NULL,
        gosto                VARCHAR(20) NULL,
	comentario 	     TEXT NULL,
	data_realizacao	     DATE DEFAULT current_date NOT NULL
	
 );

 ALTER TABLE RespBasicos
        ADD PRIMARY KEY  (cod_gabarito_gostos, cod_teste);

 
----------------------------------------------------------------
---------------- TABELA RESPONDEPERGUNTA -----------------------
---------------------------------------------------------------- 
CREATE TABLE RespondePergunta (
        cod_pessoa_julgador  INTEGER NOT NULL REFERENCES pessoajulgador (cod_pessoa_julgador) ON DELETE CASCADE,
        cod_pergunta         INTEGER  NOT NULL,
        resposta             TEXT     NULL,
        data                 DATE     DEFAULT current_date NOT NULL );

 ALTER TABLE RespondePergunta
        ADD PRIMARY KEY (cod_pessoa_julgador, 
               cod_pergunta);

 
----------------------------------------------------------------
------------------ TABELA RESPORDENACAO ------------------------
----------------------------------------------------------------  
 CREATE TABLE RespOrdenacao (
        cod_gabarito_ordenacao BIGINT NOT NULL REFERENCES gabaritoordenacao (cod_gabarito_ordenacao) ON DELETE CASCADE,
        cod_teste            BIGINT NOT NULL,
        primeiro             INTEGER NULL,
        segundo              INTEGER NULL,
        terceiro             INTEGER NULL,
        quarto               INTEGER NULL,
        quinto               INTEGER NULL,
	comentario 	     TEXT NULL,
	data_realizacao	     DATE DEFAULT current_date NOT NULL
	

 );
 
 ALTER TABLE RespOrdenacao
        ADD PRIMARY KEY  (cod_gabarito_ordenacao, 
               cod_teste);

----------------------------------------------------------------
------------------- TABELA RESPTRIANGULAR ----------------------
----------------------------------------------------------------  
  CREATE TABLE RespTriangular (
        cod_gabarito_tri     BIGINT NOT NULL REFERENCES gabaritotriangular (cod_gabarito_tri) ON DELETE CASCADE,
        cod_teste            BIGINT NOT NULL,
        cod_amostra          INTEGER NOT NULL,
	comentario 	     TEXT NULL,
        data_realizacao	     DATE DEFAULT current_date NOT NULL
	
 );

 ALTER TABLE RespTriangular
        ADD PRIMARY KEY  (cod_gabarito_tri, cod_teste);

----------------------------------------------------------------
---------------------- TABELA RESULTADO ------------------------
---------------------------------------------------------------- 
 CREATE TABLE Resultado (
        cod_teste            BIGINT NOT NULL REFERENCES teste (cod_teste) ON DELETE CASCADE,
        julgamentos          INTEGER NOT NULL,
        acertos              INTEGER NOT NULL,
        ns_01                INTEGER NOT NULL,
        ns_1                 INTEGER NOT NULL,
        ns_5                 INTEGER NOT NULL,
        conclusao_01         TEXT NOT NULL,
        conclusao_1          TEXT NOT NULL,
        conclusao_5          TEXT NOT NULL,        
        data_resultado       DATE NULL
 );
 
 ALTER TABLE Resultado
        ADD PRIMARY KEY (cod_teste);

----------------------------------------------------------------
----------------- TABELA TABELAGOSTOBASICO ---------------------
----------------------------------------------------------------  
 CREATE TABLE TabelaGostoBasico (
        grau_liberdade       INTEGER NOT NULL,
        p_10                 INTEGER NULL,
        p_5                  INTEGER NULL,
        p_2                  INTEGER NULL,
        p_1                  INTEGER NULL,
        p_01                 INTEGER NULL
 );
 
 ALTER TABLE TabelaGostoBasico
        ADD PRIMARY KEY  (grau_liberdade);

 
----------------------------------------------------------------
-------------------- TABELA ORDENACAO P1 -----------------------
----------------------------------------------------------------   
 CREATE TABLE TabelaOrdenacao_p1 (
        n_respostas          INTEGER NOT NULL,
        p_3                  INTEGER NULL,
        p_4                  INTEGER NULL,
        p_5                  INTEGER NULL,
        p_6                  INTEGER NULL,
        p_7                  INTEGER NULL,
        p_8                  INTEGER NULL,
        p_9                  INTEGER NULL,
        p_10                 INTEGER NULL,
        p_11                 INTEGER NULL,
        p_12                 INTEGER NULL
 );

 ALTER TABLE TabelaOrdenacao_p1
        ADD PRIMARY KEY  (n_respostas);

 
----------------------------------------------------------------
-------------------- TABELA ORDENACAO P5 -----------------------
----------------------------------------------------------------   
 CREATE TABLE TabelaOrdenacao_p5 (
        n_respostas          INTEGER NOT NULL,
        p_3                  INTEGER NULL,
        p_4                  INTEGER NULL,
        p_5                  INTEGER NULL,
        p_6                  INTEGER NULL,
        p_7                  INTEGER NULL,
        p_8                  INTEGER NULL,
        p_9                  INTEGER NULL,
        p_10                 INTEGER NULL,
        p_11                 INTEGER NULL,
        p_12                 INTEGER NULL
 );

 ALTER TABLE TabelaOrdenacao_p5
        ADD PRIMARY KEY  (n_respostas);

 
----------------------------------------------------------------
--------------------- TABELA TRIANGULAR ------------------------
----------------------------------------------------------------  
 CREATE TABLE TabelaTriangular (
        julgamentos          INTEGER NOT NULL,
        p_005                INTEGER NULL,
        p_001                INTEGER NULL,
        p_0001               INTEGER NULL
 );

 ALTER TABLE TabelaTriangular
        ADD PRIMARY KEY  (julgamentos);

 
----------------------------------------------------------------
---------------------- TABELA TOMA -----------------------------
----------------------------------------------------------------  
 CREATE TABLE Toma (
        cod_pessoa_julgador  INTEGER NOT NULL REFERENCES pessoa (cod_pessoa) ON DELETE CASCADE,
        cod_medicamento      INTEGER NOT NULL
 );
 
ALTER TABLE Toma
        ADD PRIMARY KEY (cod_pessoa_julgador, 
               cod_medicamento);
 
----------------------------------------------------------------
-------------------- TABELA TRABALHA ---------------------------
----------------------------------------------------------------  
 CREATE TABLE Trabalha (
        cod_pessoa_julgador  INTEGER NOT NULL REFERENCES pessoa (cod_pessoa) ON DELETE CASCADE,
        cod_pessoa_empresa   INTEGER NOT NULL,
        ativo                BOOLEAN NULL
 );
 
 ALTER TABLE Trabalha
        ADD PRIMARY KEY (cod_pessoa_julgador, 
               cod_pessoa_empresa);

 
----------------------------------------------------------------
--------------------- TABELA TRIANGULAR ------------------------
----------------------------------------------------------------   
 CREATE TABLE Triangular (
        cod_teste            INTEGER NOT NULL REFERENCES teste (cod_teste) ON DELETE CASCADE
 );
 
 ALTER TABLE Triangular
        ADD PRIMARY KEY  (cod_teste);

 
----------------------------------------------------------------
----------------------- TABELA UF ------------------------------
---------------------------------------------------------------- 
 CREATE TABLE Uf (
        cod_uf               SERIAL NOT NULL,
        nome                 CHAR(2) NULL
 );

 ALTER TABLE Uf
        ADD PRIMARY KEY  (cod_uf);

 
----------------------------------------------------------------
------------------- TABELA UTILIZAAMOSTRA ----------------------
----------------------------------------------------------------  
 CREATE TABLE UtilizaAmostra (
        cod_amostra          INTEGER NOT NULL,
        cod_teste            INTEGER NOT NULL REFERENCES teste (cod_teste) ON DELETE CASCADE        
 );
 
 ALTER TABLE UtilizaAmostra
        ADD PRIMARY KEY  (cod_amostra, cod_teste);

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
------------------------------------------ DEFINICAO DAS CHAVES ESTRANGEIRAS ------------------------------------
-----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------- 
 ALTER TABLE Amostra
        ADD FOREIGN KEY (cod_produto)
                              REFERENCES Produto;
 ALTER TABLE Cidade
        ADD FOREIGN KEY (cod_uf)
                              REFERENCES Uf;
 ALTER TABLE Fone
        ADD FOREIGN KEY (cod_pessoa)
                              REFERENCES Pessoa;

 ALTER TABLE GabaritoGostos
        ADD FOREIGN KEY (cod_teste)
                              REFERENCES GostosBasicos;

 ALTER TABLE GabaritoGostos
        ADD FOREIGN KEY (cod_pessoa_julgador, cod_teste)
                              REFERENCES Selecionado;

 ALTER TABLE GabaritoOrdenacao
        ADD FOREIGN KEY (cod_teste)
                              REFERENCES Ordenacao;

 ALTER TABLE GabaritoOrdenacao
        ADD FOREIGN KEY (cod_pessoa_julgador, cod_teste)
                              REFERENCES Selecionado;

 ALTER TABLE GabaritoTriangular
        ADD FOREIGN KEY (cod_teste)
                              REFERENCES Triangular;
 
 ALTER TABLE GabaritoTriangular
        ADD FOREIGN KEY (cod_pessoa_julgador, cod_teste)
                              REFERENCES Selecionado;

 ALTER TABLE GostosBasicos
        ADD FOREIGN KEY (cod_teste)
                              REFERENCES Teste;

 ALTER TABLE NaoGosta
        ADD FOREIGN KEY (cod_pessoa_julgador)
                              REFERENCES PessoaJulgador;

 ALTER TABLE NaoGosta
        ADD FOREIGN KEY (cod_produto)
                              REFERENCES Produto;

 ALTER TABLE Ordenacao
        ADD FOREIGN KEY (cod_teste)
                              REFERENCES Teste;

 ALTER TABLE Pergunta
        ADD FOREIGN KEY (cod_pessoa_julgador)
                              REFERENCES PessoaJulgador;

 ALTER TABLE Pessoa
        ADD FOREIGN KEY (cod_cidade)
                              REFERENCES Cidade;

 ALTER TABLE PessoaEmpresa
        ADD FOREIGN KEY (cod_pessoa_empresa)
                             REFERENCES Pessoa;
 
 ALTER TABLE PessoaJulgador
        ADD FOREIGN KEY (cod_civil)
                              REFERENCES EstadoCivil;
 
 ALTER TABLE PessoaJulgador
        ADD FOREIGN KEY (cod_pessoa_julgador)
                              REFERENCES Pessoa;

 ALTER TABLE RespBasicos
        ADD FOREIGN KEY (cod_gabarito_gostos, cod_teste)
                              REFERENCES GabaritoGostos;

 ALTER TABLE RespondePergunta
        ADD FOREIGN KEY (cod_pessoa_julgador)
                              REFERENCES PessoaJulgador;

 ALTER TABLE RespondePergunta
        ADD FOREIGN KEY (cod_pergunta)
                              REFERENCES Pergunta;

 ALTER TABLE RespOrdenacao
        ADD FOREIGN KEY (cod_gabarito_ordenacao, cod_teste)
                              REFERENCES GabaritoOrdenacao;
 
 ALTER TABLE RespTriangular
        ADD FOREIGN KEY (cod_gabarito_tri, cod_teste)
                              REFERENCES GabaritoTriangular;
 
 ALTER TABLE Resultado
        ADD FOREIGN KEY (cod_teste)
                              REFERENCES Teste;

 ALTER TABLE Selecionado
        ADD FOREIGN KEY (cod_pessoa_julgador)
                              REFERENCES PessoaJulgador;

 ALTER TABLE Selecionado
        ADD FOREIGN KEY (cod_teste)
                              REFERENCES Teste;

 ALTER TABLE Teste
        ADD FOREIGN KEY (cod_pessoa_empresa)
                              REFERENCES PessoaEmpresa;

 ALTER TABLE Teste
        ADD FOREIGN KEY (cod_pessoa_julgador)
                              REFERENCES PessoaJulgador;
 
 ALTER TABLE Toma
        ADD FOREIGN KEY (cod_pessoa_julgador)
                              REFERENCES PessoaJulgador;

 ALTER TABLE Toma
        ADD FOREIGN KEY (cod_medicamento)
                              REFERENCES Medicamento;

 ALTER TABLE Trabalha
        ADD FOREIGN KEY (cod_pessoa_julgador)
                              REFERENCES PessoaJulgador;
 
 ALTER TABLE Trabalha
        ADD FOREIGN KEY (cod_pessoa_empresa)
                              REFERENCES PessoaEmpresa;
 
 ALTER TABLE Triangular
        ADD FOREIGN KEY (cod_teste)
                              REFERENCES Teste;
 
 ALTER TABLE UtilizaAmostra
        ADD FOREIGN KEY (cod_amostra)
                             REFERENCES Amostra;

 ALTER TABLE UtilizaAmostra
        ADD FOREIGN KEY (cod_teste)
                              REFERENCES Teste;
------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
---------------------------------------- TRIGGER'S PJTO_SITAS -----------------------------------------------
-------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
----------------------------------------
------- TRIGGER RESP_TRIANGULAR --------
----------------------------------------
CREATE FUNCTION tgr_resptriangular_iu() RETURNS trigger AS '
DECLARE ret BIGINT;
    BEGIN
	SELECT t.cod_teste INTO ret
	FROM teste t
	WHERE   NEW.cod_teste = t.cod_teste AND
		t.em_aberto = FALSE;
	IF FOUND THEN
	    RAISE EXCEPTION ''Nao e possivel responder teste fechado'';	    
	    ROLLBACK TRANSACTION;
	END IF;
        RETURN NEW;
    END;
' LANGUAGE 'plpgsql';
 
CREATE TRIGGER tgr_resptriangular_iu AFTER INSERT OR UPDATE ON RespTriangular
    FOR EACH ROW EXECUTE PROCEDURE tgr_resptriangular_iu();
 

------------------------------------------------
-------------- TRIGGER TRABALHA ----------------
------------------------------------------------
CREATE FUNCTION tgr_trabalha_iu() RETURNS trigger AS '
DECLARE ret integer;
    BEGIN
	SELECT t.cod_julgador INTO ret
	FROM Trabalha t
	WHERE t.cod_julgador = NEW.cod_julgador AND
 	      t.ativo = TRUE OR NEW.ativo = FALSE;
	IF FOUND THEN
	    RAISE EXCEPTION ''Julgador trabalha (ativo) em outra empresa ou o valor e invalido'';	    
	    ROLLBACK TRANSACTION;
	END IF;
        RETURN NEW;
    END;
' LANGUAGE 'plpgsql';

CREATE TRIGGER tgr_trabalha_iu BEFORE INSERT OR UPDATE ON Trabalha
    FOR EACH ROW EXECUTE PROCEDURE tgr_trabalha_iu();

-------------------------------------------
-------- TRIGGER RESPTRIANGULAR -----------
-------------------------------------------
CREATE FUNCTION tgr_resptriangular_i() RETURNS trigger AS '
DECLARE 
	val1 INTEGER;
	val2 INTEGER;
	julg VARCHAR;
    BEGIN
	SELECT gt.cod_pessoa_julgador INTO julg
	FROM gabaritotriangular gt
	WHERE gt.cod_gabarito_tri = NEW.cod_gabarito_tri;

	SELECT count(*) INTO val1
	FROM gabaritotriangular gt
	WHERE gt.cod_teste = NEW.cod_teste
	AND gt.cod_pessoa_julgador = julg ;
	     
	 

	SELECT count(*) INTO val2 
	FROM resptriangular rt, gabaritotriangular gt
	WHERE rt.cod_gabarito_tri = gt.cod_gabarito_tri
	      AND gt.cod_teste = NEW.cod_teste
	      AND gt.cod_pessoa_julgador = julg;
	   
          
	IF val1 = val2 THEN
	    UPDATE selecionado
	    SET ativo = FALSE
	    WHERE NEW.cod_teste = selecionado.cod_teste 
		  AND selecionado.cod_pessoa_julgador = julg;		
	END IF;	
        RETURN NEW;
    END;
' LANGUAGE 'plpgsql';

CREATE TRIGGER tgr_resptriangular_i AFTER INSERT ON resptriangular
    FOR EACH ROW EXECUTE PROCEDURE tgr_resptriangular_i();

-------------------------------------------------
------------ TRIGGER FINALIZAR TESTE ------------
-------------------------------------------------
CREATE FUNCTION tgr_finalizar_teste_u() RETURNS trigger AS '
DECLARE val record;
BEGIN

SELECT * INTO val
FROM selecionado s
WHERE s.cod_teste = NEW.cod_teste  
                    AND NOT EXISTS 
                                 (SELECT *
				  FROM selecionado sel
				  WHERE sel.ativo = TRUE AND sel.cod_teste = s.cod_teste);
				  
				  IF FOUND THEN
				     UPDATE teste
				     SET em_aberto = FALSE
				     WHERE NEW.cod_teste = teste.cod_teste;     
				  END IF;
RETURN NEW;
END;
' LANGUAGE 'plpgsql';

CREATE TRIGGER tgr_finalizar_teste_u AFTER UPDATE ON selecionado
FOR EACH ROW EXECUTE PROCEDURE tgr_finalizar_teste_u();

-------------------------------------------------
------------ TRIGGER RESULTADO TESTE ------------
-------------------------------------------------
CREATE FUNCTION tgr_resultado_teste() RETURNS trigger AS '
DECLARE acertos INTEGER;
	julgamentos INTEGER;
	ns01 INTEGER;
	ns1 INTEGER;
	ns5 INTEGER;
	com01 TEXT;
	com1 TEXT;
	com5 TEXT;
	c_teste BIGINT;
BEGIN

--CONDICAO DE DISPARO DA TRIGGER
SELECT teste.cod_teste INTO c_teste
FROM teste
WHERE NEW.cod_teste = teste.cod_teste
      AND OLD.em_aberto = TRUE
      AND NEW.em_aberto = FALSE;

   IF FOUND THEN
   --ACERTOS
   SELECT count(*) INTO acertos
   FROM  resptriangular rt, gabaritotriangular gt
   WHERE rt.cod_gabarito_tri = gt.cod_gabarito_tri 
	 AND NEW.cod_teste = rt.cod_teste
         AND rt.cod_amostra NOT IN (SELECT g.amostra1
      				    FROM gabaritotriangular g
				    WHERE g.amostra1 = g.amostra2 
					   AND g.cod_teste = NEW.cod_teste
					   UNION ALL
					   SELECT ga.amostra2
					   FROM gabaritotriangular ga
					   WHERE ga.amostra2 = ga.amostra3
						   AND ga.cod_teste = NEW.cod_teste
						   UNION ALL
						   SELECT gab.amostra3
						   FROM gabaritotriangular gab
						   WHERE gab.amostra1 = gab.amostra3
							   AND gab.cod_teste = NEW.cod_teste);
      
         --JULGAMENTOS
         SELECT count(*) INTO julgamentos
         FROM resptriangular rt
         WHERE rt.cod_teste = NEW.cod_teste;
	 
	 IF julgamentos >= 7 THEN
         --NIVEIS SIG NS01
         SELECT tt.P_0001 INTO ns01
         FROM tabelatriangular tt
         WHERE tt.julgamentos = julgamentos;

         --NIVEIS SIG NS1
         SELECT tt.P_001 INTO ns1
         FROM tabelatriangular tt
         WHERE tt.julgamentos = julgamentos;

         --NIVEIS SIG NS5
         SELECT tt.P_005 INTO ns5
         FROM tabelatriangular tt
         WHERE tt.julgamentos = julgamentos;

         --CONCLUSAO_01
         IF acertos >= ns01 THEN
            com01 := ''A 0.1 de Significancia: Conclui-se que existe diferença entre as amostras'';
         ELSE
            com01 := ''A 0.1 de Significancia: Conclui-se que nao existe diferença entre as amostras'';
         END IF;

         --CONCLUSAO_1
         IF acertos >= ns1 THEN
            com1 := ''A 1 de Significancia: Conclui-se que existe diferença entre as amostras'';
         ELSE
            com1 := ''A 1 de Significancia: Conclui-se que nao existe diferença entre as amostras'';
         END IF;

         --CONCLUSAO_5
         IF acertos >= ns5 THEN
            com5 := ''A 5 de Significancia: Conclui-se que existe diferença entre as amostras'';
         ELSE
            com5 := ''A 5 de Significancia: Conclui-se que nao existe diferença entre as amostras'';
         END IF;

         INSERT INTO resultado
         VALUES( c_teste, julgamentos, acertos, ns01, ns1, ns5, com01, com1, com5, DEFAULT );
      ELSE
	  julgamentos := 0;
	  acertos := 0;
	  ns01 := 0;
	  ns1 := 0;
	  ns5 := 0;
	  com01 := ''NUMERO INSUFICIENTE DE JULGAMENTOS'';
	  com1 := ''NUMERO INSUFICIENTE DE JULGAMENTOS'';
	  com5 := ''NUMERO INSUFICIENTE DE JULGAMENTOS'';
          INSERT INTO resultado
          VALUES( c_teste, julgamentos, acertos, ns01, ns1, ns5, com01, com1, com5, DEFAULT );
      END IF;

   END IF;
RETURN NEW;
END;
' LANGUAGE 'plpgsql';

CREATE TRIGGER tgr_resultado_teste BEFORE UPDATE ON teste
FOR EACH ROW EXECUTE PROCEDURE tgr_resultado_teste();

0;
	  acertos := 0;
	  ns01 := 0;
	  ns1 := 0;
	  ns5 := 0;
	  com01 := ''NUMERO INSUFICIENTE DE JULGAMENTOS'';
	  com1 := ''NUMERO INSUFICIENTE DE JULGAMENTOS'';
	  com5 := ''NUMERO INSUFICIENTE DE JULGAMENTOS'';
          INSERT INTO resultado
          VALUES( c_teste, julgamentos, acertos, ns01, ns1, ns5, com01, com1, com5, DEFAULT );
      END IF;

   END IF;
RETURN NEW;
END;
' LANGUAGE 'plpgsql';

CREATE TRIGGER tgr_resultado_teste BEFORE UPDATE ON teste
FOR EACH ROW EXECUTE PROCEDURE tgr_resultado_teste();

E tgr_resultado_teste();

 ns5 := 0;
	  com01 := ''NUMERO INSUFICIENTE DE JULGAMENTOS'';
	  com1 := ''NUMERO INSUFICIENTE DE JULGAMENTOS'';
	  com5 := ''NUMERO INSUFICIENTE DE JULGAMENTOS'';
          INSERT INTO resultado
          VALUES( c_teste, julgamentos, acertos, ns01, ns1, ns5, com01, com1, com5, DEFAULT );
      END IF;

   END IF;
RETURN NEW;
END;
' LANGUAGE 'plpgsql';

CREATE TRIGGER tgr_resultado_teste BEFORE UPDATE ON teste
FOR EACH ROW EXECUTE PROCEDURE tgr_resultado_teste();

E tgr_resultado_teste();


PROCEDURE tgr_resultado_teste();

E tgr_resultado_teste();

_resultado_teste BEFORE UPDATE ON teste
FOR EACH ROW EXECUTE PROCEDURE tgr_resultado_teste();

E tgr_resultado_teste();

_resultado_teste();

E tgr_resultado_teste();

ste();

