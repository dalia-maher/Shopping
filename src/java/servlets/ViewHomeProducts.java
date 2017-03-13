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
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mrawi
 */
@WebServlet(name = "ViewHomeProducts", urlPatterns = {"/ViewHomeProducts"})
public class ViewHomeProducts extends HttpServlet {
    ArrayList<Product> products ;
    private Random randomGenerator = new Random();
   // Product randProduct;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
           products=DBController.getInstance().getAllProducts();
           
           response.getWriter().print(this.builGsonFromObject(products));
           for(int i=0;i<products.size();i++){
               System.out.println(products.get(i).getCategory().getName());
           }
//           if(products.size()>0){
//              randProduct = this.anyItem();
//           }
            
    }
     private String builGsonFromObject(ArrayList<Product> product) {
        Gson gsonUser = new Gson();
        return gsonUser.toJson(product);
    }
//     private Product anyItem()
//    {
//        int index = randomGenerator.nextInt(products.size());
//        Product randItem = products.get(index);
//        System.out.println("Managers choice this week" + randItem + "our recommendation to you");
//        return randItem;
//    }

}
