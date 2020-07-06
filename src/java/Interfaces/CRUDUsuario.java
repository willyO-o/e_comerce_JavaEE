
package Interfaces;

import Modelo.Usuario;
import java.util.List;


public interface CRUDUsuario {
        public List listar();

    public int add(Usuario cat);

    public int update(Usuario id);

    public int delete(int id);

    public Usuario getCat(int id);
    
    public Usuario validar(String em,String pas);
    
    public void upEstado(int id,int est);
}
