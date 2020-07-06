/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUDCategoria;
import Modelo.Categoria;
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
public class CategoriaDAO implements CRUDCategoria {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    @Override
    public List listar() {
        List<Categoria> lis = new ArrayList<>();
        String sql = "SELECT * FROM categoria";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Categoria p = new Categoria();
                p.setIdCat(rs.getInt(1));
                p.setCate(rs.getString(2));
                p.setDesc(rs.getString(3));

                lis.add(p);
            }
        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return lis;
    }

    @Override
    public int add(Categoria cat) {
        String sql = "INSERT INTO categoria VALUES(null,?,?)";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cat.getCate());
            ps.setString(2, cat.getDesc());
            r = ps.executeUpdate();

        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return r;
    }

    @Override
    public int update(Categoria id) {
        String sql = "UPDATE categoria SET categoria=?,descripcion=? WHERE id_categoria=?";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, id.getCate());
            ps.setString(2, id.getDesc());
            ps.setInt(3, id.getIdCat());
            r = ps.executeUpdate();

        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return r;
    }

    @Override
    public int delete(int id) {
        String sql = "DELETE FROM categoria WHERE id_categoria=" + id;
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
    public Categoria getCat(int id) {
        String sql = "SELECT * FROM categoria WHERE id_categoria=" + id;
        Categoria p = new Categoria();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            rs.next();

            p.setIdCat(rs.getInt(1));
            p.setCate(rs.getString(2));
            p.setDesc(rs.getString(3));

        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return p;
    }

}
