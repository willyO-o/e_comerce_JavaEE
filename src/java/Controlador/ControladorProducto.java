/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Producto;
import ModeloDAO.ProductoDAO;
import com.google.gson.Gson;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author willy
 */
public class ControladorProducto extends HttpServlet {

    Producto p = new Producto();
    ProductoDAO pdao = new ProductoDAO();
    int idp;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //System.out.println("llego al request");
        String accion = request.getParameter("accion");
        Gson objGson = new Gson();
        String json;
        if (accion.equals("add")) {

            ArrayList<String> lista = new ArrayList<>();
            try {
                FileItemFactory file = new DiskFileItemFactory();
                ServletFileUpload fileUpload = new ServletFileUpload(file);
                List items = fileUpload.parseRequest(request);
                int co = 0;
                for (int i = 0; i < items.size(); i++) {
                    FileItem fileItem = (FileItem) items.get(i);
                    if (!fileItem.isFormField()) {
                        File f = new File("C:\\e_comerce\\web\\img\\" + fileItem.getName());
                        fileItem.write(f);
                        co++;
                        switch (co) {
                            case 1:
                                p.setImg("img/" + fileItem.getName());
                                break;
                            case 2:
                                p.setImg2("img/" + fileItem.getName());
                                break;
                            case 3:
                                p.setImg3("img/" + fileItem.getName());
                                break;
                            case 4:
                                p.setImg4("img/" + fileItem.getName());
                                break;
                        }

                    } else {
                        lista.add(fileItem.getString());
                    }
                }

            } catch (Exception e) {
            }
            p.setPro(lista.get(0));
            p.setDesPro(lista.get(1));
            p.setCarPro(lista.get(2));
            p.setPreVenta(Integer.parseInt(lista.get(3)));
            p.setStock(Integer.parseInt(lista.get(4)));
            p.setStockMin(Integer.parseInt(lista.get(5)));
            p.setIdCat(Integer.parseInt(lista.get(6)));
            p.setIdMarc(Integer.parseInt(lista.get(7)));
            p.setGaran(lista.get(8));
            if (pdao.add(p) == 1) {
                p = new Producto();
                p.setRes("exito");
            } else {
                p.setRes("error");
            }

            json = objGson.toJson(p);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);

        }
        if (accion.equalsIgnoreCase("update")) {
            idp = Integer.parseInt(request.getParameter("idp"));

            String pro = request.getParameter("prod");
            String des = request.getParameter("desc");
            String car = request.getParameter("carac");
            double pre = Double.parseDouble(request.getParameter("prec"));
            int stoc = Integer.parseInt(request.getParameter("stoc"));
            int stocmin = Integer.parseInt(request.getParameter("stocmin"));
            int cate = Integer.parseInt(request.getParameter("cate"));
            int marc = Integer.parseInt(request.getParameter("marc"));
            String garan = request.getParameter("garan");
            
            p.setInPro(idp);
            p.setPro(pro);
            p.setDesPro(des);
            p.setCarPro(car);
            p.setStock(stoc);
            p.setPreVenta(pre);
            p.setStockMin(stocmin);
            p.setIdCat(cate);
            p.setIdMarc(marc);
            p.setGaran(garan);
            pdao.update(p);
            p.setRes("exito");
            
            json = objGson.toJson(p);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
            p=new Producto();
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        Gson objGson = new Gson();
        String json;
        switch (accion) {
            case "listar":
                List<Producto> lp1 = pdao.Listar();

                json = objGson.toJson(lp1);
                String data = "{\"data\":" + json + "}";
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(data);
                break;

        }
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

        String accion = request.getParameter("accion");
        Gson objGson = new Gson();
        String json;
        //System.out.println(accion);
        switch (accion) {
            case "getPr":
                idp = Integer.parseInt(request.getParameter("idp"));
                Producto pr = pdao.getProducto(idp);
                json = objGson.toJson(pr);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                break;

            case "delete":
                idp=Integer.parseInt(request.getParameter("id"));
                pdao.delete(idp);
                p.setRes("exito");
                json = objGson.toJson(p);
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
