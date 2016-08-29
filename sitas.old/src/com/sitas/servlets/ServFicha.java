/*
 * FichaElaborar.java
 *
 * Created on 22 de Setembro de 2004, 21:46
 */

package com.sitas.servlets;

import java.io.*;
import java.net.*;
import java.sql.*;
import javax.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.sitas.beans.*;
import com.sitas.persistencia.*;

import javax.swing.JOptionPane;




/**
 *
 * @author  alex
 * @version
 */
public class ServFicha extends HttpServlet {
    
    /** Initializes the servlet.
     */
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        
    }
    
    /** Destroys the servlet.
     */
    public void destroy() {
        
    }
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        /* TODO output your page here
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet</title>");
        out.println("</head>");
        out.println("<body>");
         
        out.println("</body>");
        out.println("</html>");
         */
        out.close();
    }
    
    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       // processRequest(request, response);
 /*       HttpSession sessao = request.getSession( false ); 
        if( sessao == null )
            request.getRequestDispatcher( "../jsp/sitas-login.jsp" ).forward( request, response );
        else{
            if( request.getParameter( "sucesso" ) != null ){
                        if( sessao.getAttribute( "beanElaborarTesteTri" ) != null )
                            sessao.removeAttribute("beanElaborarTesteTri");
                        request.getRequestDispatcher("../servlet/ServPreviaSitas" ).forward( request, response );
            }
            if( sessao.getAttribute( "beanElaborarTesteTri" ) != null ){
                AtribValores.getAtribValores().setValores( request, response );
                request.getRequestDispatcher( "../jsp/sitas-teste.triangular.ficha.jsp" ).forward( request, response );
           }
            
        }
  */  }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //processRequest(request, response);
  /*      HttpSession sessao = request.getSession( false ); 
        if( sessao == null )
            request.getRequestDispatcher( "../jsp/sitas-login.jsp" ).forward( request, response );
        else{
            if( sessao.getAttribute( "beanElaborarTesteTri" ) != null ){
                AtribValores.getAtribValores().setValores( request, response );
                if( request.getParameter("concluir") != null ){
                    if( Integer.parseInt( request.getParameter("concluir") ) == 1 ){
                        BeanElaborarTesteTri beanElaborar = (BeanElaborarTesteTri) sessao.getAttribute("beanElaborarTesteTri");
                        if( beanElaborar.getConfigAmostras() == false ){
                            request.getRequestDispatcher( "../servlet/ServAmostra" ).forward( request, response );
                        }
                        else{
                            if( beanElaborar.getJulgadoresEscolhidos().size() == 0 ){
                                request.getRequestDispatcher( "../servlet/ServJulgador" ).forward( request, response );
                            }
                            else{                                
                                PerElaborarTeste persiste = PerElaborarTeste.getPerElaborarTeste();
                                long c_teste = persiste.adicionarNovoTesteTri(beanElaborar);
                                Long CodTeste = new Long( c_teste );
                                sessao.setAttribute( "cod_teste", CodTeste );
                                if( sessao.getAttribute( "beanElaborarTesteTri" ) != null )
                                    sessao.removeAttribute("beanElaborarTesteTri");
                                request.getRequestDispatcher( "../jsp/sitas-teste.elaborado.sucesso.jsp" ).forward( request, response );
                            }                            
                        }
                    }
                    
                }
                if( request.getParameter("continuar") != null ){
                        if( Integer.parseInt( request.getParameter("continuar") ) == 1 )
                            request.getRequestDispatcher( "../jsp/sitas-teste.triangular.ficha.jsp" ).forward( request, response );
                    }
                if( request.getParameter("visualizar") != null ){
                        if( Integer.parseInt( request.getParameter("visualizar") ) == 1 )
                            request.getRequestDispatcher( "../jsp/sitas-teste.triangular.visualizar.jsp" ).forward( request, response );
                    }
                
            }
            else{
                request.getRequestDispatcher( "../servlet/ServObjetivo" ).forward( request, response );
            }
         }
   */ }
    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    
}
