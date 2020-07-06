package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUDPedido;
import Modelo.Carrito;
import Modelo.Pedido;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PedidoDAO implements CRUDPedido {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    @Override
    public List listar() {
        List<Pedido> lis = new ArrayList<>();
        String sql = "SELECT * FROM pedido";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Pedido c = new Pedido();
                c.setIdPd(rs.getInt(1));
                c.setPago(rs.getString(2));
                c.setProd(rs.getString(3));
                c.setTot(rs.getDouble(4));
                c.setFech(rs.getString(5));
                c.setEsta(rs.getInt(6));
                c.setIdCl(rs.getInt(7));

                lis.add(c);
            }
        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return lis;

    }

    @Override
    public int add(Pedido pe) {
        String sql = "INSERT INTO pedido VALUES(null,?,?,?,NOW(),1,?)";
        int id;
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, pe.getPago());
            ps.setString(2, pe.getProd());
            ps.setDouble(3, pe.getTot());
            ps.setInt(4, pe.getIdCl());
            r = ps.executeUpdate();

            id = ultimoId();
            for (int i = 0; i < pe.getCarr().size(); i++) {
                detallePe(id, pe.getCarr().get(i).getIdPr(), pe.getCarr().get(i).getCan(), pe.getCarr().get(i).getPre());
            }

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
        String sql = "DELETE FROM pedido WHERE id_pedido=" + id;
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
    public Pedido getPed(int id) {
        Pedido c = new Pedido();
        String sql = "SELECT * FROM pedido WHERE id_pedido=" + id;
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            rs.next();
            c.setIdPd(rs.getInt(1));
            c.setPago(rs.getString(2));
            c.setProd(rs.getString(3));
            c.setTot(rs.getDouble(4));
            c.setFech(rs.getString(5));
            c.setEsta(rs.getInt(6));
            c.setIdCl(rs.getInt(7));


        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return c;
    }

    public int estado(int id) {

        String sql = "UPDATE pedido SET estado_pedido=2 WHERE id_pedido=" + id;
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
    public int ultimoId() {
        int id = 0;
        String sql = "SELECT MAX(id_pedido) FROM pedido";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            rs.next();
            id = rs.getInt(1);
        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }

        return id;
    }

    @Override
    public int detallePe(int id, int idp, int can, double pre) {
        String sql = "INSERT INTO participa_pedido VALUES(?,?,?,?)";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, idp);
            ps.setInt(3, can);
            ps.setDouble(4, pre);
            r = ps.executeUpdate();

        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return r;
    }
    
    public List listarDetallePed(int id) {
        List<Carrito> lis = new ArrayList<>();
        String sql = "SELECT * FROM participa_pedido WHERE id_pedido="+id;
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Carrito c = new Carrito();
                c.setIdPr(rs.getInt(2));
                c.setCan(rs.getInt(3));
                c.setPre(rs.getDouble(4));
                lis.add(c);
            }
        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return lis;

    }

}
