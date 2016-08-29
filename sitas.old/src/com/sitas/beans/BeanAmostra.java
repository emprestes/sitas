package com.sitas.beans;

import java.beans.*;
import java.io.Serializable;

public class BeanAmostra extends Object implements Serializable {
   private int codigo;
   private String nome;
   private boolean ativo;
   private int codigoProduto;
   private BeanProduto produto;

   public BeanAmostra( ) {
       codigo = 0;
       nome = "";
       codigoProduto = 0;
       produto = null;
       ativo = true;
   }

   public void setCodigo( int novaAmostra ) {
       codigo = novaAmostra;
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

   public void setProduto( BeanProduto novoProduto ) {
       produto = novoProduto;
   }

   public BeanProduto getProduto( ) {
       return produto;
   }

   public void setCodigoProduto( int novoCodigoProduto ) {
       codigoProduto = novoCodigoProduto;
   }

   public int getCodigoProduto( ) {
       return codigoProduto;
   }

   public void setAtivo( boolean ehAtivo ) {
        ativo = ehAtivo;
   }

    public boolean getAtivo( ) {
        return ativo;
   }
}