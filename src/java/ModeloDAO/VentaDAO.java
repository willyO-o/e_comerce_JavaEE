package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUDVenta;
import Modelo.Carrito;
import Modelo.Venta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class VentaDAO implements CRUDVenta {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    @Override
    public List listar() {
        List<Venta> lis = new ArrayList<>();
        String sql = "SELECT * FROM venta";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Venta c = new Venta();
                c.setIdVn(rs.getInt(1));
                c.setPago(rs.getString(2));
                c.setTot(rs.getDouble(3));
                c.setFech(rs.getString(4));
                c.setIdCl(rs.getInt(5));

                lis.add(c);
            }
        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return lis;

    }

    @Override
    public int add(Venta pe) {
        String sql = "INSERT INTO venta VALUES(null,?,?,NOW(),?)";
        int id;
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, pe.getPago());
            ps.setDouble(2, pe.getTot());
            ps.setInt(3, pe.getIdCl());
            r = ps.executeUpdate();

            id = ultimoId();
            for (int i = 0; i < pe.getCarr().size(); i++) {
                detalleVen(id, pe.getCarr().get(i).getIdPr(), pe.getCarr().get(i).getCan(), pe.getCarr().get(i).getPre());
            }

        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return r;

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
    public Venta getVen(int id) {
        Venta c = new Venta();
        String sql = "SELECT * FROM venta WHERE id_venta=" + id;
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            rs.next();
            c.setIdVn(rs.getInt(1));
            c.setPago(rs.getString(2));
            c.setTot(rs.getDouble(3));
            c.setFech(rs.getString(4));
            c.setIdCl(rs.getInt(5));

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
        String sql = "SELECT MAX(id_venta) FROM venta";
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
    public int detalleVen(int id, int idp, int can, double pre) {
        String sql = "INSERT INTO participa VALUES(?,?,?,?)";
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

    public List listarDetalleVen(int id) {
        List<Carrito> lis = new ArrayList<>();
        String sql = "SELECT producto,cantidad_pro,precio FROM participa JOIN producto USING(id_producto) WHERE id_venta=" + id;
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Carrito c = new Carrito();
                c.setPro(rs.getString(1));
                c.setCan(rs.getInt(2));
                c.setPre(rs.getDouble(3));
                lis.add(c);
            }
        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }
        return lis;

    }

    public Map ventasMes() {
        Map<String, Double> m = new HashMap<>();
        String sql = "SELECT Mes,IFNULL(Total,0) total \n"
                + "                FROM (SELECT 1 as IdMes , 'Enero'  as Mes UNION\n"
                + "                SELECT 2 as IdMes , 'Febrero'    as Mes UNION\n"
                + "                 SELECT 3 as IdMes , 'Marzo'      as Mes UNION\n"
                + "                SELECT 4 as IdMes , 'Abril'      as Mes UNION\n"
                + "                SELECT 5 as IdMes , 'Mayo'       as Mes UNION\n"
                + "                 SELECT 6 as IdMes , 'Junio'      as Mes UNION\n"
                + "                 SELECT 7 as IdMes , 'Julio'      as Mes UNION\n"
                + "                 SELECT 8 as IdMes , 'Agosto'     as Mes UNION\n"
                + "                 SELECT 9 as IdMes , 'Septiembre' as Mes UNION\n"
                + "               SELECT 10 as IdMes, 'Octubre'    as Mes UNION\n"
                + "                SELECT 11 as IdMes, 'Noviembre'  as Mes UNION\n"
                + "                 SELECT 12 as IdMes, 'Diciembre'  as Mes) M\n"
                + "          \n"
                + "               LEFT JOIN (SELECT MONTH(v.fecha_venta) AS Ms,YEAR(v.fecha_venta) AS anio,ROUND(SUM(v.total_pago),2)  Total\n"
                + "               FROM venta v\n"
                + "                WHERE v.fecha_venta BETWEEN DATE_SUB(NOW(),INTERVAL '1-1' YEAR_MONTH) AND now()\n"
                + "             GROUP BY Ms) T ON M.IdMes=T.Ms";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                m.put(rs.getString(1), rs.getDouble(2));
            }

        } catch (SQLException e) {
        } finally {
            cn.cerrar();
        }

        return m;
    }

}
