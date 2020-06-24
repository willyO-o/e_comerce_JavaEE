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
public class Producto {
    private int inPro;
    private String pro ;
    private String img;
    private String desPro;
    private String carPro;
    private int stock;
    private int stockMin ;
    private double preVenta;
    private String garan;
    private int idMarc ;
    private int idCat ;
    private String marc;
    private String cate;
    private String res;
    
    private String img2;
    private String img3;
    private String img4;
    
    public Producto() {
    }

    public Producto(int inPro, String pro, String img, String desPro, String carPro, int stock, int stockMin, double preVenta, String garan, int idMarc, int idCat, String marc, String cate, String res, String img2, String img3, String img4) {
        this.inPro = inPro;
        this.pro = pro;
        this.img = img;
        this.desPro = desPro;
        this.carPro = carPro;
        this.stock = stock;
        this.stockMin = stockMin;
        this.preVenta = preVenta;
        this.garan = garan;
        this.idMarc = idMarc;
        this.idCat = idCat;
        this.marc = marc;
        this.cate = cate;
        this.res = res;
        this.img2 = img2;
        this.img3 = img3;
        this.img4 = img4;
    }

    

    public int getInPro() {
        return inPro;
    }

    public void setInPro(int inPro) {
        this.inPro = inPro;
    }

    public String getPro() {
        return pro;
    }

    public void setPro(String pro) {
        this.pro = pro;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDesPro() {
        return desPro;
    }

    public void setDesPro(String desPro) {
        this.desPro = desPro;
    }

    public String getCarPro() {
        return carPro;
    }

    public void setCarPro(String carPro) {
        this.carPro = carPro;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getStockMin() {
        return stockMin;
    }

    public void setStockMin(int stockMin) {
        this.stockMin = stockMin;
    }

    public double getPreVenta() {
        return preVenta;
    }

    public void setPreVenta(double preVenta) {
        this.preVenta = preVenta;
    }

    public String getGaran() {
        return garan;
    }

    public void setGaran(String garan) {
        this.garan = garan;
    }

    public int getIdMarc() {
        return idMarc;
    }

    public void setIdMarc(int idMarc) {
        this.idMarc = idMarc;
    }

    public int getIdCat() {
        return idCat;
    }

    public void setIdCat(int idCat) {
        this.idCat = idCat;
    }

    public String getMarc() {
        return marc;
    }

    public void setMarc(String marc) {
        this.marc = marc;
    }

    public String getCate() {
        return cate;
    }

    public void setCate(String cate) {
        this.cate = cate;
    }

    public String getRes() {
        return res;
    }

    public void setRes(String res) {
        this.res = res;
    }

    public String getImg2() {
        return img2;
    }

    public void setImg2(String img2) {
        this.img2 = img2;
    }

    public String getImg3() {
        return img3;
    }

    public void setImg3(String img3) {
        this.img3 = img3;
    }

    public String getImg4() {
        return img4;
    }

    public void setImg4(String img4) {
        this.img4 = img4;
    }
    
    
    
    
    
}
