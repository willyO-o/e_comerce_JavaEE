
package Interfaces;

import Modelo.Venta;
import java.util.List;

public interface CRUDVenta {
        
    public List listar();

    public int add(Venta cat);

    public int delete(int id);

    public Venta getVen(int id);
    
    public int ultimoId();
    
    public int detalleVen(int id, int idp, int can, double to);
    
}
