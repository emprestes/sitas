/*
 * BeanTeste.java
 *
 * Created on 28 de Setembro de 2004, 02:42
 */

package com.sitas.beans;

import java.beans.*;
import java.io.Serializable;
import java.util.*;

/**
 * @author alex
 */
public class BeanTeste extends Object implements Serializable {
    private long cod_teste;
    private int cod_coordenador;
    private String nomeCoordenador;
    private int cod_empresa;
    private String nome;
    private String objetivo;
    private String descricao;
    private String instrucao;
    private boolean emAberto;
    private Date dataCriacao;
    private int repeticoes;
    private String descMaterial;
    private int cod_produto;
    private String nomeProduto;
    
    public void setCodTeste( long c_teste ){
        cod_teste = c_teste;
    }
    public long getCodTeste(){
        return cod_teste;
    }
    public void setCodCoordenador( int c_coord ){
        cod_coordenador = c_coord;
    }
    public int getCodCoordenador(){
        return cod_coordenador;
    }
    public void setNomeCoordenador( String nome ){
        nomeCoordenador = nome;
    }
    public String getNomeCoordenador(){
        return nomeCoordenador;
    }
    public void setCodEmpresa( int c_emp ){
        cod_empresa = c_emp;
    }
    public int getCodEmpresa(){
        return cod_empresa;
    }
    public void setNome( String n ){
        nome = n;
    }
    public String getNome(){
        return nome;
    }
    public void setObjetivo( String obj ){
        objetivo = obj;
    }
    public String getObjetivo(){
        return objetivo;
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
    public void setIsAberto( boolean val ){
        emAberto = val;
    }
    public boolean getIsAberto(){
        return emAberto;
    }
    public void setDataCriacao( Date data ){
        dataCriacao = data;
    }
    public Date getDataCriacao(){
        return dataCriacao;
    }
    public void setRepeticoes( int rep ){
        repeticoes = rep;
    }
    public int getRepeticoes(){
        return repeticoes;
    }
    public void setDescMaterial( String desc ){
        descMaterial = desc;
    }
    public String getDescMaterial(){
        return descMaterial;
    }
    public void setCodProduto( int c_prod ){
        cod_produto = c_prod;
    }
    public int getCodProduto(){
        return cod_produto;
    }
    public void setNomeProduto( String n_prod ){
        nomeProduto = n_prod;
    }
    public String getNomeProduto(){
        return nomeProduto;
    }
}