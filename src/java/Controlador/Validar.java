/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Cliente;
import Modelo.Usuario;
import ModeloDAO.ClienteDAO;
import ModeloDAO.UsuarioDAO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author willy
 */
public class Validar extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion=request.getParameter("accion");
        if (accion.equalsIgnoreCase("salir")) {
            HttpSession session=request.getSession();
            session.invalidate();
            response.sendRedirect("index.jsp");
        }
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion=request.getParameter("accion");
        
        if(accion.equals("login")){
            String email=request.getParameter("email");
            String pass=request.getParameter("pass");
            Gson objGson = new Gson();
            
            ClienteDAO cdao=new ClienteDAO();
            UsuarioDAO udao=new UsuarioDAO();
            
            Cliente c=cdao.validar(email, pass);
            Usuario u = udao.validar(email, pass);
            HttpSession session=request.getSession();
            //System.out.println("normal+");
            if (u.getNom() != null) {
                u.setRes("user");

                session.setAttribute("id", u.getIdUs());
                session.setAttribute("nombre", u.getNom());
                session.setAttribute("apellido", u.getApe());
                session.setAttribute("email", u.getEmail());
                session.setAttribute("tipo", "admin");
                String json = objGson.toJson(u);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                
            } else if (c.getNom() != null) {
                
                c.setRes("cliente");
                session.setAttribute("id", c.getIdCl());
                session.setAttribute("nombre", c.getNom());
                session.setAttribute("apellido", c.getApe());
                session.setAttribute("email", c.getEmail());
                session.setAttribute("tipo", "cliente");
                String json = objGson.toJson(c);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            }else{
                c.setRes("error");
                String json = objGson.toJson(c);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            }
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
