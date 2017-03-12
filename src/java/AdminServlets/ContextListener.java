/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminServlets;
import connections.DBController;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
 
@WebListener
public class ContextListener implements ServletContextListener {
 
    @Override
    public void contextInitialized(ServletContextEvent event) {
        System.out.println(event.getServletContext().getInitParameter("Password"));
        DBController.getInstance().setUsername(event.getServletContext().getInitParameter("User"));
        DBController.getInstance().setPassword(event.getServletContext().getInitParameter("Password"));
        DBController.getInstance().initConnection();

    }
     
    @Override
    public void contextDestroyed(ServletContextEvent event) {
    }
}