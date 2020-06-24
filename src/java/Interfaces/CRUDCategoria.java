/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Modelo.Categoria;
import java.util.List;

/**
 *
 * @author willy
 */
public interface CRUDCategoria {
    public List listar();
    public int add(Categoria cat);
    public int update(int id);
    public int delete(int id);
    public Categoria getCat(int id);
}
