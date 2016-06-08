package cart;

import entity.Pokemon;

/**
 *
 * @author Max
 */
public class ShoppingCartItem {

    Pokemon pokemon;
    short quantity;

    public ShoppingCartItem(Pokemon pokemon) {
        this.pokemon = pokemon;
        quantity = 1;
    }

    public Pokemon getPokemon() {
        return pokemon;
    }

    public short getQuantity() {
        return quantity;
    }

    public void setQuantity(short quantity) {
        this.quantity = quantity;
    }

    public void incrementQuantity() {
        quantity++;
    }

    public void decrementQuantity() {
        quantity--;
    }
}