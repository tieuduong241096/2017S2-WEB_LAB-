/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.TreeMap;

/**
 *
 * @author tuan
 */
public class SizeBean {
    private ArrayList<Double> sizes;
    private double size;
    private TreeMap<Integer,Double>idsizes;

    public TreeMap<Integer, Double> getIdsizes() {
        return idsizes;
    }

    public void setIdsizes(TreeMap<Integer, Double> idsizes) {
        this.idsizes = idsizes;
    }

    
    public ArrayList<Double> getSizes() {
        return sizes;
    }

    public void setSizes(ArrayList<Double> sizes) {
        this.sizes = sizes;
    }

    public double getSize() {
        return size;
    }

    public void setSize(double size) {
        this.size = size;
    }

   

    
    
    
}
