/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.Category;
import beans.Product;
import beans.ShoppingCart;
import beans.User;
import com.google.gson.Gson;
import connections.DBController;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
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
@WebServlet(name = "AddingToCart", urlPatterns = {"/AddingToCart"})
public class AddingToCart extends HttpServlet {
    
    ArrayList<ShoppingCart> shoopingList = new ArrayList<>();
    ServletConfig config;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config); //To change body of generated methods, choose Tools | Templates.
        this.config = config;
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);
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
        //processRequest(request, response);
        HttpSession userSession = request.getSession(false);
        User currentUser = (User) userSession.getAttribute("loggedInUser");
         if (currentUser != null) {
            
            int productID = 0,productQuant=0;
            double productPrice = 0.0;
            String ProductId = request.getParameter("prooductID");
            //String categoryId = request.getParameter("categoryID");
          
            String quantity = request.getParameter("quantity");
            //System.out.println(ProductId+""+categoryId);
            
            if (ProductId != null && quantity !=null) {
                productID = Integer.parseInt(ProductId);
                //catId = Integer.parseInt(categoryId);
               productQuant = Integer.parseInt(quantity);
           }
            Category productCategory = null;
              Product choosenProduct = DBController.getInstance().getProduct(productID);
//            product choosenProduct = new Product(productID, productCategory,request.getParameter("productName"),
//                    request.getParameter("Description") , productPrice, , , );
            ArrayList<Category> categories = (ArrayList<Category>) config.getServletContext().getAttribute("categoriesList");
            //System.out.println(categories.size());
            for (int i = 0; i < categories.size(); i++) {
                if (categories.get(i).getCategoryID() == choosenProduct.getCategory().getCategoryID()) {
                    productCategory = categories.get(i);
                    break;
                }
            }
            ShoppingCart newProduct = new ShoppingCart(choosenProduct, currentUser, productQuant);
            int ret=DBController.getInstance().addToShoppingCart(choosenProduct.getProductID(), currentUser.getCustomerID(),productQuant);
         response.getWriter().write(ret);
            shoopingList.add(newProduct);
        //    userSession.setAttribute("shoppingList", new Gson().toJson(shoopingList));
        }
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
