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
import java.text.ParseException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
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
        
        PrintWriter out = response.getWriter();
        
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String userName = request.getParameter("uname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String job = request.getParameter("job");
        String address = request.getParameter("address");
        String bdate = request.getParameter("bdate");
        String creditStr = request.getParameter("credit");
        int credit;
        if(creditStr.equals(""))
            credit = 0;
        else
            credit = Integer.parseInt(creditStr);
        String[] selectedInterests = request.getParameterValues("interest");
        System.out.println(bdate);
        SimpleDateFormat sdf = new SimpleDateFormat("mm/dd/yyyy");
        try {
            Date birthDate = new Date(sdf.parse(bdate).getTime());
            User user = new User(email, userName, password, firstName, lastName, address, credit, false, birthDate, job);
            boolean signed_up = DBController.getInstance().signUp(user);
            
            if(signed_up) {
                ArrayList<Integer> interests = new ArrayList<>(selectedInterests.length);
                for (String interest : selectedInterests) {
                    interests.add(Integer.parseInt(interest.trim()));
                }
                boolean added_interests = DBController.getInstance().insertInterests(user, interests);
                if(added_interests)
                    response.sendRedirect("register.jsp?success=1");
            }
            else
                response.sendRedirect("register.jsp?failed=1");
        } catch (ParseException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }        

    }

}
