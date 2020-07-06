package Interfaces;

import Modelo.Cliente;
import java.util.List;

public interface CRUDCliente {

    public List listar();

    public int add(Cliente cli);

    public int update(int id);

    public int delete(int id);

    public Cliente getCli(int id);
    
    public Cliente validar(String em,String pas);
    
    public int addContacto(String na,String te,String em,String me);
}
