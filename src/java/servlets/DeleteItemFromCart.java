/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.User;
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
@WebServlet(name = "DeleteItemFromCart", urlPatterns = {"/DeleteItemFromCart"})
public class DeleteItemFromCart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession userSession = req.getSession(false);
        User currentUser = (User) userSession.getAttribute("loggedInUser");
        int productID = Integer.parseInt(req.getParameter("productID"));
        DBController.getInstance().removeFromShoppingCart(productID, currentUser.getCustomerID());
    }

}