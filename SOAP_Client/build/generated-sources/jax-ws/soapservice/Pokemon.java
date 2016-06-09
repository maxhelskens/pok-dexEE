
package soapservice;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for pokemon complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="pokemon">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="abilityI" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="abilityII" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="attack" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="defense" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="evolvesBy" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="evolvesFrom" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="evolvesTo" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="gender" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="height" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="hp" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="id" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="name" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="specialAttack" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="specialDefense" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="speed" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="total" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="weight" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "pokemon", propOrder = {
    "abilityI",
    "abilityII",
    "attack",
    "defense",
    "evolvesBy",
    "evolvesFrom",
    "evolvesTo",
    "gender",
    "height",
    "hp",
    "id",
    "name",
    "specialAttack",
    "specialDefense",
    "speed",
    "total",
    "weight"
})
public class Pokemon {

    protected String abilityI;
    protected String abilityII;
    protected int attack;
    protected int defense;
    protected String evolvesBy;
    protected Integer evolvesFrom;
    protected Integer evolvesTo;
    protected String gender;
    protected int height;
    protected int hp;
    protected Integer id;
    protected String name;
    protected int specialAttack;
    protected int specialDefense;
    protected int speed;
    protected int total;
    protected int weight;

    /**
     * Gets the value of the abilityI property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getAbilityI() {
        return abilityI;
    }

    /**
     * Sets the value of the abilityI property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setAbilityI(String value) {
        this.abilityI = value;
    }

    /**
     * Gets the value of the abilityII property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getAbilityII() {
        return abilityII;
    }

    /**
     * Sets the value of the abilityII property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setAbilityII(String value) {
        this.abilityII = value;
    }

    /**
     * Gets the value of the attack property.
     * 
     */
    public int getAttack() {
        return attack;
    }

    /**
     * Sets the value of the attack property.
     * 
     */
    public void setAttack(int value) {
        this.attack = value;
    }

    /**
     * Gets the value of the defense property.
     * 
     */
    public int getDefense() {
        return defense;
    }

    /**
     * Sets the value of the defense property.
     * 
     */
    public void setDefense(int value) {
        this.defense = value;
    }

    /**
     * Gets the value of the evolvesBy property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getEvolvesBy() {
        return evolvesBy;
    }

    /**
     * Sets the value of the evolvesBy property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setEvolvesBy(String value) {
        this.evolvesBy = value;
    }

    /**
     * Gets the value of the evolvesFrom property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getEvolvesFrom() {
        return evolvesFrom;
    }

    /**
     * Sets the value of the evolvesFrom property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setEvolvesFrom(Integer value) {
        this.evolvesFrom = value;
    }

    /**
     * Gets the value of the evolvesTo property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getEvolvesTo() {
        return evolvesTo;
    }

    /**
     * Sets the value of the evolvesTo property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setEvolvesTo(Integer value) {
        this.evolvesTo = value;
    }

    /**
     * Gets the value of the gender property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getGender() {
        return gender;
    }

    /**
     * Sets the value of the gender property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setGender(String value) {
        this.gender = value;
    }

    /**
     * Gets the value of the height property.
     * 
     */
    public int getHeight() {
        return height;
    }

    /**
     * Sets the value of the height property.
     * 
     */
    public void setHeight(int value) {
        this.height = value;
    }

    /**
     * Gets the value of the hp property.
     * 
     */
    public int getHp() {
        return hp;
    }

    /**
     * Sets the value of the hp property.
     * 
     */
    public void setHp(int value) {
        this.hp = value;
    }

    /**
     * Gets the value of the id property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getId() {
        return id;
    }

    /**
     * Sets the value of the id property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setId(Integer value) {
        this.id = value;
    }

    /**
     * Gets the value of the name property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the value of the name property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setName(String value) {
        this.name = value;
    }

    /**
     * Gets the value of the specialAttack property.
     * 
     */
    public int getSpecialAttack() {
        return specialAttack;
    }

    /**
     * Sets the value of the specialAttack property.
     * 
     */
    public void setSpecialAttack(int value) {
        this.specialAttack = value;
    }

    /**
     * Gets the value of the specialDefense property.
     * 
     */
    public int getSpecialDefense() {
        return specialDefense;
    }

    /**
     * Sets the value of the specialDefense property.
     * 
     */
    public void setSpecialDefense(int value) {
        this.specialDefense = value;
    }

    /**
     * Gets the value of the speed property.
     * 
     */
    public int getSpeed() {
        return speed;
    }

    /**
     * Sets the value of the speed property.
     * 
     */
    public void setSpeed(int value) {
        this.speed = value;
    }

    /**
     * Gets the value of the total property.
     * 
     */
    public int getTotal() {
        return total;
    }

    /**
     * Sets the value of the total property.
     * 
     */
    public void setTotal(int value) {
        this.total = value;
    }

    /**
     * Gets the value of the weight property.
     * 
     */
    public int getWeight() {
        return weight;
    }

    /**
     * Sets the value of the weight property.
     * 
     */
    public void setWeight(int value) {
        this.weight = value;
    }

}
