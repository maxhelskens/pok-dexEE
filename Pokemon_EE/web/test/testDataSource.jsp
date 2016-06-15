<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : testDataSource
    Created on : May 23, 2016, 4:16:12 PM
    Author     : Max
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
            url="jdbc:mysql://localhost/affablebean"
            user="root"  password="password"/>
 
        <sql:query dataSource="${snapshot}" var="result">
            SELECT * from category;
        </sql:query>

        <table border="1" width="100%">
            <tr>
               <th>id</th>
               <th>name</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                   <td><c:out value="${row.id}"/></td>
                   <td><c:out value="${row.name}"/></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
