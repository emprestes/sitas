/*
 * BeanPessoa.java
 *
 * Created on 10 de Setembro de 2004, 21:57
 */

package com.sitas.beans;

import java.beans.*;
import java.io.Serializable;
import java.util.*;

public class BeanCidade extends Object implements Serializable {
    private int codigo;
    private String nome;
    
    public BeanCidade( ) {
        codigo = 0;
        nome = "";
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
}