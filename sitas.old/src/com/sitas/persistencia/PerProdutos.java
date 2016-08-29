/*
 * PerProdutos.java
 *
 * Created on 22 de Setembro de 2004, 18:30
 */
package com.sitas.persistencia;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.*;

import com.sitas.beans.*;

public class PerProdutos implements Serializable {
    private Connection connection;
    private Statement sqlSelectProduto;

    public PerProdutos( ) {
        try {
            InitialContext ic = new InitialContext( );
            
            DataSource source = ( DataSource ) ic.lookup( 
              "java:comp/env/jdbc/sitas" );
            
            connection = source.getConnection( );
            sqlSelectProduto = connection.createStatement( );
        }
        catch( SQLException sqlException ) {
            sqlException.printStackTrace( );
        }
        catch( NamingException namingException ) {
            namingException.printStackTrace( );
        }
    }

    protected void finalize( ) {
        try {
            connection.close( );
        }
        catch( SQLException sqlexception ) {
            sqlexception.printStackTrace( );
        }
    }

    public List getProdutos( ) {
        List produtosList = new ArrayList( );

        try {
            ResultSet resultado = sqlSelectProduto.executeQuery( 
              "SELECT cod_produto, nome, ativo " +
              "  FROM produto " +
              " WHERE ativo=true " +
              " ORDER BY nome;" );

            while( resultado.next( ) ) {
                BeanProduto produto = new BeanProduto( );

                produto.setCodigo( resultado.getInt( "cod_produto" ) );
                produto.setNome( resultado.getString( "nome" ) );
                produto.setAtivo( resultado.getBoolean( "ativo" ) );

                produtosList.add( produto );
            }
        }
        catch( SQLException exception ) {
            exception.printStackTrace( );
        }

        return produtosList;
    }

    public boolean gravarProduto( BeanProduto novoProduto ) 
     throws Exception {
         int resultado = 0;
         PreparedStatement sqlInsertProduto;

         sqlInsertProduto = connection.prepareStatement( 
          "INSERT INTO produto( nome, ativo ) " +
              " VALUES( ?, true );" );

         sqlInsertProduto.setString( 01, novoProduto.getNome( ) );
         resultado = sqlInsertProduto.executeUpdate( );

         if( resultado == 0 ) {
             connection.rollback( );
             return false;
         }

         connection.commit( );
         return true;
    }

    public int buscarProduto( BeanProduto nomeProduto ) {
         String query =
          "SELECT cod_produto " +
           " FROM produto " +
          " WHERE nome='" + nomeProduto.getNome( ) + "';";

         try {
            ResultSet resultado = sqlSelectProduto.executeQuery( query );
            if( resultado.next( ) ) {
                return resultado.getInt( "cod_produto" );
            }
         }
         catch( SQLException exception ) {
             exception.printStackTrace( );
         }
         return 0;
    }

    public boolean apagarProduto( int codigo ) 
     throws Exception {
         int resultado = 0;
         PreparedStatement sqlDeleteProduto;

         sqlDeleteProduto = connection.prepareStatement( 
          "UPDATE produto SET ativo=false " +
          " WHERE cod_produto=" + codigo + ";" );

         resultado = sqlDeleteProduto.executeUpdate( );

         if( resultado == 0 ) {
             connection.rollback( );
             return false;
         }

         connection.commit( );
         return true;
    }

    public boolean ativarProduto( String nomeProduto ) 
     throws Exception {
         int resultado = 0;
         PreparedStatement sqlDeleteProduto;

         sqlDeleteProduto = connection.prepareStatement( 
          "UPDATE produto SET ativo=true " +
          " WHERE nome='" + nomeProduto + "';" );

         resultado = sqlDeleteProduto.executeUpdate( );

         if( resultado == 0 ) {
             connection.rollback( );
             return false;
         }

         connection.commit( );
         return true;
    }
}
