package soapService;

import entity.Pokemon;
import javax.ejb.EJB;
import javax.jws.WebService;
import javax.jws.WebMethod;
import session.PokemonFacade;

/**
 *
 * @author Max
 */

@WebService
public class pokemonInformation {

    @EJB
    private PokemonFacade pokemonFacade;
    
    @WebMethod
    public Pokemon getPokemonInfo(int id){
        
        Pokemon requestedPokemon = pokemonFacade.find(id);
        return requestedPokemon;
    }
}
