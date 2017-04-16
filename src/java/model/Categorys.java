
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
public class Categorys {
    private String name;
    private String supplierId;
    private List<Products> products;
}
