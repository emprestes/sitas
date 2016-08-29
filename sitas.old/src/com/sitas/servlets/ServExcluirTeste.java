/*
 * ServExcluir.java
 *
 * Created on 13 de Outubro de 2004, 22:59
 */

package com.sitas.servlets;

import java.io.*;
import java.net.*;
import java.util.*;
import javax.servlet.*;
import com.sitas.beans.*;
import com.sitas.persistencia.*;
import javax.servlet.http.*;

import javax.swing.JOptionPane;

/**
 *
 * @author  alex
 * @version
 */
public class ServExcluirTeste extends HttpServlet {
    
    /** Initializes the servlet.
     */
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        
    }
    
    /** Destroys the servlet.
     */
    public void destroy() {
        
    }
    
   
    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ArrayList testes;
        Integer numero;
        HttpSession sessao = request.getSession( false ); 
        if( sessao == null || sessao.getAttribute( "julgador" ) == null )
            request.getRequestDispatcher( "../jsp/sitas-login.jsp" ).forward( request, response );
        else{
            if( request.getParameter( "sucesso" ) != null ){
                        if( sessao.getAttribute( "excluirTesteBean" ) != null )
                            sessao.removeAttribute("excluirTesteBean");
                        response.sendRedirect("../servlet/ServPreviaSitas" );
            }
            BeanJulgador julgador = (BeanJulgador) sessao.getAttribute( "julgador" );
            testes = PerExcluirTeste.getExcluirTeste().getTestesExcluir( julgador );
            sessao.setAttribute( "testes", testes );           
            request.getRequestDispatcher( "../jsp/sitas-excluir-teste.jsp" ).forward( request, response );
        }
    
    }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ArrayList testes;        
        BeanExcluirTeste excluirTesteBean;        
        HttpSession sessao = request.getSession( false ); 
        if( sessao == null || sessao.getAttribute( "julgador" ) == null )
            request.getRequestDispatcher( "../jsp/sitas-login.jsp" ).forward( request, response );
        else{
            if( request.getParameter("escolheu") != null &&
                sessao.getAttribute("testes") != null ){
                BeanJulgador julgador = (BeanJulgador) sessao.getAttribute("julgador");                
                long cod_teste = Integer.parseInt( request.getParameter("escolheu") );
                Long codTeste = new Long( cod_teste );
                sessao.setAttribute("codTeste", codTeste );
                excluirTesteBean = PerExcluirTeste.getExcluirTeste().getBeanExcluirTeste( cod_teste );
                sessao.setAttribute( "excluirTesteBean", excluirTesteBean );
                
                request.getRequestDispatcher( "../jsp/sitas-teste.triangular.visualizar.exclusao.jsp" ).forward( request, response );
            }
            else{
                if( Integer.parseInt( request.getParameter("excluir") ) == 1 ){
                    int cod_amostra = 0;
                    String coment = null;
                    long cod_teste = 0;
                    Long codTeste;
                    if( sessao.getAttribute("codTeste") != null ){
                        codTeste = (Long) sessao.getAttribute("codTeste");
                        cod_teste = codTeste.longValue();
                    }                   
                    int excl = PerExcluirTeste.getExcluirTeste().excluirTeste( cod_teste );
                    
                    if( excl > 0 ){
                        sessao.removeAttribute("testes");
                        sessao.removeAttribute("testeTri");
                        if( sessao.getAttribute("excluirTesteBean") != null )
                            sessao.removeAttribute("excluirTesteBean");
                    
                        response.sendRedirect( "../jsp/sitas-teste.excluido.sucesso.jsp" );
                    }
                    else{
                        response.sendRedirect( "../jsp/sitas-Erro.jsp" );
                    }             
                        
                }
                else{
                    if( sessao.getAttribute("testes") != null )
                        sessao.removeAttribute("testes");
                    
                                        
                    if( sessao.getAttribute("testeTri") != null )
                        sessao.removeAttribute("testeTri");
                    
                    if( sessao.getAttribute("excluirTesteBean") != null )
                        sessao.removeAttribute("excluirTesteBean");
                    
                    if( sessao.getAttribute("codTeste") != null )
                        sessao.removeAttribute("codTeste");
                                       
                    
                    response.sendRedirect( "../jsp/sitas-login.jsp" );
                }
            }                
        }
    }
    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    
}
