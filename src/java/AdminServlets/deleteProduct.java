/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminServlets;

import com.google.gson.Gson;
import connections.DBController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mustafa
 */
@WebServlet(name = "deleteProduct", urlPatterns = {"/deleteProduct"})
public class deleteProduct extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DBController dbHandler = DBController.getInstance();
        resp.getWriter().write(dbHandler.deleteProduct(Integer.parseInt(req.getParameter("id"))) + "");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DBController dbHandler = DBController.getInstance();
        resp.getWriter().write(new Gson().toJson(dbHandler.getProduct(Integer.parseInt(req.getParameter("id")))));
    }
    
}
