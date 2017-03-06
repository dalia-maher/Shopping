/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.Category;
import connections.DBController;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dalia
 */
@WebServlet(name = "ShowCategories", urlPatterns = {"/ShowCategories"})
public class ShowCategories extends HttpServlet {

    ServletConfig config;
    
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        this.config = config;

    }
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ArrayList<Category> categories = DBController.getInstance().getAllCategories();

        request.setAttribute("categoriesList", categories);
        config.getServletContext().setAttribute("categoriesList", categories);
        

    }

}
