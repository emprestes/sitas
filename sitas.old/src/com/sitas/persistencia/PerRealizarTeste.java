/*
 * PerRealizarTeste.java
 *
 * Created on 28 de Setembro de 2004, 02:16
 */

package com.sitas.persistencia;

import java.util.*;
import java.sql.*;
import javax.sql.*;
import com.sitas.beans.*;

/**
 *
 * @author  alex
 */
public class PerRealizarTeste extends Persistencia{
    private Statement statement;
    private ResultSet resultset;
    private static PerRealizarTeste persiste;
    
    /** Creates a new instance of PerRealizarTeste */
    public PerRealizarTeste() {
        super();
    }
    
    public static PerRealizarTeste getPerRealizarTeste(){
        if( persiste == null )
            persiste = new PerRealizarTeste();
        
        return persiste;
    }
    
    public ArrayList getTestes( BeanJulgador julgador ){
        ArrayList testes = new ArrayList();
        BeanTeste teste;
        String query = "SELECT * FROM get_testes(" + julgador.getCodPessoa() + ") AS (c_teste bigint, c_coord int, c_emp int, " +
                       "nome varchar, objetivo text, descricao text, instrucao text, em_aberto boolean, " +
                       "data_criacao date, repeticoes integer, material text, n_coord varchar, cod_prod integer, n_prod varchar );";        
        try{
            statement = connect.createStatement();
            resultset = statement.executeQuery( query );
            
            while( resultset.next() ){
                teste = new BeanTeste();
                
                teste.setCodTeste( resultset.getLong( 1 ) );
                teste.setCodCoordenador( resultset.getInt( 2 ) );
                teste.setCodEmpresa( resultset.getInt( 3 ) );
                teste.setNome( resultset.getString( 4 ) );
                teste.setObjetivo( resultset.getString( 5 ) );
                teste.setDescricao( resultset.getString( 6 ) );
                teste.setInstrucao( resultset.getString( 7 ) );
                teste.setIsAberto( resultset.getBoolean( 8 ) );
                teste.setDataCriacao( resultset.getDate( 9 ) );
                teste.setRepeticoes( resultset.getInt( 10 ) );
                teste.setDescMaterial( resultset.getString( 11 ) );
                teste.setNomeCoordenador( resultset.getString( 12 ) );
                teste.setCodProduto( resultset.getInt( 13 ) );
                teste.setNomeProduto( resultset.getString( 14 ) );
                
                testes.add( teste );
            }
            
            
            if ( statement != null )
                statement.close();
            
            if ( resultset != null )
                resultset.close();            
           
        }
        catch( SQLException sqlexp ){
            sqlexp.printStackTrace();
        }
        
        return testes;
    }
    
    public ArrayList getGabaritos( BeanJulgador julgador, BeanTeste teste ){
        ArrayList gabaritos = new ArrayList();
        BeanGabaritoTri gabarito;
        String query = "SELECT * FROM get_gabaritos( " + julgador.getCodPessoa() + ", "
                        + teste.getCodTeste() + " ) as " + 
                       "( c_gab bigint, c_teste bigint, c_jul integer, " +
                       "n1 integer, n2 integer, n3 integer, " +
                       "a1 integer, a2 integer, a3 integer );";
        try{
            statement = connect.createStatement();
            resultset = statement.executeQuery( query );
            
            while( resultset.next() ){
                gabarito = new BeanGabaritoTri();
                
                gabarito.setCodGabaritoTri( resultset.getLong( 1 ) );
                gabarito.setCodTeste( resultset.getLong( 2 ) );
                gabarito.setCodJulgador( resultset.getInt( 3 ) );
                gabarito.setNumero1( resultset.getInt( 4 ) );
                gabarito.setNumero2( resultset.getInt( 5 ) );
                gabarito.setNumero3( resultset.getInt( 6 ) );
                gabarito.setAmostra1( resultset.getInt( 7 ) );
                gabarito.setAmostra2( resultset.getInt( 8 ) );
                gabarito.setAmostra3( resultset.getInt( 9 ) );
                
                gabaritos.add( gabarito );                
            }
            
            if ( statement != null )
                statement.close();
            
            if ( resultset != null )
                resultset.close();
        }
        catch( SQLException sqlexp ){
            sqlexp.printStackTrace();
        }
        return gabaritos;
    }
    public Integer getNumeroTestes( BeanJulgador julgador ){
        Integer numero  = null;
        int num = 0;
        String query = "SELECT count(teste.cod_teste) " +
                       "FROM teste " + 
                       "WHERE teste.cod_teste = selecionado.cod_teste " +
                       "AND  selecionado.cod_pessoa_julgador = " + julgador.getCodPessoa() + " " +
                       "AND  teste.em_aberto = true " +
                       "AND  selecionado.ativo = TRUE; ";
        try{
            statement = connect.createStatement();
            resultset = statement.executeQuery( query );
            
            if( resultset.next() ){
                num = resultset.getInt( 1 );
            }
            
            numero = new Integer( num ) ;
            
            if ( statement != null )
                statement.close();
            
            if ( resultset != null )
                resultset.close();
        }
        catch( SQLException sqlexp ){
            sqlexp.printStackTrace();
        }
        return numero;
    }
    
    public void responderTesteTri( long c_gabarito, long c_teste, int c_amostra, String coment ){
        String query;
       
        if( coment == null ){
            query = "INSERT INTO resptriangular( cod_gabarito_tri, cod_teste, cod_amostra, comentario, " + 
                        "data_realizacao ) VALUES( " + c_gabarito + ", " + c_teste + ", " + c_amostra + ", " + "DEFAULT, DEFAULT );";
        }
        else{
            query = "INSERT INTO resptriangular( cod_gabarito_tri, cod_teste, cod_amostra, comentario, " + 
                        "data_realizacao ) VALUES( " + c_gabarito + ", " + c_teste + ", " + c_amostra + ", '" + coment + "', DEFAULT );";
        }
        
        try{
            statement = connect.createStatement();
            statement.executeQuery( query );
            
            if ( statement != null )
                statement.close();
            
        }
        catch( SQLException sqlexp ){
            sqlexp.printStackTrace();
        }
    }
    
}
