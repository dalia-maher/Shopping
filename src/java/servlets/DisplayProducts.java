/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.Product;
import com.google.gson.Gson;
import connections.DBController;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mrawi
 */
public class DisplayProducts extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet displayProduct</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet displayProduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
            
            
            PrintWriter out = response.getWriter();
           DBController db = DBController.getInstance();
          
         
            
        int numberNewproduct=0 ,  CategoryIDInt=0;
        String productNo = request.getParameter("numberOfPro");
        String CategoryID = request.getParameter("categoryID");
        
        if (productNo != null && CategoryID != null ) {
            CategoryIDInt = Integer.parseInt(CategoryID);
            System.out.println("servlets.DisplayProduct.doGet()"+"///cat Id"+ CategoryID);
            numberNewproduct = Integer.parseInt(productNo);
        }
        String path = request.getServletContext().getRealPath("");
      
          ArrayList<Product> allProducts = db.getProductsCategory(CategoryIDInt);
          
          System.out.println("servlets.DisplayProduct.doGet()"+allProducts.size());
        ArrayList<Product> newProduct = new ArrayList<>();
        
        for (int i = numberNewproduct,j=0; i < allProducts.size(); i++,j++) {
            // File temp=new File(path+"\\images\\" +allProducts.get(i).getName().trim()+j+".jpg");
            newProduct.add(allProducts.get(i));
        }
        out.print(this.builGsonFromObject(newProduct));
    }

           
          
     private String builGsonFromObject(ArrayList<Product> product) {
        Gson gsonUser = new Gson();
        return gsonUser.toJson(product);
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
