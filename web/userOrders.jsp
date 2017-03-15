<%-- 
    Document   : userOrders
    Created on : Mar 7, 2017, 8:00:44 AM
    Author     : TahanyFawzy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Orders | Sugar Store</title>
        <!-- for-mobile-apps -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Sugar Store Responsive Shopping Online Web Application" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- //for-mobile-apps -->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- js -->
        <script src="js/jquery-1.11.1.min.js"></script>
        <!-- //js -->
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
        </script>
        <!-- start-smoth-scrolling -->
        <!-- start menu -->
        <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/megamenu.js"></script>
        <script>$(document).ready(function () {
                $(".megamenu").megamenu();

            });
        </script>

        <script src="js/simpleCart.min.js"></script>
        <link href='http://fonts.googleapis.com/css?family=Monda:400,700' rel='stylesheet' type='text/css'>
        <!-- the jScrollPane script -->
        <script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
        <script type="text/javascript" id="sourcecode">
            $(function () {
                $('.scroll-pane').jScrollPane();
            });
        </script>
        <!-- //the jScrollPane script -->
      
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div class="mega_nav">
            <div class="container">
                <div class="menu_sec">
                    <!-- start header menu -->
                    <ul class="megamenu skyblue">
                        <li class="grid"><a class="color1" href="index.jsp">Home</a></li>
                        <li class="grid"><a class="color1" href="#">Category</a>
                            <div class="megapanel">
                                <div class="row">
                                    <div class="col1">
                                        <div class="h_nav">
                                            <%@ include file="categoryItems.jsp" %>
                                        </div>							
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul> 
                    <form action ="SearchProducts" method ="get">
                        <div class="search">
                            <input type="text" value="" placeholder="Search..." name = "keyword">
                            <input type="submit" value="">
                        </div><br/>
                        <a href="searchPage.jsp" >Advanced Search</a>
                    </form>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!---->
        <!-- products -->
        <div class="products">
            <div class="container">
                <div class="products-grids">
                    <div class="col-md-12 products-grid-left">
                        <div id="result" class="products-grid-lft">
                            <div class="col-lg-10">
                                <div class="table-responsive">
                                    <c:if test="${!empty userOrders}">
                                        <c:forEach items="${userOrders}" var="order" varStatus="loop">
                                            <c:if test="${loop.index == 0 || userOrders[loop.index].orderNumber != userOrders[loop.index-1].orderNumber}">
                                                <c:set var="total" value="${0}"/>
                                                <center><table class="table table-bordered table-hover table-striped">
                                                        <caption>${order.date} (Order: ${order.orderNumber})</caption>
                                                        <thead>
                                                            <tr>
                                                                <th>Product</th>
                                                                <th>Quantity</th>
                                                                <th>Unit Price</th>
                                                                <th>Total</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        </c:if>
                                                        <c:set var="total" value="${total + order.quantity*order.price}"/>
                                                        <tr>
                                                            <td>${order.product.name}</td>
                                                            <td>${order.quantity}</td>
                                                            <td>${order.price}</td>
                                                            <td>${order.quantity * order.price}</td>
                                                        </tr>
                                                        <c:if test="${loop.index == fn:length(userOrders)|| userOrders[loop.index].orderNumber != userOrders[loop.index+1].orderNumber}">
                                                        <tr>
                                                            <td colspan="3"><b>Order Total Price (including delivery)</b></td>
                                                            <td>${total + 150}</td>
                                                        </tr>
                                                        </tbody>
                                                    </table></center>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${empty userOrders}">
                                        You have no orders.
                                    </c:if>  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //products -->
        <%@ include file="footer.html" %>
    </body>
</html>
