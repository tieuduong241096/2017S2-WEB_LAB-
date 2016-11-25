/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;



/**
 *
 * @author tuan
 */
public class Receipt {
    private long receiptID;
    private Timestamp bookDate;
    private String payMode;
    private Timestamp shipDate;
    private String shipAddress;
    private User user;
    private String status;

    public Receipt() {
    }

    public Receipt(long receiptID, Timestamp bookDate, String payMode, Timestamp shipDate, String shipAddress, User user, String status) {
        this.receiptID = receiptID;
        this.bookDate = bookDate;
        this.payMode = payMode;
        this.shipDate = shipDate;
        this.shipAddress = shipAddress;
        this.user = user;
        this.status = status;
    }

    public long getReceiptID() {
        return receiptID;
    }

    public void setReceiptID(long receiptID) {
        this.receiptID = receiptID;
    }

    public Timestamp getBookDate() {
        return bookDate;
    }

    public void setBookDate(Timestamp bookDate) {
        this.bookDate = bookDate;
    }

    public String getPayMode() {
        return payMode;
    }

    public void setPayMode(String payMode) {
        this.payMode = payMode;
    }

    public Timestamp getShipDate() {
        return shipDate;
    }

    public void setShipDate(Timestamp shipDate) {
        this.shipDate = shipDate;
    }

    public String getShipAddress() {
        return shipAddress;
    }

    public void setShipAddress(String shipAddress) {
        this.shipAddress = shipAddress;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
