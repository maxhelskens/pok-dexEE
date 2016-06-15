package interceptor;

import java.io.Serializable;
import java.util.logging.Logger;
import javax.inject.Inject;
import javax.interceptor.AroundConstruct;
import javax.interceptor.AroundInvoke;
import javax.interceptor.Interceptor;
import javax.interceptor.InvocationContext;

/**
 *
 * @author matthias
 */
public class CatchLogger implements Serializable{
    @Inject
    private Logger logger;
    
    @AroundConstruct
    private void init(InvocationContext ic) throws Exception {
        logger.fine("Entering constructor");
        try {
            ic.proceed();
        } finally {
            logger.fine("Exiting constructor");
        }
    }
    
    @AroundInvoke
    public Object logMethod(InvocationContext ic) throws Exception {
        logger.entering(ic.getTarget().toString(), ic.getMethod().getName());
        try {
            System.out.println(ic.getParameters()[0].toString() + " was caught!");
            return ic.proceed();
        } finally {
        logger.exiting(ic.getTarget().toString(), ic.getMethod().getName());
        }
    }
}
