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
<%  response.setHeader("Cache-Control","no-cache.must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Last-Modified", System.currentTimeMillis()); %>
<html>
 <head>
  <title>SiTaS :: Bem Vindo!!!</title>
  <link rel="stylesheet" type="text/css" href="../css/sitas-gui.css" />
  <script type="text/html" language="JavaScript1.2" src="../js/sitas-login.js"></script>
 </head>
 <body class="body-fundo" onload="start()">
 <% HttpSession sessao = request.getSession( false );
    if( sessao != null ){
        sessao.invalidate();
    }%>
  <table width="95%" border="0" align="center">
   <tr>
    <td width="70%" height="100" align="left" valign="top">     <p><span class="uepg">Universidade Estadual de Ponta Grossa</span><br />
      Setor de Ci&ecirc;ncias Agr&aacute;rias e Tecnologia<br />
      Departamento de Engenharia de Alimentos<br />
      Laborat&oacute;rio de An&aacute;lise Sensorial<br />
      <span class="data-hora">
      <script language="JavaScript1.2" type="text/javascript" src="../js/sitas-hora.js"></script>
     </span>      </p></td>
    <td width="30%" align="center" valign="middle">     <span class="data-hora">
     </span></td>
   </tr>
   <tr align="center" valign="middle">
       <td colspan="2"><img alt="" src="../image/sitas-logo.main.jpg" width="397" height="113">      <br />
        <form name="formacesso" id="formacesso" method="get" action="">
      <table width="80%" border="0">
       <tr>
        <td width="50%" align="right" valign="middle">Usu&aacute;rio:<br />
         Senha:</td>
        <td width="50%">
         <input name="login" type="text" id="login" /><br />
         <input name="password" type="password" id="password" maxlength="8" /></td></tr>
       <tr align="center" valign="middle">
        <td colspan="2">
         <p>
          <input name="entrar" type="button" id="entrar" value="ENTRAR" onclick="validar( )" />
          <input name="limpar" type="reset" id="limpar" value="LIMPAR" />
         </p>
     </td></tr></table></form></td></tr>
 </table>
     <div align="center" class="autores">por <a href="mailto:alexvan@brturbo.com">Margraf,
         A. V.</a>       e      <a href="mailto:projetositas@uol.com.br">Prestes,
      E. M.</a></div>
 </body>
</html>