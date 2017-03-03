
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin - Bootstrap Admin Template</title>

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
        <script>
            function btnSaveProduct(event) {
                event.preventDefault();
                var productname = $("#txtProductName").val();
                var productPrice = $("#txtProductPrice").val();
                var productQuantity = $("#txtProductQuantity").val();
                var productDesc = $("#txtProductDesc").val();
                var files = document.getElementById("inputImages").files;



                var formdata = new FormData();

                formdata.append("name", productname);
                formdata.append("price", productPrice);
                formdata.append("quantoty", productQuantity);
                formdata.append("desc", productDesc);
                formdata.append("imgLength", files.length);

                for (var i = 0; i < files.length; i++)
                {
                    formdata.append("file" + i, files[0]);
                }
                $.ajax({
                    url: 'http://localhost:8080/Shopping/ProductServlet',
                    type: 'POST',
                    data: formdata,
                    async: false,
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function () {
                        alert('Form Submitted!');
                    },
                    error: function () {
                        alert("error in ajax form submission");
                    }
                });


            }

            function  btnAddCatgoreyAction() {
                var catgoreyname = $("#txtCatgorey").val();
                if (catgoreyname != "") {
                    $.ajax({url: 'http://localhost:8080/Shopping/AddCatgorey', //servlet url
                        type: 'POST', //servlet request type
                        data: {"name": catgoreyname}, //input data
                        success: function (data, textStatus, jqXHR) {
                            if (data == "true") {
                                $("#txtCatgorey").val("");
                                $("#catgoretStatus").html("Saved");
                                getCatgories();

                            } else
                            {
                                $("#catgoretStatus").html("Error Happened,Please Try Again");
                            }
                        }
                    });
                }
            }
            function getCatgories() {
                $.ajax({url: 'http://localhost:8080/Shopping/AddCatgorey', //servlet url
                    type: 'GET', //servlet request type
                    dataType: 'json', //For output type

                    success: function (data, textStatus, jqXHR) {
                        $("#selectCatgories").empty();
                        for (var i = 0; i < data.length; i++) {
                            $("#selectCatgories").append($("<option></option>").attr("id", data[i].categoryID).text(data[i].name));
                        }
                    }
                });

            }

        </script>
    </head>

    <body onload="getCatgories()">
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

            <nav class="navbar navbar-inverse navbar-fixed-top color" role="navigation">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header ">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp">SB Admin</a>
                </div>
                <!-- Top Menu Items -->

                <ul class="nav navbar-right top-nav ">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> John Smith <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav color">
                        <li >
                            <a href="index.jsp"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
                        </li>

                        <li>
                            <a href="tables.jsp"><i class="fa fa-fw fa-table"></i> Users</a>
                        </li>
                        <li class="active">
                            <a href="forms.jsp"><i class="fa fa-fw fa-edit"></i> Products</a>
                        </li>

                        <li>
                            <a href="blank-page.jsp"><i class="fa fa-fw fa-file"></i> Blank Page</a>
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
                                Products
                            </h1>
                            <ol class="breadcrumb">
                                <li>
                                    <i class="fa fa-dashboard"></i>  <a href="index.jsp">Dashboard</a>
                                </li>
                                <li class="active">
                                    <i class="fa fa-edit"></i> Products
                                </li>
                            </ol>
                        </div>
                    </div>
                    <!-- /.row -->

                    <div class="row">
                        <div class="col-lg-6">

                            <form role="form" id="addProductForm" enctype="multipart/form-data">

                                <div class="form-group">
                                    <label>Product Name</label>
                                    <input class="form-control" id="txtProductName" >
                                </div>
                                <div class="form-group">
                                    <label>Product Price</label>
                                    <input class="form-control" type="number" id="txtProductPrice">
                                </div>
                                <div class="form-group">
                                    <label>Available Quantity</label>
                                    <input class="form-control" type="number" id="txtProductQuantity">
                                </div>

                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea class="form-control" rows="3" id="txtProductDesc"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Images</label>
                                    <input type="file" accept="image/*" multiple id="inputImages">
                                </div>

                                <div class="form-group">
                                    <label>Catgorey</label>
                                    <select class="form-control" id="selectCatgories">                                 
                                    </select>
                                </div>
                                <button type="submit" id="btnSave" onclick="btnSaveProduct(event);" class="btn btn-default">Save</button>
                                <button type="reset" class="btn btn-default">Reset</button>

                            </form>

                        </div>
                        <div class="col-lg-6">
                            <h1>Catogries</h1>

                            <div class="form-group">
                                <label for="disabledSelect">New Catogrey</label>
                                <input class="form-control" id="txtCatgorey" type="text" placeholder="New Catgorey name" >
                            </div>

                            <button onclick="btnAddCatgoreyAction();"  class="btn btn-primary">Save</button>
                            <div class="form-group">
                                <label id="catgoretStatus"></label>
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

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

    </body>

</html>
