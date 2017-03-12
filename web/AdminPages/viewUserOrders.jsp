<%-- 
    Document   : viewUserOrders
    Created on : Mar 11, 2017, 8:58:30 AM
    Author     : TahanyFawzy
--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
            <%@ include file="navHeader.jsp" %>

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
                                                            <td colspan="3"><b>Order Total Price</b></td>
                                                            <td>${total}</td>
                                                        </tr>
                                                    </tbody>
                                                </table></center>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty userOrders}">
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
