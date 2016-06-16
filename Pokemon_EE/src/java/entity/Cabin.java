

package entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Size;

/**
 *
 * @author Vincent Ceulemans
 */
@Entity
public class Cabin {
    @Id()
    @Column(name="CABIN_ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer cabinId;
    
    @Size(max=45)
    @Basic(optional=false)
    @Column(name="CABIN_NAME")
    private String cabinName;
    
    @Column(name="CABIN_DECK_LEVEL")
    private Integer cabinDeckLevel;
    
    
}
