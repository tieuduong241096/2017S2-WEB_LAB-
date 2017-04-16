/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author tuan
 */
public class ReceiptDetail {
    private int receiptDetailID;
    private int quantity;
    private double price;
    private Receipt receipt;
    private Product product;
    private double size;

    public ReceiptDetail() {
    }

    public double getSize() {
        return size;
    }

    public void setSize(double size) {
        this.size = size;
    }

    public ReceiptDetail(int receiptDetailID, int quantity, double price, Receipt receipt, Product product, double size) {
        this.receiptDetailID = receiptDetailID;
        this.quantity = quantity;
        this.price = price;
        this.receipt = receipt;
        this.product = product;
        this.size = size;
    }

    

    public int getReceiptDetailID() {
        return receiptDetailID;
    }

    public void setReceiptDetailID(int receiptDetailID) {
        this.receiptDetailID = receiptDetailID;
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

    public Receipt getReceipt() {
        return receipt;
    }

    public void setReceipt(Receipt receipt) {
        this.receipt = receipt;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
    
    
}
