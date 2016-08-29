// JavaScript Document
<!--
  var sigla = "SiTaS";

  function inicio( pagina ) {
    switch( pagina ) {
      case 1: status = sigla + " :: Página de inclusão de clientes";
       break;
      case 2: status = sigla + " :: Página de alteração de clientes";
       break;
      case 3: status = sigla + " :: Página de exclusão de clientes";
       break;
      case 4: status = sigla + " :: Página de atualização da lista de clientes";
       break;
    }
  }

  function isNumber( inputVal ) {
    oneDecimal = false;
    inputStr = inputVal.toString( );
    for( var i = 0; i < inputStr.length; i++ ) {
      var oneChar = inputStr.charAt( i );
      if( i == 0 && oneChar == "-" ) {
        continue;
      }
      if( oneChar == "." && ! oneDecimal ) {
        oneDecimal = true;
        continue;
      }
      if( oneChar < "0" || oneChar > "9" ) {
        return false;
      }
    }
    return true;
  }

  function isPosInteger( inputVal ) {
    inputStr = inputVal.toString( );
    for( var i = 0; i < inputStr.length; i++ ) {
      var oneChar = inputStr.charAt( i );
      if( oneChar < "0" || oneChar > "9" ) {
		return false;
      }
    }
    return true;
  }

  function marcarClientes( ) {
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

  function gerenciarClientes( opcao ) {
    var valido = true;
	var msn = "";
	var form = window.document.forms[0];
	var conte = 0;

    switch( opcao ) {
       case 5: for( var i = 0; i < form.elements.length; i++ ) {
                 if( form.elements[i].value == "" ) {
                   valido = false;
                   form.elements[i].focus( );
                   msn = "Este campo é obrigatório!";
				   break;
                 } else {
                   if( form.elements[i].name == "clienteNumero" ) {
                     if( ! ( isNumber( form.elements[i].value )  &&
                             isPosInteger( form.elements[i].value ) ) ) {
                       valido = false;
                       form.elements[i].focus( );
                       form.elements[i].select( );
                       msn = "Este campo só aceita número inteiro e positivo!";
                       break;
                     }
                   } else {
                     if( form.elements[i].name == "clienteCEP" ) {
                       if( ! ( isNumber( form.elements[i].value )  &&
                               isPosInteger( form.elements[i].value ) && 
                               form.elements[i].value.length == 8 ) ) {
                         valido = false;
                         form.elements[i].focus( );
                         form.elements[i].select( );
                         msn = "Este campo precisa ter 8 dígitos (ex: 12345678)!";
                         break;
                       }
                     } else {
                       var campo = form.elements[i].value;
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
                       form.elements[i].value = campo;
					 }
				   }
                 }
               }
			   if( ! valido ) {
                 status = sigla + " :: Preencha corretamente este campo!";
                 window.alert( msn );
			   }
        break;
       case 7: valido = false;
               for( var i = 0; i < form.elements.length; i++ ) {
                 if( form.elements[i].checked ) {
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
      form.gerente.value = opcao;
      form.action = "../servlet/gerenteClientes";
      form.submit( );
	}  
  }
//-->