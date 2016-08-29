// JavaScript Document
<!--  
  var sigla = "SiTaS";

  function validar( ) {
      status = sigla + " :: Iniciando validacao...";
      var contar = 0;
      if( document.forms[ 0 ].amostra1.checked ) {
          contar++;
          document.forms[ 0 ].resposta.value = document.forms[ 0 ].amostra1.value;
      }      

      if( document.forms[ 0 ].amostra2.checked ) {
       contar++;
       document.forms[ 0 ].resposta.value = document.forms[ 0 ].amostra2.value;
      }

      if( document.forms[ 0 ].amostra3.checked ) {
       contar++;
       document.forms[ 0 ].resposta.value = document.forms[ 0 ].amostra3.value;
      }
       
     
      switch( contar ) {
          case 00:
          case 02:
          case 03:
            status = sigla + " :: ERRO DE VALIDACAO....";
            window.alert( "Por favor, marque UMA AMOSTRA (DIFERENTE)!" )
            break;
          case 01:
            status = sigla + " :: VALIDACAO OK, enviando dados...";
            document.forms[ 0 ].click.value = 1;
            document.forms[ 0 ].action = "../servlet/ServRealTeste";
            document.forms[ 0 ].submit( );
            break;
	  }
  }
//-->
