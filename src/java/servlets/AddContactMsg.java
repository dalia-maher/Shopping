/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.Contact;
import connections.DBController;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dalia
 */
@WebServlet(name = "AddContactMsg", urlPatterns = {"/AddContactMsg"})
public class AddContactMsg extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String from = request.getParameter("from");
        String telephone = request.getParameter("telephone");
        String msg = request.getParameter("msg");
        
        DBController dbCon = DBController.getInstance();

        Contact contact = new Contact(name, from, telephone, msg);
        boolean sent = dbCon.addMsg(contact);

        if(sent) {
            response.sendRedirect("contactUs.jsp?success=1");
        }
        else {
            response.sendRedirect("contactUs.jsp?failed=1");
        }
    }

}
