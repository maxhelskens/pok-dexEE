<%--
    Document   : cart
    Created on : May 23, 2016, 3:59:32 PM
    Author     : max
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="typePage" style="height: 520px">

    <div id="categoryRightColumn">
        <h1>Groups</h1>
        <ul>
            <c:forEach var="pokeGroup" items="${pokeGroups}" varStatus="iter">
                <li>
                    <a href="group?${pokeGroup.id}">${pokeGroup.name}</a>
                </li>
            </c:forEach>
        </ul>
        
        <h1>All Pokemon</h1>
        <table id="productTable">

            <c:forEach var="pokemon" items="${list}" varStatus="iter">
                
                <tr class="${((iter.index % 2) == 0) ? 'lightRed' : 'white'}">
                    <td>
                        <a href="pokemon?${pokemon.id}">
                            <img src="${initParam.pokemonImagePath}${pokemon.id}.png"
                                alt="${pokemon.name}">
                        </a>
                    </td>

                    <td>
                        <a href="pokemon?${pokemon.id}">
                            ${pokemon.name}
                        </a>
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

