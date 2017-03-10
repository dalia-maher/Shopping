/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.Category;

import beans.User;

import connections.DBController;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mrawi
 */
public class ViewProfile extends HttpServlet {

    
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //until we finished the login
        HttpSession userSession = request.getSession(false);
        if (userSession != null) {
            User currentUser = (User) userSession.getAttribute("loggedInUser");
            // User currentUser = DBController.getInstance().getUser(1);
            //request.setAttribute("userData", currentUser);
            ArrayList<Category> interest = DBController.getInstance().getInterests(currentUser);

            request.setAttribute("userInterest", interest);
            for (int i = 0; i < interest.size(); i++) {
                System.out.println(interest.get(i).getName());
            }
        }
        
    }

  
}
