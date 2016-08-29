/*
 * Persistencia.java
 *
 * Created on 11 de Setembro de 2004, 11:27
 */

package com.sitas.persistencia;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


/**
 *
 * @author  alex
 */
public abstract class Persistencia {
    protected Connection connect;
    private final static String JNDI_NAME = "java:/comp/env/jdbc/sitas";
    private InitialContext ic = null;
    private DataSource ds = null;
    
    /** Creates a new instance of Persistencia */
    public Persistencia() {
        try {
            
            ic = new InitialContext();
            ds = (DataSource) ic.lookup(JNDI_NAME);
            connect = ds.getConnection();                           
        }
        catch (NamingException e) {
            //TODO: Use um sistema de log adequado
            e.printStackTrace();
        }
        catch (SQLException e) {
            //TODO: Use um sistema de log adequado
            e.printStackTrace();
        }       
    }
    
    protected void finalize(){
        try{
            connect.close();
        }
        catch(SQLException sqlexp){
            sqlexp.printStackTrace();
        }
    }    
}
