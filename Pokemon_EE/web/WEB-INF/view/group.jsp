<%@page contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="typePage" style="height: 520px">
    <div id="categoryRightColumn">
         <h1>${group.name} (${group.region} region)</h1>
        <table id="productTable">
            <c:forEach var="pokemon" items="${group.pokemons}" varStatus="iter">
                <tr class="${((iter.index % 2) == 0) ? 'lightRed' : 'white'}">
                    <td>
                        <a href="pokemon?${pokemon.id}">
                            <img src="${initParam.pokemonImagePath}${pokemon.id}.png"
                                alt="${pokemon.name}">
                        </a>
                    </td>

                    <td>
                        <a href="pokemon?${pokemon.id}">${pokemon.name}</a>
                    </td>

                    <td>
                        <a href="pokemon?${pokemon.id}">
                            <span class="smallText">${pokemon.abilityI}</span>
                            <br>
                            <span class="smallText">${pokemon.abilityII}</span>
                        </a>
                    </td>
                    
                    <td>
                        <a href="pokemon?${pokemon.id}">
                            <c:forEach var="type" items="${pokemon.getTypeCollection()}">
                                <div class="typeBox">
                                    <img src="${initParam.typesImagePath}${type.id}.png"
                                         alt="${type.name}" class="typeImage">
                                </div>
                            </c:forEach>
                        </a>
                    </td>

                    <td>
                        <c:if test="${nrofpokemon != 0}">
                            <c:forEach var="cartItem" items="${caughtpokemon}">
                                <c:if test="${cartItem.pokemon.id == pokemon.id}">
                                    <img src="img/Pokeball.png" alt="pokeball icon" id="caught">
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
