/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.Category;
import beans.Customer;
import connections.DBController;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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

/**
 *
 * @author Mrawi
 */
@WebServlet(name = "SaveEditProfile", urlPatterns = {"/SaveEditProfile"})
public class SaveEditProfile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SaveEditProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaveEditProfile at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        //HttpSession userSession = request.getSession(false);
        //Customer currentUser  = (Customer)userSession.getAttribute("User");
        Double userCredit = 0.0;
        Date BOD = null;
        Customer currentUser = DBController.getInstance().getUser(1);// until make seeions
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String credit = request.getParameter("credit");
        String birthDay = request.getParameter("bdate");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
             BOD = (Date)sdf.parse(birthDay);
        } catch (ParseException ex) {
            Logger.getLogger(SaveEditProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
//        if (birthDay != null) {
//            BOD = Date.valueOf(birthDay);
//        }

        String pass = request.getParameter("password");
        String[] interest = request.getParameterValues("userInterest");
        ArrayList<Category> categories = (ArrayList<Category>) config.getServletContext().getAttribute("categoriesList");
        ArrayList<Category> userInt = new ArrayList<>();
        System.out.println(interest.length+"size");
        if (interest.length != 0) {
            for (int i = 0; i < categories.size(); i++) {
               for(int k=0; k < interest.length;k++){
                   int catId = Integer.parseInt(interest[k].trim());
                    if (catId == categories.get(i).getCategoryID()) {
                       // System.out.println("servlets.SaveEditProfile.doPost()"+"d5laat if "+categories.get(i).getCategoryID());
                        userInt.add(categories.get(i));
                    }
               }
                    
                }
            
        }
        for(int i=0;i<userInt.size();i++){
            System.out.println(userInt.get(i).getCategoryID());
        }
        DBController.getInstance().deleteIntersts(currentUser);
        DBController.getInstance().insertInterests(currentUser, userInt);

        if (credit != null) {
            userCredit = Double.valueOf(credit);
        }
        DBController.getInstance().updateCustomer(currentUser, new Customer(currentUser.getCustomerID(), currentUser.getEmail(), currentUser.getUserName(),
                pass, fname, lname, request.getParameter("address"), userCredit, false, BOD, request.getParameter("job")));
                response.sendRedirect("userProfile.jsp");
                
    
    }
      
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
