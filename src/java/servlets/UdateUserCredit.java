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
@WebServlet(name = "UdateUserCredit", urlPatterns = {"/UdateUserCredit"})
public class UdateUserCredit extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        String cardId = request.getParameter("creditID");

        HttpSession userSession = request.getSession(false);
        User currentUser = (User) userSession.getAttribute("loggedInUser");

        if (currentUser != null) {
            User oldUser = currentUser;
            double oldCredit = oldUser.getCredit();
            System.out.println("old Credit --->"+oldCredit);
            double newCrrdit = DBController.getInstance().getCreditValue(cardId);
            System.out.println("new Credit --->"+oldCredit);
           if (DBController.getInstance().updateCreditCard(cardId,currentUser.getCustomerID())){
               currentUser.setCredit(oldCredit+newCrrdit);
                
               System.out.println("servlets.UdateUserCredit.doPost()"+currentUser.getCredit());
               userSession.setAttribute("loggedInUser",currentUser);
               DBController.getInstance().updateCustomer(oldUser, currentUser);
               out.print(currentUser.getCredit());
               System.out.println(" last new Credit --->"+currentUser.getCredit());
           }
           else{
               out.print("false");
           }
        }
    }

 
}
