package beans;

/**
 *
 * @author TahanyFawzy
 */
public class ShoppingCart 
{
    private Product product;
    private User customer;
    private int quantity;

    public ShoppingCart() {
    }
    
    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public User getCustomer() {
        return customer;
    }

    public void setCustomer(User customer) {
        this.customer = customer;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public ShoppingCart(Product product, User customer, int quantity) {
        this.product = product;
        this.customer = customer;
        this.quantity = quantity;
    }
}
