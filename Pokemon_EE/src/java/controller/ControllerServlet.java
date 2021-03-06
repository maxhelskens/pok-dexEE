package controller;

import entity.PokeGroup;
import entity.Pokemon;
import entity.Type;
import java.io.IOException;
import java.util.Collection;
import java.util.Random;
import javax.ejb.EJB;
import javax.inject.Inject;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import session.PokeGroupFacade;
import session.PokedexEJB;
import session.PokemonFacade;
import session.SingletonPokemonEJB;
import session.TypeFacade;

/**
 *
 * @author Max
 */
@WebServlet(name = "ControllerServlet",
        loadOnStartup = 1,
        urlPatterns = {"/index",
                       "/type",
                       "/viewAll",
                       "/pokemon",
                       "/addToCart",
                       "/viewCart",
                       "/updateCart",
                       "/randomPokemon",
                       "/featured",
                       "/group"})
public class ControllerServlet extends HttpServlet {
    
    @EJB
    private PokemonFacade pokemonFacade;
    
    @EJB
    private TypeFacade typeFacade;
    
    @EJB
    private PokeGroupFacade groupFacade;
    
    @Inject
    private PokedexEJB pokedexBean;
    /* With @EJB the bean is loaded when the servlet is started.
       But the serlvet is shared between requests, so different sessions use the same
       stateful bean. This is not what we want.
       Using @Inject here, and @SessionScoped on the EJB we get what we want:
       Dependening on the session a different - the correct - Stateful Bean is used.
     */
    
    @EJB
    private SingletonPokemonEJB singletonPokemonEJB;

    private static final long serialVersionUID = 1L;
    
    @Override
    public void init(ServletConfig servletConfig) throws ServletException {

        super.init(servletConfig);
        
        // store type list in servlet context
        getServletContext().setAttribute("types", typeFacade.findAll());
        
        // store pokemon list in servlet context
        getServletContext().setAttribute("pokemonList", pokemonFacade.findAll());
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userPath = request.getServletPath();
        HttpSession session = request.getSession();
        System.out.println(userPath);
        
        Type selectedType;
        Collection<Pokemon> typePokemon;
        
        // if type page is requested
        if (userPath.equals("/type")) {

            // get typeId from request
            String typeId = request.getQueryString();

            if (typeId != null) {

                // get selected type
                selectedType = typeFacade.find(Integer.parseInt(typeId));

                // place selected type in request scope
                request.setAttribute("selectedType", selectedType);

                // get all pokemon for selected type
                typePokemon = selectedType.getPokemonCollection();

                // place type pokemon in request scope
                request.setAttribute("typePokemon", typePokemon);
            }
            
        // if allPokemon page is requested
        } else if (userPath.equals("/viewAll")) {
            userPath = "/allPokemon";
            request.setAttribute("list", pokemonFacade.findAll());
            request.setAttribute("pokeGroups", groupFacade.findAll());
        // if pokemon page is requested
        } else if (userPath.equals("/pokemon")) {

            // get typeId from request
            String pokemonId = request.getQueryString();
            
            if (pokemonId != null) {

                // get selected type
                Pokemon selectedPokemon = pokemonFacade.find(Integer.parseInt(pokemonId));

                // place type pokemon in request scope
                request.setAttribute("selectedPokemon", selectedPokemon);
                request.setAttribute("selectedPokemonTypes", selectedPokemon.getTypeCollection());
            }
            
        // if cart page is requested
        } else if (userPath.equals("/viewCart")) {
            request.setAttribute("pokemonlist", pokedexBean.getItems());
            String clear = request.getParameter("clear");

            if ((clear != null) && clear.equals("true")) {
                pokedexBean.clear();
            }

            userPath = "/cart";
            
        // if random pokemon is requested
        } else if (userPath.equals("/randomPokemon") || userPath.equals("/index")) {
            // store random pokemon
            Pokemon randPokemon = pokemonFacade.getRandomPokemon();
            request.setAttribute("randPokemon", randPokemon);
            request.setAttribute("randPokemonTypes", randPokemon.getTypeCollection());
            session.setAttribute("catched", pokemonFacade.getCatched(randPokemon));
            
            userPath = "index";
        }
        else if(userPath.equals("/featured")){
            request.setAttribute("featuredPokemon", singletonPokemonEJB.getFeaturedPokemon());
        }
        else if(userPath.equals("/group")){
            long groupId = Long.parseLong(request.getQueryString());
            PokeGroup pokeGroup = groupFacade.find(groupId);
            request.setAttribute("group", pokeGroup);
        }
        
        request.setAttribute("nrofpokemon", pokedexBean.getNumberOfItems());
        
        String url;
        // use RequestDispatcher to forward request internally
        if (userPath.equals("index")){
            url = "/index.jsp";
        }
        else {
            url = "/WEB-INF/view" + userPath + ".jsp";
        }

        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }


    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userPath = request.getServletPath();
        HttpSession session = request.getSession();
        
        // if addToCart action is called
        if (userPath.equals("/addToCart")) {
            // get user input from request
            String pokemonId = request.getParameter("pokemonId");

            if((boolean) session.getAttribute("catched") == true && !pokemonId.isEmpty()) {
                Pokemon pokemon = pokemonFacade.find(Integer.parseInt(pokemonId));
                pokedexBean.add(pokemon);
            }
            
            session.setAttribute("caughtpokemon", pokedexBean.getItems());
            session.setAttribute("catched", false);
            
            response.sendRedirect("viewCart");
        // if updateCart action is called
        } else if (userPath.equals("/updateCart")) {

            // get input from request
            String pokemonId = request.getParameter("pokemonId");
            String quantity = request.getParameter("quantity");

            Pokemon pokemon = pokemonFacade.find(Integer.parseInt(pokemonId));
            pokedexBean.update(pokemon, Short.parseShort(quantity));
            
            session.setAttribute("caughtpokemon", pokedexBean.getItems());

            response.sendRedirect("viewCart");
        }

        // use RequestDispatcher to forward request internally
        String url = "/WEB-INF/view" + userPath + ".jsp";

        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}