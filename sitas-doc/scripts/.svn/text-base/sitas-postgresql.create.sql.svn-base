-- CREATE :: BEGIN
CREATE TABLE estado_civil (
 idestado_civil SERIAL NOT NULL,
 descricao VARCHAR(80) NOT NULL,
 CONSTRAINT estado_civil_PK PRIMARY KEY(idestado_civil)
);

CREATE TABLE remedio (
 idremedio SERIAL NOT NULL,
 nome VARCHAR(100) NOT NULL,
 descricao TEXT NULL,
 CONSTRAINT remedio_PK PRIMARY KEY(idremedio)
);

CREATE TABLE pessoa (
 idpessoa SERIAL NOT NULL,
 nome VARCHAR(80) NOT NULL,
 sobre_nome VARCHAR(80) NULL,
 CONSTRAINT pessoa_PK PRIMARY KEY(idpessoa)
);

CREATE TABLE tipo_dieta (
 idtipo_dieta SERIAL NOT NULL,
 descricao VARCHAR(50) NOT NULL,
 CONSTRAINT tipo_dieta_PK PRIMARY KEY(idtipo_dieta)
);

CREATE TABLE tipo_contato (
 idtipo_contato SERIAL NOT NULL,
 descricao VARCHAR(80) NOT NULL,
 CONSTRAINT tipo_contato_PK PRIMARY KEY(idtipo_contato)
);

CREATE TABLE periodo (
 idperiodo SERIAL NOT NULL,
 descricao VARCHAR(30) NOT NULL,
 CONSTRAINT periodo_PK PRIMARY KEY(idperiodo)
);

CREATE TABLE sexo (
 idsexo CHAR(1) NOT NULL,
 descricao CHAR(30) NOT NULL,
 CONSTRAINT sexo_PK PRIMARY KEY(idsexo)
);

CREATE TABLE pais (
 idpais SERIAL NOT NULL,
 nome VARCHAR(80) NOT NULL,
 CONSTRAINT pais_PK PRIMARY KEY(idpais)
);

CREATE TABLE sitas_acao (
 idacao SERIAL NOT NULL,
 descricao VARCHAR(30) NOT NULL,
 CONSTRAINT sitas_acao_PK PRIMARY KEY(idacao)
);

CREATE TABLE grau_instrucao (
 idgrau_instrucao SERIAL NOT NULL,
 descricao VARCHAR(50) NOT NULL,
 CONSTRAINT grau_instrucao_PK PRIMARY KEY(idgrau_instrucao)
);

CREATE TABLE horario (
 idhorario SERIAL NOT NULL,
 descricao VARCHAR(15) NOT NULL,
 CONSTRAINT horario_PK PRIMARY KEY(idhorario)
);

CREATE TABLE tipo_logradouro (
 idtipo_logradouro SERIAL NOT NULL,
 descricao CHAR(50) NOT NULL,
 CONSTRAINT tipo_logradouro_PK PRIMARY KEY(idtipo_logradouro)
);

CREATE TABLE processo_objetivo (
 idobjetivo SERIAL NOT NULL,
 descricao VARCHAR(50) NOT NULL,
 CONSTRAINT processo_objetivo_PK PRIMARY KEY(idobjetivo)
);

CREATE TABLE profissao (
 idprofissao SERIAL NOT NULL,
 nome VARCHAR(80) NOT NULL,
 CONSTRAINT profissao_PK PRIMARY KEY(idprofissao)
);

CREATE TABLE analise_WALD (
 idwald SERIAL NOT NULL,
 alfa FLOAT NOT NULL,
 beta FLOAT NOT NULL,
 p0 FLOAT NOT NULL,
 p1 FLOAT NOT NULL,
 n INTEGER NOT NULL,
 CONSTRAINT alanise_WALD_PK PRIMARY KEY(idwald)
);

CREATE TABLE alimento (
 idalimento SERIAL NOT NULL,
 nome VARCHAR(255) NOT NULL,
 CONSTRAINT alimento_PK PRIMARY KEY(idalimento)
);

CREATE TABLE amostra (
 idamostra SERIAL NOT NULL,
 descricao VARCHAR(50) NOT NULL,
 CONSTRAINT amostra_PK PRIMARY KEY(idamostra)
);

CREATE TABLE tipo_teste (
 idtipo_teste SERIAL NOT NULL,
 descricao VARCHAR(50) NOT NULL,
 CONSTRAINT tipo_teste_PK PRIMARY KEY(idtipo_teste)
);

CREATE TABLE tipo_problema (
 idtipo_problema SERIAL NOT NULL,
 descricao VARCHAR(30) NOT NULL,
 CONSTRAINT tipo_problema_PK PRIMARY KEY(idtipo_problema)
);

CREATE TABLE dia_semana (
 iddia_semana SERIAL NOT NULL,
 descricao VARCHAR(20) NOT NULL,
 CONSTRAINT dia_semana_PK PRIMARY KEY(iddia_semana)
);

CREATE TABLE pessoa_juridica (
 idpessoa SERIAL NOT NULL,
 cnpj CHAR(20) NULL,
 CONSTRAINT pessoa_juridica_PK PRIMARY KEY(idpessoa),
 FOREIGN KEY(idpessoa)
  REFERENCES pessoa(idpessoa)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX pessoa_juridica_FK1
 ON pessoa_juridica (idpessoa);

CREATE TABLE teste (
 idteste SERIAL,
 idtipo_teste INTEGER NOT NULL,
 nome VARCHAR(80) NOT NULL,
 construido BOOL NOT NULL DEFAULT FALSE,
 CONSTRAINT teste_PK PRIMARY KEY(idteste),
 FOREIGN KEY(idtipo_teste)
  REFERENCES tipo_teste(idtipo_teste)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX teste_FK1
 ON teste (idtipo_teste);

CREATE TABLE uf (
 iduf CHAR(2) NOT NULL,
 idpais INTEGER NOT NULL DEFAULT 1,
 nome VARCHAR(80) NOT NULL,
 CONSTRAINT uf_PK PRIMARY KEY(iduf, idpais),
 FOREIGN KEY(idpais)
  REFERENCES pais(idpais)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX uf_FK1
 ON uf (idpais);

CREATE TABLE contato (
 idpessoa INTEGER NOT NULL,
 idtipo_contato INTEGER NOT NULL,
 contato VARCHAR(80) NOT NULL,
 observacao TEXT NULL,
 CONSTRAINT contato_PK PRIMARY KEY(idpessoa, idtipo_contato, contato),
 FOREIGN KEY(idtipo_contato)
  REFERENCES tipo_contato(idtipo_contato)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 FOREIGN KEY(idpessoa)
  REFERENCES pessoa(idpessoa)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX contato_FK1
 ON contato (idtipo_contato);
CREATE INDEX contato_FK2
 ON contato (idpessoa);

CREATE TABLE alimento_amostra (
 idalimento INTEGER NOT NULL,
 idamostra INTEGER NOT NULL,
 CONSTRAINT alimento_amostra_PK PRIMARY KEY(idalimento, idamostra),
 FOREIGN KEY(idalimento)
  REFERENCES alimento(idalimento)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 FOREIGN KEY(idamostra)
  REFERENCES amostra(idamostra)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX alimento_amostra_FK1
 ON alimento_amostra (idalimento);
CREATE INDEX alimento_amostra_FK2
 ON alimento_amostra (idamostra);

CREATE TABLE periodo_horario (
 idperiodo INTEGER NOT NULL,
 idhorario INTEGER NOT NULL,
 CONSTRAINT periodo_horario_PK PRIMARY KEY(idperiodo, idhorario),
 FOREIGN KEY(idperiodo)
  REFERENCES periodo(idperiodo)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 FOREIGN KEY(idhorario)
  REFERENCES horario(idhorario)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX periodo_horario_FK1
 ON periodo_horario (idperiodo);
CREATE INDEX periodo_horario_FK2
 ON periodo_horario (idhorario);

CREATE TABLE processo (
 idprocesso SERIAL NOT NULL,
 titulo VARCHAR(255) NOT NULL,
 idteste INTEGER NOT NULL,
 idempresa INTEGER NOT NULL,
 objetivo_id INTEGER NOT NULL,
 objetivo_especifico TEXT NOT NULL,
 material TEXT NULL,
 data_hora TIMESTAMP NOT NULL DEFAULT current_timestamp,
 data_agenda DATE NULL,
 CONSTRAINT processo_PK PRIMARY KEY(idprocesso),
 FOREIGN KEY(idteste)
  REFERENCES teste(idteste)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 FOREIGN KEY(idempresa)
  REFERENCES pessoa_juridica(idpessoa)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 FOREIGN KEY(objetivo_id)
  REFERENCES processo_objetivo(idobjetivo)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX processo_FK1
 ON processo (idteste);
CREATE INDEX processo_FK2
 ON processo (idempresa);
CREATE INDEX processo_FK3
 ON processo (objetivo_id);

CREATE TABLE pessoa_fisica (
 idpessoa INTEGER NOT NULL,
 idsexo CHAR(1) NOT NULL,
 idestado_civil INTEGER NOT NULL,
 idgrau_instrucao INTEGER NOT NULL,
 idprofissao INTEGER NOT NULL,
 rg VARCHAR(30) NULL,
 cpf VARCHAR(30) NULL,
 data_nascimento DATE NOT NULL,
 foto VARCHAR(255) NULL,
 pontualidade BOOLEAN NOT NULL,
 interessado BOOLEAN NOT NULL,
 CONSTRAINT pessoa_fisica_PK PRIMARY KEY(idpessoa),
 FOREIGN KEY(idpessoa)
  REFERENCES pessoa(idpessoa)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 FOREIGN KEY(idsexo)
  REFERENCES sexo(idsexo)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 FOREIGN KEY(idestado_civil)
  REFERENCES estado_civil(idestado_civil)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 FOREIGN KEY(idprofissao)
  REFERENCES profissao(idprofissao)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 FOREIGN KEY(idgrau_instrucao)
  REFERENCES grau_instrucao(idgrau_instrucao)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX pessoa_fisica_FK1
 ON pessoa_fisica (idpessoa);
CREATE INDEX pessoa_fisica_FK2
 ON pessoa_fisica (idsexo);
CREATE INDEX pessoa_fisica_FK3
 ON pessoa_fisica (idestado_civil);
CREATE INDEX pessoa_fisica_FK4
 ON pessoa_fisica (idprofissao);
CREATE INDEX pessoa_fisica_FK5
 ON pessoa_fisica (idgrau_instrucao);

CREATE TABLE processo_ficha (
 idficha INTEGER NOT NULL,
 enunciado TEXT NOT NULL,
 comentarios BOOL NOT NULL,
 CONSTRAINT processo_ficha_PK PRIMARY KEY(idficha),
 FOREIGN KEY(idficha)
  REFERENCES processo(idprocesso)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX processo_ficha_FK1
 ON processo_ficha (idficha);

CREATE TABLE pessoa_doente (
 idpessoa INTEGER NOT NULL,
 doente_desde DATE NULL,
 doenca TEXT NOT NULL,
 CONSTRAINT pessoa_doente_PK PRIMARY KEY(idpessoa),
 FOREIGN KEY(idpessoa)
  REFERENCES pessoa_fisica(idpessoa)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX pessoa_doente_FK1
 ON pessoa_doente (idpessoa);

CREATE TABLE users (
 user_name VARCHAR(30) NOT NULL,
 user_pass VARCHAR(30) NOT NULL,
 idpessoa INTEGER NOT NULL,
 CONSTRAINT users_PK PRIMARY KEY(user_name),
 FOREIGN KEY(idpessoa)
  REFERENCES pessoa_fisica(idpessoa)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX users_FK1
 ON users (idpessoa);

CREATE TABLE user_roles (
 role_name VARCHAR(30) NOT NULL,
 user_name VARCHAR(30) NOT NULL,
 data_hora TIMESTAMP NOT NULL DEFAULT current_timestamp,
 CONSTRAINT users_roles_PK PRIMARY KEY(role_name, user_name),
 FOREIGN KEY(user_name)
  REFERENCES users(user_name)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX user_roles_FK1
 ON user_roles (user_name);

CREATE TABLE cidade (
 idcidade SERIAL NOT NULL,
 iduf CHAR(2) NOT NULL DEFAULT 'PR',
 idpais INTEGER  NOT NULL DEFAULT 1,
 nome VARCHAR(80) NOT NULL,
 CONSTRAINT cidade_PK PRIMARY KEY(idcidade, iduf, idpais),
 FOREIGN KEY(iduf, idpais)
  REFERENCES uf(iduf, idpais)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX cidade_FK1
 ON cidade (iduf, idpais);

CREATE TABLE recrutamento (
 idprocesso INTEGER NOT NULL,
 idjulgador INTEGER NOT NULL,
 data_hora TIMESTAMP NOT NULL DEFAULT current_timestamp,
 CONSTRAINT recrutamento_PK PRIMARY KEY(idprocesso, idjulgador),
 FOREIGN KEY(idprocesso)
  REFERENCES processo(idprocesso)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 FOREIGN KEY(idjulgador)
  REFERENCES pessoa_fisica(idpessoa)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX recrutamento_FK1
 ON recrutamento (idprocesso);
CREATE INDEX recrutamento_FK2
 ON recrutamento (idjulgador);

CREATE TABLE processo_WALD (
 idprocesso INTEGER NOT NULL,
 idwald INTEGER NOT NULL,
 data_hora TIMESTAMP NOT NULL DEFAULT current_timestamp,
 FOREIGN KEY(idprocesso)
  REFERENCES processo(idprocesso)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 FOREIGN KEY(idwald)
  REFERENCES analise_WALD(idwald)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX processo_WALD_FK1
 ON processo_WALD (idprocesso);
CREATE INDEX processo_WALD_FK2
 ON processo_WALD (idwald);

CREATE TABLE emprego (
 idempresa INTEGER NOT NULL,
 idfuncionario INTEGER NOT NULL,
 trabalha_desde DATE NOT NULL,
 departamento VARCHAR(100) NOT NULL,
 cargo VARCHAR(100) NULL,
 afeta_sentidos BOOLEAN NOT NULL,
 CONSTRAINT emprego_PK PRIMARY KEY(idempresa, idfuncionario, trabalha_desde),
 FOREIGN KEY(idfuncionario)
  REFERENCES pessoa_fisica(idpessoa)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 FOREIGN KEY(idempresa)
  REFERENCES pessoa_juridica(idpessoa)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX emprego_FK1
 ON emprego (idfuncionario);
CREATE INDEX emprego_FK2
 ON emprego (idempresa);

CREATE TABLE escala (
 idficha INTEGER NOT NULL,
 idalimento INTEGER NOT NULL,
 idamostra INTEGER NOT NULL,
 repeticao_amostra INTEGER NOT NULL,
 PRIMARY KEY(idficha, idalimento, idamostra),
 FOREIGN KEY(idalimento, idamostra)
  REFERENCES alimento_amostra(idalimento, idamostra)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 FOREIGN KEY(idficha)
  REFERENCES processo_ficha(idficha)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX escala_FK1
 ON escala (idalimento, idamostra);

CREATE TABLE dieta (
 idpessoa INTEGER NOT NULL,
 idtipo_dieta INTEGER NOT NULL,
 dieta_desde DATE NOT NULL,
 CONSTRAINT dieta_PK PRIMARY KEY(idpessoa, idtipo_dieta),
 FOREIGN KEY(idtipo_dieta)
  REFERENCES tipo_dieta(idtipo_dieta)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 FOREIGN KEY(idpessoa)
  REFERENCES pessoa_fisica(idpessoa)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX dieta_FK1
 ON dieta (idtipo_dieta);
CREATE INDEX dieta_FK2
 ON dieta (idpessoa);

CREATE TABLE dia_horario (
 iddia_semana INTEGER NOT NULL,
 idperiodo INTEGER NOT NULL,
 idhorario INTEGER NOT NULL,
 CONSTRAINT dia_horario_PK PRIMARY KEY(iddia_semana, idperiodo, idhorario),
 FOREIGN KEY(iddia_semana)
  REFERENCES dia_semana(iddia_semana)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 FOREIGN KEY(idperiodo, idhorario)
  REFERENCES periodo_horario(idperiodo, idhorario)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX dia_horario_FK1
 ON dia_horario (idperiodo, idhorario);
CREATE INDEX dia_horario_FK2
 ON dia_horario (iddia_semana);

CREATE TABLE experiencia_sensorial (
 idpessoa INTEGER NOT NULL,
 idteste INTEGER NOT NULL,
 desde DATE NOT NULL,
 CONSTRAINT experiencia_sensorial_PK PRIMARY KEY(idpessoa, idteste, desde),
 FOREIGN KEY(idpessoa)
  REFERENCES pessoa_fisica(idpessoa)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 FOREIGN KEY(idteste)
  REFERENCES teste(idteste)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX experiencia_sensorial_FK1
 ON experiencia_sensorial (idpessoa);
CREATE INDEX experiencia_sensorial_FK2
 ON experiencia_sensorial (idteste);

CREATE TABLE pessoa_remedio (
 idpessoa INTEGER NOT NULL,
 idremedio INTEGER NOT NULL,
 CONSTRAINT pessoa_remedio_PK PRIMARY KEY(idpessoa, idremedio),
 FOREIGN KEY(idpessoa)
  REFERENCES pessoa_doente(idpessoa)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 FOREIGN KEY(idremedio)
  REFERENCES remedio(idremedio)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX pessoa_remedio_FK1
 ON pessoa_remedio (idpessoa);
CREATE INDEX pessoa_remedio_FK2
 ON pessoa_remedio (idremedio);

CREATE TABLE problema_alimento (
 idpessoa INTEGER NOT NULL,
 idalimento INTEGER NOT NULL,
 idtipo_problema INTEGER NOT NULL,
 CONSTRAINT problema_alimento_PK PRIMARY KEY(idpessoa, idalimento, idtipo_problema),
 FOREIGN KEY(idpessoa)
  REFERENCES pessoa_fisica(idpessoa)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 FOREIGN KEY(idalimento)
  REFERENCES alimento(idalimento)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 FOREIGN KEY(idtipo_problema)
  REFERENCES tipo_problema(idtipo_problema)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX problema_alimento_FK1
 ON problema_alimento (idpessoa);
CREATE INDEX problema_alimento_FK2
 ON problema_alimento (idalimento);
CREATE INDEX problema_alimento_FK3
 ON problema_alimento (idtipo_problema);

CREATE TABLE processo_auditoria (
 idprocesso INTEGER NOT NULL,
 idcoordenador INTEGER NOT NULL,
 idacao INTEGER NOT NULL,
 data_hora DATE NOT NULL,
 FOREIGN KEY(idcoordenador)
  REFERENCES pessoa_fisica(idpessoa)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 FOREIGN KEY(idacao)
  REFERENCES sitas_acao(idacao)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 FOREIGN KEY(idprocesso)
  REFERENCES processo(idprocesso)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX processo_auditoria_FK1
 ON processo_auditoria (idcoordenador);
CREATE INDEX processo_auditoria_FK2
 ON processo_auditoria (idacao);
CREATE INDEX processo_auditoria_FK3
 ON processo_auditoria (idprocesso);

CREATE TABLE bairro (
 idbairro SERIAL NOT NULL,
 idcidade INTEGER NOT NULL DEFAULT 574,
 iduf CHAR(2) NOT NULL DEFAULT 'PR',
 idpais INTEGER NOT NULL DEFAULT 1,
 nome VARCHAR(80) NOT NULL,
 CONSTRAINT bairro_PK PRIMARY KEY(idbairro, idcidade, iduf, idpais),
 FOREIGN KEY(idcidade, idpais, iduf)
  REFERENCES cidade(idcidade, idpais, iduf)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX bairro_FK1
 ON bairro (idcidade, idpais, iduf);

CREATE TABLE ficha_julgamento (
 idficha INTEGER NOT NULL,
 idjulgador INTEGER NOT NULL,
 comentario TEXT NULL,
 CONSTRAINT ficha_julgamento_PK PRIMARY KEY(idficha, idjulgador),
 FOREIGN KEY(idficha, idjulgador)
  REFERENCES recrutamento(idprocesso, idjulgador)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX ficha_julgamento_FK1
 ON ficha_julgamento (idficha, idjulgador);

CREATE TABLE escala_triangular (
 repeticao INTEGER NOT NULL,
 idficha INTEGER NOT NULL,
 idalimento INTEGER NOT NULL,
 idamostra INTEGER NOT NULL,
 numero_aleatorio INTEGER NOT NULL,
 CONSTRAINT escala_triangular_PK PRIMARY KEY(repeticao, idficha, idalimento, idamostra, numero_aleatorio),
 FOREIGN KEY(idamostra, idalimento, idficha)
  REFERENCES escala(idamostra, idalimento, idficha)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX escala_triangular_FK1
 ON escala_triangular (idamostra, idalimento, idficha);

CREATE TABLE disponibilidade (
 idpessoa INTEGER NOT NULL,
 iddia_semana INTEGER NOT NULL,
 idperiodo INTEGER NOT NULL,
 idhorario INTEGER NOT NULL,
 CONSTRAINT disponibilidade_PK PRIMARY KEY(idpessoa, iddia_semana, idperiodo, idhorario),
 FOREIGN KEY(idpessoa)
  REFERENCES pessoa_fisica(idpessoa)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 FOREIGN KEY(iddia_semana, idhorario, idperiodo)
  REFERENCES dia_horario(iddia_semana, idhorario, idperiodo)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX disponibilidade_FK1
 ON disponibilidade (idpessoa);
CREATE INDEX disponibilidade_FK2
 ON disponibilidade (iddia_semana, idhorario, idperiodo);

CREATE TABLE julgamento_triangular (
 repeticao INTEGER NOT NULL,
 idjulgador INTEGER NOT NULL,
 idficha INTEGER NOT NULL,
 idalimento INTEGER NOT NULL,
 idamostra INTEGER NOT NULL,
 julgamento INTEGER NOT NULL,
 CONSTRAINT julgamento_triangular_PK PRIMARY KEY(repeticao, idjulgador, idficha, idalimento, idamostra, julgamento),
 FOREIGN KEY(idjulgador, idficha)
  REFERENCES ficha_julgamento(idjulgador, idficha)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 FOREIGN KEY(idalimento, idamostra)
  REFERENCES alimento_amostra(idalimento, idamostra)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX julgamento_triangular_FK1
 ON julgamento_triangular (idjulgador, idficha);
CREATE INDEX julgamento_triangular_FK2
 ON julgamento_triangular (idalimento, idamostra);

CREATE TABLE logradouro (
 idlogradouro SERIAL NOT NULL,
 idbairro INTEGER NOT NULL,
 idcidade INTEGER NOT NULL DEFAULT 574,
 iduf CHAR(2) NOT NULL DEFAULT 'PR',
 idpais INTEGER NOT NULL DEFAULT 1,
 idtipo_logradouro INTEGER NOT NULL,
 cep CHAR(10) NULL,
 nome VARCHAR(80) NOT NULL,
 complemento VARCHAR(255) NULL,
 CONSTRAINT logradouro_PK PRIMARY KEY(idlogradouro),
 FOREIGN KEY(idtipo_logradouro)
  REFERENCES tipo_logradouro(idtipo_logradouro)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 FOREIGN KEY(idbairro, idcidade, iduf, idpais)
  REFERENCES bairro(idbairro, idcidade, iduf, idpais)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX logradouro_FK1
 ON logradouro (idtipo_logradouro);
CREATE INDEX logradouro_FK2
 ON logradouro (idbairro, idcidade, iduf, idpais);

CREATE TABLE endereco (
 idlogradouro INTEGER NOT NULL,
 idpessoa INTEGER NOT NULL,
 numero INTEGER NULL,
 complemento VARCHAR(255) NULL,
 atual BOOLEAN NOT NULL,
 CONSTRAINT endereco_PK PRIMARY KEY(idlogradouro, idpessoa, numero),
 FOREIGN KEY(idpessoa)
  REFERENCES pessoa(idpessoa)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 FOREIGN KEY(idlogradouro)
  REFERENCES logradouro(idlogradouro)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION
);
CREATE INDEX endereco_FK1
 ON endereco (idpessoa);
CREATE INDEX endereco_FK2
 ON endereco (idlogradouro);

CREATE TABLE tabela_significancia (
  idtabela INTEGER NOT NULL,
  nome VARCHAR(50) NOT NULL,
  descricao TEXT NULL,
  CONSTRAINT tabela_significancia_PK PRIMARY KEY(idtabela)
);

CREATE TABLE valores_significancia (
  idtabela INTEGER NOT NULL,
  linha INTEGER NOT NULL,
  coluna FLOAT NOT NULL,
  significancia FLOAT NOT NULL,
  valor FLOAT NULL,
  CONSTRAINT valores_significancia_PK PRIMARY KEY(idtabela, linha),
  FOREIGN KEY(idtabela)
    REFERENCES tabela_significancia(idtabela)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);
CREATE INDEX valores_significancia_FK1
 ON valores_significancia (idtabela);

CREATE TABLE teste_tabela (
  idteste INTEGER NOT NULL,
  idtabela INTEGER NOT NULL,
 CONSTRAINT teste_tabela_PK PRIMARY KEY(idteste, idtabela),
  FOREIGN KEY(idteste)
    REFERENCES teste(idteste)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(idtabela)
    REFERENCES tabela_significancia(idtabela)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);
CREATE INDEX teste_tabela_FK1
 ON teste_tabela (idteste);
CREATE INDEX teste_tabela_FK2
 ON teste_tabela (idtabela);
-- CREATE :: END