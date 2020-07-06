
package Modelo;

import java.util.List;

public class Pedido {
    private int idPd;
    private String pago;
    private String prod;
    private double tot;
    private String fech;
    private int esta;
    private int idCl;
    
    private List<Carrito> carr;
    
    private String res;

    public Pedido() {
    }

    public Pedido(int idPd, String pago, String prod, double tot, String fech, int esta, int idCl, List<Carrito> carr, String res) {
        this.idPd = idPd;
        this.pago = pago;
        this.prod = prod;
        this.tot = tot;
        this.fech = fech;
        this.esta = esta;
        this.idCl = idCl;
        this.carr = carr;
        this.res = res;
    }

    public int getIdPd() {
        return idPd;
    }

    public void setIdPd(int idPd) {
        this.idPd = idPd;
    }

    public String getPago() {
        return pago;
    }

    public void setPago(String pago) {
        this.pago = pago;
    }

    public String getProd() {
        return prod;
    }

    public void setProd(String prod) {
        this.prod = prod;
    }

    public double getTot() {
        return tot;
    }

    public void setTot(double tot) {
        this.tot = tot;
    }

    public String getFech() {
        return fech;
    }

    public void setFech(String fech) {
        this.fech = fech;
    }

    public int getEsta() {
        return esta;
    }

    public void setEsta(int esta) {
        this.esta = esta;
    }

    public int getIdCl() {
        return idCl;
    }

    public void setIdCl(int idCl) {
        this.idCl = idCl;
    }

    public List<Carrito> getCarr() {
        return carr;
    }

    public void setCarr(List<Carrito> carr) {
        this.carr = carr;
    }

    public String getRes() {
        return res;
    }

    public void setRes(String res) {
        this.res = res;
    }
    
    
            
}
