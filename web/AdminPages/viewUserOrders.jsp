<%-- 
    Document   : viewUserOrders
    Created on : Mar 11, 2017, 8:58:30 AM
    Author     : TahanyFawzy
--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="beans.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Order</title>

        <!-- Bootstrap Core CSS -->
        <link href="AdminPages/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="AdminPages/css/sb-admin.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="AdminPages/js/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- jQuery -->
        <script src="AdminPages/js/jquery.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="AdminPages/js/bootstrap.min.js"></script>

    </head>

    <body>
        <style>
            .color{
                background-color: #f65a5b;
            }

            .navbar-inverse .navbar-nav>.active>a, .navbar-inverse .navbar-nav>.active>a:focus, .navbar-inverse .navbar-nav>.active>a:hover {
                color: #fff;
                background-color: #b35656;
            }

            .navbar-inverse .navbar-nav>li>a {
                color: #f5f5f5;
            }
            .navbar-inverse .navbar-brand {
                color: #ffffff;
            }
            .top-nav>li>a {
                color: #fff;
            }
        </style>
        
        <div id="wrapper">

            <!-- Navigation -->
            <%--<%@ include file="navHeader.jsp" %>--%>
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
                            <%User user1 = (User) session.getAttribute("loggedInUser");%>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <%=user1.getFirstName() + " " + user1.getLastName()%> <b class="caret"></b></a>
                            </c:if>
                            <c:if test="${sessionScope.loggedInUser == null}">
                            <a href="AdminPages/login.jsp" ><i class="fa fa-user"></i> Login <b class="caret"></b></a>
                            </c:if>
                        <ul class="dropdown-menu">
                           
                            <li class="divider"></li>
                            <li>
                                <a href="Logout"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
                <div class="collapse navbar-collapse navbar-ex1-collapse color">
                    <ul class="nav navbar-nav side-nav color">
                        <li class="active">
                            <a href="AdminPages/index.jsp"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
                        </li >

                        <li >
                            <a href="AdminPages/tables.jsp"><i class="fa fa-fw fa-table"></i> Users</a>
                        </li>
                        <li>
                            <a href="AdminPages/forms.jsp"><i class="fa fa-fw fa-edit"></i> Add Product</a>
                        </li>
                        <li>
                            <a href="AdminPages/blank-page.jsp"><i class="fa fa-fw fa-edit"></i>View / Edit Products</a>
                        </li>
                        <li>
                            <a href="AdminPages/CreditPage.jsp"><i class="fa fa-fw fa-file"></i> Credit Cards</a>
                        </li>

                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </nav>

            <div id="page-wrapper">
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">
                                <c:if test="${!empty userName}">
                                    ${userName}
                                </c:if>
                            </h1>
                            <ol class="breadcrumb">
                                <li>
                                    <i class="fa fa-dashboard"></i>  <a href="index.jsp">Dashboard</a>
                                </li>
                                <li class="active">
                                    <i class="fa fa-table"></i> Tables
                                </li>
                            </ol>
                        </div>
                    </div>
                    <!-- /.row -->

                    <div class="row">

                        <div class="col-lg-10">

                            <div class="table-responsive">
                                <c:if test="${!empty requestScope.userOrders}">
                                    <c:forEach items="${requestScope.userOrders}" var="order" varStatus="loop">
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
                                                            <td colspan="3"><b>Order Total Price</b></td>
                                                            <td>${total}</td>
                                                        </tr>
                                                    </tbody>
                                                </table></center>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty requestScope.userOrders}">
                                    There is no orders.
                                </c:if>  
                            </div>

                        </div>
                    </div>
                    <!-- /.row -->



                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

    </body>

</html>
