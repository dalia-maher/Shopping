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
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = DBController.getInstance().signIn(email, password);
        
        if(user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loggedInUser", user);
            System.out.println("from login user credit is :"+ user.getCredit());
            if(user.isType()) {
                // todo: set admin page
                response.sendRedirect("AdminPages/index.jsp");
            }
            else {
                String lastvis=request.getSession().getAttribute("lastVisited").toString();
                if(lastvis!=null&&lastvis!="")
                response.sendRedirect(lastvis);
                else
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("login.jsp?attempt=1");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
