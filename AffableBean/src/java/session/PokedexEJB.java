package session;

import cart.PokeBall;
import entity.Pokemon;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.ejb.Stateful;

/**
 *
 * @author Vincent
 */
@Stateful
public class PokedexEJB {

    private List<PokeBall> items;

    /**
     * Adds a Pokemon to the Pokedex
     *
     * If a pokemon of the same species already exists then the quantity is
     * incremented.
     *
     * @param pokemon the Pokemon
     * @see PokeBall
     */
    public void add(Pokemon pokemon) {
        boolean newPokemon = true;

        for (PokeBall scItem : items) {
            if (scItem.getPokemon().getId().equals(pokemon.getId())) {
                newPokemon = false;
                scItem.incrementQuantity();
            }
        }

        if (newPokemon) {
            PokeBall newPokeball = new PokeBall(pokemon);
            items.add(newPokeball);
        }
    }

    /**
     * Updates the ShoppingCartItem of the specified pokemon to the specified
     * quantity. If '0' is the given quantity, the ShoppingCartItem is removed
     * from the ShoppingCart's items list.
     *
     * @param pokemon the Pokemon
     * @param quantity the number of Pokemon of this species
     * @see PokeBall
     */
    public void update(Pokemon pokemon, short quantity) {
        //short qty = -1;

        // cast quantity as short
        //qty = Short.parseShort(quantity);
        short qty = quantity;
        
        if (qty >= 0) {
            PokeBall item = null;

            for (PokeBall scItem : items) {
                if (scItem.getPokemon().getId().equals(pokemon.getId())) {
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
    
    public List<PokeBall> getItems() {
        return items;
    }
    
    public int getNumberOfItems() {
        int numberOfItems = 0;

        for(PokeBall scItem : items) {
            numberOfItems += scItem.getQuantity();
        }

        return numberOfItems;
    }
    
    public void clear() {
        items.clear();
    }
    
    @PostConstruct
    public void initialize(){
        this.items = new ArrayList<>();
    }
}
