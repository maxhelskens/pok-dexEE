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

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
            url="jdbc:mysql://localhost/affablebean"
            user="root"  password="password"/>

<sql:query dataSource="${snapshot}" var="categories">
    SELECT * FROM category
</sql:query>
    
<sql:query var="selectedCategory" dataSource="${snapshot}">
    SELECT name FROM category WHERE id = ?
    <sql:param value="${pageContext.request.queryString}"/>
</sql:query>
    
<sql:query var="categoryProducts" dataSource="${snapshot}">
    SELECT * FROM product WHERE category_id = ?
    <sql:param value="${pageContext.request.queryString}"/>
</sql:query>

<div id="categoryLeftColumn">
    <c:forEach var="category" items="${categories.rows}">

        <c:choose>
            <c:when test="${category.id == pageContext.request.queryString}">
                <div class="categoryButton" id="selectedCategory">
                    <span class="categoryText">
                        ${category.name}
                    </span>
                </div>
            </c:when>
            <c:otherwise>
                <a href="category?${category.id}" class="categoryButton">
                    <div class="categoryText">
                        ${category.name}
                    </div>
                </a>
            </c:otherwise>
        </c:choose>

    </c:forEach>
</div>

<div id="categoryRightColumn">
    <p id="categoryTitle">${selectedCategory.rows[0].name}</p>

    <table id="productTable">
        <c:forEach var="product" items="${categoryProducts.rows}" varStatus="iter">

            <tr class="${((iter.index % 2) == 0) ? 'lightBlue' : 'white'}">
                <td>
                    <img src="${initParam.productImagePath}${product.name}.png"
                        alt="${product.name}">
                </td>
                <td>
                    ${product.name}
                    <br>
                    <span class="smallText">${product.description}</span>
                </td>
                <td>
                    &euro; ${product.price} / unit
                </td>
                <td>
                    <form action="addToCart" method="post">
                        <input type="hidden"
                               name="productId"
                               value="${product.id}">
                        <input type="submit"
                               value="add to cart">
                    </form>
                </td>
            </tr>

        </c:forEach>
    </table>
</div>

