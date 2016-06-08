package session;

import entity.Pokemon;
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
    
}
