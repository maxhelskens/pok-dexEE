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
    <br/>
    <text><strong>Cry: </strong></text>
    <audio id="cry" controls preload="auto">
        <source src="${initParam.criesSoundPath}${selectedPokemon.id}.mp3" type="audio/mpeg">
        Your browser does not support the audio element.
    </audio>
    
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
    <div class="pokemonFooterLeft">
        <text><strong>Hp: </strong></text>
        <br/>
        <text><strong>Attack: </strong></text>
        <br/>
        <text><strong>Defense: </strong></text>
    </div>
    <div class="pokemonFooterMiddle">
        <text>${selectedPokemon.hp}</text>
        <br/>
        <text>${selectedPokemon.attack}</text>
        <br/>
        <text>${selectedPokemon.defense}</text>
    </div>
    <div class="pokemonFooterRight">
        <text style="visibility: hidden">1</text><progress max="250" value="${selectedPokemon.hp}"></progress>
        <br/>
        <text style="visibility: hidden">1</text><progress max="134" value="${selectedPokemon.attack}"></progress>
        <br/>
        <text style="visibility: hidden">1</text><progress max="180" value="${selectedPokemon.defense}"></progress>
    </div>
    
    <div class="pokemonFooterLeft">
        <text><strong>Speed: </strong></text>
        <br/>
        <text><strong>Special attack: </strong></text>
        <br/>
        <text><strong>Special defense: </strong></text>
    </div>
    <div class="pokemonFooterMiddle">
        <text>${selectedPokemon.speed}</text>
        <br/>
        <text>${selectedPokemon.specialAttack}</text>
        <br/>
        <text>${selectedPokemon.specialDefense}</text>
    </div>
    <div class="pokemonFooterRight">
        <text style="visibility: hidden">1</text><progress max="140" value="${selectedPokemon.speed}"></progress>
        <br/>
        <text style="visibility: hidden">1</text><progress max="154" value="${selectedPokemon.specialAttack}"></progress>
        <br/>
        <text style="visibility: hidden">1</text><progress max="125" value="${selectedPokemon.specialDefense}"></progress>
    </div>
    
    <div class="pokemonBigFooterLeft">
        <br/>
        <text><strong>Total Strength: </strong></text>
        <br/>
    </div>
    <div class="pokemonBigFooterMiddle">
        <br/>
        <text>${selectedPokemon.total}</text>
        <br/>
    </div>
    <div class="pokemonBigFooterRight">
        <br/>
        <text style="visibility: hidden">1</text><progress id="totalStrength" max="680" value="${selectedPokemon.total}"></progress>
        <br/>
    </div>
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