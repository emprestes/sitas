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
    Arquivos: sitas-teste.triangular.amostra.jsp
              sitas-teste.triangular.amostra.js
              sitas-gui.css
  -->
<?xml version="1.0"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="java.util.*"%>
<%@page import="com.sitas.servlets.*"%>
<%@page  import="com.sitas.beans.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>SiTaS :: Criando Teste Triangular!!!</title>
 <link rel="stylesheet" type="text/css" href="../css/sitas-gui.css" />
 <script language="javascript1.2" type="text/javascript" src="../js/stm31.js" ></script>
 <style type="text/css">
<!--
..style1 {color: #FFFFFF}

-->
<% 
     HttpSession sessao = request.getSession(false); 
     String log = "";
     if( sessao != null ){
        log = (String) sessao.getAttribute("login");
     }
     else{
         request.getRequestDispatcher("../jsp/sitas-login.jsp").forward( request, response );
     }
     %> 
 </style>
</head>
<body class="body-fundo" onLoad="inicio()">
 <script language="javascript1.2" type="text/javascript" src="../js/sitas-teste.triangular.ficha.js" ></script>
 <script language="javascript1.2" type="text/javascript" src="../js/sitas-mainmenu.js" ></script>
 <table width="95%" height="93%" border="0" align="center">
  <tr>
   <td width="60%" align="left" valign="top">
    <b class="uepg">Universidade Estadual de Ponta Grossa</b> <br />
    Setor de Ci&ecirc;ncias Agr&aacute;rias e Tecnologia <br />
    Departamento de Engenharia de Alimentos <br />
    Laborat&oacute;rio de An&aacute;lise Sensorial <br />    <b class="data-hora">
    <script language="JavaScript1.2" type="text/javascript" src="../js/sitas-hora.js"></script>
    </b><br />
   </td>
   <td width="40%" align="center" valign="middle">
    <img src="../image/sitas-logo2.jpg" width="279" height="77" /> <br />
   </td>
  </tr>
  <tr align="right" valign="top" >
   <td height="61" colspan="2" align="center"><div align="center"><p>&nbsp;</p>
     <p>&nbsp;</p>
   </div></td>
  </tr>
  <tr align="right" valign="top" >
    <td height="36" colspan="2" align="center">&nbsp;</td>
  </tr>
  <tr align="right" valign="top" >
    <td height="146" colspan="2" align="center"><div align="center">
      <% long cod_teste = 0;
       if (sessao.getAttribute("cod_teste") != null ) {
            Long c_teste = (Long) sessao.getAttribute("cod_teste");
            cod_teste = c_teste.longValue();
       }%>
      <p> <b class="elaborar_sucesso"> TESTE TRIANGULAR N&ordm; <%= Long.toString( cod_teste ) %></b><br />
          <b class="elaborar_sucesso2">elaborado com sucesso</b></p>
    </div></td>
  </tr>
  <tr align="center" valign="middle">
   <td height="80" colspan="2"><form name="form1" id="form1" method="get" action="../servlet/ServFicha">
     <input type="submit" name="sucesso" value="OK"/>
   </form>     &#160;</td>
  </tr>
 </table>
 <div align="center" class="autores">por 
 <a href="mailto:projetositas@uol.com.br"> Margraf, A. V. </a>e <a href="mailto:projetositas@uol.com.br">Prestes,
 E. M.</a> </div>
 <% if (sessao.getAttribute("cod_teste") != null ){
        sessao.removeAttribute("cod_teste");
    }%>
</body>
</html>