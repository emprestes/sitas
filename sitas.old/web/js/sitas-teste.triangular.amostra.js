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
   // 01
   "Produto: Escolha o produto que será testado e analisado.\n" +
    "(É NECESSÁRIO ESCOLHER UMA OPÇÃO!)",
   // 02
   "1ª amostra: Escolha a primeira amostra referente ao produto selecionado.\n" +
    "(É NECESSÁRIO ESCOLHER UMA OPÇÃO!)",
   // 03
   "2ª amostra: Escolha a segunda amostra referente ao produto selecionado.\n" +
    "(É NECESSÁRIO ESCOLHER UMA OPÇÃO!)",
   // 04
   "Amostras iguais: Selecione qual das amostras escolhidas será igual.\n" +
    "(É NECESSÁRIO ESCOLHER UMA OPÇÃO!)",
   // 05
   "Descrição: Faça uma breve descrição sobre os materiais utilizado neste teste.\n" +
    "(É NECESSÁRIO UMA DESCRIÇÃO!)",
   // Julgadores.
   // Ficha de julgamento.
   // Relatório.
  ];

  function inicio( ) {
   status = sigla + ":: Coletando informações sobre amostras e materiais do teste triangular!";
  }

  function amostraAjudaText( menssagemNumero ) {
   if( menssagemNumero == 0 ) {
    status = sigla;
   } else {
    status = sigla + ":: Preencha os dados das amostras e materiais utilizados neste teste.";
   }

   document.forms[ 0 ].amostraAjuda.value = ajudaArray[ menssagemNumero ];
  }

  function chamarPagina( pagina ) {
   validarCampos( );
   // Validação OK.
   if( validacao ) { 
   
    status = sigla + ":: VALIDAÇÃO OK! Enviando dados ...";
    switch( pagina ) {
      case 1 : document.forms[ 0 ].action = "../servlet/ServObjetivo";
               break;
      case 3 : document.forms[ 0 ].action = "../servlet/ServJulgador";
               break;
      case 4 : document.forms[ 0 ].method="get";
               document.forms[ 0 ].action = "../servlet/ServFicha";                
               break;
      case 5 : status = sigla + ":: Visualizando teste ...";
               document.forms[ 0 ].action = "";
               break;
     default : 
               document.forms[ 0 ].action = 
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
   // Amostras e Materiais.
   if( document.forms[ 0 ].amostraProduto.value == 0 ) {
    window.alert( "É necessário escolher um produto para o teste!" );
    document.forms[ 0 ].amostraProduto.focus( );
    validacao = false;
   } else {
      if( document.forms[ 0 ].amostraUm.value == 0 ) {
       window.alert( "É necessário escolher a primeira amostra para este teste!" );
       document.forms[ 0 ].amostraUm.focus( );
       validacao = false;
      } else {
         if( document.forms[ 0 ].amostraDois.value == 0 ) {
          window.alert( "É necessário escolher a segunda amostra para este teste!" );
          document.forms[ 0 ].amostraDois.focus( );
          validacao = false;
         } else {
            if( !( ( document.forms[ 0 ].amostraIgual[ 0 ].checked ) ||
                   ( document.forms[ 0 ].amostraIgual[ 1 ].checked ) ) ) {
             window.alert( "É necessário escolher qual amostra será igual para este teste!" );
             document.forms[ 0 ].amostraIgual[ 0 ].focus( );
             validacao = false;
            } else {
               if( document.forms[ 0 ].materialDescricao.value.length == 0 ) {
                window.alert( "É necessário descrever sobre qual material será usado neste teste!" );
                document.forms[ 0 ].materialDescricao.focus( );
                validacao = false;
               }
               else{
                   document.forms[ 0 ].configAmostras.value = 1;
                   validacao = true;                   
               }
            }
         }
      }
   }
   // Julgadores.
   // Ficha de julgamentos.
   // Relatório
  }
//-->