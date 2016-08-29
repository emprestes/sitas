<?xml version="1.0" encoding="iso-8859-1"?>
<!--
 UNIVERSIDADE ESTADUAL DE PONTA GROSSA
  Setor de Ciências e Tecnologia
  Departamento de Informática
  Curso de Bacharelado em Informática
  Acadêmicos: Alex Van Margraf
              Edson Marcio Prestes Cordeiro dos Santos
       R. A.: 98.1.0.4.16.23
	          99.1.0.4.11.23
     Projeto: Sistema para Teste de Análise Sensorial.
    Arquivos: planejamento-sensorial.xml
	          planejamento-sensorial-xhtml.xsl
  -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/">
  <html> <xsl:apply-templates/> </html>
 </xsl:template>

 <xsl:template match="projeto-planejamento">
  <head>
   <title> <xsl:value-of select="@sw"/> :: <xsl:value-of select="escopo/titulo"/> </title> 
   <link rel="stylesheet" type="text/css" href="sitas-planejamento.css"/>
   <script type="text/javascript" language="JavaScript1.2" src="stm31.js"> </script>
  </head>
  <body background="sitas-uepg.01.png" bgproperties="fixed">
<!-- SLIDE SiTaS -->
   <script type="text/javascript" language="JavaScript1.2" src="sitas-planejamento.js"> 
   </script>
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="sitas" id="sitas"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td width="95%" height="80%" colspan="2" valign="top">
         <table width="100%" border="0">
          <tr>
           <td colspan="2" class="academia-titulo">
            <div align="left"> <xsl:value-of select="responsavel/academia/nome"/> </div>
           </td>
          </tr>
          <tr>
           <td width="5%"> &#160; </td>
           <td width="95%">
            <p class="academia">
             <xsl:value-of select="responsavel/academia/setor"/> <br/>
             <xsl:value-of select="responsavel/academia/departamento"/> 
             (<xsl:value-of select="responsavel/academia/sigla-departamento"/>) <br/>
             <xsl:value-of select="responsavel/academia/curso"/> <br/>
             <xsl:value-of select="responsavel/academia/disciplina"/>
            </p>			 
           </td>
          </tr>
         </table>
        </td>
       </tr>
       <tr>
        <td colspan="2" valign="bottom">
         <table width="100%" border="0">
          <tr>
           <td colspan="2" height="150" class="titulo-capa" valign="middle"> 
		   <xsl:value-of select="responsavel/projeto"/>
           </td>
          </tr>
          <tr>
           <td width="05%" class="projeto-corpo"> <p align="right"> Projeto: <br/> Acadêmico: <br/> <br/> R. A.:<br/> <br/> </p> </td>
           <td width="95%" class="academia"><B>
            <xsl:value-of select="escopo/titulo"/> <br/>
            <xsl:value-of select="responsavel/academico01/primeiro-nome"/> 
            <xsl:value-of select="responsavel/academico01/sobre-nome"/> <br/>
            <xsl:value-of select="responsavel/academico02/primeiro-nome"/> 
            <xsl:value-of select="responsavel/academico02/sobre-nome"/> <br/>
            <xsl:value-of select="responsavel/academico01/ra"/> <br/>
            <xsl:value-of select="responsavel/academico02/ra"/> </B>
           </td>
          </tr>
          <tr>
           <td colspan="2" height="100" valign="bottom" class="projeto-ano">
            <xsl:value-of select="responsavel/ano"/>
           </td>
          </tr>
         </table>
        </td>
       </tr>
      </table>
     </td>
    </tr>
   </table>
<!-- SLIDE A quem se destina -->
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="destino" id="destino"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td height="10%" colspan="2" valign="top" class="academia-titulo">
         <div align="left"> <xsl:value-of select="responsavel/cliente/@descricao"/> </div>
        </td>
       </tr>
       <tr>
        <td height="90%" colspan="2" valign="middle" class="projeto-corpo">
         <table width="100%" border="0">
          <tr>
           <td class="projeto-corpo"> <p align="right">
            <xsl:value-of select="responsavel/cliente/departamento/@descricao"/>: <br/>
            <xsl:value-of select="responsavel/cliente/responsavel/@descricao"/>: <br/>
            <xsl:value-of select="responsavel/cliente/telefone/@descricao"/>: <br/>
            <xsl:value-of select="responsavel/cliente/email/@descricao"/>: </p>
           </td>
           <td class="academia"> <B>
            <xsl:value-of select="responsavel/cliente/departamento"/> <br/>
            <xsl:value-of select="responsavel/cliente/responsavel"/> <br/>
            <xsl:value-of select="responsavel/cliente/telefone"/> <br/>
            <xsl:value-of select="responsavel/cliente/email"/> </B>
           </td>
          </tr>
         </table>
        </td>
       </tr>
      </table>
     </td>
	</tr>
   </table>
<!-- SLIDE Planejamento -->
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="planejamento" id="planejamento"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td height="10%" colspan="2" valign="top" class="academia-titulo"><div align="left"><xsl:value-of select="@descricao"/></div></td>
       </tr>
       <tr>
        <td height="90%" colspan="2" valign="middle" class="projeto-corpo"><ul>
          <li><xsl:value-of select="escopo/@descricao"/>;</li>
          <li><xsl:value-of select="diagnostico-atual/@descricao"/>;</li>
          <li><xsl:value-of select="objetivo/@descricao"/>;</li>
          <li><xsl:value-of select="proposta/@descricao"/>;
           <ul>
            <li><xsl:value-of select="proposta/beneficios/@descricao"/>;</li>
            <li><xsl:value-of select="proposta/custos/@descricao"/>;</li>
            <li><xsl:value-of select="proposta/riscos/@descricao"/>;</li>
            <li><xsl:value-of select="proposta/modelagem/@descricao"/>.</li>
           </ul>
          </li>
          <li><xsl:value-of select="cronograma/@descricao"/>;</li>
          <li><xsl:value-of select="conclusao/@descricao"/>;</li>
          <li><xsl:value-of select="referencias/@descricao"/>;</li>
          <li><xsl:value-of select="responsavel/@descricao"/>.</li>
        </ul></td>
       </tr>
      </table>
     </td>
    </tr>
   </table>
<!-- SLIDE Escopo -->
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="escopo" id="escopo"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td height="10%" colspan="2" valign="top" class="academia-titulo">
         <div align="left"> <xsl:value-of select="escopo/@descricao"/> </div> <br/>
         <xsl:value-of select="escopo/titulo/@assunto"/>
		</td>
       </tr>
       <tr>
        <td height="90%" colspan="2" valign="middle" class="projeto-corpo">
         <p align="justify">
          "<em><xsl:value-of select="escopo/citacao"/></em>"
          ( <xsl:value-of select="escopo/citacao/@norma"/>, <xsl:value-of select="escopo/citacao/@ano"/> )
         </p>
         <b><em><xsl:value-of select="escopo/introducao/@descricao"/></em></b>
         <p align="justify">
          <xsl:value-of select="escopo/introducao/ser-humano"/>
          <ul>
           <li><xsl:value-of select="escopo/introducao/ser-humano/@habilidade1"/>;</li>
           <li><xsl:value-of select="escopo/introducao/ser-humano/@habilidade2"/>;</li>
           <li><xsl:value-of select="escopo/introducao/ser-humano/@habilidade3"/>.</li>
          </ul>
         </p>
         <p align="justify"> <xsl:value-of select="escopo/introducao/analise-sensorial"/> </p>
        </td>
       </tr>
      </table>
     </td>
	</tr>
   </table>
<!-- SLIDE Eng. de Alimentos UEPG -->
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="eauepg" id="eauepg"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td height="10%" colspan="2" valign="top" class="academia-titulo">
         <div align="left"><xsl:value-of select="escopo/@descricao"/> <br/> </div>
         <xsl:value-of select="escopo/introducao/analise-uepg/@descricao"/>
		</td>
       </tr>
       <tr>
        <td height="90%" colspan="2" valign="middle" class="projeto-corpo">
         <p align="justify"> <xsl:value-of select="escopo/introducao/analise-uepg/paragrafo"/> </p>
         <p class="academia-titulo"> <xsl:value-of select="escopo/introducao/analise-uepg/testes-discriminativos/@descricao"/> </p>
         <p> <xsl:value-of select="escopo/introducao/analise-uepg/testes-discriminativos/paragrafo"/> </p>
         <table width="100%"  border="0" align="center" class="projeto-corpo">
          <tr align="left" valign="top">
           <td>
            <ul>
             <li> <xsl:value-of select="escopo/introducao/analise-uepg/testes-discriminativos/teste01"/>; </li>
             <li> <b> <xsl:value-of select="escopo/introducao/analise-uepg/testes-discriminativos/teste02"/> </b>; </li>
             <li> <xsl:value-of select="escopo/introducao/analise-uepg/testes-discriminativos/teste03"/>; </li>
             <li> <b> <xsl:value-of select="escopo/introducao/analise-uepg/testes-discriminativos/teste04"/> </b>; </li>
             <li> <xsl:value-of select="escopo/introducao/analise-uepg/testes-discriminativos/teste05"/>; </li>
            </ul>
		   </td>
           <td>
            <ul>
             <li> <b> <xsl:value-of select="escopo/introducao/analise-uepg/testes-discriminativos/teste06"/> </b>; </li>
             <li> <xsl:value-of select="escopo/introducao/analise-uepg/testes-discriminativos/teste07"/>; </li>
             <li> <xsl:value-of select="escopo/introducao/analise-uepg/testes-discriminativos/teste08"/>; </li>
             <li> <b> <xsl:value-of select="escopo/introducao/analise-uepg/testes-discriminativos/teste09"/> </b>. </li>
            </ul>
		   </td>
          </tr>
         </table>
        </td>
       </tr>
      </table>
	 </td>
	</tr>
   </table>
<!-- SLIDE Testes -->
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="testes" id="testes"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td height="10%" colspan="2" valign="top" class="academia-titulo">
         <div align="left"><xsl:value-of select="escopo/@descricao"/> <br/> </div>
         <xsl:value-of select="escopo/introducao/analise-uepg/@descricao"/>
		</td>
       </tr>
       <tr>
        <td height="90%" colspan="2" valign="middle" class="projeto-corpo">
         <p class="academia-titulo"> <xsl:value-of select="escopo/introducao/analise-uepg/testes-descritivos/@descricao"/> </p>
         <p> <xsl:value-of select="escopo/introducao/analise-uepg/testes-descritivos/paragrafo"/> </p>
         <ul>
          <li> <xsl:value-of select="escopo/introducao/analise-uepg/testes-descritivos/teste01"/>; </li>
          <li> <xsl:value-of select="escopo/introducao/analise-uepg/testes-descritivos/teste02"/>; </li>
          <li> <xsl:value-of select="escopo/introducao/analise-uepg/testes-descritivos/teste03"/>. </li>
         </ul>
         <p class="academia-titulo"> <xsl:value-of select="escopo/introducao/analise-uepg/testes-afetivos/@descricao"/> </p>
         <p> <xsl:value-of select="escopo/introducao/analise-uepg/testes-afetivos/paragrafo"/> </p>
         <ul>
          <li> <xsl:value-of select="escopo/introducao/analise-uepg/testes-afetivos/teste01"/>; </li>
          <li> <b> <xsl:value-of select="escopo/introducao/analise-uepg/testes-afetivos/teste02"/> </b>; </li>
          <li> <xsl:value-of select="escopo/introducao/analise-uepg/testes-afetivos/teste03"/>; </li>
          <li> <xsl:value-of select="escopo/introducao/analise-uepg/testes-afetivos/teste04"/>. </li>
         </ul>
        </td>
       </tr>
      </table>
	 </td>
	</tr>
   </table>
<!-- SLIDE Laboratórios -->
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="laboratorios" id="laboratorios"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td height="10%" colspan="2" valign="top" class="academia-titulo">
         <div align="left"><xsl:value-of select="escopo/@descricao"/> </div>
		</td>
       </tr>
       <tr>
        <td height="90%" colspan="2" valign="middle" class="projeto-corpo">
         <table width="100%" border="0">
           <tr>
             <td> <div align="center"> <img height="200" width="250" src="sitas-laboratorio.01.png" alt="Laboratório sensorial"/> </div> </td>
             <td> <div align="center"> <img height="200" width="250" src="sitas-laboratorio.02.png" alt="Cabines para avaliações sensorial"/> </div> </td>
           </tr>
           <tr>
             <td> <div align="center"> <img height="200" width="250" src="sitas-duo.trio.png" alt="Material para teste Duo-Trio"/> </div> </td>
             <td> <div align="center"> <img height="200" width="250" src="sitas-triangular.png" alt="Material para teste Triangular"/> </div> </td>
           </tr>
         </table>
        </td>
       </tr>
      </table>
	 </td>
	</tr>
   </table>
<!-- SLIDE Fichas -->
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="fichas" id="fichas"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td height="10%" colspan="2" valign="top" class="academia-titulo">
         <div align="left"><xsl:value-of select="escopo/@descricao"/> </div>
		</td>
       </tr>
       <tr>
        <td height="90%" colspan="2" valign="middle" class="projeto-corpo">
         <table width="100%" border="0">
           <tr>
             <td> <div align="center"> <img height="180" width="400" src="sitas-ficha.01.png" alt="Exemplo de ficha (Escala Hedônica)"/> </div> </td>
           </tr>
           <tr>
             <td> <div align="center"> <img src="sitas-ficha.02.png" alt="Exemplo de ficha (Ordenação)"/> </div> </td>
           </tr>
           <tr>
             <td> <div align="center"> <img src="sitas-ficha.03.png" alt="Exemplo de ficha (Duo-trio)"/> </div> </td>
           </tr>
         </table>
        </td>
       </tr>
      </table>
	 </td>
	</tr>
   </table>
<!-- SLIDE Processo -->
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="processo" id="processo"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td height="10%" colspan="2" valign="top" class="academia-titulo">
         <div align="left"><xsl:value-of select="escopo/@descricao"/> <br/> </div>
         <xsl:value-of select="escopo/introducao/processo/@descricao"/>
		</td>
       </tr>
       <tr>
        <td height="90%" colspan="2" valign="middle" class="projeto-corpo">
         <p align="center"> <img src="sitas-processo.jpg" height="350" width="550" alt="Processo de Avaliação Sensorial"/> </p>
        </td>
       </tr>
      </table>
	 </td>
	</tr>
   </table>
<!-- SLIDE Diagnóstico atual -->
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="diagnostico" id="diagnostico"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td height="10%" colspan="2" valign="top" class="academia-titulo">
         <div align="left"><xsl:value-of select="diagnostico-atual/@descricao"/> <br/> </div>
		</td>
       </tr>
       <tr>
        <td height="90%" colspan="2" valign="middle" class="projeto-corpo">
         <p><xsl:value-of select="diagnostico-atual/paragrafo-avaliacao"/> <br/>
            <xsl:value-of select="diagnostico-atual/fatos-encontrados/@descricao"/>:</p>
         <ul>
          <li> <xsl:value-of select="diagnostico-atual/fatos-encontrados/fato01"/>; </li>
          <li> <xsl:value-of select="diagnostico-atual/fatos-encontrados/fato02"/>; </li>
          <li> <xsl:value-of select="diagnostico-atual/fatos-encontrados/fato03"/>; </li>
          <li> <xsl:value-of select="diagnostico-atual/fatos-encontrados/fato04"/>; </li>
          <li> <xsl:value-of select="diagnostico-atual/fatos-encontrados/fato05"/>. </li>
         </ul>
         <p> <xsl:value-of select="diagnostico-atual/paragrafo-ambiente"/> </p>
        </td>
       </tr>
      </table>
	 </td>
	</tr>
   </table>
<!-- SLIDE Objetivo -->
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="objetivo" id="objetivo"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td height="10%" colspan="2" valign="top" class="academia-titulo">
         <div align="left"><xsl:value-of select="objetivo/@descricao"/></div>
        </td>
       </tr>
       <tr>
        <td height="90%" colspan="2" valign="middle" class="projeto-corpo">
         <p align="justify"> <xsl:value-of select="objetivo"/> </p>
         <p class="academia-titulo"> <xsl:value-of select="objetivo/especifico/@descricao"/> </p>
         <p align="justify"> <ul>
           <li><xsl:value-of select="objetivo/especifico/primeiro"/></li>;
           <li><xsl:value-of select="objetivo/especifico/segundo"/></li>;
           <li><xsl:value-of select="objetivo/especifico/terceiro"/></li>.
          </ul>
         </p>
        </td>
       </tr>
      </table>
	 </td>
	</tr>
   </table>
<!-- SLIDE Proposta -->
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="proposta" id="proposta"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td height="10%" colspan="2" valign="top" class="academia-titulo">
         <div align="left"> <xsl:value-of select="proposta/@descricao"/> </div>
        </td>
       </tr>
       <tr>
        <td height="90%" colspan="2" valign="middle" class="projeto-corpo">
         <p align="justify"> <xsl:value-of select="proposta/paragrafo"/> </p>
         <p align="justify">
          <xsl:value-of select="proposta/ambientes/@paragrafo"/>:
          <ul>
           <li> <xsl:value-of select="proposta/ambientes/tool01"/>; </li>
           <li> <xsl:value-of select="proposta/ambientes/tool02"/>; </li>
           <li> <xsl:value-of select="proposta/ambientes/tool03"/>; </li>
           <li> <xsl:value-of select="proposta/ambientes/tool04"/>. </li>
          </ul>
         </p>
         <p align="justify"> <xsl:value-of select="proposta/limitacoes"/> </p>
        </td>
       </tr>
      </table>
	 </td>
	</tr>
   </table>
<!-- SLIDE Proposta Imagens -->
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="imagens" id="imagens"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td height="10%" colspan="2" valign="top" class="academia-titulo">
         <div align="left"> <xsl:value-of select="proposta/@descricao"/> </div>
        </td>
       </tr>
       <tr>
        <td height="90%" colspan="2" valign="middle" class="projeto-corpo">
          <table width="100%"  border="0">
            <tr>
              <td> <div align="center"> <img height="200" width="250" src="sitas-servidor.png" alt="Proposta de arquitetura"/> </div> </td>
              <td> <div align="center"> <img height="200" width="250" src="sitas-xml.png" alt="Transformação de XML via XSLT"/> </div> </td>
            </tr>
            <tr>
              <td colspan="2"> <div align="center"> <img height="250" width="500" src="sitas-3.camadas.png" alt="Arquitetura interna do SiTaS"/> </div> </td>
              </tr>
          </table>
        </td>
       </tr>
      </table>
	 </td>
	</tr>
   </table>
<!-- SLIDE Benefícios -->
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="beneficios" id="beneficios"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td height="10%" colspan="2" valign="top" class="academia-titulo">
         <div align="left"> <xsl:value-of select="proposta/@descricao"/> </div>
         <p align="center" class="academia-titulo"> <xsl:value-of select="proposta/beneficios/@descricao"/> </p>
        </td>
       </tr>
       <tr>
        <td height="90%" colspan="2" valign="middle" class="projeto-corpo">
         <p align="justify">
          <xsl:value-of select="proposta/beneficios/beneficio01/@descricao"/>:
          <ul>
           <li> <xsl:value-of select="proposta/beneficios/beneficio01"/>; </li>
           <li> <xsl:value-of select="proposta/beneficios/beneficio02"/>; </li>
           <li> <xsl:value-of select="proposta/beneficios/beneficio03"/>; </li>
           <li> <xsl:value-of select="proposta/beneficios/beneficio04"/>. </li>
          </ul>
         </p>
         <p align="center" class="academia-titulo"> <xsl:value-of select="proposta/custos/@descricao"/> </p>
         <p align="justify">
          <xsl:value-of select="proposta/custos/desenvolvimento/@descricao"/>:
          <ul>
           <li> <xsl:value-of select="proposta/custos/desenvolvimento/item01"/>. </li>
          </ul>
         </p>
         <p align="justify">
          <xsl:value-of select="proposta/custos/equipamento/@descricao"/>:
          <ul>
           <li> <xsl:value-of select="proposta/custos/equipamento/item01"/>; </li>
           <li> <xsl:value-of select="proposta/custos/equipamento/item02"/>; </li>
           <li> <xsl:value-of select="proposta/custos/equipamento/item03"/>. </li>
          </ul>
         </p>
        </td>
       </tr>
      </table>
	 </td>
	</tr>
   </table>
<!-- SLIDE Riscos -->
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="riscos" id="riscos"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td height="10%" colspan="2" valign="top" class="academia-titulo">
         <div align="left"> <xsl:value-of select="proposta/@descricao"/> </div>
         <p align="center" class="academia-titulo"> <xsl:value-of select="proposta/custos/@descricao"/> </p>
        </td>
       </tr>
       <tr>
        <td height="90%" colspan="2" valign="middle" class="projeto-corpo">
         <p align="justify">
          <xsl:value-of select="proposta/custos/recurso-humano/@descricao"/>:
          <ul>
           <li> <xsl:value-of select="proposta/custos/recurso-humano/item01"/>; </li>
           <li> <xsl:value-of select="proposta/custos/recurso-humano/item02"/>; </li>
           <li> <xsl:value-of select="proposta/custos/recurso-humano/item03"/>. </li>
          </ul>
         </p>
          <table width="100%" class="projeto-corpo" border="1" align="center">
           <tr>
            <td class="academia-titulo"> <div align="center"> <xsl:value-of select="proposta/riscos/tabela/riscos/@descricao"/> </div> </td>
            <td> <div align="center"> <xsl:value-of select="proposta/riscos/tabela/categoria/@descricao"/> </div> </td>
            <td> <div align="center"> <xsl:value-of select="proposta/riscos/tabela/probabilidade/@descricao"/> </div> </td>
            <td> <div align="center"> <xsl:value-of select="proposta/riscos/tabela/impacto/@descricao"/> </div> </td>
           </tr>
           <tr>
            <td> <div align="center"> <xsl:value-of select="proposta/riscos/tabela/riscos/linha01"/> </div> </td>
            <td> <div align="center"> <xsl:value-of select="proposta/riscos/tabela/categoria/linha01"/> </div> </td>
            <td> <div align="center"> <xsl:value-of select="proposta/riscos/tabela/probabilidade/linha01"/> </div> </td>
            <td> <div align="center"> <xsl:value-of select="proposta/riscos/tabela/impacto/linha01"/> </div> </td>
           </tr>
           <tr>
            <td> <div align="center"> <xsl:value-of select="proposta/riscos/tabela/riscos/linha02"/> </div> </td>
            <td> <div align="center"> <xsl:value-of select="proposta/riscos/tabela/categoria/linha02"/> </div> </td>
            <td> <div align="center"> <xsl:value-of select="proposta/riscos/tabela/probabilidade/linha02"/> </div> </td>
            <td> <div align="center"> <xsl:value-of select="proposta/riscos/tabela/impacto/linha02"/> </div> </td>
           </tr>
           <tr>
            <td> <div align="center"> <xsl:value-of select="proposta/riscos/tabela/riscos/linha03"/> </div> </td>
            <td> <div align="center"> <xsl:value-of select="proposta/riscos/tabela/categoria/linha03"/> </div> </td>
            <td> <div align="center"> <xsl:value-of select="proposta/riscos/tabela/probabilidade/linha03"/> </div> </td>
            <td> <div align="center"> <xsl:value-of select="proposta/riscos/tabela/impacto/linha03"/> </div> </td>
           </tr>
           <tr>
            <td> <div align="center"> <xsl:value-of select="proposta/riscos/tabela/riscos/linha04"/> </div> </td>
            <td> <div align="center"> <xsl:value-of select="proposta/riscos/tabela/categoria/linha04"/> </div> </td>
            <td> <div align="center"> <xsl:value-of select="proposta/riscos/tabela/probabilidade/linha04"/> </div> </td>
            <td> <div align="center"> <xsl:value-of select="proposta/riscos/tabela/impacto/linha01"/> </div> </td>
           </tr>
          </table>
          <table width="100%" class="projeto-corpo" border="0" align="center">
           <tr>
            <td>
             <div align="center">
              <xsl:value-of select="proposta/riscos/tabela/impacto/linha01"/>
              <xsl:value-of select="proposta/riscos/tabela/impacto/linha01/@descricao"/>
             </div>
            </td>
            <td>
             <div align="center">
              <xsl:value-of select="proposta/riscos/tabela/impacto/linha02"/>
              <xsl:value-of select="proposta/riscos/tabela/impacto/linha02/@descricao"/>
             </div>
            </td>
            <td>
             <div align="center">
              <xsl:value-of select="proposta/riscos/tabela/impacto/linha03"/>
              <xsl:value-of select="proposta/riscos/tabela/impacto/linha03/@descricao"/>
             </div>
            </td>
            <td>
             <div align="center">
              <xsl:value-of select="proposta/riscos/tabela/impacto/linha04"/>
              <xsl:value-of select="proposta/riscos/tabela/impacto/linha04/@descricao"/>
             </div>
            </td>
           </tr>
          </table>
         </td>
       </tr>
      </table>
	 </td>
	</tr>
   </table>
<!-- SLIDE Atores -->
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="atores" id="atores"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td height="10%" colspan="2" valign="top" class="academia-titulo">
         <div align="left"> <xsl:value-of select="proposta/@descricao"/> - 
                            <xsl:value-of select="proposta/modelagem/@descricao"/> </div>
		</td>
       </tr>
       <tr>
        <td height="90%" colspan="2" valign="middle" class="projeto-corpo">
         <p align="center" class="academia-titulo"> <xsl:value-of select="proposta/modelagem/atores/@descricao"/> </p>
         <p align="center"> <img src="sitas-uml.atores.png" alt="Definição dos atores do SiTaS"/> </p>
        </td>
       </tr>
      </table>
	 </td>
	</tr>
   </table>
<!-- SLIDE DCDU -->
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="dcdu" id="dcdu"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td height="10%" colspan="2" valign="top" class="academia-titulo">
         <div align="left"> <xsl:value-of select="proposta/@descricao"/> - 
                            <xsl:value-of select="proposta/modelagem/@descricao"/> </div>
		</td>
       </tr>
       <tr>
        <td height="90%" colspan="2" valign="middle" class="projeto-corpo">
         <p align="center" class="academia-titulo"> <xsl:value-of select="proposta/modelagem/use-case/@descricao"/> </p>
         <p align="center">
          <a href="sitas-uml.use.case.png"> <img src="sitas-uml.use.case.png" height="400" width="550" alt="Diagrama de casos de uso do SiTaS"/> </a> 
         </p>
        </td>
       </tr>
      </table>
	 </td>
	</tr>
   </table>
<!-- SLIDE DC -->
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="dc" id="dc"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td height="10%" colspan="2" valign="top" class="academia-titulo">
         <div align="left"> <xsl:value-of select="proposta/@descricao"/> - 
                            <xsl:value-of select="proposta/modelagem/@descricao"/> </div>
		</td>
       </tr>
       <tr>
        <td height="90%" colspan="2" valign="middle" class="projeto-corpo">
         <p align="center" class="academia-titulo"> <xsl:value-of select="proposta/modelagem/class/@descricao"/> </p>
         <p align="center">
          <a href="sitas-uml.class.png"> <img src="sitas-uml.class.png" height="400" width="550" alt="Diagrama de classes do SiTaS"/> </a> 
         </p>
        </td>
       </tr>
      </table>
	 </td>
	</tr>
   </table>
<!-- SLIDE DS -->
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="ds" id="ds"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td height="10%" colspan="2" valign="top" class="academia-titulo">
         <div align="left"> <xsl:value-of select="proposta/@descricao"/> - 
                            <xsl:value-of select="proposta/modelagem/@descricao"/> </div>
		</td>
       </tr>
       <tr>
        <td height="90%" colspan="2" valign="middle" class="projeto-corpo">
         <p align="center" class="academia-titulo"> <xsl:value-of select="proposta/modelagem/sequence/@descricao"/> </p>
         <table width="100%" border="0">
           <tr>
             <td>
              <div align="center">
			   <a href="sitas-uml.sequence.realizar.png"> <img height="200" width="250" src="sitas-uml.sequence.realizar.png" alt="Diagrama de Seqüencia para Realizar teste"/> </a>
              </div>
             </td>
             <td></td>
           </tr>
           <tr>
             <td></td>
             <td> 
              <div align="center"> 
               <a href="sitas-uml.sequence.elaborar.png"> <img height="200" width="250" src="sitas-uml.sequence.elaborar.png" alt="Diagrama de Seqüencia para elaborar Teste"/> </a>
              </div> 
             </td>
           </tr>
         </table>
        </td>
       </tr>
      </table>
	 </td>
	</tr>
   </table>
<!-- SLIDE DER -->
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="der" id="der"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td height="10%" colspan="2" valign="top" class="academia-titulo">
         <div align="left"> <xsl:value-of select="proposta/@descricao"/> - 
                            <xsl:value-of select="proposta/modelagem/@descricao"/> </div>
		</td>
       </tr>
       <tr>
        <td height="90%" colspan="2" valign="middle" class="projeto-corpo">
         <p align="center" class="academia-titulo"> <xsl:value-of select="proposta/modelagem/db-conceitual/@descricao"/> </p>
         <p align="center">
          <a href="sitas-db.mer.conceitual.02.png"> <img src="sitas-db.mer.conceitual.02.png" height="400" width="550" alt="Modelo conceitual de banco de dados para o SiTaS"/> </a> 
         </p>
        </td>
       </tr>
      </table>
	 </td>
	</tr>
   </table>
<!-- SLIDE DR -->
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="dr" id="dr"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td height="10%" colspan="2" valign="top" class="academia-titulo">
         <div align="left"> <xsl:value-of select="proposta/@descricao"/> - 
                            <xsl:value-of select="proposta/modelagem/@descricao"/> </div>
		</td>
       </tr>
       <tr>
        <td height="90%" colspan="2" valign="middle" class="projeto-corpo">
         <p align="center" class="academia-titulo"> <xsl:value-of select="proposta/modelagem/db-logico/@descricao"/> </p>
         <p align="center">
          <a href="sitas-db.mer.logico.02.png"> <img src="sitas-db.mer.logico.02.png" height="400" width="550" alt="Modelo lógico (IDEF1x) de banco de dados para o SiTaS"/> </a> 
         </p>
        </td>
       </tr>
      </table>
	 </td>
	</tr>
   </table>
<!-- SLIDE Cronograma -->
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="cronograma" id="cronograma"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td height="10%" colspan="2" valign="top" class="academia-titulo">
         <div align="left"><xsl:value-of select="cronograma/@descricao"/> </div>
		</td>
       </tr>
       <tr>
        <td height="90%" colspan="2" valign="middle" class="projeto-corpo">
         <table width="100%" border="0">
           <tr>
             <td>
              <div align="center">
			  <a href="sitas-cronograma.01.jpg"> <img height="200" width="250" src="sitas-cronograma.01.jpg" alt="Cronograma Página 01"/> </a>
              </div>
             </td>
             <td> <div align="center"> <img height="200" width="250" src="sitas-cronograma.02.jpg" alt="Cronograma Página 02"/> </div> </td>
           </tr>
           <tr>
             <td> <div align="center"> <img height="200" width="250" src="sitas-cronograma.03.jpg" alt="Cronograma Página 03"/> </div> </td>
             <td> <div align="center"> <img height="200" width="250" src="sitas-cronograma.04.jpg" alt="Cronograma Página 04"/> </div> </td>
           </tr>
         </table>
        </td>
       </tr>
      </table>
	 </td>
	</tr>
   </table>
<!-- SLIDE Cronograma - continuação -->
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="ccontinuacao" id="ccontinuacao"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td height="10%" colspan="2" valign="top" class="academia-titulo">
         <div align="left"><xsl:value-of select="cronograma/@descricao"/> </div>
		</td>
       </tr>
       <tr>
        <td height="90%" colspan="2" valign="middle" class="projeto-corpo">
         <table width="100%" border="0">
           <tr>
             <td> <div align="center"> <img height="200" width="250" src="sitas-cronograma.05.jpg" alt="Cronograma Página 05"/> </div> </td>
             <td> <div align="center"> <img height="200" width="250" src="sitas-cronograma.06.jpg" alt="Cronograma Página 06"/> </div> </td>
           </tr>
           <tr>
             <td> <div align="center"> <img height="200" width="250" src="sitas-cronograma.07.jpg" alt="Cronograma Página 07"/> </div> </td>
             <td> <div align="center"> &#160; </div> </td>
           </tr>
         </table>
        </td>
       </tr>
      </table>
	 </td>
	</tr>
   </table>
<!-- SLIDE Conclusão -->
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="conclusao" id="conclusao"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td height="10%" colspan="2" valign="top" class="academia-titulo">
         <div align="left"><xsl:value-of select="conclusao/@descricao"/></div>
        </td>
       </tr>
       <tr>
        <td height="90%" colspan="2" valign="middle" class="projeto-corpo">
         <p align="justify"> <xsl:value-of select="conclusao/paragrafo01"/> </p>
         <p align="justify"> <xsl:value-of select="conclusao/paragrafo02"/> </p>
         <p align="justify"> <xsl:value-of select="conclusao/paragrafo03"/> </p>
        </td>
       </tr>
      </table>
	 </td>
	</tr>
   </table>
<!-- SLIDE Referências -->
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="referencias" id="referencias"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td width="95%" height="80%" colspan="2" valign="top" class="academia-titulo">
         <div align="left"> <xsl:value-of select="referencias/@descricao"/> </div>
        </td>
       </tr>
       <tr>
        <td colspan="2" align="center" valign="middle">
         <p class="academia-titulo"> <xsl:value-of select="referencias/informatica/@descricao"/>
		 <table width="100%"  border="0">
          <tr align="center" valign="middle">
            <td bgcolor="#009966"> <img src="sitas-livro.01-aj2htp.jpg" width="73" height="104" alt="Advanced Java 2 Platform: How to Program (DEITEL, Harvey)"/> </td>
            <td bgcolor="#009966"> <img src="sitas-livro.03-iw3htp.jpg" width="73" height="104" alt="Internet e World Wide Web: Como Programar (DEITEL, Harvey)"/> </td>
            <td bgcolor="#009966"> <img src="sitas-livro.04-xmlhtp.jpg" width="73" height="104" alt="XML: Como Programar (DEITEL, Harvey)"/> </td>
            <td bgcolor="#009966"> <img src="sitas-livro.02-jhtp.jpg" width="73" height="104" alt="Java: Como Programar (DEITEL, Harvey)"/> </td>
            <td bgcolor="#FFFFCC"> <img src="sitas-livro.11-dbsetzer.jpg" width="73" height="104" alt="Banco de Dados (SETZER, Valdemar)"/> </td>
            <td bgcolor="#FFFFCC"> <img src="sitas-livro.12-sbd.gif" width="73" height="104" alt="Sistema de Banco de Dados (SILBERSCHATZ, Abraham)"/> </td>
            <td bgcolor="#FFFFCC"> <img src="sitas-livro.13-dbxml.jpg" width="73" height="104" alt="Projeto de Banco de Dados com XML (GRAVES, Mark)"/> </td>
          </tr>
          <tr align="center" valign="middle">
            <td bgcolor="#009966"> <img src="sitas-livro.05-arqsw.jpg" width="73" height="104" alt="Arquitetura de Software: Desenvolvimento orientado para arquitetura (MENDES, Antonio)"/> </td>
            <td bgcolor="#FFCC33"> <img src="sitas-livro.10-ooproto.jpg" width="73" height="104" alt="Orientação à Obejtos com Prototipação (FEDELI, Ricardo)"/> </td>
            <td bgcolor="#FFCC33"> <img src="sitas-livro.09-engsw.jpg" width="73" height="104" alt="Engenharia de Software (PRESSMAN, Roger)"/> </td>
            <td bgcolor="#FFFFFF"> <img src="sitas-livro.14-estexcel.jpg" width="73" height="104" alt="Estatística usando Excel (LAPPONI, Ruan)"/> </td>
            <td bgcolor="#0099FF"> <img src="sitas-livro.08-umlgu.jpg" width="73" height="104" alt="UML: Guia do Usuário (BOOCH, Grady)"/> </td>
            <td bgcolor="#0099FF"> <img src="sitas-livro.07-umldev.jpg" width="73" height="104" alt="Desenvolvendo Aplicações com UML (MELO, Ana Cristina)"/> </td>
            <td bgcolor="#0099FF"> <img src="sitas-livro.06-aoo.jpg" width="73" height="104" alt="Análise Orientada à Objetos (CORREIA, Carlos H.)"/> </td>
          </tr>
         </table> </p>
         <p class="academia-titulo">
          <xsl:value-of select="referencias/alimentos/@descricao"/>
          <table width="95%" border="0" class="publicacoes">
           <tr>
            <td colspan="2"> <div align="justify"> <xsl:value-of select="referencias/alimentos/publicacao01/autor"/> </div> </td>
           </tr>
           <tr>
            <td width="3%"> &#160; </td>
            <td width="97%">
             <b> <xsl:value-of select="referencias/alimentos/publicacao01/titulo"/> </b> <br/>
             <xsl:value-of select="referencias/alimentos/publicacao01/editora"/>
             <xsl:value-of select="referencias/alimentos/publicacao01/cidade"/>
             <xsl:value-of select="referencias/alimentos/publicacao01/ano"/>
            </td>
           </tr>
           <tr>
            <td colspan="2"> <div align="justify"> <xsl:value-of select="referencias/alimentos/publicacao02/autor"/> </div> </td>
           </tr>
           <tr>
            <td width="3%"> &#160; </td>
            <td width="97%">
             <b> <xsl:value-of select="referencias/alimentos/publicacao02/titulo"/> </b> <br/>
             <xsl:value-of select="referencias/alimentos/publicacao02/editora"/>
             <xsl:value-of select="referencias/alimentos/publicacao02/cidade"/>
             <xsl:value-of select="referencias/alimentos/publicacao02/ano"/>
            </td>
           </tr>
          </table>
         </p>
        </td>
       </tr>
      </table>
     </td>
    </tr>
   </table>
<!-- SLIDE Responsáveis -->
   <table width="600" border="0" align="center">
    <tr> <td height="75" colspan="3" class="slide"> <a name="responsavel" id="responsavel"> </a> </td> </tr>
   </table>
   <table width="600" height="520" border="1" align="center" bordercolor="#006666" bgcolor="#FFFFFF">
    <tr>
     <td align="center" valign="middle">
      <table width="555" height="480" border="0">
       <tr>
        <td width="95%" height="20%" colspan="2" valign="top" class="academia-titulo">
         <div align="left"> <xsl:value-of select="responsavel/@descricao"/> </div>
        </td>
       </tr>
       <tr>
        <td colspan="2" align="center" valign="middle">
		 <table width="100%" height="85%" border="0" class="academia">
           <tr>
             <td width="50%" align="center" valign="bottom"> 
              <b> <xsl:value-of select="responsavel/academico01/primeiro-nome"/>
              <xsl:value-of select="responsavel/academico01/sobre-nome"/> </b> <br/>
              <i> <xsl:value-of select="responsavel/academico01/email"/> </i> <br/>
              <i> <xsl:value-of select="responsavel/academico01/fone"/> </i>
             </td>
             <td width="50%" align="center" valign="bottom"> 
              <b> <xsl:value-of select="responsavel/academico02/primeiro-nome"/>
              <xsl:value-of select="responsavel/academico02/sobre-nome"/> </b> <br/>
              <i> <xsl:value-of select="responsavel/academico02/email"/> </i> <br/>
              <i> <xsl:value-of select="responsavel/academico02/fone"/> </i>
             </td>
           </tr>
           <tr>
             <td width="50%" align="center" valign="bottom"> 
              <b> <xsl:value-of select="responsavel/orientador/primeiro-nome"/> <br/>
              <xsl:value-of select="responsavel/orientador/sobre-nome"/> </b> <br/>
              <i> <xsl:value-of select="responsavel/orientador/email"/> </i> <br/>
              (<xsl:value-of select="responsavel/orientador/@descricao"/>)
             </td>
             <td width="50%" align="center" valign="bottom"> 
              <b> <xsl:value-of select="responsavel/cliente/responsavel"/> </b>
              <i> <xsl:value-of select="responsavel/cliente/email"/> </i> <br/>
              (<xsl:value-of select="responsavel/cliente/responsavel/@orientacao"/>)
             </td>
           </tr>
         </table>
        </td>
       </tr>
      </table>
     </td>
    </tr>
   </table>
<!-- RODAPÉ -->
   <table width="600" height="40" border="0" align="center">
    <tr> 
     <td width="80%" align="center" valign="middle" class="sitas">
      <xsl:value-of select="@url"/>
     </td>
     <td width="20%" align="right" valign="bottom" class="assinatura2"> por 
      <a class="autores" href="mailto:alexvan@brturbo.com">
       <xsl:value-of select="responsavel/academico01/assinatura"/>
      </a> <br/> e 
      <a class="autores" href="mailto:projetositas@uol.com.br"> 
       <xsl:value-of select="responsavel/academico02/assinatura"/>
      </a> <br/> em 17/06/2004
     </td>
    </tr>
   </table>
  </body>
 </xsl:template>
</xsl:stylesheet>
