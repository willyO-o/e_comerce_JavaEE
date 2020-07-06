
package Modelo;


public class Cliente {
    private int idCl;
    private String nom;
    private String ape;
    private String ci;
    private String email;
    private String pass;
    private String tel;
    private String dir;
    private String fec;
    private int ciu;
    private String ciud;
    private String res;

    public Cliente() {
    }

    public Cliente(int idCl, String nom, String ape, String ci, String email, String pass, String tel, String dir, String fec, int ciu, String ciud, String res) {
        this.idCl = idCl;
        this.nom = nom;
        this.ape = ape;
        this.ci = ci;
        this.email = email;
        this.pass = pass;
        this.tel = tel;
        this.dir = dir;
        this.fec = fec;
        this.ciu = ciu;
        this.ciud = ciud;
        this.res = res;
    }



    public int getIdCl() {
        return idCl;
    }

    public void setIdCl(int idCl) {
        this.idCl = idCl;
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

    public String getCi() {
        return ci;
    }

    public void setCi(String ci) {
        this.ci = ci;
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

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getDir() {
        return dir;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    public String getFec() {
        return fec;
    }

    public void setFec(String fec) {
        this.fec = fec;
    }

    public int getCiu() {
        return ciu;
    }

    public void setCiu(int ciu) {
        this.ciu = ciu;
    }

    public String getCiud() {
        return ciud;
    }

    public void setCiud(String ciud) {
        this.ciud = ciud;
    }
    

    public String getRes() {
        return res;
    }

    public void setRes(String res) {
        this.res = res;
    }
    
    
}
