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