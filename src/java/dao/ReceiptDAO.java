/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import model.Receipt;
import model.User;

/**
 *
 * @author tuan
 */
public interface ReceiptDAO {
    public ArrayList<Receipt> getReceiptListByUser(User user);
    public boolean insertReceipt(Receipt rc);
    public int getLatestReceiptID();
    public ArrayList<Receipt> getReceiptList(String input);
    public void updateReceipt(String id);
}
