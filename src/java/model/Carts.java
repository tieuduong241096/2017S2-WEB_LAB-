
package model;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;

/**
 *
 * @author IU-CSE Team
 */

@Data
@AllArgsConstructor
public class Carts {
    private List<Products> products;
    
    public void addProduct(Products product) {
        this.products.add(product);
    }
}
