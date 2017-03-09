package beans;

/**
 *
 * @author TahanyFawzy
 */
public class Product 
{
    private int productID;
    private Category category;
    private String name;
    private String description;
    private double price;
    private int quantity;
    private String images;

    public Product() {
    }

    public Product(int productID, Category category, String name, String description, double price, int quantity, String images) {
        this.productID = productID;
        this.category = category;
        this.name = name;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.images = images;
    }

    public Product(int productID, Category category, String name, String description, int quantity, double price) {
        this.productID = productID;
        this.category = category;
        this.name = name;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
       
    }

    public Product(Category category, String name, String description, int quantity, double price, String images) {
        this.category = category;
        this.name = name;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.images = images;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
}
