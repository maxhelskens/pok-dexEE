package restService;

import java.util.Set;
import javax.ws.rs.core.Application;

/**
 *
 * @author matthias
 */
@javax.ws.rs.ApplicationPath("webresources")
public class ApplicationConfig extends Application{
    public Set<Class<?>> getClasses() {
        return getRestResourceClasses();
    }
    
    private Set<Class<?>> getRestResourceClasses() {
        Set<Class<?>> resources = new java.util.HashSet<Class<?>>();
        resources.add(restService.PokemonFacadeREST.class);
        return resources;
    }
}
