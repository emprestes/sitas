// UNIVERSIDADE ESTADUAL DE PONTA GROSSA
// Setor de Ciencias e Tecnologia
// Departamento de Informatica
// Curso de Bacharelado em Informatica
// Disciplina de Projeto
// Academicos: Alex Van Margraf
//            Edson Marcio Prestes Cordeiro dos Santos
//     R. A.: 98.1.0.4.16.23
//            99.1.0.4.11.23
//   Projeto: Sistema para Testes de Avaliacao Sensorial.
//  Arquivos: sitas-teste.triangular.objetivo.jsp
//            sitas-teste.triangular.objetivo.js
//            sitas-gui.css
// JavaScript Document
<!--  
  var sigla = "SiTaS ";
  var validacao = true;
  var ajudaArray = [ // Ajuda geral.
   // 00
   "Selecione um campo para obter o texto de ajuda.", 
   // Objetivo.
   // 01
   "Avalia��o de produtos: Selecionando este item voc� estar� " +
    "destinando este teste para avaliar um produto comparando sua amostras.\n" +
    "(� NECESS�RIO ESCOLHER UMA DAS OP��ES!)",
   // 02
   "Sele��o de julgadores: Selecionando este item voc� estar� " +
    "destinando este teste para selecionar julgadores com o prop�sito futuro " +
    "de usa-los em teste para avalia��o de produtos.\n" +
    "(� NECESS�RIO ESCOLHER UMA DAS OP��ES!)",
   // 03
   "Treinamento de julgadores: Selecionando este item voc� estar� " +
    "destinando este teste para treinar julgadores, os quais estar�o participando " +
    "futuramente em testes para avalia��o de produtos.\n" +
    "(� NECESS�RIO ESCOLHER UMA DAS OP��ES!)",
   // 04
   "Descri��o: Digite aqui, qual o objetivo para este teste em rela��o ao que " +
    "vai ser testado em rela��o ao produto selecionado.\n" +
    "(� NECESS�RIO UMA DESCRI��O!)",
   // 05
   "Cliente: Escolha para que cliente este teste est� sendo criado.\n" +
    "(� NECESS�RIO ESCOLHER UMA DAS OP��ES!)"
   // Amostras e Materiais.
   // Julgadores.
   // Ficha de julgamento.
   // Relat�rio.
  ];

  function inicio( ) {
   status = sigla + ":: Coletando informa��es sobre o objetivo do teste triangular!";
  }

  // Objetivo.
  function objetivoAjudaText( menssagemNumero ) {
   if( menssagemNumero == 0 ) {
    status = sigla;
   } else {
    status = sigla + ":: Preencha os dados do objetivo deste teste.";
   }
   document.forms[ 0 ].objetivoAjuda.value = ajudaArray[ menssagemNumero ];
  }

  function chamarPagina( pagina ) {
   validarCampos( );
   // Valida��o OK.
   if( validacao ) {
    status = sigla + ":: VALIDA��O OK! Enviando dados ...";
    switch( pagina ) {
      case 2 : document.forms[ 0 ].action = "../servlet/ServAmostra";
               break;
      case 3 : document.forms[ 0 ].action = "../servlet/ServJulgador";
               break;
     case 4 : document.forms[ 0 ].method="get";
              document.forms[ 0 ].action = "../servlet/ServFicha";                
               break;
      case 5 : status = sigla + ":: Visualizando teste ...";
               document.forms[ 0 ].action = "";
               break;
     default : document.forms[ 0 ].action = 
                "../jsp/sitas-login.jsp";
    }
	document.forms[ 0 ].submit( );
   } else {
      status = sigla + ":: ERRO no preenchimento dos dados do OBJETIVO ...";
   }
  }

  function validarCampos( ) {
   status = sigla + ":: Validando dados ...";
   // Objetivo.
   if( !( ( document.forms[ 0 ].objetivoSet[ 0 ].checked ) || 
          ( document.forms[ 0 ].objetivoSet[ 1 ].checked ) ||
          ( document.forms[ 0 ].objetivoSet[ 2 ].checked ) ) ) {
    window.alert( "� necess�rio escolher um tipo de objetivo para o teste!" );
    document.forms[ 0 ].objetivoSet[ 0 ].focus( );
    validacao = false;
   } else {
	  if( document.forms[ 0 ].objetivoCliente.value == 0 ) {
       window.alert( "� necess�rio um cliente para este deste teste!" );
       document.forms[ 0 ].objetivoCliente.focus( );
       validacao = false;
	  } else {
          validacao = true; 
      }
   } 
   // Amostras e Materiais.
   // Julgadores.
   // Ficha de julgamentos.
   // Relat�rio
  }
//-->