/*
 * ProdutosBean.java
 *
 * Created on 8 de Setembro de 2004, 14:20
 */

package com.sitas.beans;

import java.io.*;
import java.sql.*;
import java.util.*;

import com.sitas.persistencia.PerProdutos;

public class BeanProdutos implements Serializable {
    private PerProdutos produtos;

    public BeanProdutos( ) {
        produtos = new PerProdutos( );
    }

    public List buscarProdutos( ) {
        return produtos.getProdutos( );
    }
}