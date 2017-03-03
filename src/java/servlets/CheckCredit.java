/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.CreditCard;
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
 * @author Dalia
 */
@WebServlet(name = "CheckCredit", urlPatterns = {"/CheckCredit"})
public class CheckCredit extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<CreditCard> creditCards = DBController.getInstance().getAllCredits();
        boolean valid = false;
        try (PrintWriter out = response.getWriter()) {
            int cardID = Integer.parseInt(request.getParameter("cardID"));
            for(int i = 0; i < creditCards.size(); i++) {
                if(cardID == creditCards.get(i).getCardID())
                    valid = true;
                else
                    valid = false;
            }
            if(valid)
               out.print("Valid Card ID!");
            else
                out.print("Invalid Card ID!");
        }
                
    }

}
