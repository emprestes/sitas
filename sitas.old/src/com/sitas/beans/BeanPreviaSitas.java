/*
 * BeanPreviaSitas.java
 *
 * Created on 5 de Outubro de 2004, 12:42
 */

package com.sitas.beans;

import java.beans.*;
import java.io.Serializable;

/**
 * @author alex
 */
public class BeanPreviaSitas extends Object implements Serializable {
    private int qtdeCoord = 0;
    private int qtdeJulg = 0;
    private int qtdeAmost = 0;
    private int qtdeProd = 0;
    private int qtdeTestesConcluidos = 0;
    private int qtdeTestesNaoConcluidos = 0;
    private int qtdeTesteCriadosVc = 0;
    private int qtdeTesteVcRealizar = 0;
    private int qtdeTesteVcRealizou = 0;
    
    
    public void setQtdeCoordenadores( int n_coord ){
        qtdeCoord = n_coord;        
    }
    public int getQtdeCoordenadores(){
        return qtdeCoord;
    }
     public void setQtdeJulgadores( int n_julg ){
        qtdeJulg = n_julg;
    }
    public int getQtdeJulgadores(){
        return qtdeJulg;
    }
    public void setQtdeAmost( int n_amos ){
        qtdeAmost = n_amos;
    }
    public int getQtdeAmost(){
        return qtdeAmost;
    }
    public void setQtdeProd( int n_prod){
        qtdeProd = n_prod;
    }
    public int getQtdeProd(){
        return qtdeProd;
    }
    public void setQtdeTestesConcluidos( int n_testes ){
        qtdeTestesConcluidos = n_testes;
    }
    public int getQtdeTestesConcluidos(){
        return qtdeTestesConcluidos;
    }
    public void setQtdeTestesNaoConcluidos( int n_t_nao ){
        qtdeTestesNaoConcluidos = n_t_nao;
    }
    public int getQtdeTestesNaoConcluidos(){
        return qtdeTestesNaoConcluidos;
    }
    public void setQtdeTesteCriadosVc( int n_t_vc ){
        qtdeTesteCriadosVc = n_t_vc;        
    }
    public int getQtdeTesteCriadosVc(){
        return qtdeTesteCriadosVc;
    }
    public void setQtdeTesteVcRealizar( int n_t_vc_r){
        qtdeTesteVcRealizar = n_t_vc_r;
    }
    public int getQtdeTesteVcRealizar(){
        return qtdeTesteVcRealizar;
    }
    public void setQtdeTesteVcRealizou( int n_t_vc_rzou ){
        qtdeTesteVcRealizou = n_t_vc_rzou;
    }
    public int getQtdeTesteVcRealizou(){
        return qtdeTesteVcRealizou;
    }    
}
