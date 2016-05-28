<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : May 23, 2016, 3:01:34 PM
    Author     : Max
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="pokemonHeader">
    <h1>No.${selectedPokemon.id} ${selectedPokemon.name}</h1>
</div>

<div id="pokemonLeftHeader">
    <c:if test="${selectedPokemon.id > 1}">
        <a href="pokemon?${selectedPokemon.id - 1}" class="pokemonlink bubble"> No. ${selectedPokemon.id - 1}</a>
    </c:if>
    <text style="visibility: hidden"> previous </text>
</div>
<div id="pokemonRightheader">
    <c:if test="${selectedPokemon.id < 151}">
        <a href="pokemon?${selectedPokemon.id + 1}" class="pokemonlink bubble"> No. ${selectedPokemon.id + 1}</a>
    </c:if>
    <text style="visibility: hidden"> next </text>
</div>

<div id="pokemonLeftColumn">
    <img src="${initParam.pokemonImagePath}${selectedPokemon.id}.png"
                     alt="${selectedPokemon.name}" class="pokemonImage">
</div>

<div id="pokemonRightColumn">
    <br/>
    <text><strong>Height:</strong> ${(selectedPokemon.height/10)} m</text>
    <br/>
    <text><strong>Ability I:</strong> ${selectedPokemon.abilityI}</text>
    <br/>
    <text><strong>Gender:</strong> ${selectedPokemon.gender}</text>
    <br/>
    <text><strong>Evolves at/by:</strong> ${selectedPokemon.evolvesBy}</text>
    <br/>
    <c:if test="${!empty selectedPokemon.evolvesFrom}">
        <a href="pokemon?${selectedPokemon.evolvesFrom}" class="pokemonlink bubble"> 
            <text>Evolves from: </text>
            <img src="${initParam.pokemonImagePath}${selectedPokemon.evolvesFrom}.png" class="thumbnail">
        </a>
    </c:if>
    <br/>
    <c:if test="${!empty selectedPokemon.evolvesTo}">
        <a href="pokemon?${selectedPokemon.evolvesTo}" class="pokemonlink bubble"> 
            <text>Evolves to: </text>
            <img src="${initParam.pokemonImagePath}${selectedPokemon.evolvesTo}.png" class="thumbnail">
        </a>
    </c:if>
</div>
<div id="pokemonRightColumn">
    <br/>
    <text><strong>Weight:</strong> ${(selectedPokemon.weight/10)} kg</text>
    <br/>
    <text><strong>Ability II:</strong> ${selectedPokemon.abilityII}</text>
    <br/>
    <br/>
    <br/>
    <text><strong>Footprint: </strong></text>
    <img src="${initParam.footprintImagePath}${selectedPokemon.id}.png" class="thumbnail">
</div>
    
<div id="pokemonTyperow">
    <c:forEach var="type" items="${selectedPokemonTypes}">
        <div class="typeBox">
            <a href="type?${type.id}">
                <img src="${initParam.typesImagePath}${type.id}.png"
                     alt="${type.name}" class="typeImage">
            </a>
        </div>
    </c:forEach>
</div>

<div id="pokemonFooter">
    footer
</div>


<%--div id="wildPokemonRow">
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
                        <a href="type?${type.id}">
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
</div--%>