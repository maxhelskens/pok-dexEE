package cart;

import entity.Pokemon;
import java.util.*;

/**
 *
 * @author Max
 */
@Deprecated
public class ShoppingCart {

    List<PokeBall> items;
    int numberOfItems;
    double total;

    public ShoppingCart() {
        items = new ArrayList<PokeBall>();
        numberOfItems = 0;
        total = 0;
    }

   

    /**
     * Updates the <code>ShoppingCartItem</code> of the specified
     * <code>pokemon</code> to the specified quantity. If '<code>0</code>'
     * is the given quantity, the <code>ShoppingCartItem</code> is removed
     * from the <code>ShoppingCart</code>'s <code>items</code> list.
     *
     * @param pokemon the <code>Pokemon</code> that defines the type of shopping cart item
     * @param quantity the number which the <code>ShoppingCartItem</code> is updated to
     * @see PokeBall
     */
    public synchronized void update(Pokemon pokemon, String quantity) {

        short qty = -1;

        // cast quantity as short
        qty = Short.parseShort(quantity);

        if (qty >= 0) {

            PokeBall item = null;

            for (PokeBall scItem : items) {

                if (scItem.getPokemon().getId() == pokemon.getId()) {

                    if (qty != 0) {
                        // set item quantity to new value
                        scItem.setQuantity(qty);
                    } else {
                        // if quantity equals 0, save item and break
                        item = scItem;
                        break;
                    }
                }
            }

            if (item != null) {
                // remove from cart
                items.remove(item);
            }
        }
    }

    /**
     * Returns the list of <code>ShoppingCartItems</code>.
     *
     * @return the <code>items</code> list
     * @see PokeBall
     */
    public synchronized List<PokeBall> getItems() {

        return items;
    }

    /**
     * Returns the sum of quantities for all items maintained in shopping cart
     * <code>items</code> list.
     *
     * @return the number of items in shopping cart
     * @see PokeBall
     */
    public synchronized int getNumberOfItems() {

        numberOfItems = 0;

        for (PokeBall scItem : items) {

            numberOfItems += scItem.getQuantity();
        }

        return numberOfItems;
    }

    /**
     * Empties the shopping cart. All items are removed from the shopping cart
     * <code>items</code> list, <code>numberOfItems</code> and
     * <code>total</code> are reset to '<code>0</code>'.
     *
     * @see PokeBall
     */
    public synchronized void clear() {
        items.clear();
        numberOfItems = 0;
        total = 0;
    }

}