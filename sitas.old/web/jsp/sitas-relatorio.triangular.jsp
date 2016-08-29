<html>
<!--
 UNIVERSIDADE ESTADUAL DE PONTA GROSSA
  Setor de Ciências e Tecnologia
  Departamento de Informática
  Curso de Bacharelado em Informática
  Disciplina de Projeto
  Acadêmicos: Alex Van Margraf
              Edson Marcio Prestes Cordeiro dos Santos
       R. A.: 98.1.0.4.16.23
              99.1.0.4.11.23
     Projeto: Sistema para Testes de Análise Sensorial.
    Arquivos: sitas-relatorio.triangular.jsp
              sitas-gui.css
  -->
<%@page import="java.util.*"%>
<%@page import="com.sitas.beans.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DecimalFormat"%>
<head>
 <title>SiTaS :: Relat&oacute;rio de Teste Triangular!!!</title>
 <link rel="stylesheet" type="text/css" href="../css/sitas-gui.css" />
 <script language="javascript1.2" type="text/javascript" src="../js/stm31.js" > </script>
</head>
<% /*
   HttpSession sessao = request.getSession(false); 
   String log = "";
   if( sessao != null || sessao.getAttribute("julgador") != null){
     log = (String) sessao.getAttribute("login");
     if( sessao.getAttribute("resultadoBean") == null ){
       request.getRequestDispatcher("../servlet/ServResultado").forward( request, response );
     }
   } else{
     response.sendRedirect("../jsp/sitas-login.jsp");      
   } */ %> 
<body class="body-fundo">
 <script language="javascript1.2" type="text/javascript" src="../js/sitas-mainmenu.js" > </script> 
 <table width="98%" border="0" align="center">
  <tr>
   <td width="70%" align="left" valign="top">
    <b class="uepg">Universidade Estadual de Ponta Grossa</b><br />
    Setor de Ci&ecirc;ncias Agr&aacute;rias e Tecnologia<br />
    Departamento de Engenharia de Alimentos<br />
    Laborat&oacute;rio de An&aacute;lise Sensorial<br />
    <b class="data-hora">
     <script language="JavaScript1.2" type="text/javascript" src="../js/sitas-hora.js" > </script>
    </b>
   </td>
   <td width="30%" align="center" valign="middle">
    <img src="../image/sitas-logo.main.jpg" width="286" height="82" />
   </td>
  </tr>
  <tr align="right" valign="top">
   <td colspan="2"> 
    <table width="84%" border="0">
     <tr>
      <td colspan="4" align="center" valign="middle"></td>
     </tr>
     <tr align="left" valign="bottom">
      <td width="30%" height="0" align="left" valign="baseline">
       Ol&aacute; <b><% /*= log */ %></b>
      </td>
      <td width="35%" height="0" align="center" valign="baseline">
       <img src="../image/sitas-relatorios.gif" alt="Download aqui!!!" width="16" height="16" />
      </td>
      <td width="35%" align="right" valign="baseline">&#160;</td>
     </tr>

     <tr align="left" valign="bottom">
      <td height="0" colspan="3" class="relatorio-fundo-celula">&#160;</td>
     </tr>
     <tr align="left" valign="bottom">
      <td height="0" colspan="3" align="right">
       <table width="100%" border="0">
        <tr align="center" valign="middle">
         <td height="150" colspan="7">
          <p class="relatorio-triangular-fundo-linha1">
           <b class="uepg">Universidade Estadual de Ponta Grossa</b><br />
           Setor de Ci&ecirc;ncias Agr&aacute;rias e Tecnologia<br />
           Departamento de Engenharia de Alimentos<br />
           Laborat&oacute;rio de An&aacute;lise Sensorial          
          </p>
          <p class="relatorio-triangular-titulo">
           RELAT&Oacute;RIO DE PREPARO PARA TESTE TRIANGULAR
          </p>
         </td>
        </tr>
<% /*BeanResultadoTri resultadoBean = (BeanResultadoTri) sessao.getAttribute("resultadoBean");
   BeanTeste testeBean = resultadoBean.getTesteBean(); 
   String form = "dd/MM/yyyy";
   DecimalFormat formato = new DecimalFormat("00");            
   SimpleDateFormat formatter = new SimpleDateFormat(form);
   Date data = new Date(); */ %>
        <tr class="relatorio-triangular-celula">
         <td align="right" valign="top">&#160;
          Data de Cria&ccedil;&atilde;o do Teste:<br /><br />
          Respons&aacute;vel:<br />
          Descri&ccedil;&atilde;o:<br />
          Objetivo:<br />
          Instru&ccedil;&otilde;es:<br />
          Material:
		  </td>
         <td height="40" colspan="2" align="left" valign="top">
          <b> <% /*= formatter.format( testeBean.getDataCriacao() ) */ %><br />
          <br />
          <% /*= testeBean.getNomeCoordenador() */ %><br />
          <% /*= testeBean.getObjetivo() */ %><br />
          <% /*= formato.format( testeBean.getRepeticoes() ) */%></b>         </td>
         <td colspan="4" align="center" valign="top">
          <table width="100%" height="100%" border="0" valign="top">
           <tr>
            <td width="50%" align="right" valign="top">
             Data do Relat&oacute;rio:<br /><br />
             Produto:<br />
             Amostra A:<br />
             Amostra B:
            </td>
            <td width="50%" align="left" valign="top">
             <b><% /*= formatter.format(data) */ %></b><br /><br />
             <b><% /*= testeBean.getNomeProduto() */ %></b ><br />
             <b><% /*= resultadoBean.getAmostra1() */ %></b><br />
             <b><% /*= resultadoBean.getAmostra2() */ %></b>
            </td>
           </tr>
          </table>
         </td>
        </tr>
        <tr align="center" valign="middle" class="relatorio-triangular-titulo">
         <td height="51" colspan="7">GABARITO DOS JULGADORES</td>
        </tr>
        <tr class="relatorio-fundo-celula">
         <td width="40%"><b>JULGADOR</b></td>
         <td colspan="3" align="center" valign="middle"><b>DISTRIBUI&Ccedil;&Atilde;O DAS AMOSTRAS</b></td>
         <td colspan="3" align="center" valign="middle"><b>N&Uacute;MEROS DAS AMOSTRAS</b></td>
        </tr>
        <tr>
         <td width="40%" align="center" valign="middle">&#160;</td>
         <td width="10%" align="center" valign="middle">&#160;</td>
         <td width="10%" align="center" valign="middle">&#160;</td>
         <td width="10%" align="center" valign="middle">&#160;</td>
         <td width="10%" align="center" valign="middle">&#160;</td>
         <td width="10%" align="center" valign="middle">&#160;</td>
         <td width="10%" align="center" valign="middle">&#160;</td>
        </tr>
<% /* BeanGabaritoJulgador gabaritoJulgador;       
   ArrayList gabaritoJulgadores = resultadoBean.getGabaritoJulgadores();
   Iterator iter = gabaritoJulgadores.iterator();
   if( gabaritoJulgadores.size() > 0 ){
     int i = -1;
     while( iter.hasNext() ){
       ++i;
       gabaritoJulgador = (BeanGabaritoJulgador) iter.next(); %>

<%   }
     if( gabaritoJulgadores.size() < 7 ){
       int y = gabaritoJulgadores.size();
       for( ; y < 7; ++y ){%>

<%     }
     }
   } else{%>

<% } */ %>
        <tr class="relatorio-fundo-linha1">
         <td colspan="7" align="right" valign="middle">
          <b class="sitas"><em>Projeto SiTaS / DEA / UEPG</em></b>
         </td>
        </tr>
       </table>
      </td>
     </tr>
    </table>	
   </td>
  </tr>
  <tr align="center" valign="middle">
   <td colspan="2">&#160;</td>
  </tr>
 </table><br />
 <div align="center" class="autores">
  por <a href="mailto:projetositas@uol.com.br"> Margraf, A. V. </a>
  e <a href="mailto:projetositas@uol.com.br">Prestes, E. M.</a>
 </div>
</body>
</html>