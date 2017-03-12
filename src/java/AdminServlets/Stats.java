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
@WebServlet(name = "Stats", urlPatterns = {"/Stats"})
public class Stats extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            if (req.getParameter("type").equals("order")) {
            resp.getWriter().write(new Gson().toJson(DBController.getInstance().selectTodayOrders()));
        }
            else if (req.getParameter("type").equals("contact")) {
            resp.getWriter().write(new Gson().toJson(DBController.getInstance().selectTodayOrders()));
        }
            
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String user= DBController.getInstance().getValue("Select count(*) AS count from customer where type!=1", "count");
       String product= DBController.getInstance().getValue("Select count(*) AS count from product ", "count");
       String order=DBController.getInstance().getValue("SELECT Count(*) AS count FROM shopping.`order` where DATE(`date`) = CURDATE()", "count");               
       resp.getWriter().write(user+"&&"+product+"&&"+order);
    }

   
}
