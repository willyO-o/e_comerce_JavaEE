/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUDUsuario;
import Modelo.Usuario;
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
public class UsuarioDAO implements CRUDUsuario {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    @Override
    public List listar() {
        List<Usuario> lis = new ArrayList<>();
        String sql = "SELECT * FROM usuario";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario p = new Usuario();
                p.setIdUs(rs.getInt(1));
                p.setEmail(rs.getString(2));
                p.setNom(rs.getString(3));
                p.setEst(rs.getInt(5));
                p.setUlCn(rs.getString(6));
                p.setApe(rs.getString(7));
                lis.add(p);
            }
        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return lis;
    }

    @Override
    public int add(Usuario cat) {
        String sql = "INSERT INTO usuario VALUES(null,?,?,MD5(?),1,NOW(),?)";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cat.getEmail());
            ps.setString(2, cat.getNom());
            ps.setString(3, cat.getPass());
            ps.setString(4, cat.getApe());
            r = ps.executeUpdate();

        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return r;
    }

    @Override
    public int update(Usuario cat) {
        String sql = "UPDATE  usuario SET email=?, nombre=?, password=MD5(?), apellido=?  WHERE id_usuario=? ";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cat.getEmail());
            ps.setString(2, cat.getNom());
            ps.setString(3, cat.getPass());
            ps.setString(4, cat.getApe());
            ps.setInt(5, cat.getIdUs());
            r = ps.executeUpdate();

        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return r;
    }

    @Override
    public int delete(int id) {
        String sql = "DELETE FROM usuario WHERE id_usuario=" + id;
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
    public Usuario getCat(int id) {
        String sql = "SELECT * FROM usuario WHERE id_usuario=" + id;
        Usuario p = new Usuario();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            rs.next();

            p.setIdUs(rs.getInt(1));
            p.setEmail(rs.getString(2));
            p.setNom(rs.getString(3));
            p.setEst(rs.getInt(5));
            p.setUlCn(rs.getString(6));
            p.setApe(rs.getString(7));


        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return p;
    }

    @Override
    public Usuario validar(String em, String pas) {
        Usuario c = new Usuario();
        String sql = "SELECT * FROM usuario WHERE email=? AND password=MD5(?) AND estado=1";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, em);
            ps.setString(2, pas);
            rs = ps.executeQuery();
            while (rs.next()) {
                c.setIdUs(rs.getInt(1));
                c.setEmail(rs.getString(2));
                c.setNom(rs.getString(3));
                c.setEst(rs.getInt(5));
                c.setUlCn(rs.getString(6));
                c.setApe(rs.getString(7));
            }

        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return c;
    }

    @Override
    public void upEstado(int id, int est) {
        String sql;
        if (est == 1) {
            sql = "UPDATE usuario SET estado=0 WHERE id_usuario=" + id;
        } else {
            sql = "UPDATE usuario SET estado=1 WHERE id_usuario=" + id;
        }
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            r = ps.executeUpdate();

        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }

    }

    public void upConexion(int id) {
        String sql = "UPDATE usuario SET ultima_conexion=NOW() WHERE id_usuario=" + id;
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            r = ps.executeUpdate();

        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }

    }

}
