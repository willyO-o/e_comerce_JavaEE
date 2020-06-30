/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Carrito;
import Modelo.Producto;
import ModeloDAO.ProductoDAO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ControladorCarrito extends HttpServlet {

    Producto p = new Producto();
    ProductoDAO pdao = new ProductoDAO();
    int id;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Gson objGson = new Gson();
        String json;
        Carrito cr = new Carrito();
        String accion = request.getParameter("accion");
        id = Integer.parseInt(request.getParameter("id"));
        HttpSession sesion = request.getSession();
        List<Carrito> li = new ArrayList<>();
        switch (accion) {
            case "add":
                int can = Integer.parseInt(request.getParameter("can"));
                int pos = -1;

                if (sesion.getAttribute("carrito") != null) {
                    li = (List<Carrito>) sesion.getAttribute("carrito");

                    for (int i = 0; i < li.size(); i++) {
                        if (li.get(i).getIdPr() == id) {
                            pos = i;

                        }
                    }
                    if (pos == -1) {

                        p = pdao.getProducto(id);

                        cr.setIdPr(p.getInPro());
                        cr.setPro(p.getPro());
                        cr.setImg(p.getImg());
                        cr.setPre(p.getPreVenta());
                        cr.setStok(p.getStock());
                        cr.setCan(can);
                        if (cr.getCan() > cr.getStok()) {
                            cr.setCan(cr.getStok());
                        }
                        cr.setTot(p.getPreVenta() * cr.getCan());
                        
                        li.add(cr);
                    } else {
                        li.get(pos).setCan(li.get(pos).getCan() + can);
                        if (li.get(pos).getCan() > li.get(pos).getStok()) {
                            li.get(pos).setCan(li.get(pos).getStok());
                        }
                        li.get(pos).setTot(li.get(pos).getPre() * li.get(pos).getCan());
                        
                        cr.setPro(li.get(pos).getPro());
                    }

                } else {
                    p = pdao.getProducto(id);
                    cr.setIdPr(p.getInPro());
                    cr.setPro(p.getPro());
                    cr.setImg(p.getImg());
                    cr.setPre(p.getPreVenta());
                    cr.setStok(p.getStock());
                    cr.setCan(can);
                    if (cr.getCan() > cr.getStok()) {
                        cr.setCan(cr.getStok());
                    }
                    cr.setTot(p.getPreVenta() * cr.getCan());
                    
                    li.add(cr);

                }
                //System.out.println("llego aqui " + can);
                sesion.setAttribute("carrito", li);
                request.setAttribute("canCarrito", li.size());
                cr.setRes("exito");
                json = objGson.toJson(cr);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);

                break;
            case "delete":
                li = (List<Carrito>) sesion.getAttribute("carrito");
                for (int i = 0; i < li.size(); i++) {
                    if (id == li.get(i).getIdPr()) {
                        li.remove(i);
                    }
                }
                if (li.isEmpty()) {
                    sesion.removeAttribute("carrito");
                }
                sesion.setAttribute("carrito", li);
                request.setAttribute("canCarrito", li.size());
                cr.setRes("exito");
                json = objGson.toJson(cr);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;

            case "tam":
                //System.out.println("llego asdasd");
                li = (List<Carrito>) sesion.getAttribute("carrito");
                cr.setIdPr(li.size());
                cr.setRes("exito");

                json = objGson.toJson(cr);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;
            case "update":
                //System.out.println("llego asdasd");

                int cant = Integer.parseInt(request.getParameter("can"));
                int posi = -1;

                li = (List<Carrito>) sesion.getAttribute("carrito");

                for (int i = 0; i < li.size(); i++) {
                    if (li.get(i).getIdPr() == id) {
                        posi = i;
                    }
                }
                li.get(posi).setCan(cant);
                if (li.get(posi).getCan() > li.get(posi).getStok()) {
                    li.get(posi).setCan(li.get(posi).getStok());
                }
                li.get(posi).setTot(li.get(posi).getPre() * li.get(posi).getCan());
                
                cr.setTot(li.get(posi).getTot());
                cr.setPro(li.get(posi).getPro());
                cr.setIdPr(li.size());
                cr.setRes("exito");

                json = objGson.toJson(cr);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;
            
            case "getTotal":
                li = (List<Carrito>) sesion.getAttribute("carrito");
                double total=0;
                for (int i = 0; i < li.size(); i++) {
                    total+=li.get(i).getTot();
                }
                cr.setTot(total);
                cr.setRes("exito");

                json = objGson.toJson(cr);
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
