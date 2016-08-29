/*
 * BeanGabaritoTri.java
 *
 * Created on 29 de Setembro de 2004, 00:53
 */

package com.sitas.beans;

import java.beans.*;
import java.io.Serializable;

/**
 * @author alex
 */
public class BeanGabaritoTri extends Object implements Serializable {
    private long codGabaritoTri;
    private long codTeste;
    private int codJulgador;
    private int numero1;
    private int numero2;
    private int numero3;
    private int codAmostra1;
    private int codAmostra2;
    private int codAmostra3;
    
    public void setCodGabaritoTri( long c_gab_tri ){
        codGabaritoTri = c_gab_tri;
    }
    public long getCodGabaritoTri(){
        return codGabaritoTri;
    }
    public void setCodTeste( long c_teste ){
        codTeste = c_teste;
    }
    public long getCodTeste(){
        return codTeste;
    }
    public void setCodJulgador( int c_julgador ){
        codJulgador = c_julgador;
    }
    public int getCodJulgador(){
        return codJulgador;
    }
    public void setNumero1( int n1 ){
        numero1 = n1;
    }
    public int getNumero1(){
        return numero1;
    }
    public void setNumero2( int n2 ){
        numero2 = n2;
    }
    public int getNumero2(){
        return numero2;
    }
    public void setNumero3( int n3 ){
        numero3 = n3;
    }
    public int getNumero3(){
        return numero3;
    }
    public void setAmostra1( int c_a1 ){
        codAmostra1 = c_a1;        
    }
    public int getAmostra1(){
        return codAmostra1;
    }
    public void setAmostra2( int c_a2 ){
        codAmostra2 = c_a2;        
    }
    public int getAmostra2(){
        return codAmostra2;
    }
    public void setAmostra3( int c_a3 ){
        codAmostra3 = c_a3;        
    }
    public int getAmostra3(){
        return codAmostra3;
    }   
}
