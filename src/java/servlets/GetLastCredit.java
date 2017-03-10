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
@WebServlet(name = "GetLastCredit", urlPatterns = {"/GetLastCredit"})
public class GetLastCredit extends HttpServlet {

   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
             HttpSession userSession = request.getSession(false);
         User currentUser = (User) userSession.getAttribute("loggedInUser");
        if (currentUser != null) {
            double updatedCredit=DBController.getInstance().getCreditValue(currentUser.getCustomerID());
            if(updatedCredit != -1)
            response.getWriter().print(updatedCredit);
            else
               response.getWriter().print(updatedCredit); 
        }
    }

   
}
