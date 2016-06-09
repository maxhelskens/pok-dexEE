
package soapservice;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the soapservice package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _GetPokemonInfoResponse_QNAME = new QName("http://soapService/", "getPokemonInfoResponse");
    private final static QName _GetPokemonInfo_QNAME = new QName("http://soapService/", "getPokemonInfo");
    private final static QName _Pokemon_QNAME = new QName("http://soapService/", "pokemon");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: soapservice
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link GetPokemonInfo }
     * 
     */
    public GetPokemonInfo createGetPokemonInfo() {
        return new GetPokemonInfo();
    }

    /**
     * Create an instance of {@link Pokemon }
     * 
     */
    public Pokemon createPokemon() {
        return new Pokemon();
    }

    /**
     * Create an instance of {@link GetPokemonInfoResponse }
     * 
     */
    public GetPokemonInfoResponse createGetPokemonInfoResponse() {
        return new GetPokemonInfoResponse();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetPokemonInfoResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://soapService/", name = "getPokemonInfoResponse")
    public JAXBElement<GetPokemonInfoResponse> createGetPokemonInfoResponse(GetPokemonInfoResponse value) {
        return new JAXBElement<GetPokemonInfoResponse>(_GetPokemonInfoResponse_QNAME, GetPokemonInfoResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetPokemonInfo }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://soapService/", name = "getPokemonInfo")
    public JAXBElement<GetPokemonInfo> createGetPokemonInfo(GetPokemonInfo value) {
        return new JAXBElement<GetPokemonInfo>(_GetPokemonInfo_QNAME, GetPokemonInfo.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Pokemon }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://soapService/", name = "pokemon")
    public JAXBElement<Pokemon> createPokemon(Pokemon value) {
        return new JAXBElement<Pokemon>(_Pokemon_QNAME, Pokemon.class, null, value);
    }

}
