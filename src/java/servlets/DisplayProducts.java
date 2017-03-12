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

   
}
