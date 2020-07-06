/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Cliente;
import ModeloDAO.ClienteDAO;
import com.google.gson.Gson;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author willy
 */
public class ControladorCliente extends HttpServlet {

    Cliente c = new Cliente();
    ClienteDAO cdao = new ClienteDAO();
    int id;

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
                List<Cliente> lp1 = cdao.listar();

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
                String ci = request.getParameter("ci");
                String email = request.getParameter("email");
                String pass = request.getParameter("pass");
                String tel = request.getParameter("tel");
                String dir = request.getParameter("dir");
                int ciu = Integer.parseInt(request.getParameter("ciu"));

                c = new Cliente(0, nom, ape, ci, email, pass, tel, dir, "", ciu, "", "");

                cdao.add(c);
                c.setRes("exito");
                json = objGson.toJson(c);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);

                break;
            case "contact":

                String name = request.getParameter("name");
                String phone = request.getParameter("phone");
                String ema = request.getParameter("email");
                String mess = request.getParameter("message");
                cdao.addContacto(name, phone, ema, mess);
                System.out.println("ejecuto");
                c = new Cliente();
                c.setRes("exito");
                json = objGson.toJson(c);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);

                break;
            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                cdao.delete(id);
                c = new Cliente();
                c.setRes("exito");
                json = objGson.toJson(c);
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
