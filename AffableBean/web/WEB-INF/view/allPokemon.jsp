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


<div id="typePage">

    <div id="categoryRightColumn">

        <table id="productTable">

            <c:forEach var="pokemon" items="${pokemonList}" varStatus="iter">

                <tr class="${((iter.index % 2) == 0) ? 'lightBlue' : 'white'}">
                    <td>
                        <a href="pokemon?${pokemon.id}">
                            <img src="${initParam.pokemonImagePath}${pokemon.id}.png"
                                 alt="${pokemon.name}">
                        </a>
                    </td>

                    <td>
                        <a href="pokemon?${pokemon.id}">
                            ${pokemon.name}
                            <br>
                            <span class="smallText">${pokemon.abilityI}</span>
                        </a>
                    </td>

                    <td>
                        <a href="pokemon?${pokemon.id}">
                            ${pokemon.total}
                        </a>
                    </td>

                    <td>
                        <form action="addToCart" method="post">
                            <input type="hidden"
                                   name="pokemonId"
                                   value="${pokemon.id}">
                            <input type="submit"
                                   name="submit"
                                   value="add to cart">
                        </form>
                    </td>
                </tr>

            </c:forEach>

        </table>
    </div>
</div>

