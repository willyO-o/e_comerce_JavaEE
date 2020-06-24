/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUDProducto;
import Modelo.Producto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author willy
 */
public class ProductoDAO implements CRUDProducto {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;

    @Override
    public List Listar() {
        List<Producto> lis = new ArrayList<>();
        String sql = "SELECT * FROM producto JOIN categora USING(id_categoria) JOIN marca";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setIdMarc(rs.getInt(1));
                p.setIdCat(rs.getInt(2));
                p.setInPro(rs.getInt(3));
                p.setPro(rs.getString(4));
                p.setImg(rs.getString(5));
                p.setDesPro(rs.getString(6));
                p.setCarPro(rs.getString(7));
                p.setStock(rs.getInt(8));
                p.setStockMin(rs.getInt(9));
                p.setPreVenta(rs.getDouble(10));
                p.setGaran(rs.getString(11));
                p.setCate(rs.getString(12));
                p.setMarc(rs.getString(14));
                lis.add(p);
            }
        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return lis;

    }

    @Override
    public Producto getProducto(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int add(Producto pr) {
        int id;
        String sql = "INSERT INTO producto VALUES(null,?,?,?,?,?,?,?,?,?,?)";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, pr.getPro());
            ps.setString(2, pr.getImg());
            ps.setString(3, pr.getDesPro());
            ps.setString(4, pr.getCarPro());
            ps.setInt(5, pr.getStock());
            ps.setInt(6, pr.getStockMin());
            ps.setDouble(7, pr.getPreVenta());
            ps.setString(8, pr.getGaran());
            ps.setInt(9, pr.getIdMarc());
            ps.setInt(10, pr.getIdCat());
            r = ps.executeUpdate();
            
            id=ultimoId();
            
            images(id, pr.getImg2(), pr.getImg3(), pr.getImg4());
            
        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return r;
    }

    @Override
    public int update(Producto pr) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int existe(String pr) {
        int res = 0;
        String sql = "SELECT COUNT(*) FROM producto WHERE producto=?";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, pr);
            rs = ps.executeQuery();
            rs.next();
            res = rs.getInt(1);
        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }

        return res;
    }

    @Override
    public int images(int id, String im2, String im3, String im4) {
        String sql = "INSERT INTO imagenes VALUES(?,?,?,?)";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, im2);
            ps.setString(3, im3);
            ps.setString(4, im4);
            r=ps.executeUpdate();
        } catch (SQLException e) {
        }finally{
            cn.cerrar();
        }
        return r;
    }
    @Override
    public int ultimoId() {
        int res = 0;
        String sql = "SELECT MAX(id_producto) FROM producto";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            rs.next();
            res = rs.getInt(1);
        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }

        return res;
    }
}
