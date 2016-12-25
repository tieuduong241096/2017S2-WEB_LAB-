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
public class ReceiptReceiptDetailProduct {
    private Timestamp bookDate;
    private String payMode;
    private String shipAddress;
     private int quantity;
    private double price;
    private double size;
    private String productName;

    public ReceiptReceiptDetailProduct() {
    }

    public ReceiptReceiptDetailProduct(Timestamp bookDate, String payMode, String shipAddress, int quantity, double price, double size, String productName) {
        this.bookDate = bookDate;
        this.payMode = payMode;
        this.shipAddress = shipAddress;
        this.quantity = quantity;
        this.price = price;
        this.size = size;
        this.productName = productName;
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

    public String getShipAddress() {
        return shipAddress;
    }

    public void setShipAddress(String shipAddress) {
        this.shipAddress = shipAddress;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getSize() {
        return size;
    }

    public void setSize(double size) {
        this.size = size;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }
    
    
}
