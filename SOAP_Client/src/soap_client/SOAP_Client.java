/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soap_client;

import soapservice.Pokemon;

/**
 *
 * @author Max
 */
public class SOAP_Client {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Pokemon requestedPokemon = getPokemonInfo(1);
        System.out.println("--------------------------");
        System.out.println("Name: " + requestedPokemon.getName());
        System.out.println("Nr: " + requestedPokemon.getId());
        System.out.println("--------------------------");
    }

    private static Pokemon getPokemonInfo(int arg0) {
        soapservice.PokemonInformationService service = new soapservice.PokemonInformationService();
        soapservice.PokemonInformation port = service.getPokemonInformationPort();
        return port.getPokemonInfo(arg0);
    }
    
}
