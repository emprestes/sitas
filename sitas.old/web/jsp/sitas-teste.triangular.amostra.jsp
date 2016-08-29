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
 <script language="javascript1.2" type="text/javascript" src="../js/sitas-teste.triangular.amostra.js" ></script>
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
    <% BeanElaborarTesteTri bean = (BeanElaborarTesteTri) sessao.getAttribute("beanElaborarTesteTri"); %>
    <table width="100%" border="0">
     <tr>
      <td colspan="4" align="right" valign="middle">
       <a name="amostra"></a>
       <h2 class="teste-titulo">Teste Triangular (Amostras e Materiais)</h2>
      </td>
     </tr>
    </table>
    <table width="84%" class="interior" border="1" bordercolor="#CCCC00">
     <tr>
      <td>
       <table width="100%" border="0">
        <tr bgcolor="#CCCC00">
         <td class="autores">
          <a href="javascript:chamarPagina(1)" target="mainFrame">Objetivo</a> &gt;&gt; 
          <b class="passo">AMOSTRAS e MATERIAIS</b> &gt;&gt; 
          <a href="javascript:chamarPagina(3)" target="mainFrame">Julgadores</a> &gt;&gt; 
          <a href="javascript:chamarPagina(4)" target="mainFrame">Ficha de Julgamento</a>
         </td>
        </tr>
       </table>
       <table width="100%" border="0">
        <tr>
         <td colspan="3" align="left" valign="bottom">
           <table width="100%"  border="0">
            <tr>
             <td height="51" align="left" valign="bottom" class="teste-subtitulo">Amostras</td>
             <td width="20%" height="51" align="right" valign="middle">Passo <b class="teste-passo">02/04</b></td>
             </a>
             </td>
            </tr>
           </table>
		  </td>
         </tr>
        <tr>
         <td width="35%" align="right" valign="middle"> Escolha o <b>produto</b>: </td>
         <td colspan="2" align="left" valign="middle">
          <script language="javascript1.2" type="text/javascript">
                function getAmostras(){
                    document.forms[0].action = "../servlet/ServAmostra";
                    document.forms[0].submit();     
                }
         </script>
         <% ArrayList produtos = bean.getProdutos(); 
            Iterator iter2 = produtos.iterator();
         %>
             <select name="amostraProduto" id="amostraProduto" 
             onFocus="amostraAjudaText(1)" onBlur="amostraAjudaText(0)" onChange="getAmostras()">
          <% while( iter2.hasNext() ){
                 BeanProduto produto = ( BeanProduto ) iter2.next();
                 if( produto.getCodigo() == bean.getProduto() ){%>
                     <option value="<%= Integer.toString( produto.getCodigo() ) %>" selected ><%= produto.getNome()%></option>
            <%   }
                 else{%>
                      <option value="<%= Integer.toString( produto.getCodigo() ) %>"><%= produto.getNome()%></option>
               <%}
            }%>
         </td>
        </tr>
        <tr valign="middle">
         <td width="35%" align="right" valign="middle">Escolha a <b>1&ordf; amostra</b>:</td>
         <td colspan="2" align="left" valign="middle">
          <% if( sessao.getAttribute("amostras") == null ){ %>
          <select name="amostraUm" 
           onFocus="amostraAjudaText(2)" onBlur="amostraAjudaText(0)" />
          </td>
        </tr>
        <tr valign="middle">
         <td width="35%" align="right" valign="middle">Escolha a <b>2&ordf; amostra</b>:</td>
         <td colspan="2" align="left" valign="middle">
          <select name="amostraDois" 
           onFocus="amostraAjudaText(3)" onBlur="amostraAjudaText(0)" />
         <%   }
              else{
                  ArrayList amostras = ( ArrayList ) sessao.getAttribute("amostras");
                  BeanAmostra amostra;
                  Iterator iter3 = amostras.iterator();
                  Iterator iter4 = amostras.iterator();
%>                <select name="amostraUm" 
                   onFocus="amostraAjudaText(2)" onBlur="amostraAjudaText(0)" >
               <% while( iter3.hasNext() ){
                       amostra = ( BeanAmostra ) iter3.next();
                       if( bean.getAmostra1() == amostra.getCodigo() ){ %>
                           <option value="<%= amostra.getCodigo() %>" selected > <%= amostra.getNome() %></option>
                    <% }
                       else{%>
                            <option value="<%= amostra.getCodigo() %>"> <%= amostra.getNome() %></option>
                      <%
                       }
                   }%>
         </select>
                   </td>
                   </tr>
                   <tr valign="middle">
                   <td width="35%" align="right" valign="middle">Escolha a <b>2&ordf; amostra</b>:</td>
                   <td colspan="2" align="left" valign="middle">
                   <select name="amostraDois" 
                    onFocus="amostraAjudaText(3)" onBlur="amostraAjudaText(0)" >
                 <% while( iter4.hasNext() ){
                         amostra = ( BeanAmostra ) iter4.next();
                         if( bean.getAmostra2() == amostra.getCodigo() ){ %>
                                 <option value="<%= amostra.getCodigo() %>" selected > <%= amostra.getNome() %></option>
                        <%    }
                              else{%>
                                  <option value="<%= amostra.getCodigo() %>"> <%= amostra.getNome() %></option>
                      <%
                              }
                         }%>
                   </select>
                <% } %>               
         </td>
        </tr>
        <tr align="center" valign="middle">
         <td colspan="3" valign="middle">
          Qual amostra ser&aacute; repetida 
         <% if( bean.getAmostraRepitida() == -1 ){ %>
               <b> <input name="amostraIgual" type="radio" value="1" onFocus="amostraAjudaText(4)" onBlur="amostraAjudaText(0)" />1&ordf; amostra</b> ou
                <b><input name="amostraIgual" type="radio" value="2" onFocus="amostraAjudaText(4)" onBlur="amostraAjudaText(0)" />2&ordf; amostra</b>
         <% } 
            else{
                if( bean.getAmostraRepitida() == 1 ){%>
                    <b><input name="amostraIgual" type="radio" value="1" onFocus="amostraAjudaText(8)" onBlur="amostraAjudaText(0)" checked />1&ordf; amostra</b> ou
                   <b><input name="amostraIgual" type="radio" value="2" onFocus="amostraAjudaText(8)" onBlur="amostraAjudaText(0)" />2&ordf; amostra </b>
             <% }
                if( bean.getAmostraRepitida() == 2 ){%>
                    <b><input name="amostraIgual" type="radio" value="1" onFocus="amostraAjudaText(8)" onBlur="amostraAjudaText(0)" />1&ordf; amostra</b> ou
                    <b><input name="amostraIgual" type="radio" value="2" onFocus="amostraAjudaText(8)" onBlur="amostraAjudaText(0)" checked />2&ordf; amostra </b>         
           <%}
          }
    %>?
         </td>
        </tr>
        <tr align="left" valign="bottom">
         <td colspan="3" class="teste-subtitulo">Materiais</td>
        </tr>
        <tr align="left" valign="bottom">
         <td align="right" valign="top">Descri&ccedil;&atilde;o:</td>
         <td colspan="2" valign="top">
          <% if( bean.getDescricaoMaterial() == null ){  %>
          <textarea name="materialDescricao" cols="45" rows="6" 
           onFocus="amostraAjudaText(5)" onBlur="amostraAjudaText(0)"></textarea>
           <%}
             else{ %>
                 <textarea name="materialDescricao" cols="45" rows="6" 
                 onFocus="amostraAjudaText(5)" onBlur="amostraAjudaText(0)"><%= bean.getDescricaoMaterial() %></textarea>
             <%} %>
         </td>
        </tr>
        <tr align="center" valign="middle">
         <td colspan="3">
          <table width="100%" border="0">
           <tr>
            <td width="15%" align="right" valign="top"><b class="teste-ajuda">Orienta&ccedil;&atilde;o</b>:</td>
            <td width="85%" align="left" valign="top">
             <textarea name="amostraAjuda" cols="60" rows="5" 
              readonly>Selecione um campo para obter o texto de ajuda.</textarea>
             <table width="99%" border="0">
              <tr>
               <td align="right" valign="top" class="autores"><em>Projeto SiTaS</em></td>
               <input name="configAmostras" type="hidden" value="0" />
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
 <a href="mailto:projetositas@uol.com.br"> Margraf, A. V. </a>e <a href="mailto:projetositas@uol.com.br">Prestes,
 E. M.</a> </div>
</body>
</html>