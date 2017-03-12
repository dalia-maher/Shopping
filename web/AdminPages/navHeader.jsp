<%-- 
    Document   : navHeader
    Created on : Mar 7, 2017, 8:18:57 AM
    Author     : Dalia
--%>

<%@page import="beans.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand colorwhite" href="index.jsp">SB Admin</a>
    </div>
    <!-- Top Menu Items -->

      <ul class="nav navbar-right top-nav">
        <li class="dropdown">
            <c:if test="${sessionScope.loggedInUser != null}">
                <%User user = (User) session.getAttribute("loggedInUser");%>
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <%=user.getFirstName() + " " + user.getLastName()%> <b class="caret"></b></a>
            </c:if>
            <c:if test="${sessionScope.loggedInUser == null}">
                <a href="../login.jsp" ><i class="fa fa-user"></i> Login <b class="caret"></b></a>
            </c:if>
            <ul class="dropdown-menu">
                <li>
                    <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="../Logout"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                </li>
            </ul>
        </li>
    </ul>
    <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
    <div class="collapse navbar-collapse navbar-ex1-collapse color">
        <ul class="nav navbar-nav side-nav color">
            <li class="active">
                <a href="index.jsp"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
            </li >

            <li >
                <a href="tables.jsp"><i class="fa fa-fw fa-table"></i> Users</a>
            </li>
            <li>
                <a href="forms.jsp"><i class="fa fa-fw fa-edit"></i> Add Product</a>
            </li>
            <li>
                <a href="blank-page.jsp"><i class="fa fa-fw fa-edit"></i>View / Edit Products</a>
            </li>
            <li>
                <a href="CreditPage.jsp"><i class="fa fa-fw fa-file"></i> Credit Cards</a>
            </li>

        </ul>
    </div>
    <!-- /.navbar-collapse -->
</nav>
