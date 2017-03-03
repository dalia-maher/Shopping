package beans;

/**
 *
 * @author TahanyFawzy
 */
public class ShoppingCart 
{
    private Product product;
    private Customer customer;
    private int quantity;

    public ShoppingCart() {
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

    public ShoppingCart(Product product, Customer customer, int quantity) {
        this.product = product;
        this.customer = customer;
        this.quantity = quantity;
    }
}
