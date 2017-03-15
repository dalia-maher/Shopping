package AdminServlets;

import beans.Category;
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

/**
 *
 * @author TahanyFawzy
 */
@WebServlet(name = "userProfile", urlPatterns = {"/userProfile"})
public class userProfile extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("do get from user profile");
        int ID = Integer.parseInt(request.getParameter("userID"));
        User user = DBController.getInstance().getUser(ID);
        if (user != null) {
            request.setAttribute("User", user);
            ArrayList<Category> interest = DBController.getInstance().getInterests(user);
             for (int i = 0; i < interest.size(); i++) {
               System.out.println("admin view user int"+interest.get(i).getName());
            }
            request.setAttribute("userInterest", interest);

            RequestDispatcher ds = request.getRequestDispatcher("AdminPages/viewUserProfile.jsp");
            ds.forward(request, response);

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
