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
   "Número de ficha: Determine a exibição do número da ficha na ficha de teste.",
   // 02
   "Cabeçalho: Escolha o cabeçalho que será apresentado na ficha de teste.",
   // 03
   "Número de repetições: Determine a exibição do número de repetições na ficha de teste.",
   // 04
   "Julgador: Escolha como a identificação do julgador será exibida na ficha de teste.",
   // 05
   "Formato/data: Escolha qual formato será utilizado para data exibida na ficha de teste.",
   // 06
   "Instruções: Digite uma breve instrução para orientar os julgadores sobre o procedimento " +
    "a ser realizado.\n" +
    "(É NECESSÁRIO UMA DESCRIÇÃO!)",
   // 07
   "Cometários: Marque este campo se desejar exibir o campo comentários na ficha de teste."
  ];

  function inicio( ) {
   status = sigla + ":: Coletando informações sobre o objetivo do teste triangular!";
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
    window.alert( "É necessário uma instrução que explique o procedimento de julgamento para este teste!" );
    document.forms[ 0 ].fichaInstrucoes.focus( );
    validacao = false;
   } else { validacao = true; }
  }
//-->