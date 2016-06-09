<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="singleColumn">
    <div class="pokemonHeader">
        <h1>Featured Pokemon: <br/> ${featuredPokemon.name}</h1>
    </div>

    <div id="pokemonLeftHeader">
         <img id="sideImg" src="${initParam.pokemonImagePath}${featuredPokemon.id}.png"
              alt="${featuredPokemon.name}" class="pokemonImage">
        
    </div>
</div>