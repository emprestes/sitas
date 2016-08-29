/*
 * ElaborarTeste.java
 *
 * Created on 27 de Agosto de 2004, 22:00
 */

package com.sitas.beans;

import java.beans.*;
import java.io.Serializable;
import java.util.*;


/**
 * @author alex
 */
public class BeanElaborarTesteTri extends Object implements Serializable {
    
    private String objetivo;
    private ArrayList empresas;
    private int cod_empresa;
    private String descricao;
    private String instrucao;
    private ArrayList produtos;
    private int cod_produto;
    private ArrayList amostras;
    private int amostra1;
    private int amostra2;
    private int amostra_repitida = -1;
    private String descricao_material;
    private ArrayList julgadoresDB;
    private ArrayList julgadoresEscolhidos = new ArrayList();
    private int codCoordenador;
    private int repeticoes = 0;
    private float significancia;
    private boolean todos_resultados = false;
    private boolean numero_relatorio = false;
    private boolean numero_julgador = false;
    private boolean mostrar_amostra = false;
    private boolean config_amostras = false;
    
        
    public void setObjetivo( String obj ){
        objetivo = obj;
    }
    
    public String getObjetivo(){
        return objetivo;
    }
    public void setEmpresas( ArrayList emp ){
        empresas = emp;
    }
    public ArrayList getEmpresas(){
        return empresas;
    }
    public void setCodEmpresa( int c_emp ){
        cod_empresa = c_emp;
    }
    public int getCodEmpresa(){
        return cod_empresa;
    }
    
    public void setDescricao( String desc ){
        descricao = desc;
    }
    
    public String getDescricao(){
        return descricao;
    }
    
    public void setInstrucao( String inst ){
        instrucao = inst;
    }
    
    public String getInstrucao(){
        return instrucao;
    }
           
    public void setProdutos( ArrayList prods ){
        produtos = prods;
    }
    
    public ArrayList getProdutos(){
        return produtos;
    }
    
    public void setProduto( int c_prod ){
        cod_produto = c_prod;
    }
    
    public int getProduto(){
        return cod_produto;
    }
    
    public void setAmostras( ArrayList a ){
        amostras = a;
    }
    
    public ArrayList getAmostras(){
        return amostras;
    }
    
    public void setAmostra1( int amost1 ){
        amostra1 = amost1;
    }
    
    public int getAmostra1(){
        return amostra1;
    }
    
    public void setAmostra2( int amost2 ){
        amostra2 = amost2;
    }
    
    public int getAmostra2(){
        return amostra2;
    }
    
    public void setAmostraRepitida( int amost_rep){
        amostra_repitida = amost_rep;
    }
    
    public int getAmostraRepitida(){
        return amostra_repitida;
    }
    
    public void setDescricaoMaterial( String desc ){
        descricao_material = desc;
    }
    
    public String getDescricaoMaterial(){
        return descricao_material;
    }
    
    public void setJulgadoresEscolhidos( ArrayList julg ){
        julgadoresEscolhidos.addAll( julg );
    }
    
    public ArrayList getJulgadoresEscolhidos(){
        return julgadoresEscolhidos;
    }
    public void setJulgadoresDB( ArrayList j ){
        julgadoresDB = j;
    }
    
    public ArrayList getJulgadoresDB(){
        return julgadoresDB;
    }
    
    public void setCodCoordenador( int coord ){
        codCoordenador = coord;
    }
    
    public int getCodCoordenador(){
        return codCoordenador;
    }
    
    public void setRepeticoes( int rep ){
        repeticoes = rep;
    }
    
    public int getRepeticoes(){
        return repeticoes;
    }
    
    public void setSignificancia( float sig ){
        significancia = sig;
    }
    
    public float getSignificancia(){
        return significancia;
    }
    
    public void setIsTodosResultados( int val ){
        if( val == 0 )
            todos_resultados = false;
        else
            if( val == 1 )
                todos_resultados = true;
    }
    
    public boolean getIsTodosResultados(){
        return todos_resultados;
    }
    
    public void setIsNumeroRelatorio( int val ){
        if( val == 0 )
            numero_relatorio = false;
        else
            if( val == 1 )
                numero_relatorio = true;
    }
    
    public boolean getIsNumerosRelatorios(){
        return numero_relatorio;
    }
    
    public void setIsNumeroJulgador( int val ){
        if( val == 0 )
            numero_julgador = false;
        else
            if( val == 1 )
                numero_julgador = true;
    }
    
    public boolean getIsNumeroJulgador(){
        return numero_julgador;
    }
    
    public void setIsMostrarAmostra( int val ){
        if( val == 0 )
            mostrar_amostra = false;
        else
            if( val == 1 )
                mostrar_amostra = true;
    }
    
    public boolean getIsMostarAmostra(){
        return mostrar_amostra;
    }
    public void setConfigAmostras( int val ){
        if( val == 0 )
            config_amostras = false;
        else
            if( val == 1 )
                config_amostras = true;
    }
    public boolean getConfigAmostras(){
        return config_amostras;
    }
    
       
}
