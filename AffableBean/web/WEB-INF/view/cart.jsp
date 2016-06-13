<%--
    Document   : cart
    Created on : May 23, 2016, 3:59:32 PM
    Author     : max
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div id="singleColumn">

    <div id="actionBar">
        <%-- Clear Pokedex --%>
        <c:if test="${nrofpokemon != 0}">
            <a href="viewCart?clear=true" class="bubble hMargin">Release all pokémon</a>
        </c:if>
        
        <%-- Catch Featured --%>
        <a href="featured" class="bubble hMargin">Catch featured pokémon</a>  
    </div>
        
    <div id="cartPage" style="height:451px">
        <c:if test="${nrofpokemon != 0}">
            <table id="cartTable">
                <tr class="header">
                    <th>Pokémon</th>
                    <th>Name</th>
                    <th>Types</th>
                    <th>Quantity</th>
                    <th>Action</th>
                </tr>

                <c:forEach var="pokeball" items="${pokemonlist}" varStatus="iter">

                    <c:set var="pokemon" value="${pokeball.pokemon}"/>

                    <tr class="${((iter.index % 2) == 0) ? 'lightRed' : 'white'}">
                    <td>
                        <img src="${initParam.pokemonImagePath}${pokemon.id}.png"
                         alt="${pokemon.name}">
                    </td>

                    <td>${pokemon.name}</td>

                    <td>
                        <c:forEach var="type" items="${pokemon.getTypeCollection()}">
                            <div class="typeBox">
                                <img src="${initParam.typesImagePath}${type.id}.png"
                                   alt="${type.name}" class="typeImage">
                            </div>
                        </c:forEach>
                    </td>

                    <td>
                        ${pokeball.quantity}
                    </td>

                    <td>
                        <form action="updateCart" method="post" style="margin-top: 20px;">
                            <input type="hidden"
                                 name="pokemonId"
                                 value="${pokemon.id}"/>
                            <input type="hidden"
                                 value="${pokeball.quantity - 1}"
                                 name="quantity"/>
                           <input type="submit"
                                 name="submit"
                                 value="Release one"/>
                        </form>
                        <br/>
                        <form action="updateCart" method="post" style="margin-top: -20px;">
                            <input type="hidden"
                                 name="pokemonId"
                                 value="${pokemon.id}"/>
                            <input type="hidden"
                                 value="0"
                                 name="quantity"/>
                            <input type="submit"
                                 name="submit"
                                 value="Release all"/>
                        </form>
                    </td>
                    </tr>
            </c:forEach>
          </table>
        </c:if>        
    </div>
</div>