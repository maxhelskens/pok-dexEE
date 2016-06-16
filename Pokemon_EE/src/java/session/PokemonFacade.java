package session;

import entity.Pokemon;
import java.util.Random;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Max
 */
@Stateless
public class PokemonFacade extends AbstractFacade<Pokemon> {

    @PersistenceContext(unitName = "AffableBeanPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PokemonFacade() {
        super(Pokemon.class);
    }
    
    
    public Pokemon getRandomPokemon(){
        Random r = new Random();
        int Low = 1;
        int High = 151;
        int Result = r.nextInt(High-Low) + Low;

        Pokemon randPokemon = this.find(Result);
        return randPokemon;
    }
    
    public boolean getCatched(Pokemon pokemon){
        int randomInt = (int) Math.floor((Math.random() * 605) + 1);
        if(randomInt >= (pokemon.getTotal() - 195)){
            return true;
        }
        return false;
    }
}
