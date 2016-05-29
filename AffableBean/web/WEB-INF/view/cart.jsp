<%--
    Document   : cart
    Created on : May 23, 2016, 3:59:32 PM
    Author     : max
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">



<div id="singleColumn">

    <div id="actionBar">
        
        <%-- clear cart widget --%>
        <c:if test="${!empty cart && cart.numberOfItems != 0}">
            <a href="viewCart?clear=true" class="bubble hMargin">Release all pokémon</a>
        </c:if>

        <%-- continue shopping widget --%>
        <a href="index.jsp" class="bubble hMargin">Start catching pokémon</a>
        
    </div>
    <div id="cartPage">
        
        <c:if test="${!empty cart && cart.numberOfItems != 0}">

          <table id="cartTable">

            <tr class="header">
                <th>Pokémon</th>
                <th>Name</th>
                <th>Types</th>
                <th>Quantity</th>
                <th>Action</th>
            </tr>

            <c:forEach var="cartItem" items="${cart.items}" varStatus="iter">

              <c:set var="pokemon" value="${cartItem.pokemon}"/>

              <tr class="${((iter.index % 2) == 0) ? 'lightRed' : 'white'}">
                <td>
                  <img src="${initParam.pokemonImagePath}${pokemon.id}.png"
                       alt="${pokemon.name}">
                </td>

                <td>${pokemon.name}</td>

                <td>
                    <c:forEach var="type" items="${cartItem.pokemon.getTypeCollection()}">
                        <div class="typeBox">
                            <img src="${initParam.typesImagePath}${type.id}.png"
                                 alt="${type.name}" class="typeImage">
                        </div>
                    </c:forEach>
                </td>

                <td>
                    ${cartItem.quantity}
                </td>
                
                <td>
                    <form action="updateCart" method="post" style="margin-top: 20px;">
                        <input type="hidden"
                               name="pokemonId"
                               value="${pokemon.id}">
                        <input type="hidden"
                               value="${cartItem.quantity - 1}"
                               name="quantity">
                        <input type="submit"
                               name="submit"
                               value="Release one">
                    </form>
                    <form action="updateCart" method="post" style="margin-top: -20px;">
                        <input type="hidden"
                               name="pokemonId"
                               value="${pokemon.id}">
                        <input type="hidden"
                               value="0"
                               name="quantity">
                        <input type="submit"
                               name="submit"
                               value="Release all">
                    </form>
                </td>
              </tr>

            </c:forEach>

          </table>

        </c:if>
    </div>
</div>