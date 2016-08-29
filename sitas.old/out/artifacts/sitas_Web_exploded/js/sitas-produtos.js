// JavaScript Document
<!--
  var sigla = "SiTaS";

  function inicio( pagina ) {
    switch( pagina ) {
      case 1: status = sigla + " :: Página de inclusão de produtos";
      break;
      case 2: status = sigla + " :: Página de alteração de produtos";
      break;
      case 3: status = sigla + " :: Página de exclusão de produtos";
      break;
      case 4: status = sigla + " :: Página de atualização da lista de produtos";
      break;
    }
  }

  function marcarProdutos( ) {
    var contar = 0;
	var form = window.document.forms[ 0 ];
    while( contar < form.elements.length ) {
      if( form.elements[ contar ].type == "checkbox" ) {
        if( form.campoMarcar.value == "NENHUM" ) {
		  form.elements[ contar ].checked = false;
        } else {
		  form.elements[ contar ].checked = true;
		}
	  }
      contar++;
	}
    if( form.campoMarcar.value == "NENHUM" ) {
      form.campoMarcar.value = "TODOS";
    } else {
      form.campoMarcar.value = "NENHUM";
	}
  }

  function gerenciarProdutos( opcao ) {
    var valido = true;

    switch( opcao ) {
       case 5: if( document.forms[ 0 ].novoProduto.value == "" ) {
                 valido = false;
                 status = sigla + " :: Preencha o campo necessário!";
                 window.alert( "Por favor, é necessário o preenchimento para incluir um novo produto!" );
                 document.forms[ 0 ].novoProduto.focus( );
               } else {
                   var campo = document.forms[ 0 ].novoProduto.value;
				   var contador = 0;

                   while( contador < campo.length ) {
                     if( campo.charAt( contador ) == ' ' ) {
                       contador++;
					 } else { break; }
                   }
                   campo = campo.substring( ( contador ), ( campo.length ) );

				   contador = campo.length - 1;
                   while( contador > 0 ) {
                     if( campo.charAt( contador ) == ' ' ) {
                       contador--;
					 } else { 
					   contador++; 
					   break;
					 }
                   }
                   campo = campo.substring( 0, contador );
				   var aux1 = campo.charAt( 0 );
				   var aux2 = campo.substring( 1, contador );
				   aux1 = aux1.toUpperCase( );
				   aux2 = aux2.toLowerCase( );
				   campo = aux1 + aux2;

				   document.forms[ 0 ].novoProduto.value = campo;
               }
        break;
       case 7: valido = false;
               for( var i = 0; i < window.document.forms[0].elements.length; i++ ) {
                 if( window.document.forms[0].elements[i].checked ) {
                   valido = true;
				   break;
                 }
               }
               if( ! valido ) {
                 status = sigla + " :: Marque o(s) campo(s) que deseja excluir!";
                 window.alert( "Por favor, é necessário marcar o(s) campo(s) que deseja excluir!" );
               }
        break;
    }

    if( valido ) {
      document.forms[ 0 ].gerente.value = opcao;
      document.forms[ 0 ].action = "../servlet/gerenteProdutos"; 
      document.forms[ 0 ].submit( );
	} 
  }
//-->