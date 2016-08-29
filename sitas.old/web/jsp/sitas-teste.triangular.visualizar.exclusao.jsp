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
<html>
<head>
 <title>SiTaS :: Resolvendo Teste Triangular!!!</title>
 <link rel="stylesheet" type="text/css" href="../css/sitas-gui.css" />
 <script language="javascript1.2" type="text/javascript" src="../js/stm31.js" > </script>
</head>
<body class="body-fundo">
<% 
     HttpSession sessao = request.getSession(false); 
     String log = "";
     if( sessao != null || sessao.getAttribute("julgador") != null ){
        log = (String) sessao.getAttribute("login");
        if( sessao.getAttribute("excluirTesteBean") == null ){
            request.getRequestDispatcher("../servlet/ServExcluirTeste").forward( request, response );
        }
     }
     else{
         response.sendRedirect("../jsp/sitas-login.jsp");      
      }%>
 <script language="javascript1.2" type="text/javascript" src="../js/sitas-teste.triangular.visualizar.exclusao.js" > </script>
 <script language="javascript1.2" type="text/javascript" src="../js/sitas-mainmenu.js" > </script>
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
     <div align="right"><img src="../image/sitas-logo2.jpg" width="285" height="84" /> </div></td>
  </tr>
  <tr align="right" valign="middle">
   <td height="51" colspan="2">
    <p>Ol&aacute; <b><%= log %></b>, voc&ecirc; est&aacute; criando um teste triangular.</p>
   </td>
  </tr>
  <tr align="right" valign="top">
   <td colspan="2">
    <form action="" method="post" name="formTesteTriangular" target="mainFrame">
<!-- OBJETIVO -->
<!-- AMOSTRAS E MATERIAIS -->
<!-- JULGADORES -->
<!-- FICHA DE JULGAMENTO. -->
<% BeanExcluirTeste bean = (BeanExcluirTeste) sessao.getAttribute("excluirTesteBean");
   int repeticoes = bean.getRepeticoes();
   int n_julgadores = bean.getJulgadoresSelecionados().size();
   int julgamentos = repeticoes * n_julgadores; %>
    <table width="85%" border="1" class="teste-passo2" bordercolor="#CCCC00">
     <tr>
      <td>
       <table width="100%" border="0">
        <tr align="center" valign="middle">
        <% long cod_teste = 0;
       if (sessao.getAttribute("codTeste") != null ) {
            Long c_teste = (Long) sessao.getAttribute("codTeste");
            cod_teste = c_teste.longValue();
       }%>
          <td colspan="4" align="center" ><h2 class="teste-titulo">Excluir Teste Triangular N&ordm; <%= cod_teste %> </h2></td>
          </tr>
        <tr align="center" valign="middle">
          <td width="15%" align="right" valign="top" >Julgamentos:<b>
          </b></td>
          <td width="35%" align="left" valign="top" ><b><%= julgamentos %></b></td>
         </tr>
        <tr align="center" valign="bottom">
          <td height="51" colspan="4" align="left" class="teste-passos">Objetivo</td>
          </tr>           
        <tr align="center" valign="middle">Cliente:
          <td align="right" valign="top">Cliente: </td>
          <td align="left" valign="top"><b><%= bean.getEmpresa() %></b></td>
          <td align="right">Objetivo:</td>
          <td align="left"><b><%= bean.getObjetivo() %></b></td>
        </tr>
        <tr align="center" valign="middle">
          <td align="right" valign="top">Descri&ccedil;&atilde;o:</td>
          <td colspan="3" align="left" valign="top"><b><%= bean.getDescricao() %></b></td>
          </tr>
        <tr align="center" valign="bottom">
          <td height="51" colspan="4" align="left" class="teste-passos">Amostras e Materiais</td>
          </tr>
        <tr align="center" valign="middle">
          <td width="15%" align="right" valign="top">Produto:<b>
          </b></td>
         <td width="35%" align="left" valign="top"><b><%= bean.getProduto()%></b></td>
         <td width="25%" align="right">1&ordf; amostra: </td>
        <td width="25%" align="left"><b><%= bean.getAmostra1() %></b></td>
        </tr>
        <tr align="center" valign="middle">
        <td align="right" valign="top">Amostra repetida: </td>
          <td align="left" valign="top"><b><%= bean.getAmostraRepetida() %></b></td>
          <td align="right">2&ordf; amostra: </td>
          <td align="left"><b><%= bean.getAmostra2() %></b></td>
        </tr>
        <tr align="center" valign="middle">
          <td colspan="4" align="left" valign="middle">Descri&ccedil;&atilde;o de Materiais:</td>
          </tr>
        <tr align="center" valign="middle">
          <td width="15%" align="right" valign="top">&nbsp;</td>
          <td colspan="3" align="left" valign="top"><b><%= bean.getDescricaoMaterial()%></b></td>
          </tr>
        <tr align="center" valign="bottom">
          <td height="51" colspan="4" align="left" class="teste-passos">Julgadores</td>
          </tr>
        <tr align="center" valign="middle">
          <td align="right" valign="top">Repeti&ccedil;&otilde;es:</td>
          <td align="left" valign="top"><b><%= bean.getRepeticoes()%></b></td>
          <td colspan="2" align="left" valign="top">&nbsp;</td>
        </tr>
        <tr align="center" valign="middle">
         <td width="15%" align="right" valign="top">Lista de Julgadores:<b>
         </b></td>              
       <% ArrayList julgadores = bean.getJulgadoresSelecionados();
          if( julgadores.size() > 0 ){
          Iterator iter4 = julgadores.iterator();
          BeanJulgador julgador;
          int linhas = (julgadores.size() % 2) == 0 ? (julgadores.size() / 2) : (julgadores.size() / 2) + 1;
          int count = 0;%>
         <td width="35%" align="left" valign="top">
       <% while( iter4.hasNext() ){
              ++count;
              julgador = (BeanJulgador) iter4.next();%>              
              <b><%= julgador.getCodPessoa()%> <%= julgador.getNome()%></b><br>
              <%if( count == linhas && linhas >= 1){%>
                  </td><td colspan="2" align="left" valign="top">
              <%}%>
          <%}
          if( count >= linhas ){%>
              </td>
         <%}
        }else{%>
        
         <td width="35%" align="left" valign="top"><b>&lt;aqui&gt;</b><br>
           <b>&lt;aqui&gt;</b><br>
           <b>&lt;aqui&gt;</b><br>
           <b>&lt;aqui&gt;</b><br>
           <b>&lt;aqui&gt;</b><br>
           <b>&lt;aqui&gt;<br>
           &lt;aqui&gt;<br>
           &lt;aqui&gt;<br>
           &lt;aqui&gt;<br>
           &lt;aqui&gt;</b></td>
         <td colspan="2" align="left" valign="top"><b>&lt;aqui&gt;</b><br>
           <b>&lt;aqui&gt;</b><br>
           <b>&lt;aqui&gt;</b><br>
           <b>&lt;aqui&gt;</b><br>
           <b>&lt;aqui&gt;</b><br>
           <b>&lt;aqui&gt;</b><br>
           <b>&lt;aqui&gt;</b><br>
           <b>&lt;aqui&gt;</b><br>
           <b>&lt;aqui&gt;</b><br>
           <b>&lt;aqui&gt;</b></td>
           <%}%>
        </tr>      
        <tr align="center" valign="bottom">
          <td height="51" colspan="4" align="left" class="teste-passos">Ficha de julgamento</td>
          </tr>         
        <tr align="center"  class="teste-passo2" valign="middle">
          <td align="right" valign="top">Instru&ccedil;&atilde;o:</td>
          <td align="left"><b><%= bean.getInstrucao()%></b></td>         
        </tr>        
        <input name="excluir" type="hidden" value="0" />
         <tr align="center" class="teste-passos">
          <td height="100" colspan="2" align="center" valign="middle"><a href="javascript:visualizar(1)" target="mainFrame">CANCELAR </a></td>
          <td height="100" colspan="2" align="center" valign="middle"><a href="javascript:visualizar(2)" target="mainFrame">EXCLUIR</a></td>
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
   <a href="mailto:alexvan@brturbo.com">Margraf, A. V.</a> e <a href="mailto:projetositas@uol.com.br">Prestes,
E. M.</a></div>
</body>
</html>