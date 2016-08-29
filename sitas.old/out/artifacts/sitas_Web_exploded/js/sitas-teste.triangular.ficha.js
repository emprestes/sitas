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
   // Amostras e Materiais.
   // Julgadores.
   // Ficha de julgamento.
   // 01
   "N�mero de ficha: Determine a exibi��o do n�mero da ficha na ficha de teste.",
   // 02
   "Cabe�alho: Escolha o cabe�alho que ser� apresentado na ficha de teste.",
   // 03
   "N�mero de repeti��es: Determine a exibi��o do n�mero de repeti��es na ficha de teste.",
   // 04
   "Julgador: Escolha como a identifica��o do julgador ser� exibida na ficha de teste.",
   // 05
   "Formato/data: Escolha qual formato ser� utilizado para data exibida na ficha de teste.",
   // 06
   "Instru��es: Digite uma breve instru��o para orientar os julgadores sobre o procedimento " +
    "a ser realizado.\n" +
    "(� NECESS�RIO UMA DESCRI��O!)",
   // 07
   "Comet�rios: Marque este campo se desejar exibir o campo coment�rios na ficha de teste."
  ];

  function inicio( ) {
   status = sigla + ":: Coletando informa��es sobre o objetivo do teste triangular!";
  }

  // Objetivo.
  function fichaAjudaText( menssagemNumero ) {
   if( menssagemNumero == 0 ) {
    status = sigla;
   } else {
    status = sigla + ":: Preencha os dados do objetivo deste teste.";
   }
   document.forms[ 0 ].fichaAjuda.value = ajudaArray[ menssagemNumero ];
  }

  function chamarPagina( pagina ) {
   switch( pagina ) {
      case 1 : document.forms[ 0 ].action = "../servlet/ServObjetivo";
               break;
      case 2 : document.forms[ 0 ].action = "../servlet/ServAmostra";
               break;
      case 3 : document.forms[ 0 ].action = "../servlet/ServJulgador";
               break;
      case 5 : validarCampos( );
               if( validacao ) {
               document.forms[ 0 ].concluir.value = 1;
               document.forms[ 0 ].action = "../servlet/ServFicha";
               }
               else{
                    status = sigla + ":: ERRO no preenchimento dos dados da FICHA DE JULGAMENTO ...";
                    document.forms[ 0 ].action = "../jsp/sitas-teste.triangular.ficha.jsp";
               }
               break;
      case 6: status = sigla + ":: Visualizando teste ...";
              document.forms[ 0 ].visualizar.value = 1;
              document.forms[ 0 ].method="post";
              document.forms[ 0 ].action = "../servlet/ServFicha";
              break;
     default : document.forms[ 0 ].action = 
                "../jsp/sitas-login.jsp";
    }
	document.forms[ 0 ].submit( );

  }

  function validarCampos( ) {
   status = sigla + ":: Validando dados ...";
   // Objetivo.
   // Amostras e Materiais.
   // Julgadores.
   // Ficha de julgamentos.
   if( document.forms[ 0 ].fichaInstrucoes.value.length == 0 ) {
    window.alert( "� necess�rio uma instru��o que explique o procedimento de julgamento para este teste!" );
    document.forms[ 0 ].fichaInstrucoes.focus( );
    validacao = false;
   } else { validacao = true; }
  }
//-->