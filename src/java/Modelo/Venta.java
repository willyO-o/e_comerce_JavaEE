package Modelo;

import java.util.List;

public class Venta {

    private int idVn;
    private String pago;
    private double tot;
    private String fech;

    private int idCl;

    private List<Carrito> carr;

    private String res;


    public Venta() {
    }

    public Venta(int idVn, String pago, double tot, String fech, int idCl, List<Carrito> carr, String res) {
        this.idVn = idVn;
        this.pago = pago;
        this.tot = tot;
        this.fech = fech;
        this.idCl = idCl;
        this.carr = carr;
        this.res = res;
    }



    public int getIdVn() {
        return idVn;
    }

    public void setIdVn(int idVn) {
        this.idVn = idVn;
    }
    

    public String getPago() {
        return pago;
    }

    public void setPago(String pago) {
        this.pago = pago;
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
