/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.User;
import connections.DBController;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
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
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String userName = request.getParameter("uname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String job = request.getParameter("job");
        String address = request.getParameter("address");
        String bdate = request.getParameter("bdate");
        String credit = request.getParameter("credit");
        
        String[] selectedInterests = request.getParameterValues("interest");
        LocalDate date = LocalDate.parse(bdate);
        System.out.println("bdate = " + date);

        double creditValue = DBController.getInstance().getCreditValue(credit);
        
        User user = new User(email, userName, password, firstName, lastName, address, creditValue, false, Date.valueOf(date), job);
        boolean signed_up = DBController.getInstance().signUp(user);

        if(signed_up) {
            ArrayList<Integer> interests = new ArrayList<>(selectedInterests.length);
            for (String interest : selectedInterests) {
                interests.add(Integer.parseInt(interest.trim()));
            }

            DBController dbCon = DBController.getInstance();
            boolean added_interests = dbCon.insertInterests(user, interests);
            if(added_interests) {
                DBController.getInstance().updateCreditCard(credit, dbCon.getUserID(email));
                response.sendRedirect("register.jsp?success=1");
            }
        }
        else
            response.sendRedirect("register.jsp?failed=1");

    }

}
