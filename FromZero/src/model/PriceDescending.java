package model;

import java.util.Comparator;

public class PriceDescending implements Comparator<Product> {
	 
    @Override
    public int compare(Product a, Product b) {
        Integer temp1 = a.getPrice();
        Integer temp2 = b.getPrice();
        
        return temp2.compareTo(temp1);
    }
}