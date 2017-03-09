/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminServlets;

import beans.Category;
import beans.Product;
import com.google.gson.Gson;
import connections.DBController;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

/**
 *
 * @author Mustafa
 */
@MultipartConfig
@WebServlet(name = "ProductEditServlet", urlPatterns = {"/ProductEditServlet"})
public class ProductEditServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DBController dBController = DBController.getInstance();
        try {
            String name = "";
            String id = "";
            String price = "";
            String quantity = "";
            String imglength = "";
            String desc = "";
            String catname = "";
            String catid = "";
            String originalImages = "";
            String deletedindexes = "";
            String maxboind = "0";
            String path = request.getServletContext().getRealPath("");
            int i = 0;
            // Create a factory for disk-based file items
            DiskFileItemFactory factory = new DiskFileItemFactory();
// Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);
// Parse the request
            List<FileItem> items = upload.parseRequest(request);
            Iterator<FileItem> iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = iter.next();
                if (item.isFormField()) {
//processFormField(item);
                    String paramName = item.getFieldName();
                    String value = item.getString();
                    switch (paramName) {
                        case "name":
                            name = value;
                            break;
                        case "price":
                            price = value;
                            break;
                        case "quantity":
                            quantity = value;
                            break;
                        case "desc":
                            desc = value;
                            break;
                        case "imgLength":
                            imglength = value;
                            break;
                        case "catgorey":
                            catname = value;
                            break;
                        case "catgoreyID":
                            catid = value;
                            break;
                        case "id":
                            id = value;
                            break;
                        case "deletedImages":
                            deletedindexes = value;
                            break;
                        case "originalImages":
                            originalImages = value;
                            break;
                        case "maxbound":
                            maxboind = value;
                            if (maxboind.contains("-")) {
                                maxboind = maxboind.substring(maxboind.indexOf("-") + 1, maxboind.length());

                                i = Integer.parseInt(maxboind) + 1;

                            } else {
                                i = 0;
                            }
                            System.out.println(maxboind);
                            break;

                    }
                } else {
// processUploadedFile(item);
                    if (!item.isFormField()) {
                        File temp = new File(path + "\\images\\" + catname);
                        temp.mkdirs();
                        System.out.println(id);
                        item.write(new File(temp.getAbsolutePath() + "\\" + id + "-" + i + ".png"));
                        originalImages += "&&" + id + "-" + i;
                        System.out.println(temp.getAbsolutePath() + "\\" + id + "-" + i + ".png");
                        i++;
                    }
                }
            }
            String[] deetedImages = deletedindexes.split("&&");
            for (int j = 0; j < deetedImages.length; j++) {
                File temp = new File(path + "\\images\\" + catname);
                System.out.println(new File(temp.getAbsolutePath() + "\\" + deetedImages[j] + ".png").delete());
                if (deetedImages[j]!="") {
                originalImages = originalImages.replaceFirst("&*"+deetedImages[j]+"&*", "&&");
                }
                System.out.println(originalImages);
            }

            dBController.editProduct(Integer.parseInt(id), new Product(new Category(Integer.parseInt(catid), catname), name, desc, Integer.parseInt(quantity), Double.parseDouble(price), originalImages));
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //               DBController dbcon=new DBController();
        //             resp.getWriter().write(new Gson().toJson(dbcon.getAllProducts()));

    }

}
