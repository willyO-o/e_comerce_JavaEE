/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author willy
 */
public class Marca {
    private int idMar;
    private String mar;

    public Marca() {
    }

    public Marca(int idMar, String mar) {
        this.idMar = idMar;
        this.mar = mar;
    }

    public int getIdMar() {
        return idMar;
    }

    public void setIdMar(int idMar) {
        this.idMar = idMar;
    }

    public String getMar() {
        return mar;
    }

    public void setMar(String mar) {
        this.mar = mar;
    }
    
    
}
