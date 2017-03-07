/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

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
 * @author Dalia
 */
@WebServlet(name = "CheckCredit", urlPatterns = {"/CheckCredit"})
public class CheckCredit extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String credit = request.getParameter("credit");
        try (PrintWriter out = response.getWriter()) {
            if(credit.trim().equals("")) {
                out.print("true");
            }
            else {
                int cardValue = DBController.getInstance().getCreditValue(credit);
                if(cardValue > 0)
                   out.print("true");
                else
                   out.print("false");
            }
        }
    }

}
