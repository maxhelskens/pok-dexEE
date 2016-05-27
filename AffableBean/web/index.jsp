<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : May 23, 2016, 3:01:34 PM
    Author     : Max
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
            url="jdbc:mysql://localhost/affablebean"
            user="root"  password="password"/>

<sql:query dataSource="${snapshot}" var="categories">
    SELECT * FROM category
</sql:query>

<div id="indexLeftColumn">
    <div id="welcomeText">
        <p>[ welcome text ]</p>
        <!-- test to access context parameters -->
        categoryImagePath: ${initParam.categoryImagePath}
        productImagePath: ${initParam.productImagePath}
    </div>
</div>

<div id="indexRightColumn">
    
    <c:forEach var="category" items="${categories.rows}">
        <div class="categoryBox">
            <a href="category?${category.id}">

                <span class="categoryLabelText">${category.name}</span>

                <img src="${initParam.categoryImagePath}${category.name}.jpg"
                     alt="${category.name}">
            </a>
        </div>
    </c:forEach>
    
</div>
