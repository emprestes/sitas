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
    Arquivos: sitas-teste.triangular.jsp
              sitas-gui.css
			  sitas-teste.triangular.js
  -->
<%@page import="java.util.*"%>
<%@page import="com.sitas.beans.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import= "javax.swing.JOptionPane"%>
<html>
<head>
 <title>SiTaS :: Resolvendo Teste Triangular!!!</title>
 <link rel="stylesheet" type="text/css" href="../css/sitas-gui.css" />
 <script language="javascript1.2" type="text/javascript" src="../js/stm31.js" > </script>
</head>
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
<body class="body-fundo">
 <script language="javascript1.2" type="text/javascript" src="../js/sitas-teste.triangular.js" > </script>
 <script language="javascript1.2" type="text/javascript" src="../js/sitas-menujulgador.js" > </script>
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
    <img src="../image/sitas-logo.main.jpg" width="286" height="82" /> <br />    </td>
  </tr>
  <tr align="right" valign="middle">
   <td height="51" colspan="2">
    <p>Ol&aacute; <b> <%= log %></b>, voc&ecirc; est&aacute; respondendo um teste triangular.</p>
   </td>
  </tr>
  <tr align="right" valign="top">
   <td colspan="2">
    <form action="" method="post" name="formTesteTriangular" target="mainFrame" id="formTesteTriangular">
<!-- OBJETIVO -->
<!-- AMOSTRAS E MATERIAIS -->
<!-- JULGADORES -->
<!-- FICHA DE JULGAMENTO. -->
    <% BeanTeste teste = (BeanTeste) sessao.getAttribute("testeTri");
       BeanJulgador julgador = (BeanJulgador) sessao.getAttribute("julgador");
       DecimalFormat formato = new DecimalFormat("00");
       DecimalFormat formato2 = new DecimalFormat("000");
       ArrayList gabaritos = (ArrayList) sessao.getAttribute("gabaritos");
       Iterator iterator = gabaritos.iterator();
       if( gabaritos.size() == 0 ){
           sessao.removeAttribute("gabaritos");
           sessao.removeAttribute("testes");
           request.getRequestDispatcher("../servlet/ServRealTeste").forward( request, response );
           }
    %>      
    <table width="85%"  class="teste-triangular-fundo" border="1" bordercolor="#CCCC00">
     <tr>
      <td>
       <table width="100%" border="0">
        <tr align="center" valign="middle">
          <td colspan="4" align="center" ><h2 class="teste-triangular-fundo">Teste Triangular</h2></td>
          </tr>
        <tr align="center"  class="teste-triangular-fundo" valign="middle">
          <td align="right" class="teste-triangular-fundo" valign="top" >Teste:<b>
            <input name="triangularNumero" type="hidden" id="triangularNumero2">
          </b></td>
          <td align="left" class="teste-triangular-fundo" valign="top" ><b><%= teste.getCodTeste() %></b></td>
          <td width="25%" align="right" class="teste-triangular-fundo" valign="top" >N&uacute;mero de repeti&ccedil;&otilde;es do teste:
            <input name="triangularRepeticoes" type="hidden" id="triangularRepeticoes"></td>
        <td width="25%" align="left" valign="top" ><b> <%= formato.format( teste.getRepeticoes() ) %></b></td>
        </tr>
        <tr align="center" valign="middle">
          <td align="right" class="teste-triangular-fundo" valign="top">Nome:<b>
            <input name="triangularJulgador" type="hidden" id="triangularJulgador2">
          </b></td>
          <td align="left" valign="top"><b><%= julgador.getNome() %></b></td>
          <td width="50%" colspan="2" rowspan="2" align="right">
          <script language="JavaScript1.2" type="text/javascript" src="../js/sitas-hora.js"></script></td>
        </tr>
        <tr align="center" valign="middle">
         <td width="15%" align="right" class="teste-triangular-fundo" valign="top">Produto:<b>
           <input name="triangularProduto" type="hidden" id="triangularProduto2">
         </b></td>
         <td width="35%" align="left" valign="top"><b><%= teste.getNomeProduto() %><br></b></td>
         </tr>
        <tr align="center" valign="middle">
         <td width="15%" align="right" class="teste-triangular-fundo" valign="top">Instru&ccedil;&atilde;o:</td>
         <td colspan="3" align="left"><div align="justify"><strong><em><%= teste.getInstrucao() %></em></strong></div></td>
         </tr>
         <tr align="center" valign="middle">
          <td height="100" colspan="4">
		   <table width="100%" height="100%"  border="0" align="center" bgcolor="#999900">
            <tr class="triangular-escala">
             <td height="20%" align="center" valign="middle">REPETI&Ccedil;&Atilde;O</td>
             <td height="20%" colspan="6" align="center" valign="middle">C&Oacute;DIGOS DAS AMOSTRAS </td>
            </tr>
              <tr align="center" valign="middle" class="triangular-repeticao">
              <td width="25%" height="80%"><%= (teste.getRepeticoes() - gabaritos.size()) + 1 %></td>
              <% BeanGabaritoTri gabarito = (BeanGabaritoTri) iterator.next();
                 Long codGab = new Long( gabarito.getCodGabaritoTri() );
                 sessao.setAttribute( "codGabarito", codGab );
%>
              <td width="12%" height="80%" align="right"><input name="amostra1" type="checkbox" id="amostra1" value="<%= gabarito.getAmostra1()%>">                </td>
              <td width="13%" align="left"><%= formato2.format( gabarito.getNumero1() )%></td>
              <td width="12%" height="80%" align="right"><input name="amostra2" type="checkbox" id="amostra2" value="<%= gabarito.getAmostra2()%>">                </td>
              <td width="13%" align="left"><%= formato2.format( gabarito.getNumero2() )%></td>
              <td width="12%" height="80%" align="right"><input name="amostra3" type="checkbox" id="amostra3" value="<%= gabarito.getAmostra3()%>">                </td>
            <td width="13%" align="left"><%= formato2.format( gabarito.getNumero3() )%></td>
             <input name="resposta" type="hidden" id="resposta" value='00'>
            </tr>
          </table>		   
             </td>
         </tr>
         <tr align="center">
           <td align="right" class="teste-triangular-fundo" valign="top">Coment&aacute;rios:</td>
           <td colspan="3" align="left" class="teste-triangular-fundo" valign="bottom"><textarea name="comentario" cols="60" rows="4"
            onFocus="fichaAjudaText(19)" onBlur="fichaAjudaText(0)"></textarea></td>
         </tr>
         <tr align="center">
         <input type="hidden" name="click" value="00" />
          <td colspan="4" align="center" class="teste-triangular-fundo" valign="middle"><input name="resolver" type="button" id="resolver" value="Resolver" onclick="validar( )" /></td>
          </tr>
        </table>       </td>
      </tr>
     </table>
<!-- RELAT�ÓRIO. -->
    </form>
   </td>
  </tr>
 </table>
 <div align="center" class="autores">por 
<a href="mailto:projetositas@uol.com.br"> Margraf, A. V. </a>e <a href="mailto:projetositas@uol.com.br">Prestes,
E. M.</a> </div>
</body>
</html>