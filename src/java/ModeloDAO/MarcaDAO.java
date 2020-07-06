/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUDMarca;
import Modelo.Marca;
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
public class MarcaDAO implements CRUDMarca {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    @Override
    public List listar() {
        List<Marca> lis = new ArrayList<>();
        String sql = "SELECT * FROM marca";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Marca p = new Marca();
                p.setIdMar(rs.getInt(1));
                p.setMar(rs.getString(2));
                lis.add(p);
            }
        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return lis;
    }

    @Override
    public int add(Marca cat) {
        String sql = "INSERT INTO marca VALUES(null,?)";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cat.getMar());
            r = ps.executeUpdate();

        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return r;
    }

    @Override
    public int update(Marca id) {
        String sql = "UPDATE marca SET marca=? WHERE id_marca=?";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, id.getMar());
            ps.setInt(2, id.getIdMar());
            r = ps.executeUpdate();

        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return r;
    }

    @Override
    public int delete(int id) {
        String sql = "DELETE FROM marca WHERE id_marca=" + id;
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            r = ps.executeUpdate();

        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }

        return r;
    }

    @Override
    public Marca getCat(int id) {
        String sql = "SELECT * FROM marca WHERE id_marca=" + id;
        Marca p = new Marca();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            rs.next();

            p.setIdMar(rs.getInt(1));
            p.setMar(rs.getString(2));

        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return p;
    }
}
