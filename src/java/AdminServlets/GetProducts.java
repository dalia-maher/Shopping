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
@WebServlet(name = "GetProducts", urlPatterns = {"/GetProducts"})
public class GetProducts extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DBController dbcon = DBController.getInstance();
        resp.getWriter().write(new Gson().toJson(dbcon.getAllProducts(Integer.parseInt(req.getParameter("offset"))*10,10)));

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.getWriter().write(req.getServletContext().getRealPath(""));
    }

}
