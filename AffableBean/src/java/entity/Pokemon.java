package entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Max
 */
@Entity
@Table(name = "pokemon")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Pokemon.findAll", query = "SELECT p FROM Pokemon p"),
    @NamedQuery(name = "Pokemon.findById", query = "SELECT p FROM Pokemon p WHERE p.id = :id"),
    @NamedQuery(name = "Pokemon.findByName", query = "SELECT p FROM Pokemon p WHERE p.name = :name"),
    @NamedQuery(name = "Pokemon.findByHeight", query = "SELECT p FROM Pokemon p WHERE p.height = :height"),
    @NamedQuery(name = "Pokemon.findByWeight", query = "SELECT p FROM Pokemon p WHERE p.weight = :weight"),
    @NamedQuery(name = "Pokemon.findByHp", query = "SELECT p FROM Pokemon p WHERE p.hp = :hp"),
    @NamedQuery(name = "Pokemon.findByAttack", query = "SELECT p FROM Pokemon p WHERE p.attack = :attack"),
    @NamedQuery(name = "Pokemon.findByDefense", query = "SELECT p FROM Pokemon p WHERE p.defense = :defense"),
    @NamedQuery(name = "Pokemon.findBySpecialAttack", query = "SELECT p FROM Pokemon p WHERE p.specialAttack = :specialAttack"),
    @NamedQuery(name = "Pokemon.findBySpecialDefense", query = "SELECT p FROM Pokemon p WHERE p.specialDefense = :specialDefense"),
    @NamedQuery(name = "Pokemon.findBySpeed", query = "SELECT p FROM Pokemon p WHERE p.speed = :speed"),
    @NamedQuery(name = "Pokemon.findByTotal", query = "SELECT p FROM Pokemon p WHERE p.total = :total"),
    @NamedQuery(name = "Pokemon.findByAbilityI", query = "SELECT p FROM Pokemon p WHERE p.abilityI = :abilityI"),
    @NamedQuery(name = "Pokemon.findByAbilityII", query = "SELECT p FROM Pokemon p WHERE p.abilityII = :abilityII"),
    @NamedQuery(name = "Pokemon.findByGender", query = "SELECT p FROM Pokemon p WHERE p.gender = :gender"),
    @NamedQuery(name = "Pokemon.findByEvolvesBy", query = "SELECT p FROM Pokemon p WHERE p.evolvesBy = :evolvesBy"),
    @NamedQuery(name = "Pokemon.findByEvolvesFrom", query = "SELECT p FROM Pokemon p WHERE p.evolvesFrom = :evolvesFrom"),
    @NamedQuery(name = "Pokemon.findByEvolvesTo", query = "SELECT p FROM Pokemon p WHERE p.evolvesTo = :evolvesTo")})
public class Pokemon implements Serializable {

    private static final long serialVersionUID = 1L;
    
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id")
    private Integer id;
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "name")
    private String name;
    
    @Basic(optional = false)
    @NotNull
    @Column(name = "height")
    private int height;
    
    @Basic(optional = false)
    @NotNull
    @Column(name = "weight")
    private int weight;
    
    @Basic(optional = false)
    @NotNull
    @Column(name = "hp")
    private int hp;
    
    @Basic(optional = false)
    @NotNull
    @Column(name = "attack")
    private int attack;
    
    @Basic(optional = false)
    @NotNull
    @Column(name = "defense")
    private int defense;
    
    @Basic(optional = false)
    @NotNull
    @Column(name = "specialAttack")
    private int specialAttack;
    
    @Basic(optional = false)
    @NotNull
    @Column(name = "specialDefense")
    private int specialDefense;
    
    @Basic(optional = false)
    @NotNull
    @Column(name = "speed")
    private int speed;
    
    @Basic(optional = false)
    @NotNull
    @Column(name = "total")
    private int total;
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "abilityI")
    private String abilityI;
    
    @Size(max = 45)
    @Column(name = "abilityII")
    private String abilityII;
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "gender")
    private String gender;
    
    @Size(max = 45)
    @Column(name = "evolvesBy")
    private String evolvesBy;
    
    /*@Column(name = "evolvesFrom")*/
    @JoinColumn(name = "evolvesFrom")
    @OneToOne
    private Pokemon evolvesFrom;
    
    
    @ManyToMany
    private Collection<Pokemon> evolvesTo;
    
//    @Column(name = "evolvesTo")
//    private Integer evolvesTo;
    
    @JoinTable(name = "pokemon_has_type", joinColumns = {
        @JoinColumn(name = "pokemon_id", referencedColumnName = "id")}, inverseJoinColumns = {
        @JoinColumn(name = "type_id", referencedColumnName = "id")})
    @ManyToMany
    private List<Type> typeCollection;

    public Pokemon() {
    }

    public Pokemon(Integer id) {
        this.id = id;
    }

    public Pokemon(Integer id, String name, int height, int weight, int hp, int attack, int defense, int specialAttack, int specialDefense, int speed, int total, String abilityI, String gender) {
        this.id = id;
        this.name = name;
        this.height = height;
        this.weight = weight;
        this.hp = hp;
        this.attack = attack;
        this.defense = defense;
        this.specialAttack = specialAttack;
        this.specialDefense = specialDefense;
        this.speed = speed;
        this.total = total;
        this.abilityI = abilityI;
        this.gender = gender;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public int getHp() {
        return hp;
    }

    public void setHp(int hp) {
        this.hp = hp;
    }

    public int getAttack() {
        return attack;
    }

    public void setAttack(int attack) {
        this.attack = attack;
    }

    public int getDefense() {
        return defense;
    }

    public void setDefense(int defense) {
        this.defense = defense;
    }

    public int getSpecialAttack() {
        return specialAttack;
    }

    public void setSpecialAttack(int specialAttack) {
        this.specialAttack = specialAttack;
    }

    public int getSpecialDefense() {
        return specialDefense;
    }

    public void setSpecialDefense(int specialDefense) {
        this.specialDefense = specialDefense;
    }

    public int getSpeed() {
        return speed;
    }

    public void setSpeed(int speed) {
        this.speed = speed;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getAbilityI() {
        return abilityI;
    }

    public void setAbilityI(String abilityI) {
        this.abilityI = abilityI;
    }

    public String getAbilityII() {
        return abilityII;
    }

    public void setAbilityII(String abilityII) {
        this.abilityII = abilityII;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEvolvesBy() {
        return evolvesBy;
    }

    public void setEvolvesBy(String evolvesBy) {
        this.evolvesBy = evolvesBy;
    }

    public Pokemon getEvolvesFrom() {
        return evolvesFrom;
    }

    public void setEvolvesFrom(Pokemon evolvesFrom) {
        this.evolvesFrom = evolvesFrom;
    }

    public Collection<Pokemon> getEvolvesTo() {
        return evolvesTo;
    }

    public void setEvolvesTo(Collection<Pokemon> evolvesTo) {
        this.evolvesTo = evolvesTo;
    }

    @XmlTransient
    public List<Type> getTypeCollection() {
        return typeCollection;
    }

    public void setTypeCollection(List<Type> typeCollection) {
        this.typeCollection = typeCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pokemon)) {
            return false;
        }
        Pokemon other = (Pokemon) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Pokemon[ id=" + id + " ]";
    }
    
}
