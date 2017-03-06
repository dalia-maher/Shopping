/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminServlets;

import beans.User;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import connections.DBController;
import connections.DBHandler;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author TahanyFawzy
 */
public class GetCustomers extends HttpServlet 
{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        System.out.println("get in getCustomers");
//        DBHandler db = new DBController();
        ArrayList<User>allCustomers = new ArrayList<>();
        allCustomers = DBController.getInstance().getAllUsers();
        response.setContentType("applecation/json");
        PrintWriter out = response.getWriter();
        GsonBuilder gsonB = new GsonBuilder();
        Gson gson = gsonB.create();
        out.println(gson.toJson(allCustomers)); 
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}
