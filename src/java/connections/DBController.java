package connections;

import beans.*;
import com.mysql.jdbc.Driver;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Shopping", "root", "");
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
            preparedStatement.setString(9, customer.getBOD().toString());
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
                    + ",`lastname`=?,`addresse`=?,`BDate`=?,`job`=? WHERE `customerID`=?");
            preparedStatement.setString(1, neww.getEmail());
            preparedStatement.setString(2, neww.getUserName());
            preparedStatement.setString(3, neww.getPassword());
            preparedStatement.setString(4, neww.getFirstName());
            preparedStatement.setString(5, neww.getLastName());
            preparedStatement.setString(6, neww.getAddresse());
            preparedStatement.setDate(7, neww.getBOD());
            preparedStatement.setString(8, neww.getJob());
            preparedStatement.setInt(9, old.getCustomerID());
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
                    + " `password`, `firstname`, `lastname`, `credit`, `addresse`, `type`, `BDate`, "
                    + "`job` FROM `customer`");
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
            System.err.println("error in getting user email");
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
    public boolean deleteProduct(Product product) {
        try {
            preparedStatement = connection.prepareStatement("DELETE FROM `product` WHERE `ID`=?");
            preparedStatement.setInt(1, product.getProductID());
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
    public ArrayList<Product> getProductsCategory(int categoryID){
        ArrayList<Product> allProducts = new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM `product` WHERE categoryID = ?");
            preparedStatement.setInt(1, categoryID);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                allProducts.add(new Product(resultSet.getInt("ID"),getCategory(resultSet.getInt("categoryID")),resultSet.getString("name"), resultSet.getString("description"),
                        resultSet.getDouble("price"),resultSet.getInt("quantity"),resultSet.getString("images")));
            }
            return allProducts;
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in selecting all products");
            return null;
        }
     
    }

    @Override
    public boolean editProduct(Product old, Product neww) {
        try {
            preparedStatement = connection.prepareStatement("UPDATE `product` SET `categoryID`=?,"
                    + "`name`=?,`description`=?,`quantity`=?,`price`=?,`images`=? WHERE `ID`=?");
            preparedStatement.setInt(1, neww.getCategory().getCategoryID());
            preparedStatement.setString(2, neww.getName());
            preparedStatement.setString(3, neww.getDescription());
            preparedStatement.setInt(4, neww.getQuantity());
            preparedStatement.setDouble(5, neww.getPrice());
            preparedStatement.setString(6, neww.getImages());
            preparedStatement.setInt(7, old.getProductID());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.err.println("error in editiing product");
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public ArrayList<Product> searchProduct(String query) 
    {
        ArrayList<Product>allProducts = new ArrayList<>();
        String keyword = "%".concat(query);
        keyword = keyword.concat("%");
        System.out.println("key = "+keyword);
        try {
            preparedStatement = connection.prepareStatement("SELECT `ID`, `categoryID`, `name`, `description`, "
                    + "`quantity`, `price`, `images` FROM `product` WHERE `name` like ? "
                    + "or `categoryID`in (select ID from category where name like ?)");
            preparedStatement.setString(1, keyword);
            preparedStatement.setString(2, keyword);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) 
            {
                allProducts.add(new Product(resultSet.getInt("ID"),getCategory(resultSet.getInt("categoryID")), 
                        resultSet.getString("name"), resultSet.getString("description"), resultSet.getDouble("price"), resultSet.getInt("quantity")
                        , resultSet.getString("images")));
            }
            return allProducts;
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in searching product");
            return null;
        }
    }

    @Override
    public ArrayList<Product> searchProductByPrice(int price) {
        ArrayList<Product>allProducts = new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement("SELECT `ID`, `categoryID`, `name`,"
                    + " `description`, `quantity`, `price`, `images` FROM `product` WHERE `price` <=?");
            preparedStatement.setInt(1, price);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) 
            {
                allProducts.add(new Product(resultSet.getInt("ID"),getCategory(resultSet.getInt("categoryID")), 
                        resultSet.getString("name"), resultSet.getString("description"), resultSet.getDouble("price"), resultSet.getInt("quantity")
                        , resultSet.getString("images")));
            }
            return allProducts;
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in searching product by price");
            return null;
        }
    }
    @Override
    public boolean addToShoppingCart(Product product, User customer, int quantity) {
        try {
            preparedStatement = connection.prepareStatement("INSERT INTO `shoppingcart`(`productID`, `CustomerID`,"
                    + " `quantity`) VALUES (?,?,?)");
            preparedStatement.setInt(1, product.getProductID());
            preparedStatement.setInt(2, customer.getCustomerID());
            preparedStatement.setInt(3, quantity);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.err.println("error in addto cart");
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean removeFromShoppingCart(Product product, User customer) {
        try {
            preparedStatement = connection.prepareStatement("DELETE FROM `shoppingcart` WHERE `productID`=? "
                    + "and `CustomerID`=?");
            preparedStatement.setInt(1, product.getProductID());
            preparedStatement.setInt(2, customer.getCustomerID());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.err.println("error in removing from cart");
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean resetShoppingCart(User customer) {
        try {
            preparedStatement = connection.prepareStatement("DELETE FROM `shoppingcart` WHERE `CustomerID`=?");
            preparedStatement.setInt(1, customer.getCustomerID());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.err.println("error in resetting cart");
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean updateCartQuantity(Product product, User customer, int newQuantity) {
        try {
            preparedStatement = connection.prepareStatement("UPDATE `shoppingcart` SET `quantity`=? "
                    + "WHERE `productID`=? and `CustomerID`=?");
            preparedStatement.setInt(1, newQuantity);
            preparedStatement.setInt(2, product.getProductID());
            preparedStatement.setInt(3, customer.getCustomerID());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.err.println("error in updating cart");
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean insertOrder(Order o) {
        try {
            preparedStatement = connection.prepareStatement("INSERT INTO `order`(`productID`, "
                    + "`customerID`, `quantity`, `date`, `price`) VALUES (?,?,?,?,?)");
            preparedStatement.setInt(1, o.getProduct().getProductID());
            preparedStatement.setInt(2, o.getCustomer().getCustomerID());
            preparedStatement.setInt(3, o.getQuantity());
            preparedStatement.setString(4, o.getDate());
            preparedStatement.setDouble(5, o.getPrice());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.err.println("error in insertorder");
            ex.printStackTrace();
            return false;
        }
    }

    private Product getProduct(int ID) {
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
                    + "`quantity`, `date`, `price` FROM `order` ");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                allOrders.add(new Order(resultSet.getInt("orderID"), getProduct(resultSet.getInt("productID")),
                        getUser(resultSet.getInt("customerID")), resultSet.getInt("quantity"),
                        resultSet.getString("date"), resultSet.getDouble("price")));
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
        ArrayList<Order> allOrders = new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement("SELECT `orderID`, `productID`, "
                    + "`customerID`, `quantity`, `date`, `price` FROM `order` WHERE `productID` = ?");
            preparedStatement.setInt(1, p.getProductID());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                allOrders.add(new Order(resultSet.getInt("orderID"), getProduct(resultSet.getInt("productID")),
                        getUser(resultSet.getInt("customerID")), resultSet.getInt("quantity"),
                        resultSet.getString("date"), resultSet.getDouble("price")));
            }
            return allOrders;
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("error in selecting all orders by product");
            return null;
        }
    }

    @Override
    public ArrayList<Order> selectAllOrders(User m) {
        ArrayList<Order> allOrders = new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement("SELECT `orderID`, `productID`, "
                    + "`customerID`, `quantity`, `date`, `price` FROM `order` WHERE `customerID` = ?");
            preparedStatement.setInt(1, m.getCustomerID());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                allOrders.add(new Order(resultSet.getInt("orderID"), getProduct(resultSet.getInt("productID")),
                        getUser(resultSet.getInt("customerID")), resultSet.getInt("quantity"),
                        resultSet.getString("date"), resultSet.getDouble("price")));
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
                preparedStatement.setInt(1, cards.get(i).getCardID());
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
    public boolean updateCreditCard(int cardID, int customerID) {
        boolean flag = false;
        ArrayList<CreditCard> cards = getAllCredits();
        for (int i = 0; i < cards.size(); i++) {
            try {
                preparedStatement = connection.prepareStatement("UPDATE `credit` SET `customerID` = ? WHERE `cardID` = ? ");
                preparedStatement.setInt(1, customerID);
                preparedStatement.setInt(2, cardID);
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
    public ArrayList<CreditCard> getAllCredits() {
        ArrayList<CreditCard> allCredits = new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement("SELECT `cardID`, `cardValue`, `customerID` FROM `credit` WHERE customerID IS NULL ");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                allCredits.add(new CreditCard(resultSet.getInt("cardID"), resultSet.getInt("cardValue")));
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
    public int getCreditValue(int cardID) {
        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM `credit` WHERE `cardID` =? AND `customerID` IS NULL");
            preparedStatement.setInt(1, cardID);
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

}
