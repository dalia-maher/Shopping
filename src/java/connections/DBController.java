package connections;

import beans.*;
import com.mysql.jdbc.Driver;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TahanyFawzy
 */
public class DBController implements DBHandler {

    Connection connection;
    PreparedStatement preparedStatement;
    private static DBController instance = null;

    private DBController() {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Shopping", "root", "root");
            System.out.println("Connected");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static DBController getInstance() {
        if (instance == null) {
            instance = new DBController();
        }
        return instance;
    }

    @Override
    public boolean insertCategorey(String name) {
        try {
            preparedStatement = connection.prepareStatement("INSERT INTO `category`(`name`) VALUES (?)");
            preparedStatement.setString(1, name);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.err.println("error in inserting category");
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteCategorey(String name) {
        try {
            preparedStatement = connection.prepareStatement("DELETE FROM `category` WHERE `name`=?");
            preparedStatement.setString(1, name);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.err.println("error in deleting category");
            ex.printStackTrace();
            return false;
        }

    }

    @Override
    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> allCategories = new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM `category`");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                allCategories.add(new Category(resultSet.getInt("ID"), resultSet.getString("name")));
            }
            return allCategories;
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in selecting all categories");
            return null;
        }
    }

    @Override
    public boolean signUp(User customer) {
        try {
            preparedStatement = connection.prepareStatement("INSERT INTO `customer`( `email`, `username`, "
                    + "`password`, `firstname`, `lastname`, `credit`, `addresse`, `type`, `BDate`, `job`) "
                    + "VALUES (?,?,?,?,?,?,?,?,?,?)");
            preparedStatement.setString(1, customer.getEmail());
            preparedStatement.setString(2, customer.getUserName());
            preparedStatement.setString(3, customer.getPassword());
            preparedStatement.setString(4, customer.getFirstName());
            preparedStatement.setString(5, customer.getLastName());
            preparedStatement.setDouble(6, customer.getCredit());
            preparedStatement.setString(7, customer.getAddresse());
            preparedStatement.setBoolean(8, customer.isType());
            preparedStatement.setDate(9, customer.getBOD());
            preparedStatement.setString(10, customer.getJob());
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.err.println("error in signup");
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean updateCustomer(User old, User neww) {
        try {
            preparedStatement = connection.prepareStatement("UPDATE `customer` SET `email`=?,"
                    + "`username`=?,`password`=?,`firstname`=?"
                    + ",`lastname`=?,credit=?,`addresse`=?,`BDate`=?,`job`=? WHERE `customerID`=?");
            preparedStatement.setString(1, neww.getEmail());
            preparedStatement.setString(2, neww.getUserName());
            preparedStatement.setString(3, neww.getPassword());
            preparedStatement.setString(4, neww.getFirstName());
            preparedStatement.setString(5, neww.getLastName());
             preparedStatement.setDouble(6, neww.getCredit());
            preparedStatement.setString(7, neww.getAddresse());
            preparedStatement.setDate(8, neww.getBOD());
            preparedStatement.setString(9, neww.getJob());
            preparedStatement.setInt(10, old.getCustomerID());
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.err.println("error in updating customer");
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public ArrayList<User> getAllUsers() {
        ArrayList<User> allCustomers = new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement("SELECT `customerID`, `email`, `username`,"
                    + "`password`, `firstname`, `lastname`, `credit`, `addresse`, `type`, `BDate`, `job` "
                    + "FROM `customer` where `type` = 0");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                allCustomers.add(new User(resultSet.getInt("customerID"), resultSet.getString("email"),
                        resultSet.getString("username"), resultSet.getString("password"),
                        resultSet.getString("firstname"), resultSet.getString("lastname"),
                        resultSet.getString("addresse"), resultSet.getDouble("credit"), resultSet.getBoolean("type"),
                        resultSet.getDate("BDate"), resultSet.getString("job")));
            }
            return allCustomers;
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in selecting all customers");
            return null;
        }
    }

    @Override
    public User getUser(int id) {
        try {
            preparedStatement = connection.prepareStatement("SELECT `customerID`, `email`, `username`,"
                    + " `password`, `firstname`, `lastname`, `credit`, `addresse`, `type`, `BDate`, "
                    + "`job` FROM `customer` WHERE `customerID` = ?");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return new User(resultSet.getInt("customerID"), resultSet.getString("email"),
                        resultSet.getString("username"), resultSet.getString("password"),
                        resultSet.getString("firstname"), resultSet.getString("lastname"),
                        resultSet.getString("addresse"), resultSet.getDouble("credit"), resultSet.getBoolean("type"),
                        resultSet.getDate("BDate"), resultSet.getString("job"));
            }
            return null;
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in getting user");
            return null;
        }
    }

    @Override
    public User signIn(String email, String password) {
        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM `customer` WHERE `email`=? and `password`=?");
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return new User(resultSet.getInt("customerID"), resultSet.getString("email"),
                        resultSet.getString("username"), resultSet.getString("password"),
                        resultSet.getString("firstname"), resultSet.getString("lastname"),
                        resultSet.getString("addresse"), resultSet.getDouble("credit"), resultSet.getBoolean("type"),
                        resultSet.getDate("BDate"), resultSet.getString("job"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in signin");
        }
        return null;
    }

    @Override
    public boolean validateEmail(String email) {
        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM `customer` WHERE `email`=?");
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in validating");
        }
        return false;
    }

    @Override
    public boolean validateUName(String username) {
        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM `customer` WHERE `username`=?");
            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in validating");
        }
        return false;
    }

    @Override
    public int getUserID(String email) {
        try {
            preparedStatement = connection.prepareStatement("SELECT `customerID` FROM `customer` WHERE `email`=?");
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt("customerID");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in getting user ID");
        }
        return -1;
    }

    @Override
    public boolean addProduct(Product product) {
        try {
            preparedStatement = connection.prepareStatement("INSERT INTO `product`("
                    + "`categoryID`, `name`, `description`, `quantity`, `price`, `images`) "
                    + "VALUES (?,?,?,?,?,?)");
            preparedStatement.setInt(1, product.getCategory().getCategoryID());
            preparedStatement.setString(2, product.getName());
            preparedStatement.setString(3, product.getDescription());
            preparedStatement.setInt(4, product.getQuantity());
            preparedStatement.setDouble(5, product.getPrice());
            preparedStatement.setString(6, product.getImages());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.err.println("error in add product");
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteProduct(int productID) {
        try {
            preparedStatement = connection.prepareStatement("DELETE FROM `product` WHERE `ID`=?");
            preparedStatement.setInt(1, productID);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.err.println("error in deleting product");
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public Category getCategory(int ID) {
        ArrayList<Category> allCategories = getAllCategories();
        for (int i = 0; i < allCategories.size(); i++) {
            if (allCategories.get(i).getCategoryID() == ID) {
                return allCategories.get(i);
            }
        }
        return null;
    }

    @Override
    public ArrayList<Product> getAllProducts(int offset, int limit) {
        ArrayList<Product> allProducts = new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement("SELECT `ID`, `categoryID`, `name`,"
                    + " `description`, `quantity`, `price`, `images` FROM `product` LIMIT ? OFFSET ?");
            preparedStatement.setInt(2, offset);
            preparedStatement.setInt(1, limit);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                allProducts.add(new Product(resultSet.getInt("ID"), getCategory(resultSet.getInt("categoryID")),
                        resultSet.getString("name"), resultSet.getString("description"), resultSet.getDouble("price"),
                        resultSet.getInt("quantity"), resultSet.getString("images")));
            }
            return allProducts;
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in selectiong all products");
            return null;
        }
    }

    @Override
    public ArrayList<Product> getAllProducts() {
        ArrayList<Product> allProducts = new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement("SELECT `ID`, `categoryID`, `name`,"
                    + " `description`, `quantity`, `price`, `images` FROM `product`");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                allProducts.add(new Product(resultSet.getInt("ID"), getCategory(resultSet.getInt("categoryID")),
                        resultSet.getString("name"), resultSet.getString("description"), resultSet.getDouble("price"), resultSet.getInt("quantity"),
                        resultSet.getString("images")));

            }
            return allProducts;
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in selecting all products");
            return null;
        }
    }

    @Override
    public ArrayList<Product> getProductsCategory(int categoryID) {
        ArrayList<Product> allProducts = new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM `product` WHERE categoryID = ?");
            preparedStatement.setInt(1, categoryID);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                allProducts.add(new Product(resultSet.getInt("ID"), getCategory(resultSet.getInt("categoryID")), resultSet.getString("name"), resultSet.getString("description"),
                        resultSet.getDouble("price"), resultSet.getInt("quantity"), resultSet.getString("images")));

            }
            return allProducts;
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in selecting all products");
            return null;
        }

    }

    @Override
    public boolean editProduct(int old, Product neww) {
        try {
            preparedStatement = connection.prepareStatement("UPDATE `product` SET `categoryID`=?,"
                    + "`name`=?,`description`=?,`quantity`=?,`price`=?,`images`=? WHERE `ID`=?");
            preparedStatement.setInt(1, neww.getCategory().getCategoryID());
            preparedStatement.setString(2, neww.getName());
            preparedStatement.setString(3, neww.getDescription());
            preparedStatement.setInt(4, neww.getQuantity());
            preparedStatement.setDouble(5, neww.getPrice());
            preparedStatement.setString(6, neww.getImages());
            preparedStatement.setInt(7, old);

            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.err.println("error in editiing product");
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean updateProductQuantity(int productID, int newQuantity) {
        try {
//            System.out.println("prodID = " + productID);
//            System.out.println("quantity = " + newQuantity);
            preparedStatement = connection.prepareStatement("UPDATE `product` SET `quantity`=? "
                    + "WHERE `ID`=?");
            preparedStatement.setInt(1, newQuantity);
            preparedStatement.setInt(2, productID);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.err.println("error in editiing product");
            ex.printStackTrace();
            return false;
        }
    }

    public int getCurrentID() {
        try {
            preparedStatement = connection.prepareStatement("SELECT AUTO_INCREMENT FROM information_schema.tables WHERE table_name = 'product'");
            ResultSet myset = preparedStatement.executeQuery();
            if (myset.next()) {
                return myset.getInt("AUTO_INCREMENT");
            } else {
                return 0;
            }

        } catch (SQLException ex) {
            System.err.println("error in get Last ID");
            ex.printStackTrace();
            return 0;
        }
    }

    @Override
    public ArrayList<Product> searchProduct(String query) {
        ArrayList<Product> allProducts = new ArrayList<>();
        String keyword = "%".concat(query);
        keyword = keyword.concat("%");
        System.out.println("key = " + keyword);
        try {
            preparedStatement = connection.prepareStatement("SELECT `ID`, `categoryID`, `name`, `description`, "
                    + "`quantity`, `price`, `images` FROM `product` WHERE `name` like ? "
                    + "or `categoryID`in (select ID from category where name like ?)");
            preparedStatement.setString(1, keyword);
            preparedStatement.setString(2, keyword);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {

                allProducts.add(new Product(resultSet.getInt("ID"), getCategory(resultSet.getInt("categoryID")),
                        resultSet.getString("name"), resultSet.getString("description"), resultSet.getDouble("price"),
                        resultSet.getInt("quantity"), resultSet.getString("images")));

            }
            return allProducts;
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in searching product");
            return null;
        }
    }

    @Override
    public ArrayList<Product> searchProductByPrice(double price) {
        ArrayList<Product> allProducts = new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement("SELECT `ID`, `categoryID`, `name`,"
                    + " `description`, `quantity`, `price`, `images` FROM `product` WHERE `price` <=?");
            preparedStatement.setDouble(1, price);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {

                allProducts.add(new Product(resultSet.getInt("ID"), getCategory(resultSet.getInt("categoryID")),
                        resultSet.getString("name"), resultSet.getString("description"), resultSet.getDouble("price"),
                        resultSet.getInt("quantity"), resultSet.getString("images")));

            }
            return allProducts;
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in searching product by price");
            return null;
        }
    }
//    @Override
//    public Product getProduct (int productID){
//        try {
//            preparedStatement = connection.prepareStatement("SELECT `ID`, `categoryID`, `name`,"
//                    + " `description`, `quantity`, `price`, `images` FROM `product` WHERE `ID` =?");
//            preparedStatement.setInt(1, productID);
//            ResultSet resultSet = preparedStatement.executeQuery();
//           Product product = new Product(resultSet.getInt("ID"),getCategory(resultSet.getInt("categoryID")), 
//                        resultSet.getString("name"), resultSet.getString("description"), resultSet.getDouble("price"), resultSet.getInt("quantity")
//                        , resultSet.getString("images"));
//            
//            return product;
//        } catch (SQLException ex) {
//           ex.printStackTrace();
//            System.err.println("error in finding product");
//            return null;
//        }
//    }

    @Override
    public int addToShoppingCart(int productID, int customerID, int quantity) {
        int result = this.checkSameProductInCart(productID, customerID);
        System.out.println("--->" + result);
        if (result == -1) {
            try {
                preparedStatement = connection.prepareStatement("INSERT INTO `shoppingcart`(`productID`, `CustomerID`,"
                        + " `quantity`) VALUES (?,?,?)");
                preparedStatement.setInt(1, productID);
                preparedStatement.setInt(2, customerID);
                preparedStatement.setInt(3, quantity);
                preparedStatement.executeUpdate();
                return DBHandler.NEW_SHOOPINGITEM;
            } catch (SQLException ex) {
                System.err.println("error in addto cart");
                ex.printStackTrace();
                return DBHandler.ERROR_IN_ADD;
            }

        } else {
//           if(quantity >= result ){
//               quantity = quantity+result;
//           }else{
//               quantity = result-quantity;
//           }
            if (this.updateCartQuantity(productID, customerID, quantity) == true) {
                return DBHandler.EDITED_SHOOPINGITEM;
            }
            return DBHandler.ERROR_IN_ADD;
        }
    }

    private int checkSameProductInCart(int productID, int customerID) {
        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM `shoppingcart` WHERE `productID` =? AND `CustomerID`=?");
            preparedStatement.setInt(1, productID);
            preparedStatement.setInt(2, customerID);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt("quantity");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in selecting");
            return -1;
        }
        return -1;
    }

    @Override
    public boolean removeFromShoppingCart(int productID, int customerID) {
        try {
            preparedStatement = connection.prepareStatement("DELETE FROM `shoppingcart` WHERE `productID`=? "
                    + "and `CustomerID`=?");
            preparedStatement.setInt(1, productID);
            preparedStatement.setInt(2, customerID);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.err.println("error in removing from cart");
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean resetShoppingCart(int customerID) {
        try {
            preparedStatement = connection.prepareStatement("DELETE  FROM `shoppingcart` WHERE `CustomerID`=?");
            preparedStatement.setInt(1,customerID);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.err.println("error in resetting cart");
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean updateCartQuantity(int productID, int customerID, int newQuantity) {
        try {
            preparedStatement = connection.prepareStatement("UPDATE `shoppingcart` SET `quantity`=? "
                    + "WHERE `productID`=? and `CustomerID`=?");
            preparedStatement.setInt(1, newQuantity);
            preparedStatement.setInt(2, productID);
            preparedStatement.setInt(3, customerID);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.err.println("error in updating cart");
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public int getMaxOrderNum(int customerID) {
        try {
            preparedStatement = connection.prepareStatement("SELECT MAX(`ordernumber`) FROM `order` WHERE `customerID` = ?");
            preparedStatement.setInt(1, customerID);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in selecting all orders");
        }
        return 0;
    }
    
    @Override
    public boolean insertOrder(Order o) {
        try {
            preparedStatement = connection.prepareStatement("INSERT INTO `order`(`productID`, "
                    + "`customerID`, `quantity`, `date`, `price` , `ordernumber`) VALUES (?,?,?,?,?,?)");
            preparedStatement.setInt(1, o.getProduct().getProductID());
            preparedStatement.setInt(2, o.getCustomer().getCustomerID());
            preparedStatement.setInt(3, o.getQuantity());
            preparedStatement.setTimestamp(4, new Timestamp(o.getDate().getTime()));
            preparedStatement.setDouble(5, o.getPrice());
            preparedStatement.setDouble(6, o.getOrderNumber());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.err.println("error in insertorder");
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public Product getProduct(int ID) {
        ArrayList<Product> allProducts = getAllProducts();
        for (int i = 0; i < allProducts.size(); i++) {
            if (allProducts.get(i).getProductID() == ID) {
                return allProducts.get(i);
            }
        }
        return null;
    }

    @Override
    public ArrayList<Order> selectAllOrders() {
        ArrayList<Order> allOrders = new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement("SELECT `orderID`, `productID`, `customerID`, "
                    + "`quantity`, `date`, `price`, `ordernumber` FROM `order` ");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                allOrders.add(new Order(resultSet.getInt("orderID"), getProduct(resultSet.getInt("productID")),
                        getUser(resultSet.getInt("customerID")), resultSet.getInt("quantity"),
                        resultSet.getTimestamp("date"), resultSet.getDouble("price"), resultSet.getInt("ordernumber")));
            }
            return allOrders;
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in selecting all orders");
            return null;
        }
    }

    @Override
    public ArrayList<Order> selectAllOrders(Product p) {
//        ArrayList<Order> allOrders = new ArrayList<>();
//        try {
//            preparedStatement = connection.prepareStatement("SELECT `orderID`, `productID`, "
//                    + "`customerID`, `quantity`, `date`, `price` FROM `order` WHERE `productID` = ?");
//            preparedStatement.setInt(1, p.getProductID());
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()) {
//                allOrders.add(new Order(resultSet.getInt("orderID"), getProduct(resultSet.getInt("productID")),
//                        getUser(resultSet.getInt("customerID")), resultSet.getInt("quantity"),
//                        resultSet.getString("date"), resultSet.getDouble("price")));
//            }
//            return allOrders;
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//            System.err.println("error in selecting all orders by product");
//            return null;
//        }
        return null;
    }

    @Override
    public ArrayList<Order> selectAllOrders(User m) {
        ArrayList<Order> allOrders = new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement("SELECT `orderID`, `productID`, `customerID`, "
                    + "`quantity`, `date`, `price`, `ordernumber` FROM `order` where `customerID` = ? "
                    + "order by `ordernumber`DESC");
            preparedStatement.setInt(1, m.getCustomerID());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                allOrders.add(new Order(resultSet.getInt("orderID"), getProduct(resultSet.getInt("productID")),
                        getUser(resultSet.getInt("customerID")), resultSet.getInt("quantity"),
                        resultSet.getTimestamp("date"), resultSet.getDouble("price"), resultSet.getInt("ordernumber")));
            }
            return allOrders;
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in selecting all orders by customer");
            return null;
        }
    }

    @Override
    public boolean insertNewCards(ArrayList<CreditCard> cards) {
        boolean flag = false;
        for (int i = 0; i < cards.size(); i++) {
            try {
                preparedStatement = connection.prepareStatement("INSERT INTO `credit`(`cardID`, `cardValue`) VALUES (?,?)");
                preparedStatement.setString(1, cards.get(i).getCardID());
                preparedStatement.setInt(2, cards.get(i).getCardValue());
                flag = preparedStatement.executeUpdate() > 0;
            } catch (SQLException ex) {
                ex.printStackTrace();
                System.err.println("error in inserting credits");
                flag = false;
            }
        }
        return flag;
    }

    @Override
    public boolean updateCreditCard(String cardID, int customerID) {
        boolean flag = false;
        ArrayList<CreditCard> cards = getAllCredits();
        for (int i = 0; i < cards.size(); i++) {
            try {
                preparedStatement = connection.prepareStatement("UPDATE `credit` SET `customerID` = ? WHERE `cardID` = ? ");
                preparedStatement.setInt(1, customerID);
                preparedStatement.setString(2, cardID);
                flag = preparedStatement.executeUpdate() > 0;
            } catch (SQLException ex) {
                ex.printStackTrace();
                System.err.println("error in updating credits");
                flag = false;
            }
        }
        return flag;
    }

    @Override
    public boolean updateUserCredit(User user, double value) {
        boolean flag = false;
        try {
            PreparedStatement stmt = connection.prepareStatement("UPDATE `customer` SET `credit` = ? WHERE `customerID` = ?");
            double newCredit = getCreditValue(user.getCustomerID()) - value;
            System.out.println("new = " + newCredit);
            stmt.setDouble(1, newCredit);
            stmt.setInt(2, user.getCustomerID());
            flag = stmt.executeUpdate() > 0;
            stmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in updating credits");
            flag = false;
        }
        return flag;
    }

    @Override
    public ArrayList<CreditCard> getAllCredits() {
        ArrayList<CreditCard> allCredits = new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement("SELECT `cardID`, `cardValue`, `customerID` FROM `credit` WHERE customerID IS NULL ");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                allCredits.add(new CreditCard(resultSet.getString("cardID"), resultSet.getInt("cardValue")));
            }
            return allCredits;
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in selecting all credits");
            return null;
        }
    }

    @Override
    public ArrayList<Category> getInterests(User cusomer) {
        ArrayList<Category> allCategories = new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement("SELECT `customerID`, `categoryID` FROM `interests` WHERE `customerID` =?");
            preparedStatement.setInt(1, cusomer.getCustomerID());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                allCategories.add(getCategory(resultSet.getInt("categoryID")));
            }
            return allCategories;
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in selecting all inerests");
            return null;
        }
    }

    @Override
    public boolean insertInterests(User user, ArrayList<Integer> interests) {

        int id = getUserID(user.getEmail());
        boolean flag = false;
        for (int i = 0; i < interests.size(); i++) {
            try {
                preparedStatement = connection.prepareStatement("INSERT INTO `interests`(`customerID`, `categoryID`) "
                        + "VALUES(?,?)");
                preparedStatement.setInt(1, id);
                preparedStatement.setInt(2, interests.get(i));
                flag = preparedStatement.executeUpdate() > 0;
            } catch (SQLException ex) {
                System.err.println("error in insert interests");
                ex.printStackTrace();
                flag = false;
            }
        }
        return flag;
    }

    @Override
    public boolean deleteIntersts(User customer) {
        try {
            preparedStatement = connection.prepareStatement("DELETE FROM `interests` WHERE `customerID`=?");
            preparedStatement.setInt(1, customer.getCustomerID());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.err.println("error in deleting interests");
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public int getCreditValue(String cardID) {
        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM `credit` WHERE `cardID` =? AND `customerID` IS NULL");
            preparedStatement.setString(1, cardID);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt("cardValue");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in selecting credits");
        }
        return -1;
    }
    @Override
    public double getCreditValue(int userID){
        try {
            preparedStatement = connection.prepareStatement("SELECT credit FROM `customer` WHERE `customerID` =?");
            preparedStatement.setInt(1, userID);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt("credit");
            }
            preparedStatement.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in selecting credit");
        }
        return -1;
    }
    @Override
    public ArrayList<ShoppingCart> getShoppingCart(String userID) {
        ArrayList<ShoppingCart> cart = new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement("Select p.*,c.*,s.quantity AS QUANT from shopping.shoppingcart s inner join shopping.product p inner join shopping.customer c \n"
                    + "on p.id=s.productID and c.customerid=s.CustomerID where s.CustomerID=?");
            preparedStatement.setString(1, userID);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                User x = new User(resultSet.getInt("customerID"), resultSet.getString("email"), resultSet.getString("username"), null, resultSet.getString("firstName"), resultSet.getString("lastName"), resultSet.getString("addresse"), resultSet.getDouble("credit"), resultSet.getBoolean("type"), resultSet.getDate("BDate"), resultSet.getString("job"));
                Product p = new Product(resultSet.getInt("ID"), getCategory(resultSet.getInt("categoryID")),
                        resultSet.getString("name"), resultSet.getString("description"), resultSet.getDouble("price"),
                        resultSet.getInt("quantity"), resultSet.getString("images"));
                cart.add(new ShoppingCart(p, x, resultSet.getInt("QUANT")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in selecting credits");
        }
        return cart;
    }
}
