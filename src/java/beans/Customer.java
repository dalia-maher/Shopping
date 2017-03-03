package beans;

import java.sql.Date;

/**
 *
 * @author TahanyFawzy
 */
public class Customer 
{
    private int customerID;
    private String email;
    private String userName;
    private String password;
    private String firstName;
    private String lastName;
    private String addresse;
    private double credit;
    private boolean type;
    private Date BOD;
    private String job;

    public Customer() {
    }
    
    public Customer(int customerID, String email, String userName, String password, String firstName, String lastName, String addresse, double credit, boolean type, Date BOD, String job) {
        this.customerID = customerID;
        this.email = email;
        this.userName = userName;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.addresse = addresse;
        this.credit = credit;
        this.type = type;
        this.BOD = BOD;
        this.job = job;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddresse() {
        return addresse;
    }

    public void setAddresse(String addresse) {
        this.addresse = addresse;
    }

    public double getCredit() {
        return credit;
    }

    public void setCredit(double credit) {
        this.credit = credit;
    }

    public boolean isType() {
        return type;
    }

    public void setType(boolean type) {
        this.type = type;
    }

    public Date getBOD() {
        return BOD;
    }

    public void setBOD(Date BOD) {
        this.BOD = BOD;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }
    
    
}
