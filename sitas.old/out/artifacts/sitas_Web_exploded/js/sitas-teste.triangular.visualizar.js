// JavaScript Document
<!--
  function visualizar( opcao ) {
    switch( opcao ) {
       case 1: document.forms[ 0 ].action = "../servlet/ServPreviaSitas";
	       document.forms[ 0 ].submit( );
               break;
       case 2: document.forms[ 0 ].continuar.value = 1;
               document.forms[ 0 ].method="post";
               document.forms[ 0 ].action = "../servlet/ServFicha";
               document.forms[ 0 ].submit( );
               break;
                 
    }
}    
  
//-->