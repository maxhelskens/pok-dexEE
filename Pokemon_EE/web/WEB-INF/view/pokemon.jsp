<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : index
    Created on : May 23, 2016, 3:01:34 PM
    Author     : Max
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="pokemonHeader">
    <h1>No.${selectedPokemon.id} ${selectedPokemon.name}</h1>
</div>
<div class="pokemonHeader">
    <div id="pokemonLeftHeader">
        <c:if test="${selectedPokemon.id > 1}">
            <a href="pokemon?${selectedPokemon.id - 1}" class="pokemonlink bubble"> No. ${selectedPokemon.id - 1}</a>
        </c:if>
    </div>
    <div id="pokemonRightHeader">
        <c:if test="${selectedPokemon.id < 151}">
            <a href="pokemon?${selectedPokemon.id + 1}" class="pokemonlink bubble"> No. ${selectedPokemon.id + 1}</a>
        </c:if>
    </div>
</div>

<div id="pokemonLeftColumn">
    <img id="sideImg" src="${initParam.pokemonImagePath}${selectedPokemon.id}.png"
                     alt="${selectedPokemon.name}" class="pokemonImage">
    <text id="switchSide"><tiny style="font-size: 10px; cursor: pointer">show backside</tiny></text>
</div>
    
<script>
    var front = true;
    
    d3.select('#switchSide')
            .on('click', function(){
                
                if (front){
                    d3.select('#sideImg')
                        .attr('src', '${initParam.pokemonImagePath}back/${selectedPokemon.id}.png');
                
                    d3.select(switchSide)
                        .style('font-size', '10px')
                        .style('cursor','pointer')
                        .text('show frontside');
                        
                    front = false;
                }
                else {
                    d3.select('#sideImg')
                        .attr('src', '${initParam.pokemonImagePath}${selectedPokemon.id}.png');
                
                    d3.select(switchSide)
                        .style('font-size', '10px')
                        .style('cursor','pointer')
                        .text('show backside');
                
                    front = true;
                }
            })
</script>

<div id="pokemonRightColumn" style="font-size: 12px">
    <br/>
    <text><strong>Height:</strong> ${(selectedPokemon.height/10)} m</text>
    <br/>
    <text><strong>Gender:</strong> ${selectedPokemon.gender}</text>
    <br/>
    <br/>
    <text><strong>Ability I:</strong> ${selectedPokemon.abilityI}</text>
    <br/>
    <br/>
    <text><strong>Evolves at/by:</strong> ${selectedPokemon.evolvesBy}</text>
    <br/>
    <c:if test="${!empty selectedPokemon.evolvesFrom}">
        <a href="pokemon?${selectedPokemon.evolvesFrom.id}" class="pokemonlink bubble"> 
            <text>Evolves from: </text>
            <img src="${initParam.pokemonImagePath}${selectedPokemon.evolvesFrom.id}.png" class="thumbnail">
        </a>
    </c:if>
    <br/>
    <br/>
    <text><strong>Footprint: </strong></text>
    <img src="${initParam.footprintImagePath}${selectedPokemon.id}.png" class="thumbnail">
    
</div>
<div id="pokemonRightColumn" style="font-size: 12px">
    <br/>
    <text><strong>Weight:</strong> ${(selectedPokemon.weight/10)} kg</text>
    <br/>
    <br/>
    <br/>
    <text><strong>Ability II:</strong> ${selectedPokemon.abilityII}</text>
    <br/>
    <br/>
    <br/>
    <c:if test="${!empty selectedPokemon.evolvesTo}">
        <div class="typeBox">
            <text class="pokemonlink bubble">Evolves to: </text>
            <c:forEach var="nextPokémon" items="${selectedPokemon.evolvesTo}">
                <a href="pokemon?${nextPokémon.id}" class="pokemonlink bubble"> 
                    <img src="${initParam.pokemonImagePath}${nextPokémon.id}.png" class="thumbnail">
                </a>
            </c:forEach>
        </div>
    </c:if>
    <br/>
    <br/>
    <br/>
    <br/>
    <text id="cryLink"><strong>Cry: </strong></text>
    <audio id="cry" preload="auto">
        <source src="${initParam.criesSoundPath}${selectedPokemon.id}.mp3" type="audio/mpeg">
        Your browser does not support the audio element.
    </audio>
    <input type="button" value="PLAY"  onclick="play()">
    <script>
        function play(){
            var audio = document.getElementById("cry");
            audio.play();
        }
   </script>
    
</div>
    
<div id="pokemonTyperow" style="margin-top: 5px">
    <c:forEach var="type" items="${selectedPokemonTypes}">
        <div class="typeBox">
            <a href="type?${type.id}">
                <img src="${initParam.typesImagePath}${type.id}.png"
                     alt="${type.name}" class="typeImage">
            </a>
        </div>
    </c:forEach>
</div>

<div id="pokemonFooter" style="font-size: 12px">
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
        <progress max="250" value="${selectedPokemon.hp}"></progress>
        <br/>
        <progress max="134" value="${selectedPokemon.attack}"></progress>
        <br/>
        <progress max="180" value="${selectedPokemon.defense}"></progress>
        <br/>
    </div>
    
    <div class="pokemonFooterLeft">
        <text><strong>Speed: </strong></text>
        <br/>
        <text><strong>S. attack: </strong></text>
        <br/>
        <text><strong>S. defense: </strong></text>
    </div>
    <div class="pokemonFooterMiddle">
        <text>${selectedPokemon.speed}</text>
        <br/>
        <text>${selectedPokemon.specialAttack}</text>
        <br/>
        <text>${selectedPokemon.specialDefense}</text>
    </div>
    <div class="pokemonFooterRight">
        <progress max="140" value="${selectedPokemon.speed}"></progress>
        <br/>
        <progress max="154" value="${selectedPokemon.specialAttack}"></progress>
        <br/>
        <progress max="125" value="${selectedPokemon.specialDefense}"></progress>
        <br/>
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
        <progress id="totalStrength" max="680" value="${selectedPokemon.total}"></progress>
        <br/>
    </div>
</div>
        
<div id="pokemonFooter" style="font-size: 12px">
    <div class="pokemonBigFooterLeft">
        <br/>
        <text><strong>Catching chance: </strong></text>
        <br/>
    </div>
    <div class="pokemonBigFooterMiddle">
        <br/>
        <text id="catchChance2">${selectedPokemon.total}</text>
        <br/>
    </div>
    <div class="pokemonBigFooterRight">
        <br/>
        <progress id="chanceBar" max="100" style="width: 630px; margin-left: 10px;"></progress>
        <br/>
    </div>
    <script>
        var chance =100 - Math.round(${(selectedPokemon.total - 195) / 6.05});
        
        d3.select("#catchChance2")
            .text(function(){
                return (chance + "%");
            });
        
        d3.select("#chanceBar")
            .attr('value', chance);
    </script>
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