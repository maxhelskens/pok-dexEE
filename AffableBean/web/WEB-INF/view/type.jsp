<%--
    Document   : cart
    Created on : May 23, 2016, 3:59:32 PM
    Author     : max
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<div id="typerow">
    <c:forEach var="type" items="${types}">
        <c:choose>
                <c:when test="${type.name == selectedType.name}">
                    <div class="typeBox" id="selectedType">
                        <a href="type?${type.id}">
                            <img src="${initParam.typesImagePath}${type.id}.png"
                                 alt="${type.name}" class="typeImage">
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="typeBox">
                        <a href="type?${type.id}">
                            <img src="${initParam.typesImagePath}${type.id}.png"
                                 alt="${type.name}" class="typeImage">
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
    </c:forEach>
</div>

<div id="typePage">

    <div id="categoryRightColumn">

        <table id="productTable">

            <c:forEach var="pokemon" items="${typePokemon}" varStatus="iter">
                
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
                                <c:choose>
                                        <c:when test="${type.name == selectedType.name}">
                                            <div class="typeBox" id="selectedType">
                                                <img src="${initParam.typesImagePath}${type.id}.png"
                                                     alt="${type.name}" class="typeImage">
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="typeBox">
                                                <img src="${initParam.typesImagePath}${type.id}.png"
                                                     alt="${type.name}" class="typeImage">
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                            </c:forEach>
                        </a>
                    </td>

                    <td>
                        <c:if test="${!empty cart && cart.numberOfItems != 0}">
                            <c:forEach var="cartItem" items="${cart.items}">
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

