package servlets;

import beans.Order;
import beans.User;
import connections.DBController;
import java.io.IOException;
import java.io.PrintWriter;
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedInUser");
        if(user != null) {
            ArrayList<Order>allOrders = DBController.getInstance().selectAllOrders(user);
            if(!allOrders.isEmpty())
                request.setAttribute("userOrders", allOrders);
            RequestDispatcher ds = request.getRequestDispatcher("userOrders.jsp");
            ds.forward(request, response);
        }
        else {
            RequestDispatcher ds = request.getRequestDispatcher("index.jsp");
            ds.forward(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}
