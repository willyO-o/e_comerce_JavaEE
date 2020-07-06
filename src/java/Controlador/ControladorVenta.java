/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Carrito;
import Modelo.Cliente;
import Modelo.Venta;
import ModeloDAO.ClienteDAO;
import ModeloDAO.VentaDAO;
import com.google.gson.Gson;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author willy
 */
public class ControladorVenta extends HttpServlet {

    int idv;
    VentaDAO vdao = new VentaDAO();
    Venta v = new Venta();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        Gson objGson = new Gson();
        String json;

        switch (accion) {
            case "listar":
                List<Venta> lp1 = vdao.listar();

                json = objGson.toJson(lp1);
                String data = "{\"data\":" + json + "}";
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(data);
                break;
            case "factura":
                idv = Integer.parseInt(request.getParameter("idv"));
                double total=0;
                Cliente c = new Cliente();
                ClienteDAO cdao = new ClienteDAO();

                v = vdao.getVen(idv);
                List<Carrito> lic=vdao.listarDetalleVen(idv);
                System.out.println("tam "+lic.size());
                v.setCarr(lic);
                
                
                for (int i = 0; i < lic.size(); i++) {
                    total+=lic.get(i).getCan()*lic.get(i).getPre();
                    
                }
                
                
                c = cdao.getCli(v.getIdCl());
                
                request.setAttribute("total", total);
                request.setAttribute("cl", c);
                request.setAttribute("ve", v);

                request.getRequestDispatcher("Vista/VistaAdmin/factura.jsp").forward(request, response);

                break;
            case "venMes":
                Map<String, Double> m = vdao.ventasMes();
                json = objGson.toJson(m);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;
        }
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
