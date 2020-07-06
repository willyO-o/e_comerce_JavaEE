
package Modelo;


public class Usuario {
    private int idUs;
    private String nom;
    private String ape;
    private String email;
    private String pass;
    private int est;
    private String ulCn;
    private String res;

    public Usuario() {
    }

    public Usuario(int idUs, String nom, String ape, String email, String pass, int est, String ulCn, String res) {
        this.idUs = idUs;
        this.nom = nom;
        this.ape = ape;
        this.email = email;
        this.pass = pass;
        this.est = est;
        this.ulCn = ulCn;
        this.res = res;
    }

    public int getIdUs() {
        return idUs;
    }

    public void setIdUs(int idUs) {
        this.idUs = idUs;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getApe() {
        return ape;
    }

    public void setApe(String ape) {
        this.ape = ape;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getEst() {
        return est;
    }

    public void setEst(int est) {
        this.est = est;
    }

    public String getUlCn() {
        return ulCn;
    }

    public void setUlCn(String ulCn) {
        this.ulCn = ulCn;
    }

    public String getRes() {
        return res;
    }

    public void setRes(String res) {
        this.res = res;
    }
    
    
    
    
}
