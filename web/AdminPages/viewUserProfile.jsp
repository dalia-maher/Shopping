
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="beans.User"%>

<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Admin | Customer's Profile</title>

        <!-- Bootstrap Core CSS -->
        <link href="AdminPages/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="AdminPages/css/sb-admin.css" rel="stylesheet">
<!--        <link href="../css/style.css"  rel="stylesheet">-->
    
        <!-- Custom Fonts -->
        <link href="AdminPages/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
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
                           
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${sessionScope.loggedInUser.getFirstName()} ${sessionScope.loggedInUser.getLastName()} <b class="caret"></b></a>
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

                            <c:if test="${!empty User}">
                                <h1 class="page-header">
                                    ${User.userName}
                                </h1>
                                <h3><a class="btn" style="float:right;" type="button" href="GetOrders?userID=${User.customerID}">The Orders</a></h3>
                            </c:if>

                            <ol class="breadcrumb">
                                <li>
                                    <i class="fa fa-dashboard"></i>  <a href="AdminPages/index.jsp">Dashboard</a>
                                </li>
                                <li class="active">
                                    <i class="fa fa-table"></i> Tables
                                </li>
                            </ol>
                        </div>
                    </div>
                    <!-- /.row -->
                    <div class="row">

                        <div class="col-lg-10 form-inline">
                            <c:if test="${!empty User}">
                                <div>
                                  <ul>
                                                <li class="text-info">First Name:</li>
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
                                            
<!--                                            <ul>
                                                <li class="text-info">Password: </li>

                                                <li><p>${User.password}</p></li>
                                            </ul>-->
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

                                                            <li><c:out value="${interest.name}"/></li>
                                                            <br>

                                                        </c:forEach>
                                                    </ul>
                                                </li>
                                            </ul>
     
                                </div>
                            </c:if>
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
