package com.sitas.servlets;

import java.io.*;
import java.net.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.sitas.beans.*;
import com.sitas.persistencia.*;

public class ServGerenteClientes extends HttpServlet {
    private HttpSession session;
    private RequestDispatcher dispatcher;
    private int pagina;
    private PerClientes sgbd;

    public void init( ServletConfig config ) 
     throws ServletException {
        super.init( config );
        sgbd = new PerClientes( );
    }
    
    public void destroy( ) {
        
    }

    protected void processRequest( HttpServletRequest request, 
     HttpServletResponse response)
     throws ServletException, IOException {
        session = request.getSession( false );
        dispatcher = request.getRequestDispatcher( "../jsp/sitas-login.jsp" );

        if( session == null ) 
            dispatcher.forward( request, response );

        String campo = "";
        List auxiliarList = null;
        pagina = Integer.parseInt( request.getParameter( "gerente" ) );
        try {
            switch( pagina ) {
                case 1: session.removeAttribute( "gccidades" );
                        auxiliarList = sgbd.getCidades( );
                        session.setAttribute( "gccidades", auxiliarList );
                        session.removeAttribute( "gcufs" );
                        auxiliarList = sgbd.getUFs( );
                        session.setAttribute( "gcufs", auxiliarList );
                 break;
                case 2: 
                case 3: 
                 break;
                case 4: session.removeAttribute( "gclientes" );
                        auxiliarList = sgbd.getClientes( );
                        session.setAttribute( "gclientes", auxiliarList );
                 break;
                case 5: session.removeAttribute( "gclientes" );
                        BeanPessoa pessoaNova = new BeanPessoa( );
                        campo = request.getParameter( "clienteNome" );
                        pessoaNova.setNome( campo );
                        campo = request.getParameter( "clienteRua" );
                        pessoaNova.setRua( campo );
                        campo = request.getParameter( "clienteNumero" );
                        pessoaNova.setNumero( Integer.parseInt( campo ) );
                        campo = request.getParameter( "clienteBairro" );
                        pessoaNova.setBairro( campo );
                        campo = request.getParameter( "clienteCEP" );
                        pessoaNova.setCEP( Integer.parseInt( campo ) );
                        campo = request.getParameter( "clienteUF" );
                        pessoaNova.setCodigoUF( Integer.parseInt( campo ) );
                        campo = request.getParameter( "clienteCidade" );
                        int resultado = sgbd.gravarCidade( campo, pessoaNova.getCodigoUF( ) );
                        pessoaNova.setCodigoCidade( resultado );
                        campo = request.getParameter( "clienteContato" );
                        pessoaNova.setEMAIL( campo );
                        BeanCliente clienteNovo = new BeanCliente( );
                        campo = request.getParameter( "clienteRamo" );
                        clienteNovo.setRamo( campo );
                        clienteNovo.setPessoa( pessoaNova );
                        resultado = sgbd.buscarCliente( clienteNovo );
                        if( resultado == 0 ) {
                            sgbd.gravarCliente( clienteNovo );
                        } else {
                            clienteNovo.setCodigo( resultado );
                            sgbd.ativarCliente( clienteNovo );
                        }                        
                        auxiliarList = sgbd.getClientes( );
                        session.setAttribute( "gclientes", auxiliarList );
                 break;
                case 7: auxiliarList = ( List ) session.getAttribute( "gclientes" );
                        session.removeAttribute( "gclientes" );
                        int total = auxiliarList.size( );
                        for( int contador = 1; contador <= total; contador++ ) {
                          campo = request.getParameter( "cliente" + contador );
                          if( campo != null ) {
                            sgbd.apagarCliente( Integer.parseInt( campo ) );
                          }
                        }
                        auxiliarList = sgbd.getClientes( );
                        session.setAttribute( "gclientes", auxiliarList );
                break;
            }

            response.sendRedirect( "../jsp/sitas-clientes.jsp?gerente=" + 
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