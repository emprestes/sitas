package com.sitas.persistencia;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.*;

import com.sitas.beans.*;

public class PerAmostras implements Serializable {
    private Connection connection;
    private Statement sqlSelectAmostra;

    public PerAmostras( ) {
        try {
            InitialContext ic = new InitialContext( );
            
            DataSource source = ( DataSource ) ic.lookup( 
              "java:comp/env/jdbc/sitas" );
            
            connection = source.getConnection( );
            sqlSelectAmostra = connection.createStatement( );
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

    public List getAmostras( ) {
        List amostrasList = new ArrayList( );

        try {
            ResultSet resultado = sqlSelectAmostra.executeQuery( 
              "SELECT a.cod_amostra, a.nome AS amostra, " +
              "       p.cod_produto, p.nome AS produto " +
              "  FROM amostra AS a, produto AS p " +
              " WHERE a.cod_produto=p.cod_produto " +
              "   AND p.ativo=true " +
              "   AND a.ativo=true " +
              " ORDER BY produto, amostra;" );

            while( resultado.next( ) ) {
                BeanAmostra amostra = new BeanAmostra( );
                BeanProduto produto = new BeanProduto( );

                amostra.setCodigo( resultado.getInt( "cod_amostra" ) );
                amostra.setNome( resultado.getString( "amostra" ) );
                amostra.setAtivo( true );
                produto.setCodigo( resultado.getInt( "cod_produto" ) );
                produto.setNome( resultado.getString( "produto" ) );
                produto.setAtivo( true );
                amostra.setProduto( produto );

                amostrasList.add( amostra );
            }
        }
        catch( SQLException exception ) {
            exception.printStackTrace( );
        }

        return amostrasList;
    }

    public boolean gravarAmostra( BeanAmostra novaAmostra ) 
     throws Exception {
         int resultado = 0;
         PreparedStatement sqlInsertAmostra;

         sqlInsertAmostra = connection.prepareStatement( 
          "INSERT INTO produto( nome, ativo ) " +
              " VALUES( ?, true );" );

         sqlInsertAmostra.setString( 01, novaAmostra.getNome( ) );
         resultado = sqlInsertAmostra.executeUpdate( );

         if( resultado == 0 ) {
             connection.rollback( );
             return false;
         }

         connection.commit( );
         return true;
    }

    public int buscarAmostra( BeanAmostra nomeAmostra ) {
         String query =
          "SELECT cod_produto " +
           " FROM produto " +
          " WHERE nome='" + nomeAmostra.getNome( ) + "';";

         try {
            ResultSet resultado = sqlSelectAmostra.executeQuery( query );
            if( resultado.next( ) ) {
                return resultado.getInt( "cod_produto" );
            }
         }
         catch( SQLException exception ) {
             exception.printStackTrace( );
         }
         return 0;
    }

    public boolean apagarAsmotra( int codigo ) 
     throws Exception {
         int resultado = 0;
         PreparedStatement sqlDeleteAmostra;

         sqlDeleteAmostra = connection.prepareStatement( 
          "UPDATE produto SET ativo=false " +
          " WHERE cod_produto=" + codigo + ";" );

         resultado = sqlDeleteAmostra.executeUpdate( );

         if( resultado == 0 ) {
             connection.rollback( );
             return false;
         }

         connection.commit( );
         return true;
    }

    public boolean ativarAmostra( String nomeAmostra ) 
     throws Exception {
         int resultado = 0;
         PreparedStatement sqlDeleteAmostra;

         sqlDeleteAmostra = connection.prepareStatement( 
          "UPDATE produto SET ativo=true " +
          " WHERE nome='" + nomeAmostra + "';" );

         resultado = sqlDeleteAmostra.executeUpdate( );

         if( resultado == 0 ) {
             connection.rollback( );
             return false;
         }

         connection.commit( );
         return true;
    }
}