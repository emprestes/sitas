/*
 * ServAmostra.java
 *
 * Created on 16 de Setembro de 2004, 20:32
 */

package com.sitas.servlets;

import com.sitas.beans.BeanElaborarTesteTri;
import com.sitas.persistencia.PerElaborarTeste;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author  alex
 * @version
 */
public class ServAmostra extends HttpServlet {
    
    /** Initializes the servlet.
     */
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        
    }
    
    /** Destroys the servlet.
     */
    public void destroy() {
        
    }
    private ArrayList getAmostras( int cod_produto ){
        PerElaborarTeste persiste = PerElaborarTeste.getPerElaborarTeste();
        ArrayList amostras = persiste.getAmostras( cod_produto );
        
        return amostras;
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
        //processRequest(request, response);
        
        HttpSession sessao = request.getSession( false ); 
        if( sessao == null )
            request.getRequestDispatcher( "../jsp/sitas-login.jsp" ).forward( request, response );
        else{
  //          if( sessao.getAttribute( "beanElaborarTesteTri" ) != null )
  //               AtribValores.getAtribValores().setValores( request, response );
 //          else{
 //               request.getRequestDispatcher( "../servlet/ServObjetivo" ).forward( request, response );
 //           }
            request.getRequestDispatcher( "../jsp/sitas-teste.triangular.amostra" ).forward( request, response );
        }
    }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //processRequest(request, response);
        HttpSession sessao = request.getSession( false ); 
        if( sessao == null )
            request.getRequestDispatcher( "../jsp/sitas-login.jsp" ).forward( request, response );
        else{
 /*           if( sessao.getAttribute( "beanElaborarTesteTri" ) != null )
                AtribValores.getAtribValores().setValores( request, response );
            else{
                request.getRequestDispatcher( "../servlet/ServObjetivo" ).forward( request, response );
            } 
 */           if( sessao.getAttribute( "amostras") != null )
                    sessao.removeAttribute( "amostras" );
            BeanElaborarTesteTri bean =  (BeanElaborarTesteTri) sessao.getAttribute("beanElaborarTesteTri");
            ArrayList amostras = this.getAmostras( bean.getProduto() );
            sessao.setAttribute( "amostras", amostras );
            request.getRequestDispatcher( "../jsp/sitas-teste.triangular.amostra.jsp" ).forward( request, response );
        }
    }
    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    
}
