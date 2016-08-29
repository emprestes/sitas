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
<%@page import="com.sitas.beans.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>SiTaS :: Criando Teste Triangular!!!</title>
 <link rel="stylesheet" type="text/css" href="../css/sitas-gui.css" />
 <script language="javascript1.2" type="text/javascript" src="../js/stm31.js" ></script>
 <style type="text/css">
<!--
.style1 {color: #FFFFFF}
-->
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
    Laborat&oacute;rio de An&aacute;lise Sensorial <br />
    <b class="data-hora">
    <script language="JavaScript1.2" type="text/javascript" src="../js/sitas-hora.js"></script>
    </b><br />
   </td>
   <td width="40%" align="center" valign="middle">
     <div align="right"><img src="../image/sitas-logo.main.jpg" width="286" height="82" /> <br />
     </div></td>
  </tr>
  <tr align="right" valign="top">
   <td height="51" colspan="2">
   <% 
     HttpSession sessao = request.getSession(false); 
     String log = "";
     if( sessao != null || sessao.getAttribute("julgador") != null){
        log = (String) sessao.getAttribute("login");
        if( sessao.getAttribute("beanElaborarTesteTri") == null ){
            request.getRequestDispatcher("../servlet/ServObjetivo").forward( request, response );
        }
     }
     else{
         response.sendRedirect("../jsp/sitas-login.jsp");      
      }%>
    <p>Ol&aacute; <b><%= log %></b>, voc&ecirc; est&aacute; criando um teste triangular.</p></td>
  </tr>
  <tr align="right" valign="top">
   <td colspan="2">
    <form action="" method="post" name="formTesteTriangular" target="mainFrame" id="formTesteTriangular">
<!-- OBJETIVO -->
<!-- AMOSTRAS E MATERIAIS -->
<!-- JULGADORES -->
<!-- FICHA DE JULGAMENTO. -->
 <% BeanElaborarTesteTri bean = (BeanElaborarTesteTri) sessao.getAttribute("beanElaborarTesteTri");%>
    <table width="100%" border="0">
     <tr>
      <td height="40" colspan="4" align="right" valign="baseline">
       <a name="ficha" id="ficha"></a> <br />
       <h2 class="teste-titulo">Teste Triangular (Ficha)</h2>      </td>
     </tr>
    </table>
    <table width="85%" border="1" class="interior" bordercolor="#CCCC00">
     <tr>
      <td>
       <table width="100%" border="0">
         <tr bgcolor="#CCCC00">
         <td colspan="5" class="autores">
           <a href="javascript:chamarPagina(1)" target="mainFrame">Objetivo</a> &gt;&gt; 
           <a href="javascript:chamarPagina(2)" target="mainFrame">Amostras e Materiais</a> &gt;&gt; 
           <a href="javascript:chamarPagina(3)" target="mainFrame">Julgadores</a> &gt;&gt; 
           <b class="passo"> FICHA DE JULGAMENTO </b>
         </td>
        </tr>
       </table>
       <table width="100%" border="0">
        <tr>
         <td height="51" colspan="4" align="left" valign="bottom">
          <table width="100%"  border="0">
           <tr>
            <td height="51" align="left" valign="bottom" class="teste-subtitulo">Ficha</td>
            <td width="20%" height="51" align="right" valign="middle">Passo <b class="teste-passo">04/04</b></td>
            <td width="5%" height="51" align="center" valign="middle">
            <input type="hidden" name="visualizar" value="0" />
             <a href="javascript:chamarPagina(6)" target="mainFrame">
              <img src="../image/sitas-visualizar.gif" alt="Visualizar Testes" width="19" height="19" border="0" />
             </a>
            </td>
           </tr>
          </table>
         </td>
        </tr>
        <tr align="center" valign="middle">
         <td width="15%" align="right">&#160;</td>
         <td width="35%" align="left">&#160;</td>
         <td width="55%" colspan="2" align="right">
          </td>
        </tr>
        <tr align="center" valign="middle">         
         </tr>
         <tr align="center">
          <td width="15%" align="right" valign="top">Instru&ccedil;&otilde;es:</td>
          <td colspan="3" align="left" valign="bottom">
          <% if( bean.getInstrucao() == null ){ %>
                 <textarea name="fichaInstrucoes" cols="60" rows="8"
                 onFocus="fichaAjudaText(6)" onBlur="fichaAjudaText(0)">Prove da esquerda para direita e diga qual é a amostra diferentes</textarea>                 
          <% }
             else{%>
                 <textarea name="fichaInstrucoes" cols="60" rows="8"
                 onFocus="fichaAjudaText(6)" onBlur="fichaAjudaText(0)"><%= bean.getInstrucao() %></textarea>
             <%}%>    
          </td>
         </tr>
         <tr align="center">
          <td width="15%" align="right" valign="top">&#160;</td>
          <td colspan="3" align="left" valign="bottom">           
          </td>
         </tr>
         <tr align="center">
          <td colspan="4" align="center" valign="middle">
           <table width="100%" border="0">
            <tr>
             <td width="15%" align="right" valign="top"><b class="teste-ajuda">Orienta&ccedil;&atilde;o</b>:</td>
             <td width="85%" align="left" valign="top">
              <textarea name="fichaAjuda" cols="60" rows="5" 
               readonly>Selecione um campo para obter o texto de ajuda.</textarea>
             <table width="99%" border="0">
               <tr>
               <input type="hidden" name="concluir" value="0" />
                 <td width="72%" height="0" align="right" valign="top" class="concluir"><div align="center"><a href="javascript:chamarPagina(5)" target="mainFrame" >&lt;
                       Concluir &gt;</a></div></td>
                 <td width="28%" height="0" align="right" valign="top" class="autores">&nbsp;</td>
                </tr>
               <tr>
                <td colspan="3" align="right" valign="top" class="autores"><em>Projeto SiTaS</em></td>
               </tr>
              </table>
             </td>
            </tr>
           </table>
          </td>
         </tr>
        </table>
       </td>
      </tr>
     </table>
    </form>
   </td>
  </tr>
  <tr align="center" valign="middle">
   <td height="30" colspan="2">&#160;</td>
  </tr>
 </table>
 <div align="center" class="autores">por 
   <a href="mailto:alexvan@brturbo.com">Margraf, A. V.</a> e <a href="mailto:projetositas@uol.com.br">Prestes,
 E. M.</a> </div>
</body>
</html>