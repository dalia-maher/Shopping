/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.User;
import connections.DBController;
import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletConfig;
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

    ServletConfig config;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config); //To change body of generated methods, choose Tools | Templates.
        this.config = config;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String adminUser = (String) config.getServletContext().getInitParameter("AdminUser");
        String adminPass = (String) config.getServletContext().getInitParameter("AdminPass");

        User user = DBController.getInstance().signIn(email, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loggedInUser", user);

            if (user.isType()) {
                // todo: set admin page
                response.sendRedirect("AdminPages/index.jsp");
            } else {
                String lastvis = request.getSession().getAttribute("lastVisited").toString();
                if (lastvis != null && !lastvis.equals("")) {
                    response.sendRedirect(lastvis);
                } else {
                    response.sendRedirect("index.jsp");
                }
            }
        } else if (email.equals(adminUser) && password.equals(adminPass)) {

            java.sql.Date sqlDate = new java.sql.Date(new Date().getTime());
            DBController.getInstance().signUp(new User(adminUser, adminUser, adminPass, adminUser, adminUser, "", 0.0, true, sqlDate, ""));
            User admin = DBController.getInstance().signIn(email, password);
            if (admin != null) {
                HttpSession session = request.getSession();
                session.setAttribute("loggedInUser", admin);
                response.sendRedirect("AdminPages/index.jsp");
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
