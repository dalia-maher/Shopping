<%-- 
    Document   : header
    Created on : Mar 4, 2017, 9:54:29 PM
    Author     : Dalia
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="beans.User"%>
<!-- top-header -->
<div class="top_bg">
    <div class="container">
        <div class="header_top-sec">
            <div class="top_right">
                <ul>
                    <li><a href="contactUs.jsp">Contact</a></li>
                </ul>
            </div>
            <div class="top_left">
                <ul>
                    <c:if test="${sessionScope.loggedInUser != null}">
                        <%User user = (User) session.getAttribute("loggedInUser");%>
                        <li class="top_link">Email:<a href="#"><%=user.getEmail()%></a></li>
                        <li class="top_link"><a href="Logout">Logout</a></li>
                        <!-- to do: set credit pop-up -->
                        <li class="top_link"><a href="#">Add Credit</a></li>
                        <li class="top_link"><a href="GetOrders">My Orders</a></li>
                        <li class="top_link"><a href="userProfile.jsp">My Account</a></li>					
                    </c:if>
                    <c:if test="${sessionScope.loggedInUser == null}">
                        <li class="top_link"><a href="login.jsp">Login</a></li>					
                    </c:if>
                </ul>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!-- top-header -->
<!-- logo-cart -->
<div class="header_top">
    <div class="container">
        <div class="logo">
            <a href="index.jsp">Pendent Store</a>			 
        </div>
        <div class="header_right">
            <div class="cart box_1">
                <a href="checkout.jsp">
                <div class="total"><h3>
                    <span class="simpleCart_total"></span> (<span id="simpleCart_quantity" class="simpleCart_quantity"></span> items)</h3></div>
                    <img src="images/cart1.png" alt=""/>
                </a>
                <p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>
                <div class="clearfix"> </div>
            </div>				 
        </div>
        <div class="clearfix"></div>	
    </div>
</div>
<!-- //logo-cart -->
