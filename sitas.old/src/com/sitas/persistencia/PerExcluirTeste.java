/*
 * PerExcluirTeste.java
 *
 * Created on 14 de Outubro de 2004, 13:19
 */

package com.sitas.persistencia;

import java.util.*;
import java.sql.*;
import javax.sql.*;
import com.sitas.beans.*;

import javax.swing.JOptionPane;

/**
 *
 * @author  alex
 */
public class PerExcluirTeste extends Persistencia{
    private Statement statement;
    private ResultSet resultset;
    private static PerExcluirTeste persistencia;
    
    /** Creates a new instance of PerExcluirTeste */
    public PerExcluirTeste() {
        super();
    }
    public static synchronized PerExcluirTeste getExcluirTeste(){
        if( persistencia == null )
            persistencia = new PerExcluirTeste();
        return persistencia;
    }
    
    public BeanExcluirTeste getBeanExcluirTeste( long cod_teste ){
        BeanExcluirTeste excluirTesteBean = new BeanExcluirTeste();
        BeanTeste teste;
        ArrayList nomeAmostras;
        Iterator iter;
        
        String query = "SELECT * FROM get_teste(" + cod_teste + ") AS (c_teste bigint, c_coord int, c_emp int, " +
                       "nome varchar, objetivo text, descricao text, instrucao text, em_aberto boolean, " +
                       "data_criacao date, repeticoes integer, material text, n_coord varchar, cod_prod integer, n_prod varchar );";
        try{
            statement = connect.createStatement();
            resultset = statement.executeQuery( query );
            teste = new BeanTeste();
            if( resultset.next() ){
                                
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
                
                excluirTesteBean.setDescricao( teste.getDescricao() );
                excluirTesteBean.setObjetivo( teste.getObjetivo() );
                excluirTesteBean.setInstrucao( teste.getInstrucao() );
                excluirTesteBean.setProduto( teste.getNomeProduto() );
                excluirTesteBean.setCoordenador( teste.getNomeCoordenador() );
                excluirTesteBean.setDescricaoMaterial( teste.getDescMaterial() );
                excluirTesteBean.setRepeticoes( teste.getRepeticoes() );
                excluirTesteBean.setInstrucao( teste.getInstrucao() );
                
                excluirTesteBean.setEmpresa( this.getEmpresa( teste.getCodEmpresa() ) );
                excluirTesteBean.setAmostraRepetida( this.getAmostraRepetida( teste.getCodTeste() ) );
                                
            }
            excluirTesteBean.setJulgadoresSelecionados( this.getJulgadoresSelecionados( teste.getCodTeste() ) );
            nomeAmostras = this.getNomeAmostras( teste.getCodTeste() );
            iter = nomeAmostras.iterator();
            
            if( iter.hasNext() )
                excluirTesteBean.setAmostra1( (String) iter.next() );
            if( iter.hasNext() )
                excluirTesteBean.setAmostra2( (String) iter.next() );
                  
            if ( statement != null )
                statement.close();
            
            if ( resultset != null )
                resultset.close();            
        }
        catch( SQLException sqlexp ){
            sqlexp.printStackTrace();            
        }        
        return excluirTesteBean;
    }
    private String getAmostraRepetida( long cod_teste ){
        
        String query1 = "SELECT utilizaamostra.cod_amostra FROM utilizaamostra " + 
                        "WHERE utilizaamostra.cod_teste = " + cod_teste + ";";
        
        int repetida = 0;
        int cod_amostra1 = 0;
        int cod_amostra2 = 0;
        try{
            statement = connect.createStatement();
            
            resultset = statement.executeQuery( query1 );
            
            if( resultset.next() ){
                cod_amostra1 = resultset.getInt( 1 );
            }
            if( resultset.next() ){
                cod_amostra2 = resultset.getInt( 1 );
            }
           
            resultset.close();           
	    String query2 = "SELECT get_amostra_repetida( " + cod_teste + ", " + cod_amostra1 + " );";
            resultset = statement.executeQuery( query2 );
            
            if( resultset.next() ){
                repetida = resultset.getInt( 1 );
                resultset.close();
            }
            
            if( repetida == 1 ){
                String query3 = "SELECT amostra.nome FROM amostra " + 
                                "WHERE amostra.cod_amostra = "  + cod_amostra1 + ";";
                resultset = statement.executeQuery( query3 );
                if( resultset.next() )
                    return resultset.getString( 1 );
            }
            else
                if( repetida == -1 ){
                    String query3 = "SELECT amostra.nome FROM amostra " + 
                                    "WHERE amostra.cod_amostra = "  + cod_amostra2 + ";";
                    resultset = statement.executeQuery( query3 );
                    if( resultset.next() )
                        return resultset.getString( 1 );
                }
            
        }
        catch( SQLException sqlexp ){
            sqlexp.printStackTrace();
        }
        return "";
            
    }
    
    private String getEmpresa( int cod_empresa ){
        String nomeEmpresa = "";
        String query = "SELECT pessoa.nome FROM pessoa " + 
                        "WHERE pessoa.cod_pessoa = " + cod_empresa + ";";
        try{
            statement = connect.createStatement();
            resultset = statement.executeQuery( query );
            
            if( resultset.next() ){
                nomeEmpresa = resultset.getString( 1 );
            }            
             if ( statement != null )
                statement.close();
             if ( resultset != null )
                resultset.close();    
        }
        catch( SQLException sqlexp ){
            sqlexp.printStackTrace();            
           
        }
        return nomeEmpresa;
    }
    
    private ArrayList getNomeAmostras( long cod_teste ){        
        ArrayList nomeAmostras = new ArrayList();
        
        String query = "SELECT amostra.nome FROM utilizaamostra, amostra " + 
                       "WHERE utilizaamostra.cod_teste = " + cod_teste + " AND utilizaamostra.cod_amostra = amostra.cod_amostra;";
        try{
            statement = connect.createStatement();
            resultset = statement.executeQuery( query );
            
            if( resultset.next() ){
                nomeAmostras.add( resultset.getString( 1 ) );
            }
            if( resultset.next() ){
                nomeAmostras.add( resultset.getString( 1 ) );
            }           
            
             if ( statement != null )
                statement.close();
             if ( resultset != null )
                resultset.close();    
        }
        catch( SQLException sqlexp ){
            sqlexp.printStackTrace();
        }
        return nomeAmostras;
    }
    
    private ArrayList getJulgadoresSelecionados( long cod_teste ){
        
        ArrayList julgadoresSelecionados = new ArrayList();
        BeanJulgador julgadorBean;        
        String query = "SELECT * FROM get_julgadores_selecionados('" + cod_teste + "') AS (cod integer, nome varchar, " +
                                     "rua varchar, numero integer, bairro varchar, cep integer, " +
                                     "email varchar, cod_cidade integer, cod_uf integer, " +
                                     "data_nascimento date, cod_civil integer, sexo bpchar, " +
				     "login varchar, senha varchar, e_coordenador boolean, faixa_salarial_familiar money);";
        try{
            statement = connect.createStatement();
            resultset = statement.executeQuery( query );
            
            while( resultset.next() ){
                julgadorBean = new BeanJulgador();
                
                julgadorBean.setCodPessoa( resultset.getInt( 1 ) );
                julgadorBean.setNome( resultset.getString( 2 ) );
                julgadorBean.setRua( resultset.getString( 3 ) );
                julgadorBean.setNumero( resultset.getInt( 4 ) );
                julgadorBean.setBairro( resultset.getString( 5 ) );
                julgadorBean.setCep( resultset.getInt( 6 ) );
                julgadorBean.setEmail( resultset.getString( 7 ) );
                julgadorBean.setCodCidade( resultset.getInt( 8 ) );
                julgadorBean.setCodUf( resultset.getInt( 9 ) );
                julgadorBean.setDataNascimento( resultset.getDate( 10 ) );
                julgadorBean.setCodCivil( resultset.getInt( 11 ) );
                julgadorBean.setSexo( resultset.getString( 12 ) );
                julgadorBean.setLogin( resultset.getString( 13 ) );
                julgadorBean.setSenha( resultset.getString( 14 ) );
                julgadorBean.setIsCoordenador( resultset.getBoolean( 15 ) );
                julgadorBean.setFaixaSalarial( resultset.getString(16) );
                
                julgadoresSelecionados.add( julgadorBean );
            }
            
            
            if ( statement != null )
                statement.close();
            
            if ( resultset != null )
                resultset.close();
            
        }
        catch( SQLException sqlexp ){
            sqlexp.printStackTrace();
        }
        
        return julgadoresSelecionados;        
    }
    
    
    public ArrayList getTestesExcluir( BeanJulgador julgador ){
        ArrayList testes = new ArrayList();
        BeanTeste teste;
        String query = "SELECT * FROM get_testes_excluir(" + julgador.getCodPessoa() + ") AS (c_teste bigint, c_coord int, c_emp int, " +
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
    public int excluirTeste( long cod_teste ){
        JOptionPane.showMessageDialog(null, "teste", "teste", JOptionPane.INFORMATION_MESSAGE);
        int excl = 0;
        String query = "DELETE FROM teste WHERE teste.cod_teste = " + cod_teste + ";";
        try{
            
            statement = connect.createStatement();
            excl = statement.executeUpdate( query );          
            
            
            if ( statement != null )
                statement.close();
            
           
        }
        catch( SQLException sqlexp ){
            sqlexp.printStackTrace();
        }
         return excl;
    }
   
    
}
