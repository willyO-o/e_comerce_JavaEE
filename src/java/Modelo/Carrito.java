
package Modelo;

public class Carrito {
    private int idPr;
    private String img;
    private String pro;
    private double pre;
    private int can;
    private double tot;
    private int stok;
    private String res;

    public Carrito() {
    }

    public Carrito(int idPr, String img, String pro, double pre, int can, double tot, int stok, String res) {
        this.idPr = idPr;
        this.img = img;
        this.pro = pro;
        this.pre = pre;
        this.can = can;
        this.tot = tot;
        this.stok = stok;
        this.res = res;
    }



    public int getIdPr() {
        return idPr;
    }

    public void setIdPr(int idPr) {
        this.idPr = idPr;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getPro() {
        return pro;
    }

    public void setPro(String pro) {
        this.pro = pro;
    }

    public double getPre() {
        return pre;
    }

    public void setPre(double pre) {
        this.pre = pre;
    }

    public int getCan() {
        return can;
    }

    public void setCan(int can) {
        this.can = can;
    }

    public double getTot() {
        return tot;
    }

    public void setTot(double tot) {
        this.tot = tot;
    }

    public String getRes() {
        return res;
    }

    public void setRes(String res) {
        this.res = res;
    }

    public int getStok() {
        return stok;
    }

    public void setStok(int stok) {
        this.stok = stok;
    }
    
    
}
