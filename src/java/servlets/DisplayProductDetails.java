package servlets;

import beans.*;
import beans.Product;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
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
 * @author TahanyFawzy
 */
@WebServlet(name = "DisplayProductDetails", urlPatterns = {"/DisplayProductDetails"})
public class DisplayProductDetails extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String id = request.getParameter("productID");
        int ID = Integer.parseInt(id);
        Product product = DBController.getInstance().getProduct(ID);
        response.setContentType("applecation/json");
        PrintWriter out = response.getWriter();
        GsonBuilder gsonB = new GsonBuilder();
        Gson gson = gsonB.create();
        out.println(gson.toJson(product)); 
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}
