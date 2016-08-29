package com.sitas.persistencia;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.*;

import com.sitas.beans.*;

public class PerClientes implements Serializable {
    private Connection connection;
    private Statement sqlSelectCliente;

    public PerClientes( ) {
        try {
            InitialContext ic = new InitialContext( );
            
            DataSource source = ( DataSource ) ic.lookup( 
              "java:comp/env/jdbc/sitas" );
            
            connection = source.getConnection( );
            sqlSelectCliente = connection.createStatement( );
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

    /* OK. (getClientes) */
    public List getClientes( ) {
        List clientesList = new ArrayList( );

        try {
            ResultSet resultado = sqlSelectCliente.executeQuery( 
              "SELECT p.cod_pessoa, p.nome AS CLIENTE, p.rua, p.numero, " +
                    " p.bairro, p.cep, p.email, p.ativo, " +
                    " pc.ramo, c.nome AS CIDADE, uf.nome AS UF " +
               " FROM pessoa p, pessoaempresa pc, cidade c, uf " +
              " WHERE p.cod_pessoa=pc.cod_pessoa_empresa " +
                " AND p.cod_cidade=c.cod_cidade " +
                " AND c.cod_uf=uf.cod_uf " +
                " AND p.ativo=true " +
              " ORDER BY p.nome;" );

            while( resultado.next( ) ) {
                BeanCliente cliente = new BeanCliente( );
                BeanPessoa pessoa = new BeanPessoa( );

                pessoa.setCodigo( resultado.getInt( "cod_pessoa" ) );
                pessoa.setNome( resultado.getString( "cliente" ) );
                pessoa.setRua( resultado.getString( "rua" ) );
                pessoa.setNumero( resultado.getInt( "numero" ) );
                pessoa.setBairro( resultado.getString( "bairro" ) );
                pessoa.setCEP( resultado.getInt( "cep" ) );
                pessoa.setCidade( resultado.getString( "cidade" ) );
                pessoa.setUF( resultado.getString( "uf" ) );
                pessoa.setEMAIL( resultado.getString( "email" ) );
                cliente.setCodigo( pessoa.getCodigo( ) );
                cliente.setRamo( resultado.getString( "ramo" ) );
                cliente.setPessoa( pessoa );

                pessoa.setAtivo( resultado.getBoolean( "ativo" ) );

                clientesList.add( cliente );
            }
        }
        catch( SQLException exception ) {
            exception.printStackTrace( );
        }

        return clientesList;
    }

    /* ok (gravarCliente). */
    public void gravarCliente( BeanCliente novoCliente ) 
     throws Exception {
         int resultado = 0;
         PreparedStatement sqlInsertCliente;
         BeanPessoa pessoa = novoCliente.getPessoa( );

         String query = "INSERT INTO pessoa " +
          " ( nome, rua, numero, bairro, cep, email, cod_cidade ) " +
          " VALUES( '" + pessoa.getNome( ) + "', '" + pessoa.getRua( ) + "',  " +
          pessoa.getNumero( ) + ", '" + pessoa.getBairro( ) + "', " +
          pessoa.getCEP( ) + ", '" + pessoa.getEMAIL( ) + "', " +
          pessoa.getCodigoCidade( ) + " );";

         sqlInsertCliente = connection.prepareStatement( query );
         resultado = sqlInsertCliente.executeUpdate( );

         if( resultado == 0 ) {
             connection.rollback( );
         }

         connection.commit( );

         query = "SELECT p.cod_pessoa " +
          "  FROM pessoa p " +
          " WHERE NOT EXISTS ( SELECT pj.cod_pessoa_julgador " +
          "      FROM pessoajulgador AS pj " +
          "     WHERE pj.cod_pessoa_julgador=p.cod_pessoa ) " +
          "   AND NOT EXISTS ( SELECT pe.cod_pessoa_empresa " +
          "      FROM pessoaempresa AS pe " +
          "     WHERE pe.cod_pessoa_empresa=p.cod_pessoa );";
         ResultSet consulta = sqlSelectCliente.executeQuery( query );
         if( consulta.next( ) ) {
             resultado = consulta.getInt( "cod_pessoa" );
         }

         query = "INSERT INTO pessoaempresa " +
          " ( cod_pessoa_empresa, ramo ) " +
          " VALUES( " + resultado + ", '" + novoCliente.getRamo( ) + "' );";

         sqlInsertCliente = connection.prepareStatement( query );
         resultado = sqlInsertCliente.executeUpdate( );

         if( resultado == 0 ) {
             connection.rollback( );
         }

         connection.commit( );
    }

    public int buscarCliente( BeanCliente Cliente ) {
        BeanPessoa pessoa = Cliente.getPessoa( );
        String query = "SELECT cod_pessoa " +
         " FROM pessoa p, pessoaempresa pe " +
         " WHERE p.cod_pessoa=pe.cod_pessoa_empresa " +
         "   AND p.nome='" + pessoa.getNome( ) + "' " +
         "   AND pe.ramo='" + Cliente.getRamo( ) + "';";

        try {
            ResultSet resultado = sqlSelectCliente.executeQuery( query );
            if( resultado.next( ) ) {
                return resultado.getInt( "cod_pessoa" );
            }
        }
        catch( SQLException exception ) {
            exception.printStackTrace( );
        }
        return 0;
    }

    /* ok (apagraCliente). */
    public void apagarCliente( int codigo ) 
     throws Exception {
         int resultado = 0;
         PreparedStatement sqlDeleteCliente;

         sqlDeleteCliente = connection.prepareStatement( 
          "UPDATE pessoa SET ativo=false " +
          " WHERE cod_pessoa=" + codigo + ";" );

         resultado = sqlDeleteCliente.executeUpdate( );

         if( resultado == 0 ) {
             connection.rollback( );
         }

         connection.commit( );
    }

    public void ativarCliente( BeanCliente Cliente ) 
     throws Exception {
         BeanPessoa pessoa = Cliente.getPessoa( );
         int resultado = 0;
         PreparedStatement sqlDeleteCliente;

         String query = 
          "UPDATE pessoa SET nome='" + pessoa.getNome( ) + "', rua='" +
          pessoa.getRua( ) + "', numero=" + pessoa.getNumero( ) + ", bairro='" +
          pessoa.getBairro( ) + "', cep=" + pessoa.getCEP( ) + ", email='" +
          pessoa.getEMAIL( ) + "', cod_cidade=" + pessoa.getCodigoCidade( ) + 
          ", ativo=true WHERE cod_pessoa=" + Cliente.getCodigo( ) + ";";
         sqlDeleteCliente = connection.prepareStatement( query );

         resultado = sqlDeleteCliente.executeUpdate( );

         if( resultado == 0 ) {
             connection.rollback( );
         }

         connection.commit( );
    }

    /* ok (gravarCidade). */
    public int gravarCidade( String novaCidade, int codigoUF ) 
     throws Exception {
         String query = "SELECT cod_cidade " +
          "  FROM cidade " +
          " WHERE nome='" + novaCidade + "' " +
          "   AND cod_uf=" + codigoUF + " " +
          " ORDER BY cod_cidade DESC;";
         try {
            ResultSet consulta = sqlSelectCliente.executeQuery( query );
            if( consulta.next( ) ) {
                return consulta.getInt( "cod_cidade" );
            }
         }
         catch( SQLException exception ) {
             exception.printStackTrace( );
         }

         int resultado = 0;
         PreparedStatement sqlInsertCliente;
         query = "INSERT INTO cidade ( cod_uf, nome ) " +
          " VALUES( " + codigoUF + ", '" + novaCidade + "' );";

         sqlInsertCliente = connection.prepareStatement( query );

         resultado = sqlInsertCliente.executeUpdate( );

         if( resultado == 0 ) {
             connection.rollback( );
             return 0;
         }

         connection.commit( );

         query = "SELECT MAX( cod_cidade ) AS cod_cidade, nome " +
          " FROM cidade WHERE nome='" + novaCidade + "' GROUP BY nome;";
         try {
            ResultSet consulta = sqlSelectCliente.executeQuery( query );
            if( consulta.next( ) ) {
                int aux = consulta.getInt( "cod_cidade" );
                return aux;
            }
         }
         catch( SQLException exception ) {
             exception.printStackTrace( );
         }
         return 0;
    }

    /* ok (getCidades) */
    public List getCidades( ) 
     throws Exception {
         List cidadesList = new ArrayList( );
         String query =
          "SELECT cod_cidade, nome AS cidade " +
           " FROM cidade " +
          " ORDER BY cidade;";

         try {
             BeanCidade cidade = new BeanCidade( );
             ResultSet resultado = sqlSelectCliente.executeQuery( query );
             while( resultado.next( ) ) {
                 cidade.setCodigo( resultado.getInt( "cod_cidade" ) );
                 cidade.setNome( resultado.getString( "cidade" ) );

                 cidadesList.add( cidade );
             }
         }
         catch( SQLException exception ) {
             exception.printStackTrace( );
         }
         return cidadesList;
    }

    /* ok (getUFs) */
    public List getUFs( ) 
     throws Exception {
         List ufsList = new ArrayList( );
         String query =
          "SELECT cod_uf, nome AS uf " +
           " FROM uf " +
          " ORDER BY uf;";

         try {
             ResultSet resultado = sqlSelectCliente.executeQuery( query );
             while( resultado.next( ) ) {
                 BeanUF uf = new BeanUF( );
                 uf.setCodigo( resultado.getInt( "cod_uf" ) );
                 uf.setNome( resultado.getString( "uf" ) );

                 ufsList.add( uf );
             }
         }
         catch( SQLException exception ) {
             exception.printStackTrace( );
         }
         return ufsList;
    }
}