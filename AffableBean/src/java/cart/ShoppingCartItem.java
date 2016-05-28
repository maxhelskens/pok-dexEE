/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package cart;

import entity.Pokemon;
import entity.Product;

/**
 *
 * @author tgiunipero
 */
public class ShoppingCartItem {

    Pokemon pokemon;
    Product product;
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