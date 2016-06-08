package cart;

import entity.Pokemon;

/**
 *
 * @author Max
 */
public class PokeBall {

    private Pokemon pokemon;
    private short quantity;

    public PokeBall(Pokemon pokemon) {
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