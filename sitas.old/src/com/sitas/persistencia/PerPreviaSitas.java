/*
 * PerPreviaSitas.java
 *
 * Created on 5 de Outubro de 2004, 11:38
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
public class PerPreviaSitas extends Persistencia{
    private Statement statement;
    private ResultSet resultset;
    private static PerPreviaSitas persistencia;
    
    /** Creates a new instance of PerPreviaSitas */
    public PerPreviaSitas() {
        super();
    }
    
    public static synchronized PerPreviaSitas getPreviaSitas(){
        if( persistencia == null )
            persistencia = new PerPreviaSitas();
        return persistencia;
    }
    
    public BeanPreviaSitas getBeanPreviaSitas( BeanJulgador julgador ){
        int cod_julgador = julgador.getCodPessoa();
        String query = "SELECT count(*) " + 
                       "FROM pessoa, pessoajulgador " + 
                       "WHERE pessoa.ativo = TRUE AND pessoa.cod_pessoa = pessoajulgador.cod_pessoa_julgador " +
                              "AND pessoajulgador.e_coordenador = TRUE " +
                       "UNION ALL " + 
                       "SELECT count(*) " + 
                       "FROM pessoajulgador ps " + 
                       "WHERE ps.e_coordenador = FALSE " + 
                       "UNION ALL " + 
                       "SELECT count(*) " + 
                       "FROM amostra " +
                       "WHERE amostra.ativo = TRUE " +
                       "UNION ALL " + 
                       "SELECT count(*) " + 
                       "FROM produto " +
                       "WHERE produto.ativo = TRUE " +
                       "UNION ALL " + 
                       "SELECT count(*) " + 
                       "FROM teste " + 
                       "WHERE teste.em_aberto = FALSE " + 
                       "UNION ALL " + 
                       "SELECT count(*) " + 
                       "FROM teste " + 
                       "WHERE teste.em_aberto = TRUE " + 
                       "UNION ALL " + 
                       "SELECT count(*) " + 
                       "FROM teste " + 
                       "WHERE teste.cod_pessoa_julgador = " + cod_julgador + " " + 
                       "UNION ALL " + 
                       "SELECT count(*) " + 
                       "FROM selecionado " + 
                       "WHERE selecionado.cod_pessoa_julgador = " + cod_julgador + " AND selecionado.ativo = TRUE " + 
                       "UNION ALL " + 
                       "SELECT count(*) " + 
                       "FROM selecionado " + 
                       "WHERE selecionado.cod_pessoa_julgador = " + cod_julgador + " AND selecionado.ativo = FALSE;";
        
        BeanPreviaSitas BeanPrevia = new BeanPreviaSitas();
        try{
            statement = connect.createStatement();
            resultset = statement.executeQuery( query );
            
           if( resultset.next() )
                BeanPrevia.setQtdeCoordenadores( resultset.getInt( 1 ) );
            if( resultset.next() )
                BeanPrevia.setQtdeJulgadores( resultset.getInt( 1 ) );
            if( resultset.next() )
                BeanPrevia.setQtdeAmost( resultset.getInt( 1 ) );
            if( resultset.next() )
                BeanPrevia.setQtdeProd( resultset.getInt( 1 ) );
            if( resultset.next() )
                BeanPrevia.setQtdeTestesConcluidos( resultset.getInt( 1 ) );
            if( resultset.next() )
                BeanPrevia.setQtdeTestesNaoConcluidos( resultset.getInt( 1 ) );
            if( resultset.next() )
                BeanPrevia.setQtdeTesteCriadosVc( resultset.getInt( 1 ) );
            if( resultset.next() )
                BeanPrevia.setQtdeTesteVcRealizar( resultset.getInt( 1 ) );
            if( resultset.next() )
                BeanPrevia.setQtdeTesteVcRealizou( resultset.getInt( 1 ) );
            
            if ( statement != null )
                statement.close();
            
            if ( resultset != null )
                resultset.close();            
            
        }
        catch( SQLException sqlexp ){
            sqlexp.printStackTrace();
        }
        return BeanPrevia;
    }
    
}
