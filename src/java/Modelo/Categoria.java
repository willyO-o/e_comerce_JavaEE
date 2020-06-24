
package Modelo;


public class Categoria {
    private int idCat;
    private String cate;
    private String desc;

    public Categoria() {
    }

    public Categoria(int idCat, String cate, String desc) {
        this.idCat = idCat;
        this.cate = cate;
        this.desc = desc;
    }

    public int getIdCat() {
        return idCat;
    }

    public void setIdCat(int idCat) {
        this.idCat = idCat;
    }

    public String getCate() {
        return cate;
    }

    public void setCate(String cate) {
        this.cate = cate;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
    
    
}
