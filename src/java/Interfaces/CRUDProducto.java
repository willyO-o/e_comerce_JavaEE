/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Modelo.Producto;
import java.util.List;

public interface CRUDProducto {

    public List Listar();

    public Producto getProducto(int id);

    public int add(Producto pr);

    public int update(Producto pr);

    public int delete(int id);

    public int existe(String pr);

    public int images(int id, String im2, String im3, String im4);
    
    public int ultimoId();
}
