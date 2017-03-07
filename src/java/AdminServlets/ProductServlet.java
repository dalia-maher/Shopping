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
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Mustafa
 */
@MultipartConfig
@WebServlet(name = "ProductServlet", urlPatterns = {"/ProductServlet"})
public class ProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DBController dBController = DBController.getInstance();
        try {
            String name="";
            String price="";
            String quantity="";
            String imglength="";
            String desc="";
            String catname="";
            String catid="";
            int availableID = dBController.getCurrentID();

            String path = request.getServletContext().getRealPath("");
            int i=0;
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
                    switch(paramName){
                        case "name":
                            name=value;
                            break;
                            case "price":
                                price=value;
                            break;
                            case "quantity":
                                quantity=value;
                            break;
                            case "desc":
                                desc=value;
                            break;
                            case "imgLength":
                                for (int j = 0; j < Integer.parseInt(value); j++) {
                                    imglength+=availableID+"-"+j;
                                    if(j+1<Integer.parseInt(value))
                                    imglength+="&&";
                                }                                
                            break;
                             case "catgorey":
                                catname=value;
                            break;
                            case "catgoreyID":
                                catid=value;
                            break;                           
                    }
                } else {
// processUploadedFile(item);
                    if (!item.isFormField()) {
                        File temp=new File(path+"\\images\\"+catname);
                        temp.mkdirs();
                        item.write(new File(temp.getAbsolutePath()+"\\"+availableID+"-"+i+".png"));
                        i++;
                    }
                }
            }
            System.out.println("cat id = " + catid);
            System.out.println("quantity = " + quantity);
            System.out.println("price = " + price);
            dBController.addProduct(new Product(new Category(Integer.parseInt(catid), catname),name,desc,Integer.parseInt(quantity),Double.parseDouble(price),imglength));
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

      @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DBController dbcon = DBController.getInstance();
        resp.getWriter().write(new Gson().toJson(dbcon.getAllProducts()));

    }
    
    
}
