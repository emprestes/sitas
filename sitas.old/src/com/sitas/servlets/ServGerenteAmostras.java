package com.sitas.servlets;

import java.io.*;
import java.net.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.sitas.beans.*;
import com.sitas.persistencia.*;

public class ServGerenteAmostras extends HttpServlet {
    private HttpSession session;
    private RequestDispatcher dispatcher;
    private int pagina;
    private PerAmostras sgbd;

    /** Initializes the servlet.
     */
    public void init( ServletConfig config ) 
     throws ServletException {
        super.init( config );
        sgbd = new PerAmostras( );
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
                case 4: session.removeAttribute( "gamostras" );
                        auxiliarList = sgbd.getAmostras( );
                        session.setAttribute( "gamostras", auxiliarList );
                break;
                case 5: session.removeAttribute( "gamostras" );
                        BeanAmostra amostraNova = new BeanAmostra( );
                        String campo = request.getParameter( "novaAmostra" );
                        amostraNova.setNome( campo );
                        amostraNova.setCodigo( sgbd.buscarAmostra( amostraNova ) );

                        if( amostraNova.getCodigo( ) == 0 ) {
                            if( sgbd.gravarAmostra( amostraNova ) ) {
                                auxiliarList = sgbd.getAmostras( );
                                session.setAttribute( "gamostras", auxiliarList );
                            }
                        } else {
                            if( sgbd.ativarAmostra( campo ) ) {
                                auxiliarList = sgbd.getAmostras( );
                                session.setAttribute( "gamostras", auxiliarList );
                            }
                        }
                break;
                case 7: /*auxiliarList = ( List ) session.getAttribute( "gamostras" );
                        int total = auxiliarList.size( );
                        for( int contador = 1; contador <= total; contador++ ) {
                          campo = request.getParameter( "campo" + contador );
                          if( campo != null ) {
                            if( sgbd.apagarAmostra( Integer.parseInt( campo ) ) ) {
                                session.removeAttribute( "gamostras" );
                                auxiliarList = sgbd.getAmostras( );
                                session.setAttribute( "gamostras", auxiliarList );
                            }
                          }
                        }*/
                break;
            }

            response.sendRedirect( "../jsp/sitas-amostras.jsp?gerente=" + 
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
