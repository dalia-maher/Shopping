/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.User;
import com.google.gson.Gson;
import connections.DBController;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dalia
 */
@WebServlet(name = "CheckOut", urlPatterns = {"/CheckOut"})
public class CheckOut extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession userSession = req.getSession(false);
        User currentUser = (User) userSession.getAttribute("loggedInUser");
        if(currentUser != null) {
            resp.getWriter().write(new Gson().toJson((DBController.getInstance().getShoppingCart(currentUser.getCustomerID() + ""))));
        }
    }

}