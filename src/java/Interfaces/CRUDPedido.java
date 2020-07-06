
package Interfaces;

import Modelo.Carrito;
import Modelo.Pedido;
import java.util.List;

public interface CRUDPedido {
    
    public List listar();

    public int add(Pedido cat);

    public int update(int id);

    public int delete(int id);

    public Pedido getPed(int id);
    
    public int ultimoId();
    
    public int detallePe(int id, int idp, int can, double to);
}
