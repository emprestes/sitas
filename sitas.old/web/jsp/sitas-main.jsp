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
    Arquivos: sitas-login.jsp
              sitas-gui.css
  -->
<%@page import="java.util.*"%>
<%@page import="com.sitas.beans.*"%>
<%@page import="java.text.DecimalFormat"%>
<html>
 <head>
  <title>SiTaS :: Seja Bem Vindo!!!</title>
  <link rel="stylesheet" type="text/css" href="../c ss/sitas-gui.css" />
  <script language="javascript1.2" type="text/javascript" src="../js/stm31.js" ></script>
  <meta http-equiv="Refresh" content="60" />
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
  <script language="javascript1.2" type="text/javascript" src="../js/sitas-mainmenu.js" > </script>
  <table width="95%" border="0" align="center">
   <tr>
    <td width="70%" height="100" align="left" valign="top">     <p><span class="uepg">Universidade Estadual de Ponta Grossa</span><br />
      Setor de Ci&ecirc;ncias Agr&aacute;rias e Tecnologia<br />
      Departamento de Engenharia de Alimentos<br />
      Laborat&oacute;rio de An&aacute;lise Sensorial <br />
      <span class="data-hora">
      <script language="JavaScript1.2" type="text/javascript" src="../js/sitas-hora.js"></script>
     </span>      </p></td>
    <td width="30%" align="center" valign="middle">
      <div align="right"><img alt="" src="../image/sitas-logo.main.jpg" width="286" height="82" /><br/>
      <span class="data-hora">     </span></div></td>
   </tr>
   <tr align="right" valign="top">
    <td colspan="2"> 
     <table width="90%" border="0">
      <tr>
       <td colspan="4" align="center" valign="middle"></td></tr>
      <tr align="left" valign="bottom">
       <td height="0">&nbsp;</td>
       <td height="0" colspan="3">
        <p><a href="../jsp/sitas-main.jsp?login=<%= log %>" target="mainFrame">SiTaS</a> :: Seja bem-vindo!!!</p></td></tr>
      <tr align="left" valign="bottom">
       <td width="5%" height="0" rowspan="2">&nbsp;</td>
       <td colspan="2">Ol&aacute; <b><%= log %>!!</b></td>
       <td width="50%" align="right">&nbsp;        </td>
      </tr>
      <tr align="left" valign="bottom">
       <td height="0" colspan="3" class="body-fundo-celula">O SiTaS possui:</td></tr>
      <tr>
       <td width="5%">&nbsp;</td>
       <td width="5%">&nbsp;</td>
       <td colspan="2" align="left" valign="top">
    <% BeanPreviaSitas beanPrevia = (BeanPreviaSitas) sessao.getAttribute("BeanPrevia");
        DecimalFormat formato = new DecimalFormat("0000"); %>
        <p><b><%= formato.format( 9 )%> Coordenador(es) cadastrado(s);<br />
         <%= formato.format( 8 )%> Julgador(es) cadastrado(s);<br />
         <%= formato.format( 7 )%> Amostra(s) cadastrada(s);<br />
         <%= formato.format( 6 )%> Produto(s) cadastrado(s);</b><br />
         <%= formato.format( 5 )%> Teste(s) criado(s) por voc&ecirc;;<br />
         <%= formato.format( 4 )%> Teste(s) conclu&iacute;do(s);<br />
         <%= formato.format( 3 )%> Teste(s) n&atilde;o conclu&iacute;do(s);<br />
         
        <tr align="left" valign="bottom">
       <td rowspan="2">&nbsp;</td></tr>
      <tr align="left" valign="bottom">
       <td colspan="3" class="body-fundo-celula">Voc&ecirc; possui, atualmente:</td></tr>
      <tr>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td colspan="2" align="left" valign="top">
        <p><b><%= formato.format( 10 )%> Teste(s) para voc&ecirc; realizar;</b><br />
         <%= formato.format( 9 )%> Teste(s) j&aacute; realizados por voc&ecirc;;<br />
         </p></td></tr></table></td></td></tr></table><br />
  <div align="center" class="autores">por 
   <a href="mailto:alexvan@brturbo.com">Margraf, A. V.</a>e <a href="mailto:projetositas@uol.com.br">Prestes,
   E. M.</a> </div>
 </body>
</html>