<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Customer's Profile</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/sb-admin.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <!-- jQuery -->
        <script src="js/jquery.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                        <!--                    <div class="reg-form">
                                                <div class="reg">-->
                        <div class="col-lg-10">

                            <c:if test="${!empty User}">
                                <h2>${User.userName}</h2>
                                <a id="btn" href="GetOrders?userID=${User.customerID}">The Orders</a>
                                <div class="table-responsive">
                                    <ul>
                                        <li class="text-info">First Name: </li>

                                        <li><p> ${User.firstName}</p></li>
                                    </ul>
                                    <hr>
                                    <ul>
                                        <li class="text-info">Last Name: </li>

                                        <li><p>${User.lastName}</p></li>
                                    </ul>
                                    <hr>
                                    <ul>
                                        <li class="text-info">Email: </li>

                                        <li><p>${User.email}</p></li>
                                    </ul>
                                    <hr>
                                    <ul>
                                        <li class="text-info">Password: </li>

                                        <li><p>${User.password}</p></li>
                                    </ul>
                                    <hr>
                                    <ul>
                                        <li class="text-info">Job:</li>

                                        <li><p>${User.job}</p></li>
                                    </ul>
                                    <hr>
                                    <ul>
                                        <li class="text-info">Address:</li>

                                        <li><p>${User.addresse}</p></li>

                                    </ul>
                                    <hr>
                                    <ul>
                                        <li class="text-info">BirthDay Date:</li>

                                        <li><p>${User.BOD}</p></li>
                                    </ul>
                                    <hr>
                                    <ul>
                                        <li class="text-info">Credit:</li>

                                        <li><p id="lastCredit">EGP ${User.credit}</p></li>
                                    </ul>
                                    <hr>

                                    <ul>
                                        <li class="text-info">Interests:</li>
                                        <li>
                                            <br/>
                                            <ul>
                                                <c:forEach  items= "${requestScope.userInterest}" var="interest">
                                                    <li><c:out value="${interest.getName()}"/></li>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                    </ul>

                                </div>
                            </c:if>
                        </div>
                        <!--                            </div>
                        
                                                </div>-->
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
