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

    <c:if test="${!empty cart && cart.numberOfItems != 0}">

      <h4 id="subtotal">Total caught: ${cart.numberOfItems}</h4>

      <table id="cartTable">

        <tr class="header">
            <th>pokemon</th>
            <th>name</th>
            <th>abilityI</th>
            <th>quantity</th>
        </tr>

        <c:forEach var="cartItem" items="${cart.items}" varStatus="iter">

          <c:set var="pokemon" value="${cartItem.pokemon}"/>

          <tr class="${((iter.index % 2) == 0) ? 'lightBlue' : 'white'}">
            <td>
              <img src="${initParam.pokemonImagePath}${pokemon.id}.png"
                   alt="${pokemon.name}">
            </td>

            <td>${pokemon.name}</td>

            <td>${pokemon.abilityI}</td>

            <td>
                <form action="updateCart" method="post">
                    <input type="hidden"
                           name="pokemonId"
                           value="${pokemon.id}">
                    <input type="text"
                           maxlength="2"
                           size="2"
                           value="${cartItem.quantity}"
                           name="quantity"
                           style="margin:5px">
                    <input type="submit"
                           name="submit"
                           value="update">
                </form>
            </td>
          </tr>

        </c:forEach>

      </table>

    </c:if>
</div>