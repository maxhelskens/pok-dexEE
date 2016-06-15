package controllers;

import play.*;
import play.mvc.*;
import play.db.jpa.*;
import views.html.*;
import models.*;
import play.data.FormFactory;
import play.data.Form;
import javax.inject.Inject;
import java.util.List;
import java.util.*;

import static play.libs.Json.*;

public class Application extends Controller {

    @Inject
    FormFactory formFactory;
    
    
    /**
     * @Transactional annotation is needed to inject EntityManager
     */

    @Transactional(readOnly = true)
    public Result index() {
        List<Pokemon> pokemon = (List<Pokemon>) JPA.em().createQuery("select p from Pokemon p").getResultList();
        return ok(index.render(pokemon));
    }

    @Transactional(readOnly = true)
    public Result pokemonEdit(int id){
        Form<Pokemon> pokeForm = formFactory.form(Pokemon.class);
        Pokemon selectedPokemon = JPA.em().find(Pokemon.class, id);
        
        List<Type> types = JPA.em().createQuery("select t  from Type t").getResultList();
        Map<String, String> typeOptions = new HashMap<>();
        for(Type type : types){
            typeOptions.put(type.getId().toString(), type.getName());
        }
        
        //Stupid Play Framework -> fill() returns a new Form object;
        //How should we know?
        pokeForm = pokeForm.fill(selectedPokemon);
        return ok(pokemon_edit.render(pokeForm, typeOptions));
    }
    
    
    @Transactional
    public Result addPokemon(){
        Form<Pokemon> pokeForm = formFactory.form(Pokemon.class);
        pokeForm = pokeForm.bindFromRequest();
        
        List<Type> types = JPA.em().createQuery("select t  from Type t").getResultList();
        Map<String, String> typeOptions = new HashMap<>();
        for(Type type : types){
            typeOptions.put(type.getId().toString(), type.getName());
        }
       
        System.out.println(pokeForm.errors());
       
        if(pokeForm.hasErrors()){
            System.out.println("Errors");
            return badRequest(pokemon_edit.render(pokeForm, typeOptions));
        }
        else{
            Pokemon pokemon = pokeForm.get();
            JPA.em().merge(pokemon);
            JPA.em().flush();
        }
        
        
        return redirect(routes.Application.index());
    }

    @Transactional(readOnly = true)
    public Result getPersons() {
        List<Person> persons = (List<Person>) JPA.em().createQuery("select p from Person p").getResultList();
        return ok(toJson(persons));
    }
    
    @Transactional(readOnly = true)
    public Result getPokemons(){
        List<Pokemon> pokemon = (List<Pokemon>) JPA.em().createQuery("select p from Pokemon p").getResultList();
        return ok(toJson(pokemon));
    }
    
    @Transactional(readOnly = true)
    public Result pokemon(int id){
        Pokemon selectedPokemon = JPA.em().find(Pokemon.class, id);
        return ok(pokemon.render(selectedPokemon));
    }
    
    @Transactional
    public Result setLangToDutch(){
        ctx().changeLang("nl");
        return redirect(routes.Application.index());
    }
    
    @Transactional
    public Result setLangToEnglish(){
        ctx().changeLang("en");
        return redirect(routes.Application.index());
    }
}
