/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Categoria;
import ModeloDAO.CategoriaDAO;
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
public class ControladorCategoria extends HttpServlet {

    Categoria c = new Categoria();
    CategoriaDAO cdao = new CategoriaDAO();
    int idcat;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        Gson objGson = new Gson();
        String json;
        switch (accion) {
            case "listar":
                List<Categoria> lp1 = cdao.listar();
                json = objGson.toJson(lp1);
                String data = "{\"data\":" + json + "}";
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(data);
                break;
        }
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
        String accion = request.getParameter("accion");
        Gson objGson = new Gson();
        String json;
        switch (accion) {
            case "add":

                String cate = request.getParameter("cate");
                String des = request.getParameter("des");
                c.setCate(cate);
                c.setDesc(des);
                cdao.add(c);
                c.setRes("exito");
                json = objGson.toJson(c);
                
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;
            case "edit":
                idcat = Integer.parseInt(request.getParameter("id"));
                c = cdao.getCat(idcat);
                c.setRes("exito");
                json = objGson.toJson(c);

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;
            case "update":
                idcat = Integer.parseInt(request.getParameter("id"));
                String cate1 = request.getParameter("cate");
                String des1 = request.getParameter("des");
                c.setIdCat(idcat);
                c.setCate(cate1);
                c.setDesc(des1);
                cdao.update(c);
                c.setRes("exito");
                json = objGson.toJson(c);

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;
            case "delete":
                idcat = Integer.parseInt(request.getParameter("id"));
                cdao.delete(idcat);

                c = new Categoria();
                c.setRes("exito");
                json = objGson.toJson(c);

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
