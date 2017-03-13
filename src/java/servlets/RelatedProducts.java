/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.Product;
import com.google.gson.Gson;
import connections.DBController;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mrawi
 */
@WebServlet(name = "RelatedProducts", urlPatterns = {"/RelatedProducts"})
public class RelatedProducts extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String id = request.getParameter("productID");
         if(id!= null){
              int productID= Integer.parseInt(id);
              Product product = DBController.getInstance().getProduct(productID);
               ArrayList<Product> allProducts = DBController.getInstance().getProductsCategory(product.getCategory().getCategoryID());
              request.setAttribute("peroductList", allProducts);
              
              // response.getWriter().print(this.builGsonFromObject(allProducts));
         }
          
        
    }
    
   

}
