/*
 * incluirProduto.java
 *
 * Created on 22 de Setembro de 2004, 17:09
 */

package com.sitas.servlets;

import java.io.*;
import java.net.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.sitas.beans.*;
import com.sitas.persistencia.*;

/**
 *
 * @author  empcs99
 * @version
 */
public class ServGerenteProdutos extends HttpServlet {
    private HttpSession session;
    private RequestDispatcher dispatcher;
    private int pagina;
    private PerProdutos sgbd;

    /** Initializes the servlet.
     */
    public void init( ServletConfig config ) 
     throws ServletException {
        super.init( config );
        sgbd = new PerProdutos( );
    }
    
    /** Destroys the servlet.
     */
    public void destroy( ) {
        
    }
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest( HttpServletRequest request, 
     HttpServletResponse response)
     throws ServletException, IOException {
        session = request.getSession( false );
        dispatcher = request.getRequestDispatcher( "../jsp/sitas-login.jsp" );

        if( session == null ) 
            dispatcher.forward( request, response );

        List auxiliarList = null;
        pagina = Integer.parseInt( request.getParameter( "gerente" ) );
        try {
            switch( pagina ) {
                case 1: 
                case 2: 
                case 3: 
                break;
                case 4: session.removeAttribute( "gprodutos" );
                        auxiliarList = sgbd.getProdutos( );
                        session.setAttribute( "gprodutos", auxiliarList );
                break;
                case 5: session.removeAttribute( "gprodutos" );
                        BeanProduto produtoNovo = new BeanProduto( );
                        String campo = request.getParameter( "novoProduto" );
                        produtoNovo.setNome( campo );
                        produtoNovo.setCodigo( sgbd.buscarProduto( produtoNovo ) );

                        if( produtoNovo.getCodigo( ) == 0 ) {
                            if( sgbd.gravarProduto( produtoNovo ) ) {
                                auxiliarList = sgbd.getProdutos( );
                                session.setAttribute( "gprodutos", auxiliarList );
                            }
                        } else {
                            if( sgbd.ativarProduto( campo ) ) {
                                auxiliarList = sgbd.getProdutos( );
                                session.setAttribute( "gprodutos", auxiliarList );
                            }
                        }
                break;
                case 7: auxiliarList = ( List ) session.getAttribute( "gprodutos" );
                        int total = auxiliarList.size( );
                        for( int contador = 1; contador <= total; contador++ ) {
                          campo = request.getParameter( "campo" + contador );
                          if( campo != null ) {
                            if( sgbd.apagarProduto( Integer.parseInt( campo ) ) ) {
                                session.removeAttribute( "gprodutos" );
                                auxiliarList = sgbd.getProdutos( );
                                session.setAttribute( "gprodutos", auxiliarList );
                            }
                          }
                        }
                break;
            }

            response.sendRedirect( "../jsp/sitas-produtos.jsp?gerente=" + 
             String.valueOf( pagina ) ); 
        } catch( Exception exception ) {
            
        }
    }

    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest( request, response );
    }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest( request, response );
    }
    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
}
