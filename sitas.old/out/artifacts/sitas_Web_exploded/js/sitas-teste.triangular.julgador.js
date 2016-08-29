//  UNIVERSIDADE ESTADUAL DE PONTA GROSSA
//  Setor de Ciencias e Tecnologia
//  Departamento de Informatica
//  Curso de Bacharelado em Informatica
//  Disciplina de Projeto
//  Academicos: Alex Van Margraf
//              Edson Marcio Prestes Cordeiro dos Santos
//       R. A.: 98.1.0.4.16.23
//              99.1.0.4.11.23
//     Projeto: Sistema para Testes de Avaliacao Sensorial.
//    Arquivos: sitas-teste.triangular.amostra.jsp
//              sitas-teste.triangular.amostra.js
//              sitas-gui.css
// JavaScript Document
<!--  
  var validacao = true;
  var sigla = "SiTaS ";
  var ajudaArray = [ // Ajuda geral.
   // 00
   "Selecione um campo para obter o texto de ajuda.", 
   // Objetivo.
   // Amostras e Materiais.
   // Julgadores.
   // 01
   "Repeti��es por julgador: N�mero de repeti��es que cada julgador far� na realiza��o " +
    "deste teste.\n" +
    "(ESTE ITEM DEVE POSSUIR PELO MENOS 01 REPETI��O)",
   // 02
   "Codifica��es aleat�rias: Determina que os n�meros aleat�rios ser�o distribu�dos " +
    "por julgador.",
   // 03
   "Escolher: Escolha, no m�nimo, 20 JULGAMENTOS. O que significa que ter� que ter " +
    "aten��o na rela��o JULGADORES x REPETI��ES. Exemplo: Na escolha de 10 julgadores " +
    "ser� necess�rio, no m�nimo, 2 repeti��es por julgador para realizar este teste.",
   // Ficha de julgamento.
   // Relat�rio.
  ];

  function checkInteger(evt) {
   evt = ( evt ) ? evt : window.event;
   var charCode = ( evt.which ) ? evt.which : evt.keyCode;
   if( charCode > 31 && ( charCode < 48 || charCode > 57 ) ) {
    status = sigla + ":: Este campo aceita somente n�meros.";
    window.alert( status );
    return false;
   }
   status = sigla;
   return true;
  }

  function inicio( ) {
   status = sigla + ":: Coletando informa��es sobre os julgadores do teste triangular!";
  }

  function julgadorAjudaText( menssagemNumero ) {
   if( menssagemNumero == 0 ) {
    status = sigla;
   } else {
    status = sigla + ":: Preencha os dados dos julgadores utilizados neste teste.";
   }

   document.forms[ 0 ].julgadorAjuda.value = ajudaArray[ menssagemNumero ];
  }

  function chamarPagina( pagina, letra ) {
   // Valida��o OK.   
    
    switch( pagina ) {
      case 1 : document.forms[ 0 ].action = "../servlet/ServObjetivo";
               break;
      case 2 : document.forms[ 0 ].action = "../servlet/ServAmostra";
               break;
      case 4 : document.forms[ 0 ].action = "../servlet/ServFicha";
               document.forms[ 0 ].method="get";
               break;
      case 5 : document.forms[ 0 ].action = "../jsp/sitas-teste.triangular.relatorio.jsp#relatorio";
               break;
      case 6 : document.forms[ 0 ].letra.value = letra;
               document.forms[ 0 ].action = "../servlet/ServJulgador";
               break;
      case 7 : document.forms[ 0 ].maisJulgadores.value = 1;
               document.forms[ 0 ].count.value = letra;
               document.forms[ 0 ].action = "../servlet/ServJulgador";
               break;               
     default :  
               document.forms[ 0 ].action = "../jsp/sitas-login.jsp";
    }

	document.forms[ 0 ].submit( );  
  }

  function visualizarTeste( ) {
   status = sigla + ":: Visualizando teste ...";
   if( document.forms[ 0 ].visualizacaoOK.value == -1 ) {
    document.forms[ 0 ].action = "";
    document.forms[ 0 ].submit( );
   } else {
      window.alert( "Teste incompleto! " );
	  chamarPagina( parseInt( document.forms[ 0 ].visualizacaoOK.value ), 00 );	  
   }
  }

  function julgadorContar( julgador, conte ) {
   var julgadorConte = conte.value;
   if( julgador.checked ) {
    julgadorConte++;
   } else {
    julgadorConte--;
   }
   conte.value = julgadorConte;
  }

  function validarCampos( ) {
   status = sigla + ":: Validando dados ...";

   // Objetivo.
   // Amostras e Materiais.
   // Julgadores.
   if( document.forms[ 0 ].julgadorRepeticoes.value == 00 ) {
    window.alert( "� necess�rio, pelo menos, 01 repeti��o por julgador para este teste!" );
    document.forms[ 0 ].julgadorRepeticoes.value = 01;
    document.forms[ 0 ].julgadorRepeticoes.focus( );
    validacao = true;
   } else {
      // Julgamentos.
      var julgadorConte = document.forms[ 0 ].julgadorQuantidade.value * 
                          document.forms[ 0 ].julgadorRepeticoes.value;
      if( julgadorConte < 20 ) {
       window.alert( "� necess�rio um m�nimo de 20 JULGAMENTOS para este teste!" );
       document.forms[ 0 ].julgadorRepeticoes.focus( );
       validacao = false;
      } else { validacao = true; }
   }
   // Ficha de julgamentos.
   // Relat�rio
  }
//-->