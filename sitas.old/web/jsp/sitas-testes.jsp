<!--
 UNIVERSIDADE ESTADUAL DE PONTA GROSSA
  Setor de Ciencias e Tecnologia
  Departamento de Informatica
  Curso de Bacharelado em Informatica
  Disciplina de Projeto
  Academicos: Alex Van Margraf
              Edson Marcio Prestes Cordeiro dos Santos
       R. A.: 98.1.0.4.16.23
	      99.1.0.4.11.23
     Projeto: Sistema para Testes de Avaliacao Sensorial.
    Arquivos: sitas-testes.jsp
              sitas-gui.css
  -->
<%@page import="java.util.*"%>
<%@page import="com.sitas.beans.*"%>
<html>
 <head>
  <title>SiTaS :: Testes de An&aacute;lise Sensorial!!!</title>
  <link rel="stylesheet" type="text/css" href="../css/sitas-gui.css" />
  <script language="javascript1.2" type="text/javascript" src="../js/stm31.js" ></script>
  <script language="javascript1.2" type="text/javascript" src="../js/sitas-realizarteste.triangular.js" ></script>
 </head>
<% 
     HttpSession sessao = request.getSession( false ); 
     String log = "";
     if( sessao != null ){
        log = (String) sessao.getAttribute( "login" );
     }
     else{
         request.getRequestDispatcher( "../jsp/sitas-login.jsp" ).forward( request, response );
     }
     %>
 <body class="body-fundo">
 <form method="post" name="escolheu-testes" target="mainFrame" id="form-testes">
  <% BeanJulgador bean = (BeanJulgador) sessao.getAttribute("julgador");
    if( bean != null && ( bean.getIsCoordenador() == true ) ){ %>
        <script language="javascript1.2" type="text/javascript" src="../js/sitas-mainmenu.js" > </script>
  <% }
     else
         if( bean != null && ( bean.getIsCoordenador() == false ) ) { %>
             <script language="javascript1.2" type="text/javascript" src="../js/sitas-menujulgador.js" > </script>
  <%     }  %>
  <table width="95%" height="94%"  border="0" align="center">
   <tr>
    <td width="70%" height="100" align="left" valign="top">     <p><span class="uepg">Universidade Estadual de Ponta Grossa</span><br />
      Setor de Ci&ecirc;ncias Agr&aacute;rias e Tecnologia<br />
      Departamento de Engenharia de Alimentos<br />
      Laborat&oacute;rio de An&aacute;lise Sensorial<br />
      <span class="data-hora">
      <script language="JavaScript1.2" type="text/javascript" src="../js/sitas-hora.js"></script>
     </span>      </p></td>
    <td width="30%" align="center" valign="middle">
     <img src="../image/sitas-logo.main.jpg" width="286" height="82" /><br/>
     <span class="data-hora">     </span></td>
   </tr>
   <tr align="right" valign="top">
    <td colspan="2"> 
     <table width="90%"  border="0">
      <tr>
       <td colspan="3" align="center" valign="middle">&nbsp;</td></tr>
      <tr align="left" valign="bottom">
       <td height="0">&nbsp;</td>
       <td height="0" colspan="2">
        </td></tr>
      <tr align="right" valign="bottom">
       <td width="5%" height="0" rowspan="2">&nbsp;</td></tr>
      <tr align="left" valign="bottom">
       <td width="25%" height="0" align="left" valign="baseline" >Ol&aacute; <b><%= log %>!!!</b></td>
       <td width="70%" height="0" align="right" valign="baseline" >
      </td></tr>
      <tr align="left" valign="bottom">
       <td width="5%" height="0" rowspan="2">&nbsp;</td></tr>
      <tr align="left" valign="bottom">
       <td height="0" colspan="2" class="teste-fundo-celula">O(s) teste(s) inclu&iacute;do(s) no SiTaS &eacute;(s&atilde;o):</td></tr>
      <tr align="left" valign="bottom">
       <td rowspan="2">&nbsp;</td></tr>
      <tr align="left" valign="bottom">
       <td height="0" colspan="2"><table width="100%" border="0">
      <tr align="right" valign="bottom" class="teste-fundo-celula">
      <input type="hidden" name="escolheu" value="0"/>
      <% int num = 0;
         if( sessao.getAttribute( "numeroTestesJulgador" ) != null ){
             Integer numero = ( Integer ) sessao.getAttribute( "numeroTestesJulgador" );
             if( numero.intValue() != 0 )
                 num = numero.intValue();
         }
        %>
       <td colspan="4">Voc&ecirc; possu&iacute; <b><%= num %> teste(s)</b> a serem realizado(s) no SiTaS.</td></tr>
      <tr bgcolor="#008080" class="teste-fundo-celula">
      <td width="40%" align="left" valign="middle"><b>TESTE</b></td>
       <td width="20%" align="center" valign="middle" class="pequeno"><b>OBJETIVO</b></td>
       <td width="20%" align="center" valign="middle" class="pequeno"><b>CRIADO POR</b></td>
       <td width="20%" align="center" valign="middle" class="pequeno"><b>CRIADO EM</b></td></tr>
      <% BeanTeste teste;
         if( sessao.getAttribute( "testes" ) != null ){
            ArrayList testes  = (ArrayList) sessao.getAttribute( "testes" );
            Iterator iter = testes.iterator();
            if( testes.size() > 0 ){
                int i = -1;
                while( iter.hasNext() ){
                    ++i;
                    teste = (BeanTeste) iter.next();%>
                    <tr class="teste-fundo-linha<%= (i % 2) == 0 ? 2 : 1 %>" >
                    <td><a href="javascript:escolherTeste(<%= teste.getCodTeste() %>)" target="mainFrame"><%= teste.getCodTeste() %> <%= teste.getNome() %></a></td>
                    <td><%= teste.getObjetivo() %></td>
                    <td><%= teste.getNomeCoordenador() %></td>
                    <td><%= teste.getDataCriacao() %></td></tr>
                    <%}
                if( testes.size() < 12 ){
                    int y = testes.size();
                    for( ; y < 12; ++y ){%>
                        <tr class="teste-fundo-linha<%= (y % 2) == 0 ? 2 : 1 %>" >
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td></tr>
                  <%}
                }
 
            }
            else{%>
       <tr class="teste-fundo-linha2">
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td></tr>
      <tr class="teste-fundo-linha1">
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td></tr>
      <tr class="teste-fundo-linha2">
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td></tr>
      <tr class="teste-fundo-linha1">
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td></tr>
      <tr class="teste-fundo-linha2">
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td></tr>
      <tr class="teste-fundo-linha1">
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td></tr>
      <tr class="teste-fundo-linha2">
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td></tr>
      <tr class="teste-fundo-linha1">
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td></tr>
      <tr class="teste-fundo-linha2">
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td></tr>
      <tr class="teste-fundo-linha1">
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td></tr>
      <tr class="teste-fundo-linha2">
            <%}
        }
        else{%>
          <tr class="teste-fundo-linha2">
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td></tr>
      <tr class="teste-fundo-linha1">
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td></tr>
      <tr class="teste-fundo-linha2">
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td></tr>
      <tr class="teste-fundo-linha1">
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td></tr>
      <tr class="teste-fundo-linha2">
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td></tr>
      <tr class="teste-fundo-linha1">
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td></tr>
      <tr class="teste-fundo-linha2">
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td></tr>
      <tr class="teste-fundo-linha1">
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td></tr>
      <tr class="teste-fundo-linha2">
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td></tr>
      <tr class="teste-fundo-linha1">
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td></tr>
        <%}
%>     
 </form>
      <tr class="teste-fundo-linha2">
       <td align="right" valign="top"></td>
       <td height="30" colspan="3" align="right" valign="top">
      <span class="sitas">Projeto SiTaS / DEA / UEPG</span></td></tr></table></td></tr></table></td></tr>
   <tr align="center" valign="middle">
    <td height="30" colspan="2">&nbsp;</td></tr></table><br />
  <div align="center" class="autores">por <a href="mailto:alexvan@brturbo.com">Margraf,
   A. V.</a>    e <a href="mailto:projetositas@uol.com.br">Prestes, E. M.</a> </div>
 </body>
</html>