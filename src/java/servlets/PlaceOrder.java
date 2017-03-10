/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.Order;
import beans.Product;
import beans.User;
import connections.DBController;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
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
@WebServlet(name = "PlaceOrder", urlPatterns = {"/PlaceOrder"})
public class PlaceOrder extends HttpServlet {

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

        DBController db = DBController.getInstance();
        String[] products = request.getParameter("productsArr").split(",");
        String[] quantity = request.getParameter("quantityArr").split(",");
        float total = Float.parseFloat(request.getParameter("total"));
        System.out.println("total = " + total);
        boolean empty;
        boolean updated_prod;
        
        HttpSession userSession = request.getSession(false);
        User currentUser = (User) userSession.getAttribute("loggedInUser");

        ArrayList<Order> ordersList = new ArrayList<>();
        int maxOrderNum = db.getMaxOrderNum(currentUser.getCustomerID());
        maxOrderNum++;

        for (int i = 0; i < products.length; i++) {
            ordersList.clear();
            Product product = db.getProduct(Integer.parseInt(products[i]));

            // insert order
            Calendar currenttime = Calendar.getInstance();
            Date sqldate = new Date((currenttime.getTime()).getTime());
            db.insertOrder(new Order(product, currentUser, Integer.parseInt(quantity[i]), sqldate, product.getPrice(), maxOrderNum));
            
            // update product's quantity
            int newQuantity = product.getQuantity() - Integer.parseInt(quantity[i]);
            updated_prod = db.updateProductQuantity(product.getProductID(), newQuantity);
            
            // update user's credit
            db.updateUserCredit(currentUser, total);
        }
        
        // reset shopping cart
        empty = db.resetShoppingCart(currentUser);
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
