/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Marca;
import ModeloDAO.MarcaDAO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author willy
 */
public class ControladorMarca extends HttpServlet {

    int idmr;
    Marca m = new Marca();
    MarcaDAO mdao = new MarcaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        Gson objGson = new Gson();
        String json;

        switch (accion) {
            case "listar":
                List<Marca> lp1 = mdao.listar();
                json = objGson.toJson(lp1);
                String data = "{\"data\":" + json + "}";
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(data);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        Gson objGson = new Gson();
        String json;
        switch (accion) {
            case "listar":
                List<Marca> lp1 = mdao.listar();
                json = objGson.toJson(lp1);
                
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;
            case "add":
                String marca = request.getParameter("marca");
                m.setMar(marca);
                mdao.add(m);
                m.setRes("exito");
                json = objGson.toJson(m);

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;

            case "edit":
                idmr = Integer.parseInt(request.getParameter("id"));
                m = mdao.getCat(idmr);
                m.setRes("exito");
                json = objGson.toJson(m);
                
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;
            case "update":
                idmr = Integer.parseInt(request.getParameter("id"));
                String marca1 = request.getParameter("marca");
                m.setIdMar(idmr);
                m.setMar(marca1);
                mdao.update(m);
                m.setRes("exito");
                json = objGson.toJson(m);

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;
            case "delete":
                idmr = Integer.parseInt(request.getParameter("id"));
                mdao.delete(idmr);
                
                m=new Marca();
                m.setRes("exito");
                json = objGson.toJson(m);

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;
        }
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
