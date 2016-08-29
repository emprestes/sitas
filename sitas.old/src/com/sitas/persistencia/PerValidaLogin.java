/*
 * PerValidaLogin.java
 *
 * Created on 11 de Setembro de 2004, 11:23
 */

package com.sitas.persistencia;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import com.sitas.beans.*;

/**
 *
 * @author  alex
 */
public class PerValidaLogin extends Persistencia{
    private Statement statement;
    private ResultSet resultset;
    private static PerValidaLogin persiste;
    
    /** Creates a new instance of PerValidaLogin */
    public PerValidaLogin(){
        super();
    }
    
    public static synchronized PerValidaLogin getPerValidaLogin(){
        if ( persiste == null )
            persiste =  new PerValidaLogin();
        
        return persiste;
    }
    
    public int nivelAcessoUsuario( String login, String senha ){
        
        String query1 = "SELECT get_nivel_acesso('" + login + "','" + senha + "');";
        try{            
            int acesso;
            statement = connect.createStatement();
            resultset = statement.executeQuery( query1 );
            
            if( resultset.next() ){
                acesso = resultset.getInt(1);
                return acesso;
            }
            
            if ( statement != null ){
                statement.close();
            }
            if ( resultset != null ){
                resultset.close();
            }
        }
        catch(SQLException sqlexp){
            sqlexp.printStackTrace();
        }
        return -1;
    }
    
    public BeanJulgador getBeanJulgador( String login, String senha ){
        BeanJulgador julgador = new BeanJulgador();
        String query = "SELECT * FROM pessoa, pessoajulgador " + 
                       "WHERE pessoa.ativo = TRUE AND " + 
                       "pessoa.cod_pessoa = pessoajulgador.cod_pessoa_julgador AND " + 
                       "pessoajulgador.login = '" + login + "' AND " + 
                       "pessoajulgador.senha = '" + senha + "';";
        
        try{
            statement = connect.createStatement();
            resultset = statement.executeQuery( query );
            
                
            if(resultset.next()){
                julgador.setCodPessoa( resultset.getInt( 1 ) );
                julgador.setNome( resultset.getString( 2 ) );
                julgador.setRua( resultset.getString( 3 ) );
                julgador.setNumero( resultset.getInt( 4 ) );
                julgador.setBairro( resultset.getString( 5 ) );
                julgador.setCep( resultset.getInt( 6 ) );
                julgador.setEmail( resultset.getString( 7 ) );
                julgador.setCodCidade( resultset.getInt( 8 ) );
                julgador.setCodUf( resultset.getInt( 9 ) );
                julgador.setDataNascimento(  resultset.getDate( 12 ) );
                julgador.setCodCivil( resultset.getInt( 13 ) );
                julgador.setSexo( resultset.getString( 14 ) );
                julgador.setLogin( resultset.getString( 15 ) );
                julgador.setSenha( resultset.getString( 16 ) );
                julgador.setIsCoordenador( resultset.getBoolean( 17 ) );
                julgador.setFaixaSalarial( resultset.getString( 18 ) );
            }
                
            if ( statement != null ){
                statement.close();
            }
            if ( resultset != null ){
                resultset.close();
            }
        }
        catch( SQLException sqlexp ){
            sqlexp.printStackTrace();
        }
     
        return julgador;
    }
    
}
