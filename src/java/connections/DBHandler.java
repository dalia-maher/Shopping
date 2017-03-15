package connections;

import beans.*;
import java.util.ArrayList;

/**
 *
 * @author TahanyFawzy
 */
public interface DBHandler {
    int ERROR_IN_ADD = 400;
    int NEW_SHOOPINGITEM = 1;
    int EDITED_SHOOPINGITEM = 2;
    
    //Categories
    
    public boolean insertCategorey(String name);

    public Category getCategory(int ID);
    
    public boolean deleteCategorey(String name);

    public ArrayList<Category> getAllCategories();//for the homepage

    //Customer 
    
    public boolean signUp(User customer);

    public boolean updateCustomer(User old, User neww);

    public ArrayList<User> getAllUsers();

    public User getUser(int id);

    public boolean validateEmail(String email);

    public boolean validateUName(String username);

    public int getUserID(String email);

    public User signIn(String email, String password);

    //product
    
    public boolean addProduct(Product product);//edit or add the same function

    public boolean deleteProduct(int productID);

    public ArrayList<Product> getAllProducts(int offset, int limit);

    public ArrayList<Product> getAllProducts();
    
    public ArrayList<Product>getProductsCategory(int categoryID);

    public boolean editProduct(int old, Product neww);

    public boolean updateProductQuantity(int productID, int newQuantity);

    public ArrayList<Product> searchProduct(String query);

    public ArrayList<Product>searchProductByPrice(double price);
    
    public Product getProduct(int ID);
    
    //shopping cart
    
    public int addToShoppingCart(int productID, int customerID, int quantity);

    public boolean removeFromShoppingCart(int productID, int customerID);

    public boolean resetShoppingCart(int customerID);

    public boolean updateCartQuantity(int productID, int customerID, int newQuantity);
    
    public ArrayList<ShoppingCart> getShoppingCart(String ID);
    
    //orders

    public int getMaxOrderNum(int customerID);

    public boolean insertOrder(Order o);

    public ArrayList<Order> selectAllOrders();

    public ArrayList<Order> selectAllOrders(Product p);

    public ArrayList<Order> selectAllOrders(User m);

    //Credits
    
    public boolean insertNewCards(ArrayList<CreditCard> cards);

    public ArrayList<CreditCard> getAllCredits();
    
    public int getCreditValue(String cardID);
    
     public double getCreditValue(int userID);

    public boolean updateCreditCard(String cardID, int customerID);
    
    public boolean updateUserCredit(User user, double value);

    // /Interests

    public ArrayList<Category> getInterests(User user);

    public boolean insertInterests(User user, ArrayList<Integer> interests);

    public boolean deleteIntersts(User user);
    
    // contact us
    
    public boolean addMsg(Contact contact);
    
}
