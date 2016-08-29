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
    Arquivos: sitas-teste.triangular.objetivo.jsp
              sitas-teste.triangular.objetivo.js
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
  <script language="javascript1.2" type="text/javascript" src="../js/sitas-teste.triangular.objetivo.js" ></script>
</head>
<body class="body-fundo" onLoad="inicio()">
 <script language="javascript1.2" type="text/javascript" src="../js/sitas-mainmenu.js" ></script>
 <table width="95%" height="93%" border="0" align="center">
  <tr>
   <td width="60%" align="right" valign="top">
    <b class="uepg">Universidade Estadual de Ponta Grossa</b> <br />
    Setor de Ci&ecirc;ncias Agr&aacute;rias e Tecnologia <br />
    Departamento de Engenharia de Alimentos <br />
    Laborat&oacute;rio de An&aacute;lise Sensorial <br />
    <b class="data-hora">
     <script language="JavaScript1.2" type="text/javascript" src="../js/sitas-hora.js"></script>
    </b>
   </td>
   <td width="40%" align="center" valign="middle">
    <img src="../image/sitas-logo.main.jpg" width="286" height="82" /> </td>
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
    <p>Ol&aacute; <b><%= log %></b>, voc&ecirc; est&aacute; criando um teste triangular.</p>   </td>
  </tr>
  <tr align="right" valign="top">
   <td colspan="2">
    <form action="" method="post" name="formTesteTriangular" target="mainFrame" id="formTesteTriangular">
<!-- OBJETIVO -->
     <table width="100%" border="0">
      <tr>
       <td colspan="4" align="right" valign="middle">
        <h2 class="teste-titulo">Teste Triangular (Objetivo)</h2>
       </td>
      </tr>
     </table>
     <table width="84%" border="1"  class="interior" bordercolor="#CCCC00">
      <tr>
       <td>
        <table width="100%" border="0">
         <tr bgcolor="#CCCC00">
          <td colspan="4" class="autores">
           <b class="passo"> OBJETIVO </b> &gt;&gt; 
           <a href="javascript:chamarPagina(2)" target="mainFrame">Amostras e Materiais</a> &gt;&gt; 
           <a href="javascript:chamarPagina(3)" target="mainFrame">Julgadores</a> &gt;&gt; 
           <a href="javascript:chamarPagina(4)" target="mainFrame">Ficha de Julgamento</a>
          </td>
         </tr>
         <tr>
          <td colspan="4" align="left" valign="bottom">
           <table width="100%"  border="0">
            <tr>
             <td width="75%" height="51" align="left" valign="bottom" class="teste-subtitulo">Objetivo</td>
             <td width="20%" height="51" align="right" valign="middle">Passo <b class="teste-passo">01/04</b></td>
             </a>
             </td>
            </tr>
           </table>
          </td>
         </tr>
         <tr>
          <td width="30%" align="right" valign="top">Objetivo: </td>
          <td colspan="3" align="left" valign="top"><em></em>
          <% BeanElaborarTesteTri bean = (BeanElaborarTesteTri) sessao.getAttribute("beanElaborarTesteTri"); %>
           <% if( bean.getObjetivo() == null ){ %>
              <input name="objetivoSet" type="radio" value="avaliar produtos" onfocus="objetivoAjudaText(1)" onBlur="objetivoAjudaText(0)" />
              Avalia&ccedil;&atilde;o de produtos <br />
              <input name="objetivoSet" type="radio" value="selecionar julgadores" onfocus="objetivoAjudaText(2)" onBlur="objetivoAjudaText(0)" />
              Sele&ccedil;&atilde;o de julgadores <br />
              <input name="objetivoSet" type="radio" value="treinar julgadores" onfocus="objetivoAjudaText(3)" onBlur="objetivoAjudaText(0)" />
              Treinamento de julgadores
           <% }
              else{
                  String obj = bean.getObjetivo();
                  int val = 0;
                  if( obj.equals( "avaliar produtos" ) )
                      val = 1;
                  else
                      if( obj.equals( "selecionar julgadores" ) )
                          val = 2;
                      else
                          if( obj.equals( "treinar julgadores" ) )
                              val = 3;
                          
                  switch( val ){
                      case 1:%>
                          <input name="objetivoSet" type="radio" value="avaliar produtos" onfocus="objetivoAjudaText(1)" onBlur="objetivoAjudaText(0)" checked />
                           Avalia&ccedil;&atilde;o de produtos <br />
                           <input name="objetivoSet" type="radio" value="selecionar julgadores" onfocus="objetivoAjudaText(2)" onBlur="objetivoAjudaText(0)" />
                           Sele&ccedil;&atilde;o de julgadores <br />
                           <input name="objetivoSet" type="radio" value="treinar julgadores" onfocus="objetivoAjudaText(3)" onBlur="objetivoAjudaText(0)" />
                           Treinamento de julgadores
                           <% break;
                      case 2:%>
                           <input name="objetivoSet" type="radio" value="avaliar produtos" onfocus="objetivoAjudaText(1)" onBlur="objetivoAjudaText(0)" checked />
                           Avalia&ccedil;&atilde;o de produtos <br />
                           <input name="objetivoSet" type="radio" value="selecionar julgadores" onfocus="objetivoAjudaText(2)" onBlur="objetivoAjudaText(0)" checked />
                           Sele&ccedil;&atilde;o de julgadores <br />
                           <input name="objetivoSet" type="radio" value="treinar julgadores" onfocus="objetivoAjudaText(3)" onBlur="objetivoAjudaText(0)" />
                           Treinamento de julgadores
                           <% break;                      
                      case 3:%>
                           <input name="objetivoSet" type="radio" value="avaliar produtos" onfocus="objetivoAjudaText(1)" onBlur="objetivoAjudaText(0)" />
                           Avalia&ccedil;&atilde;o de produtos <br />
                           <input name="objetivoSet" type="radio" value="selecionar julgadores" onfocus="objetivoAjudaText(2)" onBlur="objetivoAjudaText(0)" />
                           Sele&ccedil;&atilde;o de julgadores <br />
                           <input name="objetivoSet" type="radio" value="treinar julgadores" onfocus="objetivoAjudaText(3)" onBlur="objetivoAjudaText(0)" checked />
                           Treinamento de julgadores
                           <% break;                      
                      
                      }
                  }
                    %>
          </td>
         </tr>
         <tr>
          <td width="30%" align="right">Cliente:</td>
          <td colspan="4" align="left">
          <%    ArrayList empresas = bean.getEmpresas(); 
                Iterator iter1 = empresas.iterator();
          %>
           <select name="objetivoCliente" id="objetivoCliente" 
            onFocus="objetivoAjudaText(5)" onBlur="objetivoAjudaText(0)">
            <%    while( iter1.hasNext() ){ 
                    BeanEmpresa empresa = (BeanEmpresa) iter1.next();
                    if( empresa.getCodEmpresa() ==  bean.getCodEmpresa() ){   %> 
                        <option value="<%= Integer.toString(empresa.getCodEmpresa()) %>" selected ><%= empresa.getNome()%></option>
           <%       }
                    else{%>
                        <option value="<%= Integer.toString(empresa.getCodEmpresa()) %>" ><%= empresa.getNome()%></option>                  
                    
              <%     }
                  }
              %>
           </select>
          </td>
         </tr>
         <tr>
          <td width="30%" align="right" valign="top"> Descri&ccedil;&atilde;o: </td>
          <td colspan="3" align="left" valign="top">
            <% if( bean.getDescricao() == null ){  %>
                 <textarea name="objetivoDescricao" cols="45" rows="8" 
                 onfocus="objetivoAjudaText(4)" onBlur="objetivoAjudaText(0)" ></textarea>
          <% }
             else{ %>
                     <textarea name="objetivoDescricao" cols="45" rows="8" 
                     onfocus="objetivoAjudaText(4)" onBlur="objetivoAjudaText(0)" ><%= bean.getDescricao() %></textarea>             
             <%} %>
          </td>
         </tr>
         <tr>
          <td colspan="4" align="center" valign="middle">
           <table width="100%" border="0">
            <tr>
             <td width="15%" align="right" valign="top"><b class="teste-ajuda">Orienta&ccedil;&atilde;o</b>:</td>
             <td width="85%" align="left" valign="top">
              <textarea name="objetivoAjuda" cols="60" rows="5"
               readonly>Selecione um campo para obter o texto de ajuda.</textarea>
              <table width="99%" border="0">
               <tr>
                <td align="right" valign="top" class="autores"><em>Projeto SiTaS</em></td>
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
<!-- AMOSTRAS E MATERIAIS -->
<!-- JULGADORES -->
<!-- FICHA DE JULGAMENTO. -->
    </form>
   </td>
  </tr>
  <tr align="center" valign="middle">
   <td height="30" colspan="2">&#160;</td>
  </tr>
 </table>
 <div align="center" class="autores">por 
 <a href="mailto:projetositas@uol.com.br"> Margraf, A. V.</a> e <a href="mailto:projetositas@uol.com.br">Prestes,
 E. M.</a></div>
</body>
</html>