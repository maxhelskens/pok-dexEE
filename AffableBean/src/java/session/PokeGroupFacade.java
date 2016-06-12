package session;

import entity.PokeGroup;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author vincent
 */
@Stateless
public class PokeGroupFacade extends AbstractFacade<PokeGroup> {

    @PersistenceContext(unitName = "AffableBeanPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PokeGroupFacade() {
        super(PokeGroup.class);
    }
}
