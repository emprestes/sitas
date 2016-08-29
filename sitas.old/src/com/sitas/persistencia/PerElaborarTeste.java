/*
 * Class.java
 *
 * Created on 30 de Junho de 2004, 11:15
 */

/**
 *
 * @author  alex
 */
package com.sitas.persistencia;

import com.sitas.beans.BeanAmostra;
import com.sitas.beans.BeanElaborarTesteTri;
import com.sitas.beans.BeanEmpresa;
import com.sitas.beans.BeanJulgador;
import com.sitas.beans.BeanProduto;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Random;


public class PerElaborarTeste extends Persistencia{
    
    private Statement statement;
    private ResultSet resultset;
    private static PerElaborarTeste persiste;
        
    
    public PerElaborarTeste() {
        super();        
    }
    
    public static synchronized PerElaborarTeste getPerElaborarTeste(){
        if( persiste == null )
            persiste = new PerElaborarTeste();
        
        return persiste;
    }
    
    public BeanElaborarTesteTri getBeanElaborarTesteTri(){
        BeanElaborarTesteTri bean = new BeanElaborarTesteTri();
        bean.setObjetivo( null );
        bean.setDescricao( null );
        bean.setInstrucao( null );
        
        ArrayList empresas = new ArrayList();
        ArrayList produtos = new ArrayList();
        ArrayList amostras = new ArrayList();
        String query1 = "";
        try{            
            empresas = this.getEmpresas();
            bean.setEmpresas( empresas );
            produtos = this.getProdutos();
            bean.setProdutos( produtos );
            
            
            statement = connect.createStatement();
            resultset = statement.executeQuery( query1 );
            
            if( resultset.next() ){
            
               
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
        
        return bean;
    }
    public ArrayList getProdutos(){
        ArrayList produtos = new ArrayList();
        BeanProduto bean;
        String query = "SELECT * FROM produto WHERE produto.ativo = TRUE ORDER BY nome;";
        try{            
            
            statement = connect.createStatement();
            resultset = statement.executeQuery( query );
            
            while( resultset.next() ){
                bean = new BeanProduto();
                bean.setCodigo( resultset.getInt(1) );
                bean.setNome( resultset.getString(2) );
                
                produtos.add( bean );
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
        
        return produtos;
    }
    
    public ArrayList getEmpresas(){
        ArrayList empresas = new ArrayList();
        BeanEmpresa bean;
        String query = "SELECT * FROM pessoa, pessoaempresa WHERE pessoa.ativo = TRUE AND pessoa.cod_pessoa = pessoaempresa.cod_pessoa_empresa ORDER BY pessoa.nome;";
        try{            
            
            statement = connect.createStatement();
            resultset = statement.executeQuery( query );
            
            while( resultset.next() ){
                bean = new BeanEmpresa();
                bean.setCodEmpresa( resultset.getInt(1) );
                bean.setNome( resultset.getString(2) );
                bean.setRua( resultset.getString(3) );
                bean.setNumero( resultset.getInt(4) );
                bean.setBairro( resultset.getString(5) );
                bean.setCep( resultset.getInt(6) );
                bean.setEmail( resultset.getString(7) );
                bean.setCodCidade( resultset.getInt(8) );
                bean.setUf( resultset.getInt(9) );
                bean.setRamo( resultset.getString(12) );
                                
                empresas.add( bean );
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
        
        return empresas;
    }
    
    
    public ArrayList getAmostras( int c_produto ){
        ArrayList amostras = new ArrayList();
        BeanAmostra bean;
        String query = "SELECT * FROM amostra WHERE amostra.ativo = TRUE AND amostra.cod_produto = " + c_produto +" ORDER BY nome;";
        try{            
            
            statement = connect.createStatement();
            resultset = statement.executeQuery( query );
            
            while( resultset.next() ){
                bean = new BeanAmostra();
                bean.setCodigo( resultset.getInt(1) );                
                bean.setNome( resultset.getString(2) );
                bean.setCodigoProduto( resultset.getInt(3) );
                                
                amostras.add( bean );               
            }
            
            if ( statement != null )
                statement.close();
            
            if ( resultset != null )
                resultset.close();
            
        }
        catch(SQLException sqlexp){
            sqlexp.printStackTrace();
        }
       
        return amostras;
    }
    
    public ArrayList getJulgadoresDB( String letra ){
        ArrayList julgadores = new ArrayList();
        BeanJulgador julgadorBean;
        String query = "SELECT * FROM get_julgadores('" + letra + "') AS (cod integer, nome varchar, " +
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
                
                julgadores.add( julgadorBean );
            }
            
            if ( statement != null )
                statement.close();
            
            if ( resultset != null )
                resultset.close();
            
        }
        catch( SQLException sqlexp ){
            sqlexp.printStackTrace();
        }
        return julgadores;
    }
    
    
   public long adicionarNovoTesteTri( BeanElaborarTesteTri bean )
    {   
        ArrayList julgadores = bean.getJulgadoresEscolhidos();
        Iterator iter = julgadores.iterator();
        long cod_teste = 0;
        StringBuffer query3 = new StringBuffer();
        try{
            statement = connect.createStatement();
            
            String query1 = "BEGIN; " +
            "INSERT INTO teste(cod_teste, cod_pessoa_julgador, cod_pessoa_empresa, nome, objetivo, descricao, instrucao, em_aberto, data_criacao, data_fechamento, repeticoes, "+
            "material ) "+
            "VALUES ( DEFAULT, " + bean.getCodCoordenador() + ", " + bean.getCodEmpresa() + ", 'TRIANGULAR', '" + bean.getObjetivo() + "', '" + bean.getDescricao() + "', '" + bean.getInstrucao() + "', " +
            "DEFAULT, DEFAULT, DEFAULT, " + bean.getRepeticoes() + ", '" + bean.getDescricaoMaterial()+ "' ); " + 
            "SELECT cod_teste FROM teste; " ;
            
            resultset = statement.executeQuery( query1 );
            
            if( resultset.next() ){
                resultset.last();
                cod_teste = resultset.getLong( 1 );
            }
            
            query3.append(" INSERT INTO triangular( cod_teste ) VALUES ( " + cod_teste + " ); ");
            query3.append(" INSERT INTO utilizaamostra( cod_amostra, cod_teste ) VALUES ( "+ bean.getAmostra1() + ", " + cod_teste + " ); ");
            query3.append(" INSERT INTO utilizaamostra( cod_amostra, cod_teste ) VALUES ( "+ bean.getAmostra2() + ", " + cod_teste + " ); ");
            
            while( iter.hasNext() ){
                BeanJulgador julgador = (BeanJulgador) iter.next();
                query3.append( "INSERT INTO selecionado( cod_pessoa_julgador, cod_teste ) VALUES ( " + julgador.getCodPessoa() + ", " + cod_teste + " ); " );
            }
            
            query3.append( this.insertAmostras( bean, cod_teste ).toString() );
            query3.append("COMMIT; ");            
            statement.executeQuery( query3.toString() );
            
            if ( statement != null ){
                statement.close();
            }
        }
        catch(SQLException sqlexp){
            sqlexp.printStackTrace();
        }
        return cod_teste;
       
        
    }
   private StringBuffer insertAmostras( BeanElaborarTesteTri bean, long c_teste ){
       int opcao = 0;
       int temp = 0;
       StringBuffer insert = new StringBuffer();
       Random r = new Random();
       ArrayList julgadores = bean.getJulgadoresEscolhidos();
       Iterator iterator = julgadores.iterator();
       int amostra1 = bean.getAmostra1();
       int amostra2 = bean.getAmostra2();
       int amostraRep = bean.getAmostraRepitida();
       int repeticoes = bean.getRepeticoes();
       
       while( iterator.hasNext() ){
           BeanJulgador julgador = (BeanJulgador) iterator.next();
           //NumAleatorio num = NumAleatorio.getNumAleatorio();
           for( int i = 0; i < repeticoes; ++i){
               while( temp == opcao ){
                   opcao = Math.abs( r.nextInt() ) % 3 + 1;
               }
               temp = opcao;
               if( amostraRep == 1 ){
                   switch( opcao ){
                       case 1:
 /*                          insert.append( "INSERT INTO gabaritotriangular( cod_gabarito_tri, cod_teste, " + 
                           "cod_pessoa_julgador, numero1, numero2, numero3, amostra1, amostra2, amostra3 ) " + 
                           "VALUES( DEFAULT, " + c_teste + ", " + julgador.getCodPessoa() + ", " + num.getNum() + 
                           ", " + num.getNum() + ", " + num.getNum() + ", " + amostra1 + ", " + amostra1 + 
                           ", " + amostra2 + " ); " );
                           break;
                       case 2:
                           insert.append( "INSERT INTO gabaritotriangular( cod_gabarito_tri, cod_teste, " + 
                           "cod_pessoa_julgador, numero1, numero2, numero3, amostra1, amostra2, amostra3 ) " + 
                           "VALUES( DEFAULT, " + c_teste + ", " + julgador.getCodPessoa() + ", " + num.getNum() + 
                           ", " + num.getNum() + ", " + num.getNum() + ", " + amostra2 + ", " + amostra1 + 
                           ", " + amostra1 + " ); " );
                           break;
                       case 3:
                           insert.append( "INSERT INTO gabaritotriangular( cod_gabarito_tri, cod_teste, " + 
                           "cod_pessoa_julgador, numero1, numero2, numero3, amostra1, amostra2, amostra3 ) " + 
                           "VALUES( DEFAULT, " + c_teste + ", " + julgador.getCodPessoa() + ", " + num.getNum() + 
                           ", " + num.getNum() + ", " + num.getNum() + ", " + amostra1 + ", " + amostra2 + 
                           ", " + amostra1 + " ); " );
*/                           break;
                   }
               }
               else
                   if( amostraRep == 2 ){
                       switch( opcao ){
                       case 1:
 /*                          insert.append( "INSERT INTO gabaritotriangular( cod_gabarito_tri, cod_teste, " + 
                           "cod_pessoa_julgador, numero1, numero2, numero3, amostra1, amostra2, amostra3 ) " + 
                           "VALUES( DEFAULT, " + c_teste + ", " + julgador.getCodPessoa() + ", " + num.getNum() + 
                           ", " + num.getNum() + ", " + num.getNum() + ", " + amostra1 + ", " + amostra2 + 
                           ", " + amostra2 + " ); " );
                           break;
                       case 2:
                           insert.append( "INSERT INTO gabaritotriangular( cod_gabarito_tri, cod_teste, " + 
                           "cod_pessoa_julgador, numero1, numero2, numero3, amostra1, amostra2, amostra3 ) " + 
                           "VALUES( DEFAULT, " + c_teste + ", " + julgador.getCodPessoa() + ", " + num.getNum() + 
                           ", " + num.getNum() + ", " + num.getNum() + ", " + amostra2 + ", " + amostra2 + 
                           ", " + amostra1 + " ); " );
                           break;
                       case 3:
                           insert.append( "INSERT INTO gabaritotriangular( cod_gabarito_tri, cod_teste, " + 
                           "cod_pessoa_julgador, numero1, numero2, numero3, amostra1, amostra2, amostra3 ) " + 
                           "VALUES( DEFAULT, " + c_teste + ", " + julgador.getCodPessoa() + ", " + num.getNum() + 
                           ", " + num.getNum() + ", " + num.getNum() + ", " + amostra2 + ", " + amostra1 + 
                           ", " + amostra2 + " ); " );
  */                        break;
                       }
                   }           
           }
           
       }
       
       return insert;
   }
   
}
