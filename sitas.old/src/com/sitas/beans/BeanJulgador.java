/*
 * BeanPessoa.java
 *
 * Created on 10 de Setembro de 2004, 21:57
 */

package com.sitas.beans;

import java.beans.*;
import java.io.Serializable;
import java.util.*;

/**
 * @author alex
 */
public class BeanJulgador extends Object implements Serializable {
    private int codPessoa;
    private String nome;
    private String rua;
    private int numero;
    private String bairro;
    private int cep;
    private String email;
    private int codCidade;
    private int codUf;
    private Date dataNascimento;
    private int codCivil;
    private String sexo;
    private String login;
    private String senha;
    private boolean isCoordenador;
    private String faixaSalarial;
    private boolean isAtivo = true;
    
    public BeanJulgador() {
    
    }
    
    public void setCodPessoa( int c_pessoa ){
        codPessoa = c_pessoa;
    }
    public int getCodPessoa(){
        return codPessoa;
    }
    public void setNome( String n ){
        nome = n;
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
    public void setNumero( int num ){
        numero = num;
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
    public void setCep( int c ){
        cep = c;
    }
    public int getCep(){
        return cep;
    }
    public void setEmail( String eml ){
        email = eml;
    }
    public String getEmail(){
        return email;
    }
    public void setCodCidade( int c_cidade ){
        codCidade = c_cidade;
    }
    public int getCodCidade(){
        return codCidade;
    }
    public void setCodUf( int c_uf ){
        codUf = c_uf;
    }
    public int getCodUf(){
        return codUf;
    }
    public void setDataNascimento( Date data ){
        dataNascimento = data;
    }
    public Date getDataNascimento(){
        return dataNascimento;
    }
    public void setCodCivil( int c_civil ){
        codCivil = c_civil;
    }
    public int getCodCivil(){
        return codCivil;
    }
    public void setSexo( String s ){
        sexo = s;
    }
    public String getSexo(){
        return sexo;
    }
    public void setLogin( String log ){
        login = log;
    }
    public String getLogin(){
        return login;
    }
    public void setSenha( String pswd ){
        senha = pswd;
    }
    public String getSenha(){
        return senha;
    }
    public void setIsCoordenador( boolean  v ){
        isCoordenador = v;
    }
    public boolean getIsCoordenador(){
        return isCoordenador;
    }
    public void setFaixaSalarial( String salario ){
        faixaSalarial = salario;
    }
    public String getFaixaSalarial(){
        return faixaSalarial;
    }
    public void setIsAtivo( boolean val ){
        isAtivo = val;
    }
    public boolean getIsAtivo(){
        return isAtivo;
    }
}
