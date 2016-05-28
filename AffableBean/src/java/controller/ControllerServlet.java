/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import cart.ShoppingCart;
import entity.Category;
import entity.Pokemon;
import entity.Product;
import entity.Type;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Random;
import javax.ejb.EJB;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import session.CategoryFacade;
import session.PokemonFacade;
import session.ProductFacade;
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
                       "/updateCart"})

public class ControllerServlet extends HttpServlet {
    
    private String surcharge;

    @EJB
    private CategoryFacade categoryFacade;
    @EJB
    private ProductFacade productFacade;
    @EJB
    private PokemonFacade pokemonFacade;
    @EJB
    private TypeFacade typeFacade;

    @Override
    public void init(ServletConfig servletConfig) throws ServletException {

        super.init(servletConfig);
        
        // store type list in servlet context
        getServletContext().setAttribute("types", typeFacade.findAll());
        
        // store random pokemon in servlet context
        Random r = new Random();
        int Low = 1;
        int High = 151;
        int Result = r.nextInt(High-Low) + Low;
        
        getServletContext().setAttribute("randPokemon", pokemonFacade.find(Result));
        
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
        
        Category selectedCategory;
        Collection<Product> categoryProducts;
        
        Type selectedType;
        Collection<Pokemon> typePokemon;
        
        
        // store random pokemon
        Random r = new Random();
        int Low = 1;
        int High = 151;
        int Result = r.nextInt(High-Low) + Low;
        
        Pokemon randPokemon = pokemonFacade.find(Result);
        session.setAttribute("randPokemon", randPokemon);
        session.setAttribute("randPokemonTypes", randPokemon.getTypeCollection());

        // if type page is requested
        if (userPath.equals("/type")) {

            // get typeId from request
            String typeId = request.getQueryString();

            if (typeId != null) {

                // get selected type
                selectedType = typeFacade.find(Integer.parseInt(typeId));

                // place selected type in session scope
                session.setAttribute("selectedType", selectedType);

                // get all pokemon for selected type
                typePokemon = selectedType.getPokemonCollection();

                // place type pokemon in session scope
                session.setAttribute("typePokemon", typePokemon);
            }
            
        // if allPokemon page is requested
        } else if (userPath.equals("/viewAll")) {

            userPath = "/allPokemon";

        // if allPokemon page is requested
        } else if (userPath.equals("/pokemon")) {

            // get typeId from request
            String pokemonId = request.getQueryString();
            
            if (pokemonId != null) {

                // get selected type
                Pokemon selectedPokemon = pokemonFacade.find(Integer.parseInt(pokemonId));

                // place type pokemon in session scope
                session.setAttribute("selectedPokemon", selectedPokemon);
                session.setAttribute("selectedPokemonTypes", selectedPokemon.getTypeCollection());
            }
            
        // if cart page is requested
        } else if (userPath.equals("/viewCart")) {

            String clear = request.getParameter("clear");

            if ((clear != null) && clear.equals("true")) {

                ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
                cart.clear();
            }

            userPath = "/cart";
        }
        
        // use RequestDispatcher to forward request internally
        String url = "/WEB-INF/view" + userPath + ".jsp";

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
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");

        // if addToCart action is called
        if (userPath.equals("/addToCart")) {

            // if user is adding item to cart for first time
            // create cart object and attach it to user session
            if (cart == null) {

                cart = new ShoppingCart();
                session.setAttribute("cart", cart);
            }

            // get user input from request
            String pokemonId = request.getParameter("pokemonId");

            if (!pokemonId.isEmpty()) {

                Pokemon pokemon = pokemonFacade.find(Integer.parseInt(pokemonId));
                cart.addItem(pokemon);
            }

            userPath = "/type";


        // if updateCart action is called
        } else if (userPath.equals("/updateCart")) {

            // get input from request
            String pokemonId = request.getParameter("pokemonId");
            String quantity = request.getParameter("quantity");

            Pokemon pokemon = pokemonFacade.find(Integer.parseInt(pokemonId));
            cart.update(pokemon, quantity);

            userPath = "/cart";
            
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