<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : May 23, 2016, 3:01:34 PM
    Author     : Max
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div id="wildPokemonRow">
    <div id="wildPokemonText">
        
        <img src="${initParam.pokemonImagePath}${selectedPokemon.id}.png"
                     alt="${selectedPokemon.name}" class="wildPokemonImage">
        
        <div id="pokémonInformation">
            <h3 id="wildPokemonTitle">No.${selectedPokemon.id}  ${selectedPokemon.name}</h3>
            <text>Ability I: ${selectedPokemon.abilityI}</text>
            <br/>
            <text>Ability II: ${selectedPokemon.abilityII}</text>
            <br/>
            <div id="wildPokemonTyperow">
                <c:forEach var="type" items="${selectedPokemonTypes}">
                    <div class="typeBox">
                        <a href="type?${type.id}"> <%--TODO: CHANGE LINK--%>
                            <img src="${initParam.typesImagePath}${type.id}.png"
                                 alt="${type.name}" class="typeImage">
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    
    <form action="addToCart" method="post">
        <input type="hidden"
               name="pokemonId"
               value="${selectedPokemon.id}">
        <input type="submit"
               name="submit"
               value="Catch Pokemon">
    </form>
</div>