<%-- 
    Document   : categoryItems
    Created on : Mar 2, 2017, 1:06:07 PM
    Author     : Dalia
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <c:import url="/ShowCategories" />
    <c:set var="myCategories" value="${applicationScope.categoriesList}" />
    <ul>
        <c:forEach var="category" items= "${myCategories}">
            <li><a href="products.jsp?categoryID=<c:out value="${category.getCategoryID()}"/>">${category.getName()}</a></li>
        </c:forEach>
    </ul>
</html>
