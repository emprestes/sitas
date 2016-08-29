CREATE FUNCTION get_nivel_acesso(varchar, varchar) RETURNS integer AS '
DECLARE
   acesso integer;

BEGIN
   SELECT INTO acesso * 
   FROM pessoa, pessoajulgador 
   WHERE pessoa.cod_pessoa = pessoajulgador.cod_pessoa_julgador
        AND pessoa.ativo = TRUE
	AND pessoajulgador.login = $1
	AND pessoajulgador.senha = $2;
   IF NOT FOUND THEN
	RETURN -1;
   ELSE
	SELECT INTO acesso * 
	FROM pessoa, pessoajulgador 
        WHERE pessoa.cod_pessoa = pessoajulgador.cod_pessoa_julgador
	    AND pessoa.ativo = TRUE
	    AND pessoajulgador.e_coordenador = TRUE
	    AND pessoajulgador.login = $1
	    AND pessoajulgador.senha = $2;

	IF NOT FOUND THEN
	   RETURN 1;
	ELSE
	   RETURN 2;
	END IF;
    END IF;

   RETURN 0;
END;
' LANGUAGE plpgsql;

CREATE FUNCTION get_julgadores( varchar ) RETURNS setof record AS '
DECLARE
    julgadores record;
    letra ALIAS FOR $1;
BEGIN
   FOR julgadores IN SELECT pessoajulgador.cod_pessoa_julgador, pessoa.nome, pessoa.rua,
			    pessoa.numero, pessoa.bairro, pessoa.cep, pessoa.email,
		            pessoa.cod_cidade, pessoa.cod_uf, pessoajulgador.data_nascimento,
			    pessoajulgador.cod_civil, pessoajulgador.sexo, pessoajulgador.login,
			    pessoajulgador.senha, pessoajulgador.e_coordenador, pessoajulgador.faixa_salarial_familiar
				  FROM pessoa, pessoajulgador 
				  WHERE pessoa.cod_pessoa = pessoajulgador.cod_pessoa_julgador
				  AND pessoa.ativo = TRUE
				  AND pessoa.nome LIKE letra||''%'' LOOP
	RETURN NEXT julgadores;
	END LOOP;	
   RETURN;
END;
' LANGUAGE plpgsql;

CREATE FUNCTION get_testes( integer ) RETURNS setof record AS '
DECLARE
    testes record;
    julgador ALIAS FOR $1;
BEGIN
   FOR testes IN SELECT t.cod_teste, t.cod_pessoa_julgador, t.cod_pessoa_empresa, t.nome,
			t.objetivo, t.descricao, t.instrucao, t.em_aberto, t.data_criacao,
			t.repeticoes, t.material, p.nome, pr.cod_produto, pr.nome
		 FROM teste t, pessoa p, produto pr, amostra a, utilizaamostra ua
		 WHERE selecionado.cod_pessoa_julgador = julgador
		      AND t.cod_teste = selecionado.cod_teste
		      AND t.cod_pessoa_julgador = p.cod_pessoa
		      AND t.em_aberto = true AND pr.cod_produto = a.cod_produto 
		      AND a.cod_amostra = ua.cod_amostra
		      AND selecionado.ativo = TRUE
		 GROUP BY t.cod_teste, t.cod_pessoa_julgador, t.cod_pessoa_empresa, t.nome,
			  t.objetivo, t.descricao, t.instrucao, t.em_aberto, t.data_criacao,
			  t.repeticoes, t.material, p.nome, pr.cod_produto, pr.nome
		 ORDER BY t.cod_teste LOOP	      
	RETURN NEXT testes;
	END LOOP;	
   RETURN;
END;
' LANGUAGE plpgsql;

CREATE FUNCTION get_gabaritos( integer, integer ) RETURNS setof record AS '
DECLARE
   cod_julgador ALIAS FOR $1;
   cod_teste ALIAS FOR $2;
   gabarito record;
BEGIN
    FOR gabarito IN SELECT *
		    FROM gabaritotriangular gt
		    WHERE selecionado.cod_teste = gt.cod_teste
		          AND selecionado.cod_pessoa_julgador = cod_julgador
			  AND gt.cod_pessoa_julgador = cod_julgador
			  AND selecionado.cod_teste = cod_teste
			  AND gt.cod_teste = cod_teste
		          AND gt.cod_gabarito_tri NOT IN ( SELECT rt.cod_gabarito_tri 
							   FROM  resptriangular rt 
							   WHERE gt.cod_gabarito_tri = rt.cod_gabarito_tri ) LOOP                 
        RETURN NEXT gabarito;
	END LOOP;	
   RETURN;
END;
' LANGUAGE plpgsql;

-------------------------------------------------
-------------- FUNCAO FECHAR TESTE --------------
-------------------------------------------------
CREATE FUNCTION fechar_teste( BIGINT ) RETURNS  void AS'
DECLARE 
     var record;	
BEGIN

SELECT * INTO var
FROM selecionado s
WHERE s.cod_teste = $1
      AND s.ativo = TRUE;

IF FOUND THEN
          
     UPDATE selecionado
     SET ativo = FALSE
     WHERE selecionado.cod_teste = $1;
           
END IF;

RETURN;
END;
' LANGUAGE plpgsql;

-------------------------------------------------
------------- FUNCAO TESTE EXCLUIR --------------
-------------------------------------------------

CREATE FUNCTION get_testes_excluir( integer ) RETURNS setof record AS '
DECLARE
    testesexc record;
    julgador ALIAS FOR $1;
BEGIN
   FOR testesexc IN SELECT t.cod_teste, t.cod_pessoa_julgador, t.cod_pessoa_empresa, t.nome,
			t.objetivo, t.descricao, t.instrucao, t.em_aberto, t.data_criacao,
			t.repeticoes, t.material, p.nome, pr.cod_produto, pr.nome
		 FROM teste t, pessoa p, produto pr, amostra a, utilizaamostra ua
		 WHERE t.cod_pessoa_julgador = julgador
		      AND t.cod_pessoa_julgador = p.cod_pessoa
		      AND pessoajulgador.e_coordenador = TRUE 
		      AND pr.cod_produto = a.cod_produto 
		      AND a.cod_amostra = ua.cod_amostra		      
		 GROUP BY t.cod_teste, t.cod_pessoa_julgador, t.cod_pessoa_empresa, t.nome,
			  t.objetivo, t.descricao, t.instrucao, t.em_aberto, t.data_criacao,
			  t.repeticoes, t.material, p.nome, pr.cod_produto, pr.nome
		 ORDER BY t.cod_teste LOOP	      
	RETURN NEXT testesexc;
	END LOOP;	
   RETURN;
END;
' LANGUAGE plpgsql;

------------------------------------------------
------ FUNCAO JULGADORES SELECIONADOS ----------
------------------------------------------------

CREATE FUNCTION get_julgadores_selecionados( BIGINT ) RETURNS setof record AS '
DECLARE
    registro record;
    c_teste ALIAS FOR $1;
BEGIN
   FOR registro IN SELECT pessoajulgador.cod_pessoa_julgador, pessoa.nome, pessoa.rua,
			    pessoa.numero, pessoa.bairro, pessoa.cep, pessoa.email,
		            pessoa.cod_cidade, pessoa.cod_uf, pessoajulgador.data_nascimento,
			    pessoajulgador.cod_civil, pessoajulgador.sexo, pessoajulgador.login,
			    pessoajulgador.senha, pessoajulgador.e_coordenador, pessoajulgador.faixa_salarial_familiar
				  FROM pessoa, pessoajulgador, selecionado s 
				  WHERE pessoa.cod_pessoa = pessoajulgador.cod_pessoa_julgador
				  AND pessoajulgador.cod_pessoa_julgador = s.cod_pessoa_julgador
				  AND s.cod_pessoa_julgador = pessoajulgador.cod_pessoa_julgador
				  AND s.cod_teste = c_teste LOOP
				  
	RETURN NEXT registro;
	END LOOP;	
   RETURN;
END;
' LANGUAGE plpgsql;

-------------------------------------------------
------------- FUNCAO TESTE EXCLUIR --------------
-------------------------------------------------
CREATE FUNCTION get_teste( integer ) RETURNS setof record AS '
DECLARE
    teste record;
    codigo ALIAS FOR $1;
BEGIN
   FOR teste IN SELECT t.cod_teste, t.cod_pessoa_julgador, t.cod_pessoa_empresa, t.nome,
			t.objetivo, t.descricao, t.instrucao, t.em_aberto, t.data_criacao,
			t.repeticoes, t.material, p.nome, pr.cod_produto, pr.nome
		 FROM teste t, pessoa p, produto pr, amostra a, utilizaamostra ua
		 WHERE t.cod_teste = 2
		      AND t.cod_pessoa_julgador = p.cod_pessoa
		      AND pr.cod_produto = a.cod_produto 
		      AND a.cod_amostra = ua.cod_amostra		      
		 GROUP BY t.cod_teste, t.cod_pessoa_julgador, t.cod_pessoa_empresa, t.nome,
			  t.objetivo, t.descricao, t.instrucao, t.em_aberto, t.data_criacao,
			  t.repeticoes, t.material, p.nome, pr.cod_produto, pr.nome
		 ORDER BY t.cod_teste LOOP	      
	RETURN NEXT teste;
	END LOOP;	
   RETURN;
END;
' LANGUAGE plpgsql;

-------------------------------------------------
--------- FUNCAO BUSCA AMOSTRA REPETIDA ---------
-------------------------------------------------
CREATE FUNCTION get_amostra_repetida( BIGINT, integer ) RETURNS INTEGER AS '
DECLARE
    teste ALIAS FOR $1;
    cod_amostra ALIAS FOR $2;
    linhas integer;
    matriz integer;
    count1 integer;
    count2 integer;
    count3 integer;
    amostra ALIAS FOR $1;
BEGIN

   SELECT count(*) INTO linhas 
   FROM gabaritotriangular gt1
   WHERE gt1.cod_teste = teste;

   IF FOUND THEN
   SELECT count(gt2.amostra1) INTO count1
   FROM gabaritotriangular gt2
   WHERE gt2.cod_teste = teste
   GROUP BY gt2.cod_teste, gt2.amostra1
   HAVING gt2.amostra1 = cod_amostra;

   SELECT count(gt3.amostra2) INTO count2
   FROM gabaritotriangular gt3
   WHERE gt3.cod_teste = teste
   GROUP BY gt3.cod_teste, gt3.amostra2
   HAVING gt3.amostra2 = cod_amostra;

   SELECT count(gt4.amostra3) INTO count3
   FROM gabaritotriangular gt4
   WHERE gt4.cod_teste = teste
   GROUP BY gt4.cod_teste, gt4.amostra3
   HAVING gt4.amostra3 = cod_amostra;

   matriz = linhas*3;
  
  IF (count1+count2+count3) > (matriz/2) THEN
	RETURN 1;
  ELSE
        RETURN -1;
  END IF;
END IF;
   RETURN 0;
END;
' LANGUAGE plpgsql;
