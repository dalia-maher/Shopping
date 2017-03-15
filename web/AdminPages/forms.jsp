
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Admin - Add Product</title>

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
                var catgorey = $("#selectCatgories option:selected").text();
                var catgoreyID = $("#selectCatgories option:selected").attr("id");
                var files = document.getElementById("inputImages").files;
                if (productname != "" && parseFloat(productPrice) != "NaN" && productDesc != "" && parseInt(catgoreyID) != "NaN") {
                    var formdata = new FormData();
                    formdata.append("name", productname);
                    formdata.append("price", productPrice);
                    formdata.append("quantity", productQuantity);
                    formdata.append("desc", productDesc);
                    formdata.append("imgLength", files.length);
                    formdata.append("catgorey", catgorey);
                    formdata.append("catgoreyID", catgoreyID);

                    for (var i = 0; i < files.length; i++)
                    {
                        formdata.append("file" + i, files[i]);
                    }
                    $.ajax({
                        url: '../ProductServlet',
                        type: 'POST',
                        data: formdata,
                        async: false,
                        cache: false,
                        contentType: false,
                        processData: false,
                        success: function () {
                            showModal("Saved");
                            $("#reset").click();
                            getProducts();
                        },
                        error: function () {
                            showModal("Try Again");
                        }
                    });
                } else {
                            showModal("Data Validation Fails");
                    //error handle
                }
                return false;

            }
            function showModal(msg) {
                $("#msg").html(msg);
                $("#modal-registerd").modal("show");
                setTimeout(function () {
                    $("#modal-registerd").modal("hide");
                }, 1200);
            }
            function  btnAddCatgoreyAction() {
                var catgoreyname = $("#txtCatgorey").val();
                if (catgoreyname != "") {
                    $.ajax({url: '../AddCatgorey', //servlet url
                        type: 'POST', //servlet request type
                        data: {"name": catgoreyname}, //input data
                        success: function (data, textStatus, jqXHR) {
                            if (data == "true") {
                                $("#txtCatgorey").val("");
                                showModal("Saved");
                                getCatgories();
                            } else
                            {
                                showModal("Error Happened,Please Try Again");
                            }
                        }
                    });
                }
            }            
            function onloadd() {
                getCatgories();
                getProducts();
                $(function () {
                    $('#search').keyup(function () {
                        var current_query = $('#search').val();
                        if (current_query !== "") {
                            $(".list-group li").hide();
                            $(".list-group li").each(function () {
                                var current_keyword = $(this).text();
                                if (current_keyword.indexOf(current_query) >= 0) {
                                    $(this).show();
                                }
                                ;
                            });
                        } else {
                            $(".list-group li").show();
                        }
                        ;
                    });
                });

            }
        
             function delProduct(id){
                  $.ajax({url: '../DeleteProduct', //servlet url
                    type: 'POST', //servlet request type
                    dataType: 'json', //For output type
                    data: {'id':id},
                    success: function (data, textStatus, jqXHR) {
                        getProducts();
                    }
                });                 
            }
            function getProducts(){                
                 $.ajax({url: '../ProductServlet', //servlet url
                    type: 'GET', //servlet request type
                    dataType: 'json', //For output type
                    success: function (data, textStatus, jqXHR) {
                        $("#lstProducts").empty();
                        for (var i = 0; i < data.length; i++) {
                            
            var item="<li class=\"list-group-item \">"+data[i].name+
                                "<a href=\"javascript:delProduct("+data[i].productID+");\"><span class=\"glyphicon glyphicon-remove pull-right marginitem\"></span></a>"+
                    "</li>";
                            $("#lstProducts").append(item);
                        
                    }
                    }
                });                
            }
            function getCatgories() {
                $.ajax({url: '../AddCatgorey', //servlet url
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
        <style>
            
            
            .tooltip {
    position: relative;
    display: inline-block;
    border-bottom: 1px dotted black;
}

.tooltip .tooltiptext {
    visibility: hidden;
    width: 120px;
    background-color: #555;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 5px 0;
    position: absolute;
    z-index: 1;
    bottom: 125%;
    left: 50%;
    margin-left: -60px;
    opacity: 0;
    transition: opacity 1s;
}

.tooltip .tooltiptext::after {
    content: "";
    position: absolute;
    top: 100%;
    left: 50%;
    margin-left: -5px;
    border-width: 5px;
    border-style: solid;
    border-color: #555 transparent transparent transparent;
}

.tooltip:hover .tooltiptext {
    visibility: visible;
    opacity: 1;
}
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

            .navie{
                max-height: 250px;
                overflow-y:scroll; 
            }
            .marginitem{
                
                    margin-right: 5px;
    margin-left: 5px;

            }
        </style>
    </head>

    <body onload="onloadd()">
        <div class="modal fade modal-ext" id="modal-registerd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <!--Content-->
                <div class="modal-content">
                    <!--Header-->
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h3 id="msg"><i class="fa fa-user"></i> Registration Done!</h3>
                    </div>
                    <!--Body-->

                </div>
                <!--/.Content-->
            </div>
        </div>
             
        <div id="wrapper">
            <%@ include file="navHeader.jsp" %>
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
                                    <i class="fa fa-edit"></i> New Products
                                </li>
                            </ol>
                        </div>
                    </div>
                    <!-- /.row -->

                    <div class="row">
                        <div class="col-lg-6">

                            <form onsubmit="return btnSaveProduct(event);" role="form" id="addProductForm" enctype="multipart/form-data">

                                <div class="form-group">
                                    <label>Product Name</label>
                                    <input class="form-control" id="txtProductName" required>
                                </div>
                                <div class="form-group">
                                    <label>Product Price</label>
                                    <input class="form-control" type="number" id="txtProductPrice" required>
                                </div>
                                <div class="form-group">
                                    <label>Available Quantity</label>
                                    <input class="form-control" type="number" id="txtProductQuantity" required>
                                </div>

                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea class="form-control" rows="3" id="txtProductDesc" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Images</label>
                                    <input type="file" accept="image/*" multiple id="inputImages">
                                </div>

                                <div class="form-group">
                                    <label>Category</label>
                                    <select class="form-control" id="selectCatgories">                                 
                                    </select>
                                </div>
                                <button type="submit" id="btnSave"  class="btn btn-default">Save</button>
                                <button type="reset" id="reset" class="btn btn-default">Reset</button>

                            </form>

                        </div>
                        <div class="col-lg-6"> <!-- bdayet al goze2 al ymeeen-->
                            <h1>Categories</h1>

                            <div class="form-group">
                                <label for="disabledSelect">New Category</label>
                                <input class="form-control" id="txtCatgorey" type="text" placeholder="New Category name" >
                            </div>

                            <button onclick="btnAddCatgoreyAction();"  class="btn btn-primary">Save</button>
                            <div class="form-group">
                                <label id="catgoretStatus"></label>
                            </div>
                        </div>
                        <div id="custom-search-input">
                            <div class="input-group ">
                                <input id="search" type="text" class="form-control input-lg" placeholder="Search" />
                                <span class="input-group-btn">
                                    <button class="btn btn-info btn-lg" type="button">
                                        <i class="glyphicon glyphicon-search"></i>
                                    </button>
                                </span>
                            </div>
                            <ul class="list-group col-lg-6 navie" id="lstProducts">

                                <li class="list-group-item">Cras justo odio
                                <a href="#"><span class="glyphicon glyphicon-remove pull-right marginitem"></span></a>
                                <a href="#"><span class="glyphicon glyphicon-pencil pull-right marginitem"></span></a>
                                </li>
                                <li class="list-group-item">Dapibus ac facilisis in</li>
                                <li class="list-group-item">Morbi leo risus</li>
                                <li class="list-group-item">Porta ac consectetur ac</li>
                                <li class="list-group-item">Vestibulum at eros</li>

                                <li class="list-group-item">Cras justo odio</li>
                                <li class="list-group-item">Dapibus ac facilisis in</li>
                                <li class="list-group-item">Morbi leo risus</li>
                                <li class="list-group-item">Porta ac consectetur ac</li>
                                <li class="list-group-item">Vestibulum at eros</li>
                            </ul>
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
