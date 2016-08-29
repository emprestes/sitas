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
    Arquivos: sitas-clientes.jsp
              sitas-clientes.js
              sitas-gui.css
  -->
<%@ page language="java"
           import="com.sitas.beans.*, java.util.*"
          session="false"
 %>
<head>
 <title>SiTaS :: Clientes cadastratos!!!</title>
 <link rel="stylesheet" type="text/css" href="../css/sitas-gui.css" />
 <script language="javascript1.2" type="text/javascript" 
  src="../js/stm31.js" > </script>
</head>
<% HttpSession session = request.getSession( false );
   RequestDispatcher dispatcher =
    request.getRequestDispatcher( "../jsp/sitas-login.jsp" );
   if( session == null ) 
       dispatcher.forward( request, response );

   { String pagina = request.getParameter( "gerente" ); %>
<body class="body-fundo" onLoad="javascript:inicio( <%= pagina %> )"> <% } %>
 <script language="javascript1.2" type="text/javascript" 
  src="../js/sitas-mainmenu.js" > </script>
 <script language="javascript1.2" type="text/javascript" 
  src="../js/sitas-clientes.js" > </script>
 <table width="98%"  border="0" align="center">
  <tr>
   <td width="70%" align="left" valign="top">
    <p>
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
    <img src="../image/sitas-logo.main.jpg" width="286" height="82"/></td>
  </tr>
  <tr align="right" valign="top">
   <td colspan="2">
    <table width="84%"  border="0" align="right">
     <tr align="left" valign="bottom">
      <td align="left" valign="baseline" >
<% { String usuario = ( String ) session.getAttribute( "login" ); %>
       Ol&aacute; <b><%= usuario %>!!</b>
<% } %>
      </td>
     </tr>
     <tr align="left" valign="bottom">
      <td class="cliente-fundo-celula"> O(s) cliente(s) cadastrado(s) no SiTaS &eacute;(s&atilde;o): </td>
     </tr>
     <tr align="left" valign="bottom">
<% List auxiliarList; %>
      <td height="0">
       <form action="" method="post" name="formCliente" id="formCliente" >
        <input name="gerente" type="hidden" value="4" />
        <table width="100%" border="0">
         <tr align="right" valign="bottom" class="cliente-fundo-linha2">
          <td colspan="3" align="right" valign="middle">Solicitar: 
           <a href="javascript:gerenciarClientes(1)"> INCLUSÃO</a> | 
<!--           <a href="javascript:gerenciarClientes(2)">ALTERAÇÃO</a> |  -->
           <a href="javascript:gerenciarClientes(3)">EXCLUSÃO</a> | 
           <a href="javascript:gerenciarClientes(4)">ATUALIZAÇÃO</a>
          </td>
         </tr>
         <tr class="cliente-fundo-celula">
          <td colspan="3" align="center" valign="middle" class="cliente-titulo">
           <b>CLIENTES</b>
          </td>
         </tr>
<% String gerente = request.getParameter( "gerente" );
   if( ( gerente.equals( "1" ) ) || ( gerente.equals( "2" ) ) ) { %>
         <tr align="center" valign="top">
          <td colspan="3">
           <table width="100%" border="0" class="cliente-fundo-linha2">
            <tr>
<%   if( gerente.equals( "1" ) ) { %>
             <td colspan="4"><b class="cliente-novo">Novo Cliente</b> Todos os campos s&atilde;o obrigat&oacute;rios!</td>
<%   } else { %>
             <td colspan="4">Alterar Dados do Cliente</td>
<%   } %>
            </tr>
            <tr>
             <td width="15%" align="right" valign="middle">Nome:</td>
             <td width="55%" align="left" valign="middle"><input name="clienteNome" type="text" size="51"></td>
             <td align="right" valign="middle">Ramo:</td>
             <td align="left" valign="middle"><input name="clienteRamo" type="text" size="15"></td>
            </tr>
            <tr>
             <td width="15%" align="right" valign="middle">Endereco:</td>
             <td width="55%" align="left" valign="middle"><input name="clienteRua" type="text" size="51"></td>
             <td width="10%" align="right" valign="middle">N&uacute;mero:</td>
             <td width="20%" align="left" valign="middle"><input name="clienteNumero" type="text" size="5" maxlength="6"></td>
            </tr>
            <tr>
             <td width="15%" align="right" valign="middle">Bairro:</td>
             <td width="55%" align="left" valign="middle"><input name="clienteBairro" type="text" size="30"></td>
             <td width="10%" align="right" valign="middle">CEP:</td>
             <td width="20%" align="left" valign="middle">
              <input name="clienteCEP" type="text" id="clienteCEP" size="15" maxlength="8">
             </td>
            </tr>
            <tr>
             <td width="15%" align="right" valign="middle">Cidade:</td>
             <td width="55%" align="left" valign="middle">
<!--              <select name="clienteCidade" onChange="javascript:cidadeNova( 1 )">
               <option value="0"></option>
<% /* { BeanCidade cidadeCorrente; 
     auxiliarList = ( List ) session.getAttribute( "gccidades" );
     Iterator iterator = auxiliarList.iterator( ); 
     int contador = 0; int campo = 0;
     while( iterator.hasNext( ) ) {
       contador++;
       cidadeCorrente = ( BeanCidade ) iterator.next( ); %>
               <option value="<%= cidadeCorrente.getCodigo( ) %>"> <%= cidadeCorrente.getNome( ) %></option>
<% } } */ %>
              </select>
              Cidade nova: --> <input name="clienteCidade" type="text" id="clienteCidade" size="15" />
             </td>
             <td width="10%" align="right" valign="middle">UF:</td>
             <td colspan="3" align="left" valign="middle">
              <select name="clienteUF">
<% { BeanUF ufCorrente; 
     auxiliarList = ( List ) session.getAttribute( "gcufs" );
     Iterator iterator = auxiliarList.iterator( );
     while( iterator.hasNext( ) ) { 
       ufCorrente = ( BeanUF ) iterator.next( ); %>
               <option value="<%= ufCorrente.getCodigo( ) %>" <%= ( ufCorrente.getNome( ).equals( "PR" ) ? " selected" : "" ) %>><%= ufCorrente.getNome( ) %></option>
<% } } %>
              </select>
             </td>
            </tr>
            <tr>
             <td width="15%" align="right" valign="middle">Contato:</td>
             <td width="55%" align="left" valign="middle"><input name="clienteContato" type="text" size="30">
             exemplo: e-mail, telefone, etc. </td>
             <td colspan="4" align="right" valign="middle">
              Confirma? 
              <input type="button" name="campoOK" value="OK"
               onclick="javascript:gerenciarClientes(5)" />
             </td>
            </tr>
           </table>
          </td>
         </tr>
<% } else {
     if( gerente.equals( "3" ) ) { %>
         <tr align="right" valign="middle" class="cliente-fundo-linha2">
          <td align="left" class="cliente-novo" width="33%"> Excluir Clientes
          </td>
          <td colspan="2" width="66%"> Marcar:
            <input name="campoMarcar" type="button" value="TODOS"
            onClick="javascript:marcarClientes( )" />
           Confirma?
           <input type="button" name="campoOK" value="OK" 
            onclick="javascript:gerenciarClientes(7)" />
          </td>
         </tr>
<% } } %>
         <tr>
          <td align="center" valign="middle" colspan="3">
           <table width="100%"  border="0">
            <tr class="cliente-fundo-linha1">
             <td width="50%" align="left" valign="top">
<% BeanCliente clienteCorrente;
   auxiliarList = ( List ) session.getAttribute( "gclientes" );
   { Iterator iterator = auxiliarList.iterator( ); 
     int total = ( int ) ( auxiliarList.size( ) / 2 );
     int contador = 0; int campo = 0;
     while( iterator.hasNext( ) ) {
       contador++;
       clienteCorrente = ( BeanCliente ) iterator.next( );  
       BeanPessoa pessoa = clienteCorrente.getPessoa( );
       campo++; %>
<%     if( campo < 10 ) { %>
              <%= "0" + campo + ". " %>
<%     } else { %>
              <%= campo + ". " %>
<%     }
       if( gerente.equals( "3" ) ) { %>
              <input type="checkbox" name="cliente<%= campo %>" value="<%= clienteCorrente.getCodigo( ) %>">
<%     } %>
              <b><%= pessoa.getNome( ) %></b> ( <%= clienteCorrente.getRamo( ) %> )<br />
              <table border="0" width="100%">
               <tr>
                <td width="30">&#160;</td>
                <td>
                 <%= pessoa.getRua( ) %>,  <%= pessoa.getNumero( ) %><br />
                 CEP: <%= pessoa.getCEP( ) %> - <%= pessoa.getBairro( ) %><br />
                 <%= pessoa.getCidade( ) %> - <%= pessoa.getUF( ) %><br />
                 <%= pessoa.getEMAIL( ) %>
                </td>
               </tr>
              </table>
<%      if( contador > total ) { contador = 0; %>
             </td>
             <td width="50%" align="left" valign="top">
<%    } } } %>
             </td>
            </tr>
           </table>
          </td>
         </tr>
        </table>
        <table width="100%" border="0">
         <tr class="cliente-fundo-linha2">
          <td class="cliente-fundo-celula"> Existe(m) <b><%= auxiliarList.size( ) %> cliente(s)</b> cadastrado(s) no SiTaS. </td>
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