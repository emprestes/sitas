        var current = new Date(  );
        var data = ""; var aux ="";

        switch( current.getDay(  ) ) {
         case 0: data = data + "Domingo, ";            break;
         case 1: data = data + "Segunda-feira, ";      break;
         case 2: data = data + "Ter&ccedil;a-feira, "; break;
         case 3: data = data + "Quarta-feira, ";       break;
         case 4: data = data + "Quinta-feira, ";       break;
         case 5: data = data + "Sexta-feira, ";        break;
         case 6: data = data + "S&aacute;bado, ";      break;
         };

        aux = current.getDate(  );
        switch( aux ) {
          case 1: data = data + "01"; break;
          case 2: data = data + "02"; break;
          case 3: data = data + "03"; break;
          case 4: data = data + "04"; break;
          case 5: data = data + "05"; break;
          case 6: data = data + "06"; break;
          case 7: data = data + "07"; break;
          case 8: data = data + "08"; break;
          case 9: data = data + "09"; break;
         default: data = data + aux;
         };

        switch( current.getMonth(  ) ) {
         case  0: data = data + " de janeiro de ";   break;
         case  1: data = data + " de fevereiro de "; break;
         case  2: data = data + " de março de ";     break;
         case  3: data = data + " de abril de ";     break;
         case  4: data = data + " de maio de ";      break;
         case  5: data = data + " de junho de ";     break;
         case  6: data = data + " de julho de ";     break;
         case  7: data = data + " de agosto de ";    break;
         case  8: data = data + " de setembro de ";  break;
         case  9: data = data + " de outubro de ";   break;
         case 10: data = data + " de novembro de ";  break;
         case 11: data = data + " de dezembro de ";  break;
         };

        data = data + current.getFullYear(  ) + " ( ";

        aux = current.getHours(  );
        switch( aux ) {
          case 0: data = data + "00" + ":"; break;
          case 1: data = data + "01" + ":"; break;
          case 2: data = data + "02" + ":"; break;
          case 3: data = data + "03" + ":"; break;
          case 4: data = data + "04" + ":"; break;
          case 5: data = data + "05" + ":"; break;
          case 6: data = data + "06" + ":"; break;
          case 7: data = data + "07" + ":"; break;
          case 8: data = data + "08" + ":"; break;
          case 9: data = data + "09" + ":"; break;
         default: data = data + aux + ":";
         };

        aux = current.getMinutes(  );
        switch( aux ) {
          case 0: data = data + "00" + " )"; break;
          case 1: data = data + "01" + " )"; break;
          case 2: data = data + "02" + " )"; break;
          case 3: data = data + "03" + " )"; break;
          case 4: data = data + "04" + " )"; break;
          case 5: data = data + "05" + " )"; break;
          case 6: data = data + "06" + " )"; break;
          case 7: data = data + "07" + " )"; break;
          case 8: data = data + "08" + " )"; break;
          case 9: data = data + "09" + " )"; break;
         default: data = data + aux + " )";
         };
        
        document.writeln( data );