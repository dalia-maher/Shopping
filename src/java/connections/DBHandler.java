package connections;

import beans.*;
import java.util.ArrayList;

/**
 *
 * @author TahanyFawzy
 */
public interface DBHandler {

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

    public boolean deleteProduct(Product product);

    public ArrayList<Product> getAllProducts();
    
    public ArrayList<Product>getProductsCategory(int categoryID);

    public boolean editProduct(Product old, Product neww);

    public ArrayList<Product> searchProduct(String query);

    public ArrayList<Product>searchProductByPrice(int price);
    
    public Product getProduct(int ID);
    
    //shopping cart
    
    public boolean addToShoppingCart(int productID, int customerID, int quantity);

    public boolean removeFromShoppingCart(Product product, User customer);

    public boolean resetShoppingCart(User customer);

    public boolean updateCartQuantity(int productID, int customerID, int newQuantity);
    
    //orders

    public boolean insertOrder(Order o);

    public ArrayList<Order> selectAllOrders();

    public ArrayList<Order> selectAllOrders(Product p);

    public ArrayList<Order> selectAllOrders(User m);

    //Credits
    
    public boolean insertNewCards(ArrayList<CreditCard> cards);

    public ArrayList<CreditCard> getAllCredits();
    
    public int getCreditValue(int cardID);

    public boolean updateCreditCard(int cardID, int customerID);
    
    // /Interests

    public ArrayList<Category> getInterests(User user);

    public boolean insertInterests(User user, ArrayList<Integer> interests);

    public boolean deleteIntersts(User user);

}
