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
 <script language="javascript1.2" type="text/javascript" src="../js/sitas-teste.triangular.julgador.js" ></script>
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
    </b></td>
   <td width="40%" align="center" valign="middle">
     <div align="right"><img src="../image/sitas-logo.main.jpg" width="397" height="113" /> <br />
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
    <p>Ol&aacute; <b><%= log %></b>, voc&ecirc; est&aacute; criando um teste triangular.</p>   </td>
  </tr>
  <tr align="right" valign="top">
   <td colspan="2">
    <form action="" method="post" name="formTesteTriangular" target="mainFrame" id="formTesteTriangular">
     <input name="visualizacaoOK" type="hidden" value="4" />
<!-- OBJETIVO -->
<!-- AMOSTRAS E MATERIAIS -->
<!-- JULGADORES -->
<% BeanElaborarTesteTri bean = (BeanElaborarTesteTri) sessao.getAttribute("beanElaborarTesteTri"); %>
    <table width="100%" border="0">
     <tr>
      <td colspan="4" align="right" valign="middle">
       <a name="julgador" ></a>
       <h2 class="teste-titulo">Teste Triangular (Julgadores)</h2>      </td>
     </tr>
    </table>
    <table width="84%" border="1"  class="interior"  bordercolor="#CCCC00">
     <tr>
      <td>
       <table width="100%" border="0">
        <tr bgcolor="#CCCC00">
         <td colspan="4" class="autores">
          <a href="javascript:chamarPagina(1, 00)" target="mainFrame">Objetivo</a> &gt;&gt; 
          <a href="javascript:chamarPagina(2, 00)" target="mainFrame">Amostras e Materiais</a> &gt;&gt; 
          <b class="passo"> JULGADORES </b> &gt;&gt; 
          <a href="javascript:chamarPagina(4, 00)" target="mainFrame">Ficha de Julgamento</a>
         </td>
        </tr>
       </table>
       <table width="100%" border="0">
        <tr>
         <td width="50%" height="42" align="left" valign="bottom" class="teste-subtitulo">Julgadores</td>
         <td width="50%" height="42" align="right" valign="middle">Passo <b class="teste-passo">03/04</b></td>
        </tr>
       </table>
       <table width="100%" border="0">
        <tr>
         <td colspan="2" align="right" valign="top">
          Repeti&ccedil;&otilde;es por julgador:
          <%if( bean.getRepeticoes() > 0 ){%>
                <input name="julgadorRepeticoes" type="text" value="<%= Integer.toString( bean.getRepeticoes() ) %>" size="2" maxlength="2" 
                onFocus="julgadorAjudaText(1)" onBlur="julgadorAjudaText(0)" onKeyPress="return checkInteger(event)" />
         <% }
            else{%>
                 <input name="julgadorRepeticoes" type="text" value="01" size="2" maxlength="2" 
                 onFocus="julgadorAjudaText(1)" onBlur="julgadorAjudaText(0)" onKeyPress="return checkInteger(event)" />
              <%}
%>         
         </td>
        </tr>
        <tr>
         <td width="20%" align="right" valign="top">
          Escolher:
          <input type="hidden" name="julgadorQuantidade" value="00"/>
          <input type="hidden" name="letra" value="A" />
         </td>
         <td align="center" valign="top">
<!-- tabela de juilgadores -->
          <table width="100%" border="1">
           <tr>
            <td align="center" valign="middle"> 
             <a href="javascript:chamarPagina( 6, 'A' )">A</a>
             <a href="javascript:chamarPagina( 6, 'B' )">B</a>
             <a href="javascript:chamarPagina( 6, 'C' )">C</a>
             <a href="javascript:chamarPagina( 6, 'D' )">D</a>
             <a href="javascript:chamarPagina( 6, 'E' )">E</a>
             <a href="javascript:chamarPagina( 6, 'F' )">F</a>
             <a href="javascript:chamarPagina( 6, 'G' )">G</a>
             <a href="javascript:chamarPagina( 6, 'H' )">H</a>
             <a href="javascript:chamarPagina( 6, 'I' )">I</a>
             <a href="javascript:chamarPagina( 6, 'J' )">J</a>
             <a href="javascript:chamarPagina( 6, 'K' )">K</a>
             <a href="javascript:chamarPagina( 6, 'L' )">L</a>
             <a href="javascript:chamarPagina( 6, 'M' )">M</a>
             <a href="javascript:chamarPagina( 6, 'N' )">N</a>
             <a href="javascript:chamarPagina( 6, 'O' )">O</a>
             <a href="javascript:chamarPagina( 6, 'P' )">P</a>
             <a href="javascript:chamarPagina( 6, 'Q' )">Q</a>
             <a href="javascript:chamarPagina( 6, 'R' )">R</a>
             <a href="javascript:chamarPagina( 6, 'S' )">S</a>
             <a href="javascript:chamarPagina( 6, 'T' )">T</a>
             <a href="javascript:chamarPagina( 6, 'U' )">U</a>
             <a href="javascript:chamarPagina( 6, 'V' )">V</a>
             <a href="javascript:chamarPagina( 6, 'X' )">X</a>
             <a href="javascript:chamarPagina( 6, 'Y' )">Y</a>
             <a href="javascript:chamarPagina( 6, 'W' )">W</a>
             <a href="javascript:chamarPagina( 6, 'Z' )">Z</a>
            </td>
           </tr>
          </table>          
           <% BeanJulgador julgadorBeanDB;
              BeanJulgador julgadorBeanEsc;
              ArrayList julgadoresDB = bean.getJulgadoresDB();
              ArrayList julgadoresEscolhidos = bean.getJulgadoresEscolhidos();
              ArrayList julgVisualizados = (ArrayList) sessao.getAttribute("julgVisualizados");
              Iterator iter1 = julgadoresDB.iterator();
              Iterator iter2;
              boolean igual = false;
              int num = 0;  %>
           <table width="100%" border="1">
           <tr align="left" valign="top">            
           <%final int max = 1;
             for( int i = 0; i < 4; ++i ){%>
                <td width="25%"><%                
                     if( iter1.hasNext() ){
                          int x = 0;
                          igual = false;
                          while( iter1.hasNext() && x < max ){
                              ++x;
                              julgadorBeanDB = ( BeanJulgador ) iter1.next();
                              julgVisualizados.add( julgadorBeanDB );
                              iter2 = julgadoresEscolhidos.iterator();
                              if( iter2.hasNext() ){
                                  while( iter2.hasNext() ){
                                      julgadorBeanEsc = ( BeanJulgador ) iter2.next();
                                      if( julgadorBeanDB.getCodPessoa() == julgadorBeanEsc.getCodPessoa() ){
                                          igual = true; %>
                                          <input type="checkbox" name="julgador<%= Integer.toString( ++num ) %>" value="<%= Integer.toString( julgadorBeanEsc.getCodPessoa() )%>" 
                                          onFocus="julgadorAjudaText(3)" onBlur="julgadorAjudaText(0)" onClick="julgadorContar( this, julgadorQuantidade )" checked />
                                          <%= Integer.toString( julgadorBeanEsc.getCodPessoa() ) + "-" %> <%= julgadorBeanEsc.getNome() %><br />
                                   <% 
                                      } 
                                  }
                                  if( igual == false ){%>
                                      <input type="checkbox" name="julgador<%= Integer.toString( ++num ) %>" value="<%= Integer.toString( julgadorBeanDB.getCodPessoa() )%>" 
                                      onFocus="julgadorAjudaText(3)" onBlur="julgadorAjudaText(0)" onClick="julgadorContar( this, julgadorQuantidade )" />
                                      <%= Integer.toString( julgadorBeanDB.getCodPessoa() ) + "-" %> <%= julgadorBeanDB.getNome() %><br /> 
                               <% }
                              }
                              else{%>
                                   <input type="checkbox" name="julgador<%= Integer.toString( ++num ) %>" value="<%= Integer.toString( julgadorBeanDB.getCodPessoa() )%>" 
                                   onFocus="julgadorAjudaText(3)" onBlur="julgadorAjudaText(0)" onClick="julgadorContar( this, julgadorQuantidade )" />
                                   <%= Integer.toString( julgadorBeanDB.getCodPessoa() ) + "-" %> <%= julgadorBeanDB.getNome() %><br />
                                <%}
                          }
                }
                if( i == 3 && julgadoresDB.size() - ( max * 4 )  > 0 ){%>
                      <input type="hidden" name="maisJulgadores" value="0" />
                      <input type="hidden" name="count" value="0" />
                      <div align="right"><a href="javascript:chamarPagina( 7, <%=  (max * 4) %> )">+</a></div>
             <%}%>
                </td>
          <% }
           Iterator iterVisual = julgVisualizados.iterator();
           Iterator iterEsc;
           while( iterVisual.hasNext() ){
               BeanJulgador julgVisual = (BeanJulgador) iterVisual.next();
               iterEsc = julgadoresEscolhidos.iterator();
               while( iterEsc.hasNext() ){
                   BeanJulgador julgEsc = (BeanJulgador) iterEsc.next();
                   if( julgVisual.getCodPessoa() == julgEsc.getCodPessoa() ){
                       iterEsc.remove();
                   }
              }
               iterEsc = null;
          }%>         
          <input type="hidden" name="numJulg" value="<%= Integer.toString( num ) %>" />          
           </tr>
          </table>
          <table width="100%" border="1">
           <tr>
            <td align="center" valign="middle">
             <a href="javascript:chamarPagina( 6, 'A' )">A</a>
             <a href="javascript:chamarPagina( 6, 'B' )">B</a>
             <a href="javascript:chamarPagina( 6, 'C' )">C</a>
             <a href="javascript:chamarPagina( 6, 'D' )">D</a>
             <a href="javascript:chamarPagina( 6, 'E' )">E</a>
             <a href="javascript:chamarPagina( 6, 'F' )">F</a>
             <a href="javascript:chamarPagina( 6, 'G' )">G</a>
             <a href="javascript:chamarPagina( 6, 'H' )">H</a>
             <a href="javascript:chamarPagina( 6, 'I' )">I</a>
             <a href="javascript:chamarPagina( 6, 'J' )">J</a>
             <a href="javascript:chamarPagina( 6, 'K' )">K</a>
             <a href="javascript:chamarPagina( 6, 'L' )">L</a>
             <a href="javascript:chamarPagina( 6, 'M' )">M</a>
             <a href="javascript:chamarPagina( 6, 'N' )">N</a>
             <a href="javascript:chamarPagina( 6, 'O' )">O</a>
             <a href="javascript:chamarPagina( 6, 'P' )">P</a>
             <a href="javascript:chamarPagina( 6, 'Q' )">Q</a>
             <a href="javascript:chamarPagina( 6, 'R' )">R</a>
             <a href="javascript:chamarPagina( 6, 'S' )">S</a>
             <a href="javascript:chamarPagina( 6, 'T' )">T</a>
             <a href="javascript:chamarPagina( 6, 'U' )">U</a>
             <a href="javascript:chamarPagina( 6, 'V' )">V</a>
             <a href="javascript:chamarPagina( 6, 'X' )">X</a>
             <a href="javascript:chamarPagina( 6, 'Y' )">Y</a>
             <a href="javascript:chamarPagina( 6, 'W' )">W</a>
             <a href="javascript:chamarPagina( 6, 'Z' )">Z</a>
            </td>
           </tr>
          </table>
<!-- tabela de juilgadores -->         
        </tr>
        <tr align="center" valign="middle">
         <td colspan="2">
          <table width="100%" border="0">
           <tr>
            <td width="15%" align="right" valign="top"><b class="teste-ajuda">Orienta&ccedil;&atilde;o</b>:</td>
            <td width="85%" align="left" valign="top">
             <textarea name="julgadorAjuda" cols="60" rows="5" 
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
<!-- FICHA DE JULGAMENTO. -->
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