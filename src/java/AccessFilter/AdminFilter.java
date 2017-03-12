/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AccessFilter;

import beans.User;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mrawi
 */
public class AdminFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse)response;
        HttpSession currentSession = req.getSession(false);
        User currUser = (User) currentSession.getAttribute("loggedInUser");
        if (currUser != null) {
            if (currUser.isType()) {
                chain.doFilter(request, response);

            } else {
//                RequestDispatcher rd = request.getRequestDispatcher("../index.jsp");
//                rd.forward(request, response);
                
                res.sendRedirect("../index.jsp");
                
            }
        } else {
             res.sendRedirect("../index.jsp");

        }
    }

    @Override
    public void destroy() {
        // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
