<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : May 23, 2016, 3:01:34 PM
    Author     : Max
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div id="typerow">
    <c:forEach var="type" items="${types}">
        <div class="typeBox">
            <a href="type?${type.id}"> <%--TODO: CHANGE LINK--%>
                <img src="${initParam.typesImagePath}${type.id}.png"
                     alt="${type.name}" class="typeImage">
            </a>
        </div>
    </c:forEach>
</div>

<div id="wildPokemonRow">
    <div id="wildPokemonText">
        <p style="font-size: larger">Wild Pokémon appeared!</p>
        
        <img src="${initParam.pokemonImagePath}${randPokemon.id}.png"
                     alt="${randPokemon.name}" class="wildPokemonImage">
        
        <div id="pokémonInformation">
            <h3 id="wildPokemonTitle">No.${randPokemon.id}  ${randPokemon.name}</h3>
            <text>Ability I: ${randPokemon.abilityI}</text>
            <br/>
            <text>Ability II: ${randPokemon.abilityII}</text>
            <br/>
            <div id="wildPokemonTyperow">
                <c:forEach var="type" items="${randPokemonTypes}">
                    <div class="typeBox">
                        <a href="type?${type.id}"> <%--TODO: CHANGE LINK--%>
                            <img src="${initParam.typesImagePath}${type.id}.png"
                                 alt="${type.name}" class="typeImage">
                        </a>
                    </div>
                </c:forEach>
            </div>
            <div id="pokémonInformation2">
                <text><small>Attack: ${randPokemon.attack}</small></text>
                <br/>
                <text><small>Defense: ${randPokemon.defense}</small></text>
                <br/>
                <text><small>Speed: ${randPokemon.speed}</small></text>
            </div>
            <div id="pokémonInformation3">
                <text><small>Special attack: ${randPokemon.specialAttack}</small></text>
                <br/>
                <text><small>Special defense: ${randPokemon.specialDefense}</small></text>
                <br/>
                <text><small>Hp: ${randPokemon.hp}</small></text>
            </div>
        </div>
    </div>
    
    <form action="addToCart" method="post">
        <input type="hidden"
               name="pokemonId"
               value="${randPokemon.id}">
        <input type="submit"
               name="submit"
               value="Catch Pokemon">
    </form>
</div>