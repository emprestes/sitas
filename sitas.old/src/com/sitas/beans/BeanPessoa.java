/*
 * BeanPessoa.java
 *
 * Created on 10 de Setembro de 2004, 21:57
 */

package com.sitas.beans;

import java.beans.*;
import java.io.Serializable;
import java.util.*;

public class BeanPessoa extends Object implements Serializable {
    private int codigo;
    private String nome;
    private String rua;
    private int numero;
    private String bairro;
    private int cep;
    private String email;
    private int codigoCidade;
    private String cidade;
    private int codigoUF;
    private String UF;
    private boolean ativo;
    
    public BeanPessoa( ) {
        codigo = 0;
        nome = "";
        rua = "";
        numero = 0;
        bairro = "";
        cep = 0;
        email = "";
        codigoCidade = 0;
        codigoUF = 0;
        UF = "";
        ativo = true;
    }
    
    public void setCodigo( int novoCodigo ) {
        codigo = novoCodigo;
    }

    public int getCodigo( ) {
        return codigo;
    }

    public void setNome( String novoNome ) {
        nome = novoNome;
    }

    public String getNome( ) {
        return nome;
    }

    public void setRua( String novaRua ) {
        rua = novaRua;
    }

    public String getRua( ) {
        return rua;
    }

    public void setNumero( int novoNumero ) {
        numero = novoNumero;
    }

    public int getNumero( ) {
        return numero;
    }

    public void setBairro( String novoBairro ) {
        bairro = novoBairro;
    }

    public String getBairro( ) {
        return bairro;
    }

    public void setCEP( int novoCEP ) {
        cep = novoCEP;
    }

    public int getCEP( ) {
        return cep;
    }

    public void setEMAIL( String novoEMAIL ) {
        email = novoEMAIL;
    }

    public String getEMAIL( ) {
        return email;
    }

    public void setCodigoCidade( int novoCodigoCidade ) {
        codigoCidade = novoCodigoCidade;
    }

    public int getCodigoCidade( ) {
        return codigoCidade;
    }

    public void setCidade( String novaCidade ) {
        cidade = novaCidade;
    }

    public String getCidade( ) {
        return cidade;
    }

    public void setCodigoUF( int novoCodigoUF ) {
        codigoUF = novoCodigoUF;
    }

    public int getCodigoUF( ) {
        return codigoUF;
    }

    public void setUF( String novaUF ) {
        UF = novaUF;
    }

    public String getUF( ) {
        return UF;
    }

    public void setAtivo( boolean ativar ) {
        ativo = ativar;
    }
    public boolean getAtivo( ) {
        return ativo;
    }
}