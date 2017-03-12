/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.google.gson.Gson;
import connections.DBController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mustafa
 */
@WebServlet(name = "AdvancedSearch", urlPatterns = {"/AdvancedSearch"})
public class AdvancedSearch extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword=req.getParameter("keyword");
        int minPrice=Integer.parseInt(req.getParameter("minP"));
        int maxPrince=Integer.parseInt(req.getParameter("maxP"));
        String catgoreyID=req.getParameter("catgoreyID");       
        if (maxPrince==0) {
            maxPrince=Integer.MAX_VALUE;
        }
        resp.getWriter().write(new Gson().toJson(DBController.getInstance().searchProduct(keyword,catgoreyID,minPrice,maxPrince)));

    }

}
