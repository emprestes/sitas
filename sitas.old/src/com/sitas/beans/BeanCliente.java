/*
 * BeanPessoa.java
 *
 * Created on 10 de Setembro de 2004, 21:57
 */

package com.sitas.beans;

import java.beans.*;
import java.io.Serializable;
import java.util.*;

public class BeanCliente extends Object implements Serializable {
    private int codigo;
    private String ramo;
    private BeanPessoa pessoa;
    
    public BeanCliente( ) {
        codigo = 0;
        ramo = "";
        pessoa = null;
    }
    
    public void setCodigo( int novoCodigo ) {
        codigo = novoCodigo;
    }

    public int getCodigo( ) {
        return codigo;
    }

    public void setRamo( String novoRamo ) {
        ramo = novoRamo;
    }

    public String getRamo( ) {
        return ramo;
    }

    public void setPessoa( BeanPessoa novaPessoa ) {
        pessoa = novaPessoa;
    }

    public BeanPessoa getPessoa( ) {
        return pessoa;
    }
}