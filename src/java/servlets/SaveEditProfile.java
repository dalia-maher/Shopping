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
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
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
@WebServlet(name = "SaveEditProfile", urlPatterns = {"/SaveEditProfile"})
public class SaveEditProfile extends HttpServlet {



    ServletConfig config;

    @Override
    public void init(ServletConfig config)
            throws ServletException {
        super.init(config); //To change body of generated methods, choose Tools | Templates.
        this.config = config;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //processRequest(request, response);
        HttpSession userSession = request.getSession(false);
        User currentUser  = (User)userSession.getAttribute("loggedInUser");
        Double userCredit = 0.0;
        Date BOD = null;
        //User currentUser = DBController.getInstance().getUser(1);// until make seeions
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        //String credit = request.getParameter("credit");
        String birthDay = request.getParameter("bdate");
        LocalDate date = LocalDate.parse(birthDay);
        String pass = request.getParameter("password");
        String[] interest = request.getParameterValues("userInterest");
        ArrayList<Category> categories = (ArrayList<Category>) config.getServletContext().getAttribute("categoriesList");
        ArrayList<Integer> userInt = new ArrayList<>();
        System.out.println(interest.length+"size");
        if (interest.length != 0) {
            for (int i = 0; i < categories.size(); i++) {
               for(int k=0; k < interest.length;k++){
                   int catId = Integer.parseInt(interest[k].trim());
                    if (catId == categories.get(i).getCategoryID()) {
                       // System.out.println("servlets.SaveEditProfile.doPost()"+"d5laat if "+categories.get(i).getCategoryID());
                        userInt.add(categories.get(i).getCategoryID());
                    }
               }
                    
                }
            
        }
//        for(int i=0;i<userInt.size();i++){
//            System.out.println(userInt.get(i));
//        }
        DBController.getInstance().deleteIntersts(currentUser);
        DBController.getInstance().insertInterests(currentUser, userInt);


        User newUser =  new User(currentUser.getCustomerID(), currentUser.getEmail(), currentUser.getUserName(),
                pass, fname, lname, request.getParameter("address"), currentUser.getCredit(), false, Date.valueOf(date), request.getParameter("job"));
        DBController.getInstance().updateCustomer(currentUser,newUser );
                response.sendRedirect("userProfile.jsp");
                
                 userSession.setAttribute("loggedInUser",newUser);
    }
      
  

}
