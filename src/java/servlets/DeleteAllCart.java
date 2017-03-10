/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.User;
import connections.DBController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mrawi
 */
@WebServlet(name = "DeleteAllCart", urlPatterns = {"/DeleteAllCart"})
public class DeleteAllCart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession userSession = request.getSession(false);
        User currentUser = (User) userSession.getAttribute("loggedInUser");
       
        
        if(DBController.getInstance().resetShoppingCart(currentUser.getCustomerID())){
            response.getWriter().print("true");
        }

    }

}
