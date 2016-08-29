-- Total de pessoas no banco de dados.
   SELECT COUNT( idpessoa ) AS total 
     FROM pessoa;

-- Total de pessoas físicas no banco de dados.
   SELECT COUNT( idp_fisica ) AS total 
     FROM p_fisica;

-- Total de pessoas jurídicas no banco de dados.
   SELECT COUNT( idp_juridica ) AS total 
     FROM p_juridica;

-- Tipos de contato no banco de dados.
   SELECT *
     FROM tipo_contato;

-- Ações do SITAS.
   SELECT *
     FROM sitas_acao;

-- Total de contatos no banco de dados.
   SELECT COUNT( CONTATO )
     FROM contato;

-- Profissões.
   SELECT *
     FROM profissao;

-- Contatos de uma pessoa específica.
   SELECT co.idtipo_contato, co.contato, co.observacao                                                                                                                                              
     FROM pessoa pe
    INNER JOIN contato co ON (pe.idpessoa=co.idpessoa)
    INNER JOIN tipo_contato tco ON (co.idtipo_contato=tco.idtipo_contato)
    WHERE pe.idpessoa=1001
    ORDER BY tco.descricao;

-- Cidades.
   SELECT * 
     FROM cidade
    WHERE nome='Ponta Grossa';

-- Tipo de logradouros.
   SELECT *
     FROM tipo_logradouro;

-- Países na base MCT.
   SELECT *
     FROM pais;

-- Endereços.
   SELECT lo.idlogradouro, lo.nome AS logradouro, lo.cep,
          b.idbairro, b.nome AS bairro, 
          c.idcidade, c.nome AS cidade,
          uf.iduf, uf.nome AS uf,
          p.idpais, p.nome AS pais
     FROM logradouro lo
    INNER JOIN bairro b ON (lo.idbairro=b.idbairro)
    INNER JOIN cidade c ON (lo.idcidade=c.idcidade)
    INNER JOIN uf ON (lo.iduf=uf.idUF)
    INNER JOIN pais p ON (lo.idpais=p.idpais)
    --WHERE lo.cep='84010-340'
    ORDER BY lo.nome, p.nome, uf.nome, c.nome, b.nome, lo.cep;

-- Endereços por bairro.
   SELECT b.nome AS bairro, COUNT( idlogradouro ) AS endereços
     FROM logradouro lo
    INNER JOIN bairro b ON (lo.idbairro=b.idbairro)
    INNER JOIN cidade c ON (lo.idcidade=c.idcidade)
    INNER JOIN uf ON (lo.iduf=uf.idUF)
    INNER JOIN pais p ON (lo.idpais=p.idpais)
    GROUP BY b.nome
    ORDER BY bairro, endereços;

-- Testes por tipos de teste.
   SELECT tt.descricao AS tipo, t.nome AS teste
     FROM teste t
    INNER JOIN tipo_teste tt ON (t.idtipo_teste=tt.idtipo_teste)
    ORDER BY tipo, teste;