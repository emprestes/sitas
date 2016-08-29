/*
 * BeanExcluirTeste.java
 *
 * Created on 14 de Outubro de 2004, 13:24
 */

package com.sitas.beans;

import java.beans.*;
import java.io.Serializable;
import java.util.*;
/**
 * @author alex
 */
public class BeanExcluirTeste extends Object implements Serializable {
    private String objetivo;
    private String empresa;
    private String descricao;
    private String instrucao;
    private String produto;
    private String amostra1;
    private String amostra2;
    private String amostra_repetida;
    private String descricao_material;
    private ArrayList julgadoresSelecionados;
    private String coordenador;
    private int repeticoes = 0;
    
    public void setObjetivo( String obj ){
        objetivo = obj;
    }
    public String getObjetivo(){
        return objetivo;
    }
    public void setEmpresa( String emp ){
        empresa = emp;
    }
    public String getEmpresa(){
        return empresa;
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
    public void setProduto( String prod ){
        produto = prod;
    }
    public String getProduto(){
        return produto;
    }
    public void setAmostra1( String amost1 ){
        amostra1 = amost1;
    }
    public String getAmostra1(){
        return amostra1;
    }
    public void setAmostra2( String amost2 ){
        amostra2 = amost2;
    }
    public String getAmostra2(){
        return amostra2;
    }
    public void setAmostraRepetida( String amostraRep ){
        amostra_repetida = amostraRep;
    }
    public String getAmostraRepetida(){
        return amostra_repetida;
    }
    public void setDescricaoMaterial( String descMat ){
        descricao_material = descMat;
    }
    public String getDescricaoMaterial(){
        return descricao_material;
    }
    public void setJulgadoresSelecionados( ArrayList julgadores ){
        julgadoresSelecionados = julgadores;
    }
    public ArrayList getJulgadoresSelecionados(){
        return julgadoresSelecionados;
    }
    public void setCoordenador( String coord ){
        coordenador = coord;
    }
    public String getCoordenador(){
        return coordenador;
    }
    public void setRepeticoes( int rept ){
        repeticoes = rept;
    }
    public int getRepeticoes(){
        return repeticoes;
    }    
}
