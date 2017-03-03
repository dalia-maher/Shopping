package beans;

/**
 *
 * @author Dalia
 */

public class CreditCard {
    private int cardID;
    private int cardValue;
    private int customerID;
    
    public CreditCard() {
    }
    
    public CreditCard(int cardID, int cardValue) {
        this.cardID = cardID;
        this.cardValue = cardValue;
    }

    public CreditCard(int cardID, int cardValue, int customerID) {
        this.cardID = cardID;
        this.cardValue = cardValue;
        this.customerID = customerID;
    }

    public int getCardID() {
        return cardID;
    }

    public void setCardID(int cardID) {
        this.cardID = cardID;
    }

    public int getCardValue() {
        return cardValue;
    }

    public void setCardValue(int cardValue) {
        this.cardValue = cardValue;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }
    
}
