/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import connections.DBController;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dalia
 */
@WebServlet(name = "ValidateEmail", urlPatterns = {"/ValidateEmail"})
public class ValidateEmail extends HttpServlet {

    public static final Pattern VALID_EMAIL_ADDRESS_REGEX
        = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$",
                Pattern.CASE_INSENSITIVE);

    public static boolean isValidEmail(String emailStr) {
        Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(emailStr);
        return matcher.find();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        try (PrintWriter out = response.getWriter()) {
            if(!isValidEmail(email))
                out.print("invalid");
            else {
                boolean exists = DBController.getInstance().validateEmail(email);
                if(exists)
                   out.print("false");
                else
                   out.print("true");
            }
        }
                
    }

}
