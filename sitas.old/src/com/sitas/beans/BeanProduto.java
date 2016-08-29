/*
 * BeanProduto.java
 *
/*
 * BeanProduto.java
 *
 * Created on 31 de Agosto de 2004, 18:30
 */

package com.sitas.beans;

import java.beans.*;
import java.io.Serializable;

/**
 * @author alex
 */
public class BeanProduto extends Object implements Serializable {
    private int codigo;
    private String nome;
    private boolean ativo;

    public BeanProduto( ) {
        codigo = 0;
        nome = "";
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

    public void setAtivo( boolean ehAtivo ) {
        ativo = ehAtivo;
    }

    public boolean getAtivo( ) {
        return ativo;
    }       
}