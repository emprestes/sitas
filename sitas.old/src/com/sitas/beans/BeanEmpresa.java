/*
 * BeanEmpresa.java
 *
 * Created on 31 de Agosto de 2004, 17:50
 */

package com.sitas.beans;

import java.beans.*;
import java.io.Serializable;

/**
 * @author alex
 */
public class BeanEmpresa extends Object implements Serializable {
    private int cod_empresa;
    private int cep;
    private int cod_cidade;
    private int cod_uf;
    private String nome;
    private String rua;
    private int numero;
    private String bairro;
    private String email;
    private String ramo;
        
    public void setCodEmpresa( int cod ){
        cod_empresa = cod;
    }
    public int getCodEmpresa(){
        return cod_empresa;
    }
    public void setCep( int cp ){
        cep = cp;
    }
    public int getCep(){
        return cep;
    }
    public void setCodCidade( int c_cidade ){
        cod_cidade = c_cidade;
    }
    public int getCodCidade(){
        return cod_cidade;
    }
    public void setUf( int c_uf ){
        cod_uf = c_uf;
    }
    public int getUf(){
        return cod_uf;
    }
    public void setNome( String n_emp ){
        nome = n_emp;
    }
    public String getNome(){
        return nome;
    }
    public void setRua( String r ){
        rua = r;
    }
    public String getRua(){
        return rua;
    }
    public void setNumero( int n ){
        numero = n;
    }
    public int getNumero(){
        return numero;
    }
    public void setBairro( String b ){
        bairro = b;
    }
    public String getBairro(){
        return bairro;
    }
    public void setEmail( String e ){
        email = e;
    }
    public String getEmail(){
        return email;
    }
    public void setRamo( String r ){
        ramo = r;
    }
    public String getRamo(){
        return ramo;
    }
    
}
