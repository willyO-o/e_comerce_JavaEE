/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Usuario;
import ModeloDAO.UsuarioDAO;
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
public class ControladorUser extends HttpServlet {

    int id;
    
    Usuario u=new Usuario();
    UsuarioDAO udao=new UsuarioDAO();
    

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
                List<Usuario> lp1 = udao.listar();
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
        switch (accion) {
            case "add":
                String nom = request.getParameter("nom");
                String ape = request.getParameter("ape");
                String ema = request.getParameter("email");
                String pas = request.getParameter("pas");
                u.setNom(nom);
                u.setApe(ape);
                u.setEmail(ema);
                u.setPass(pas);
                udao.add(u);
                u.setRes("exito");
                json = objGson.toJson(u);

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;

            case "edit":
                id = Integer.parseInt(request.getParameter("id"));
                u = udao.getCat(id);
                u.setRes("exito");
                json = objGson.toJson(u);
                
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;
            case "update":
                id = Integer.parseInt(request.getParameter("id"));
                String nom1 = request.getParameter("nom");
                String ape1 = request.getParameter("ape");
                String ema1 = request.getParameter("email");
                String pas1 = request.getParameter("pas");
                u.setIdUs(id);
                u.setEmail(ema1);
                u.setNom(nom1);
                u.setApe(ape1);
                u.setPass(pas1);
                udao.update(u);
                u.setRes("exito");
                json = objGson.toJson(u);

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;
            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                udao.delete(id);
                
                u=new Usuario();
                u.setRes("exito");
                json = objGson.toJson(u);

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;
            case "upEstado":
                id = Integer.parseInt(request.getParameter("id"));
                int est=Integer.parseInt(request.getParameter("est"));
                udao.upEstado(id, est);
                u=new Usuario();
                u.setRes("exito");
                json = objGson.toJson(u);

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
