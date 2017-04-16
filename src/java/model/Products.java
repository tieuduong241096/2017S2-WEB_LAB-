
package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 * @author IU-CSE Team
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Products {
    private String productId;
    private String productName;
    private double productPrice;
    private String supplierId;
    private String info;
}
