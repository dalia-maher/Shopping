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

    public boolean deleteCategorey(String name);

    public ArrayList<Category> getAllCategories();//for the homepage

    //Customer 
    
    public Customer signUp(Customer customer);

    public boolean updateCustomer(Customer old, Customer neww);

    public ArrayList<Customer> getAllUsers();

    public Customer getUser(int id);

    public Customer signIn(String email, String password);

    //product
    
    public boolean addProduct(Product product);//edit or add the same function

    public boolean deleteProduct(Product product);

    public ArrayList<Product> getAllProducts();
    
    public ArrayList<Product>getProductsCategory(int categoryID);

    public boolean editProduct(Product old, Product neww);

    public ArrayList<Product> searchProduct(String query);

    public ArrayList<Product>searchProductByPrice(double price);
    
    //shopping cart
    
    public boolean addToShoppingCart(Product product, Customer customer, int quantity);

    public boolean removeFromShoppingCart(Product product, Customer customer);

    public boolean resetShoppingCart(Customer customer);

    public boolean updateCartQuantity(Product product, Customer customer, int newQuantity);
    
    //orders

    public boolean insertOrder(Order o);

    public ArrayList<Order> selectAllOrders();

    public ArrayList<Order> selectAllOrders(Product p);

    public ArrayList<Order> selectAllOrders(Customer m);

    //Credits
    
    public boolean insertNewCards(ArrayList<CreditCard> cards);

    public ArrayList<CreditCard> getAllCredits();

    public boolean updateCreditCard(int cardID, int customerID);
    
    // /Interests

    public ArrayList<Category> getInterests(Customer cusomer);

    public boolean insertInterests(Customer customer, ArrayList<Category> interest);

    public boolean deleteIntersts(Customer customer);

}
