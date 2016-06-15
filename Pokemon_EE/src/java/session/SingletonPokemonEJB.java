package session;

import entity.Pokemon;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.ejb.Schedule;
import javax.ejb.Singleton;
import javax.ejb.Stateless;

/**
 *
 * @author vincent
 */
@Singleton
public class SingletonPokemonEJB {

    @EJB
    private PokemonFacade pokemonFacade;
    
    private Pokemon featuredPokemon;
    
    @PostConstruct
    @Schedule(minute = "*/2", hour="*")
    public void setFeaturedPokemon(){
        this.featuredPokemon = pokemonFacade.getRandomPokemon();
    }
    
    public Pokemon getFeaturedPokemon(){
        return this.featuredPokemon;
    }
}
