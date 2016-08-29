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
   "Repetições por julgador: Número de repetições que cada julgador fará na realização " +
    "deste teste.\n" +
    "(ESTE ITEM DEVE POSSUIR PELO MENOS 01 REPETIÇÃO)",
   // 02
   "Codificações aleatórias: Determina que os números aleatórios serão distribuídos " +
    "por julgador.",
   // 03
   "Escolher: Escolha, no mínimo, 20 JULGAMENTOS. O que significa que terá que ter " +
    "atenção na relação JULGADORES x REPETIÇÕES. Exemplo: Na escolha de 10 julgadores " +
    "será necessário, no mínimo, 2 repetições por julgador para realizar este teste.",
   // Ficha de julgamento.
   // Relatório.
  ];

  function checkInteger(evt) {
   evt = ( evt ) ? evt : window.event;
   var charCode = ( evt.which ) ? evt.which : evt.keyCode;
   if( charCode > 31 && ( charCode < 48 || charCode > 57 ) ) {
    status = sigla + ":: Este campo aceita somente números.";
    window.alert( status );
    return false;
   }
   status = sigla;
   return true;
  }

  function inicio( ) {
   status = sigla + ":: Coletando informações sobre os julgadores do teste triangular!";
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
   // Validação OK.   
    
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
    window.alert( "É necessário, pelo menos, 01 repetição por julgador para este teste!" );
    document.forms[ 0 ].julgadorRepeticoes.value = 01;
    document.forms[ 0 ].julgadorRepeticoes.focus( );
    validacao = true;
   } else {
      // Julgamentos.
      var julgadorConte = document.forms[ 0 ].julgadorQuantidade.value * 
                          document.forms[ 0 ].julgadorRepeticoes.value;
      if( julgadorConte < 20 ) {
       window.alert( "É necessário um mínimo de 20 JULGAMENTOS para este teste!" );
       document.forms[ 0 ].julgadorRepeticoes.focus( );
       validacao = false;
      } else { validacao = true; }
   }
   // Ficha de julgamentos.
   // Relatório
  }
//-->