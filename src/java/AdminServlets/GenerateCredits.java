/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminServlets;

import beans.CreditCard;
import com.google.gson.Gson;
import connections.DBController;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import xml.Msg;

/**
 *
 * @author Mustafa
 */
@WebServlet(name = "GenerateCredits", urlPatterns = {"/GenerateCredits"})
public class GenerateCredits extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            File json = new File("file1.json");
            PrintWriter fos = new PrintWriter(json);
            Gson n = new Gson();
            DBController db = DBController.getInstance();
            String[] valuesarr = req.getParameter("firstarr").split(",");
            String[] amountarr = req.getParameter("secondarr").split(",");
            ArrayList<CreditCard> creditList = new ArrayList<>();
            for (int i = 0; i < valuesarr.length; i++) {
                creditList.clear();
                for (int j = 0; j < Integer.parseInt(valuesarr[i]); j++) {
                    creditList.add(new CreditCard(getRandomCard(), Integer.parseInt(amountarr[i])));
                }
                db.insertNewCards(creditList);
                fos.write(n.toJson(creditList));
            }
            fos.flush();
            fos.close();
            resp.setContentType("application/json");
            PrintWriter out = resp.getWriter();
            resp.setHeader("Content-Disposition", "attachment; filename=\"" + "CreditsFile" + new Date().toString() + "\"");
            FileInputStream fileInputStream = new FileInputStream(json);
            int i;
            while ((i = fileInputStream.read()) != -1) {
                out.write(i);
            }
            fileInputStream.close();
            out.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    protected static String getRandomCard() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 14) {
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;
    }
}
