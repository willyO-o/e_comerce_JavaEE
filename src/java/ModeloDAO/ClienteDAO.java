package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUDCliente;
import Modelo.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO implements CRUDCliente {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    @Override
    public List listar() {
        List<Cliente> lis = new ArrayList<>();
        String sql = "SELECT * FROM cliente JOIN ciudad USING (id_ciudad)";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cliente c = new Cliente();
                c.setCiu(rs.getInt(1));
                c.setIdCl(rs.getInt(2));
                c.setNom(rs.getString(3));
                c.setApe(rs.getString(4));
                c.setCi(rs.getString(5));
                c.setEmail(rs.getString(6));
                c.setFec(rs.getString(8));
                c.setTel(rs.getString(9));
                c.setDir(rs.getString(10));
                c.setCiud(rs.getString(11));

                lis.add(c);
            }
        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return lis;
    }

    @Override
    public int add(Cliente cli) {

        String sql = "INSERT INTO cliente VALUES(null,?,?,?,?,MD5(?),NOW(),?,?,?)";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cli.getNom());
            ps.setString(2, cli.getApe());
            ps.setString(3, cli.getCi());
            ps.setString(4, cli.getEmail());
            ps.setString(5, cli.getPass());
            ps.setString(6, cli.getTel());
            ps.setString(7, cli.getDir());
            ps.setInt(8, cli.getCiu());
            r = ps.executeUpdate();

        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return r;
    }

    @Override
    public int update(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(int id) {
        String sql = "DELETE FROM cliente WHERE id_cliente=?";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            r = ps.executeUpdate();
        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }

        return r;
    }

    @Override
    public Cliente getCli(int id) {
        Cliente c = new Cliente();
        String sql = "SELECT * FROM cliente WHERE id_cliente=" + id;
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            rs.next();
            c.setIdCl(rs.getInt(1));
            c.setNom(rs.getString(2));
            c.setApe(rs.getString(3));
            c.setCi(rs.getString(4));
            c.setEmail(rs.getString(5));
            c.setFec(rs.getString(7));
            c.setTel(rs.getString(8));
            c.setDir(rs.getString(9));
            c.setCiu(rs.getInt(10));

        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return c;
    }

    @Override
    public Cliente validar(String em, String pas) {
        Cliente c = new Cliente();
        String sql = "SELECT * FROM cliente WHERE correo=? AND password=MD5(?)";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, em);
            ps.setString(2, pas);
            rs = ps.executeQuery();
            while (rs.next()) {
                c.setIdCl(rs.getInt(1));
                c.setNom(rs.getString(2));
                c.setApe(rs.getString(3));
                c.setCi(rs.getString(4));
                c.setEmail(rs.getString(5));
                c.setFec(rs.getString(7));
                c.setTel(rs.getString(8));
                c.setDir(rs.getString(9));
                c.setCiu(rs.getInt(10));
            }

        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return c;
    }

    @Override
    public int addContacto(String na, String te, String em, String me) {
        String sql = "INSERT INTO contacto VALUES(null,?,?,?,?,NOW())";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, na);
            ps.setString(2, te);
            ps.setString(3, em);
            ps.setString(4, me);
            r = ps.executeUpdate();

        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return r;
    }
}
