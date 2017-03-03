package beans;

/**
 *
 * @author TahanyFawzy
 */
public class Order 
{
    private int orderID;
    private Product product;
    private Customer customer;
    private int quantity;
    private String date;
    private double price;

    public Order() {
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Order(int orderID, Product product, Customer customer, int quantity, String date, double price) {
        this.orderID = orderID;
        this.product = product;
        this.customer = customer;
        this.quantity = quantity;
        this.date = date;
        this.price = price;
    }

    
}
