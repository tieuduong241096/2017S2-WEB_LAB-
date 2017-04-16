/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import model.Product;
import model.Receipt;
import model.ReceiptDetail;

/**
 *
 * @author tuan
 */
public interface ReceiptDetailDAO {
    public ArrayList<ReceiptDetail> getReceiptDetailListByReceipt(Receipt receipt);
    public ArrayList<ReceiptDetail> getReceiptDetailListByProduct(Product product);
    public boolean insertReceiptDetail(ReceiptDetail rcdt);
}
