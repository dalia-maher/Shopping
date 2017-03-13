package servlets;

import beans.*;
import beans.User;
import connections.DBController;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author TahanyFawzy
 */
@WebServlet(name = "GetOrders", urlPatterns = {"/GetOrders"})
public class GetOrders extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("doget from getOrders servlet");
        String userID = request.getParameter("userID");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedInUser");
        boolean admin = false;
        if(userID!=null)
        {
            admin = true;
            int id = Integer.parseInt(userID);
            user = DBController.getInstance().getUser(id);
        }
        ArrayList<Order>allOrders = DBController.getInstance().selectAllOrders(user);
        //if(!allOrders.isEmpty())
        request.setAttribute("userOrders", allOrders);
        request.setAttribute("userName",user.getFirstName()+" "+user.getLastName());
        System.out.println("----"+allOrders.size());
        RequestDispatcher ds = null;
        if(!admin)
        {
            ds= request.getRequestDispatcher("userOrders.jsp");
        }
        else
        {
            ds = request.getRequestDispatcher("AdminPages/viewUserOrders.jsp");
        }
        ds.forward(request, response);
        
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}
