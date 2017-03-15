<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Admin - Sugar Store</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/sb-admin.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="css/plugins/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

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

            .navbar-inverse .navbar-nav>.active>a, .navbar-inverse .navbar-nav>.active>a:focus, .navbar-inverse .navbar-nav>.active>a:active {
                color: #fff;
                background-color: #b35656;
            }


            .navbar-inverse .navbar-nav>li>a {
                color: #f5f5f5;
            }

            toggle:focus, .navbar-inverse .navbar-toggle:hover {
                background-color: #b35656;
            }
            ul.nav.navbar-right.top-nav {
                background: #f65a5b;
            }
            .navbar-header {
                background: #f65a5b;

            }
            .navbar-inverse .navbar-brand {
                color: #ffffff;
            }
            .top-nav>li>a {
                color: #fff;
            }
        </style>
        <script>
            function getStats() {
                $.ajax({
                    url: "../Stats",
                    success: function (data, textStatus, jqXHR) {
                        var arr = data.split("&&");
                        $("#txtUserNum").html(arr[0]);
                        $("#txtProduct").html(arr[1]);
                        $("#txtNewOrder").html(arr[2]);
                        $("#txtUserMessage").html(arr[3]);

                    }

                });

            }
            function getOrders() {
                $.ajax({
                    url: "../Stats",
                    type: 'POST',
                    data: "type=order",
                    dataType: 'JSON',
                    success: function (data, textStatus, jqXHR) {
                        var item="<table class='table'><tr><th>Order Num</th><th>Customer</th><th>product</th>\n\
                 <th>Quantity</th><th>Price</th><th>Total</th></tr></thead><tbody>";

                        for (var i = 0; i < data.length; i++) {
                           item+="<tr><td>" + data[i].orderNumber + "</td><td ><a href=\"../userProfile?userID=" + data[i].customer.customerID + "\">" + data[i].customer.firstName + " " + data[i].customer.lastName +
                                    "</a></td><td>" + data[i].product.name + "</td>\
                 <td>" + data[i].quantity + "</td><td>" + data[i].price + "</td><td>" + data[i].price * data[i].quantity + "</td></tr>";
                        }
                       item+="</tbody></table>";
                        $("#datadiv").html(item);
                    }
                });
            }
            function getMessages() {
                $.ajax({
                    url: "../Stats",
                    type: 'POST',
                    data: "type=contact",
                    dataType: 'JSON',
                    success: function (data, textStatus, jqXHR) {
                        $("#datadiv").html("");
                        var item = "<table class='table'><tr><th>Name</th><th>EMail</th><th>Telephone</th>\
                 <th>Message</th></tr></thead><tbody>";

                        for (var i = 0; i < data.length; i++) {
                            item += "<tr><td>" + data[i].name + "</td><td ><a href=\"mailto:" + data[i].email + "\">" + data[i].email +
                                    "</a></td><td>" + data[i].telephone + "</td>\
                 <td>" + data[i].message + "</td></tr>";
                        }
                        item += "</tbody></table>";
                        $("#datadiv").append(item);
                    }
                });
            }

            window.onload = function () {
                getStats();
            }
        </script>
        <div id="wrapper">

            <!-- Navigation -->
            <%@ include file="navHeader.jsp" %>

            <div id="page-wrapper" >

                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">
                                Dashboard <small>Statistics Overview</small>
                            </h1>
                            <ol class="breadcrumb">
                                <li class="active">
                                    <i class="fa fa-dashboard"></i> Dashboard
                                </li>
                            </ol>
                        </div>
                    </div>
                    <!-- /.row -->

                    <div class="row">
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-comments fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge" id="txtUserNum">0</div>
                                            <div>User</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="tables.jsp">
                                    <div class="panel-footer">
                                        <span class="pull-left">View Details</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-green">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-tasks fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge" id="txtProduct">0</div>
                                            <div>Products</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="blank-page.jsp">
                                    <div class="panel-footer">
                                        <span class="pull-left">View Details</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-yellow">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-shopping-cart fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge" id="txtNewOrder">0</div>
                                            <div>Today Orders</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="javascript:getOrders();">
                                    <div class="panel-footer">
                                        <span class="pull-left">View Details</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-red">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-support fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge" id="txtUserMessage">0</div>
                                            <div>User Message</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="javascript:getMessages()">
                                    <div class="panel-footer">
                                        <span class="pull-left">View Details</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- /.row -->

                    <!-- /.row -->

                    <div class="row" >
                        <div id="datadiv">


                        </div>
                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

        <!-- Morris Charts JavaScript -->
        <script src="js/plugins/morris/raphael.min.js"></script>
        <script src="js/plugins/morris/morris.min.js"></script>
        <script src="js/plugins/morris/morris-data.js"></script>

    </body>

</html>
