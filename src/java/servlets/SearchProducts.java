package servlets;

import beans.Product;
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
@WebServlet(name = "SearchProducts", urlPatterns = {"/SearchProducts"})
public class SearchProducts extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // String search = request.getParameter("searchon");
        String keyword = request.getParameter("keyword");
        
        RequestDispatcher ds = null;
//        switch (search) 
//        {
//            case "price":
//                System.out.println("post in search using price");
//                double price = Double.parseDouble(keyword);
//                allProducts = DBController.getInstance().searchProductByPrice(price);
//                System.out.println("all = "+allProducts.size());
//                if(!allProducts.isEmpty())
//                    request.setAttribute("searchResults", allProducts);
//                ds = request.getRequestDispatcher("searchResults.jsp");
//		ds.forward(request,response);
//                break;
//            case "category":
//                System.out.println("post in search using category");
//                break;
//            case "name":
                System.out.println("post in search using name");
                ArrayList<Product>allProducts = DBController.getInstance().searchProduct(keyword);
                if(!allProducts.isEmpty())
                        request.setAttribute("searchResults", allProducts);
                ds = request.getRequestDispatcher("searchResults.jsp");
		ds.forward(request,response);
//                break;
//            default:
//                break;
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}
