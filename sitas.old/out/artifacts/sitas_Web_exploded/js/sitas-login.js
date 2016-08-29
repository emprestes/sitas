// JavaScript Document
  <!--
   function start(){document.forms[0].login.focus();}
   function validar() {
    status = "Validando acesso ...";
    if( document.forms[0].login.value.length == 0 ) {
     window.alert( "Por favor, escreva seu nome de usu�rio ..." );
     document.forms[0].login.focus();
    }
	 else {
	  if( document.forms[0].password.value.length == 0 ) {
       window.alert( "Por favor, escreva sua senha ..." );
       document.forms[0].password.focus();
      } 
	   else {
         if( document.forms[0].password.value.length <= 5 ) {
          window.alert( "Desculpe, sua senha tem que conter entre 6 a 8 caracteres!" );
         } else { 
		    document.forms[0].action = "../servlet/ServValidaLogin";
			document.forms[0].submit(); } 
	   }
	 }
   }
   // -->
