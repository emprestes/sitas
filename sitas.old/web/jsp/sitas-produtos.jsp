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
    Arquivos: sitas-produtos.jsp
              sitas-produtos.js
              sitas-gui.css
  -->
<%@ page language="java"
           import="com.sitas.beans.*, java.util.*"
          session="false"
 %>
<head>
 <title>SiTaS :: Produtos cadastratos!!!</title>
 <link rel="stylesheet" type="text/css" href="../css/sitas-gui.css" />
 <script language="javascript1.2" type="text/javascript" 
  src="../js/stm31.js" > </script>
</head>
<% { String pagina = ""; %>
<body class="body-fundo" onLoad="javascript:inicio( <%= pagina %> )"> <% } %>
 <script language="javascript1.2" type="text/javascript" 
  src="../js/sitas-mainmenu.js" > </script>
 <script language="javascript1.2" type="text/javascript" 
  src="../js/sitas-produtos.js" > </script>
 <table width="98%"  border="0" align="center">
  <tr>
   <td width="70%" align="left" valign="top">    <p>
     <b class="uepg">Universidade Estadual de Ponta Grossa</b><br />
     Setor de Ci&ecirc;ncias Agr&aacute;rias e Tecnologia<br />
     Departamento de Engenharia de Alimentos<br />
     Laborat&oacute;rio de An&aacute;lise Sensorial<br />
     <b class="data-hora">
      <script language="javascript1.2" type="text/javascript" 
       src="../js/sitas-hora.js" > </script>
     </b>   
    </p>
   </td>
   <td width="30%" align="center" valign="top">
       <img alt="" src="../image/sitas-logo.main.jpg" width="286" height="82"/></td>
  </tr>
  <tr align="right" valign="top">
   <td colspan="2">
    <table width="84%"  border="0" align="right">
     <tr align="left" valign="bottom">
      <td align="left" valign="baseline" >
<% { String usuario = "login"; %>
      Ol&aacute; <b><%= usuario %>!!</b>
<% } %></td>
     </tr>
     <tr align="left" valign="bottom">
      <td class="produto-fundo-celula"> O(s) produto(s) cadastrado(s) no SiTaS &eacute;(s&atilde;o): </td>
     </tr>
     <tr align="left" valign="bottom">
      <td height="0">
<% List auxiliarList;
   BeanProduto produtoCorrente;
   auxiliarList = new ArrayList();
   Iterator iterator = auxiliarList.iterator( ); %>
     <form action="" method="post" name="formProduto" id="formProduto" >
      <input name="gerente" type="hidden" value="4" />
       <table width="100%" border="0">
        <tr align="right" valign="bottom" class="produto-fundo-linha2">
         <td colspan="3" align="right" valign="middle">Solicitar: 
          <a href="javascript:gerenciarProdutos(1)"> INCLUSÃO</a> | 
<!--          <a href="javascript:gerenciarProdutos(2)">ALTERAÇÃO</a> |  -->
          <a href="javascript:gerenciarProdutos(3)">EXCLUSÃO</a> | 
          <a href="javascript:gerenciarProdutos(4)">ATUALIZAÇÃO</a>
         </td>
        </tr>
        <tr class="produto-fundo-celula">
         <td colspan="3" align="center" valign="middle" class="produto-titulo">
          <b>PRODUTOS</b>
         </td>
        </tr>
<% { String gerente = "1";
     if( gerente.equals( "1" ) ) { %>
        <tr class="produto-fundo-linha2">
         <td align="left" valign="middle" width="25%" class="produto-novo"> 
          Novo Produto 
         </td>
         <td colspan="2" align="right" valign="middle" width="75%">
		  Produto:<input type="text" name="novoProduto" value="" />
          Confirma?<input type="button" name="campoOK" value="OK" 
                    onclick="javascript:gerenciarProdutos(5)" />
         </td>
        </tr>
<%   } else {
       if( gerente.equals( "2" ) ) { %>
        <tr class="produto-fundo-linha2">
         <td colspan="3" align="right" valign="middle"> Alterar produtos?
          <input type="button" name="campoOK" value="OK"
           onclick="javascript:gerenciarProdutos(6)" /><br />
          * Produtos usados em testes n&atilde;o podem ser alterados.
         </td>
        </tr>
<%     } else {
         if( gerente.equals( "3" ) ) { %>
        <tr class="produto-fundo-linha2">
         <td align="left" valign="middle" width="25%" class="produto-novo"> 
          Excluir Produto 
         </td>
         <td colspan="2" align="right" valign="middle" width="75%">
          Marcar:
            <input name="campoMarcar" type="button" value="TODOS"
           onClick="javascript:marcarProdutos( )" />
          Confirma?
          <input type="button" name="campoOK" value="OK" 
           onclick="javascript:gerenciarProdutos(7)" />
		 </td>
        </tr>
 <%       } } } %>
        <tr class="produto-fundo-linha1">
         <td align="left" valign="top">
 <%  int contador = 0; int campo = 0;
     int total = auxiliarList.size( );
     total = ( int ) ( total / 3 );
     while( iterator.hasNext( ) ) {
       contador++;
       produtoCorrente = ( BeanProduto ) iterator.next( );  
       campo++;
       if( campo < 10 ) { %>
          <%= "0" + campo + ". " %>
<%     } else { %>
          <%= campo + ". " %>
<%     }
       if( gerente.equals( "3" ) ) { %>
          <input name="campo<%= campo %>" type="checkbox" 
           value="<%= produtoCorrente.getCodigo( ) %>" />
<%     } else { 
         if( gerente.equals( "2" ) ) { %>
          <input name="<%= produtoCorrente.getCodigo( ) %>" type="text" 
           value="<%= produtoCorrente.getNome( ) %>" /><br />
<%     } }
       if( ! gerente.equals( "2" ) ) { %>
          <%= produtoCorrente.getNome( ) %><br />
<%     }
       if( contador > total ) { contador = 0; %>
         </td>
         <td width="33%" align="left" valign="top">
<% } } } %>
         </td>
        </tr>
       </table>
       <table width="100%" border="0">
        <tr class="produto-fundo-linha2">
         <td class="produto-fundo-celula"> Existe(m) <b><%= auxiliarList.size( ) %> produto(s)</b> cadastrado(s) no SiTaS. </td>
         <td height="30" align="center" valign="middle" class="sitas"> Projeto SiTaS / DEA / UEPG </td>
        </tr>
       </table>
      </form>
	 </td>
    </tr>
   </table>
  </td>
  </tr>
</table><br />
 <div align="center" class="autores">por 
  <a href="mailto:projetositas@uol.com.br">Prestes, E. M.</a> e 
  <a href="mailto:alexvan@brturbo.com">Margraf, A. V.</a>
 </div>
</body>
</html>