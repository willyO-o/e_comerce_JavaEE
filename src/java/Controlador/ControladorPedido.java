/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Carrito;
import Modelo.Pedido;
import Modelo.Venta;
import ModeloDAO.PedidoDAO;
import ModeloDAO.VentaDAO;
import com.google.gson.Gson;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author willy
 */
public class ControladorPedido extends HttpServlet {

    int idpd;
    Pedido pd = new Pedido();
    PedidoDAO pddao = new PedidoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        Gson objGson = new Gson();
        String json;
        
        switch (accion) {
            case "listar":
                List<Pedido> lp1 = pddao.listar();

                json = objGson.toJson(lp1);
                String data = "{\"data\":" + json + "}";
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(data);
                break;
        }
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        Gson objGson = new Gson();
        String json;
        HttpSession sesion = request.getSession();
        List<Carrito> li = new ArrayList<>();
        switch (accion) {
            case "estado":
                
                idpd=Integer.parseInt(request.getParameter("id"));
                if(pddao.estado(idpd)>0){
                    Venta v=new Venta();
                    pd=pddao.getPed(idpd);
                    VentaDAO vado=new VentaDAO();
                    v.setPago(pd.getPago());
                    v.setTot(pd.getTot());
                    v.setIdCl(pd.getIdCl());
                    li=pddao.listarDetallePed(idpd);

                    v.setCarr(li);
                    
                    vado.add(v);
                }
                pd=new Pedido();
                pd.setRes("exito");

                json = objGson.toJson(pd);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                
                break;
            case "add":

                String pago = request.getParameter("pago");

                li = (List<Carrito>) sesion.getAttribute("carrito");
                int idcl = Integer.parseInt(sesion.getAttribute("id").toString());
                double total = 0;
                String prod = "";
                for (int i = 0; i < li.size(); i++) {
                    total += li.get(i).getTot();
                    prod += li.get(i).getPro() + ", ";
                }

                pd.setPago(pago);
                pd.setProd(prod);
                pd.setTot(total);
                pd.setIdCl(idcl);
                pd.setCarr(li);
                pddao.add(pd);

                sesion.removeAttribute("carrito");
                pd.setRes("exito");
                json = objGson.toJson(pd);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                //System.out.println("llego eeee");
                break;
            case "cancel":
                break;
            case "delete":
                idpd=Integer.parseInt(request.getParameter("id"));
                pddao.delete(idpd);
                pd=new Pedido();
                pd.setRes("exito");

                json = objGson.toJson(pd);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;

        }

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
