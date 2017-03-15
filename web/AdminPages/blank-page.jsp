<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Admin - All Products</title>

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
            var currentpage = 0;
            var deletedindexes = "";
            var curid = null;
            var originalImages = "";
            var maxbound = 0;

            var curimgsize = null;
            function getCatgories(l) {
                $.ajax({url: '../AddCatgorey', //servlet url
                    type: 'GET', //servlet request type
                    dataType: 'json', //For output type
                    success: function (data, textStatus, jqXHR) {
                        $("#selectCatgories").empty();
                        for (var i = 0; i < data.length; i++) {
                            $("#selectCatgories").append($("<option></option>").attr("id", data[i].categoryID).val(data[i].categoryID).text(data[i].name));
                        }
                        document.getElementById("selectCatgories").value = l;
                    }
                });
            }
            function test(id) {
                $.ajax({url: '../DeleteProduct', //servlet url
                    type: 'GET', //servlet request type
                    dataType: 'json', //For output type
                    data: {'id': id},
                    success: function (data, textStatus, jqXHR) {
                        deletedindexes = "";
                        curid = data.productID;
                        curimgsize = data.images;
                        originalImages = data.images;
                        $("#modal-edit").modal("show");
                        $("#txtProductName").val(data.name);
                        $("#txtProductPrice").val(data.price);
                        $("#txtProductQuantity").val(data.quantity);
                        $("#txtProductDesc").val(data.description);
                        getCatgories(data.category.categoryID);
                        $("#imagesDiv").html("<h3>Images</h3>");
                        var arr = data.images.split("&&");
                        console.log(arr);
                        for (var i = 0; i < arr.length; i++) {
                            var item = "  <div id=\"imgdiv" + arr[i] + "\" class=\"modal-header\"><button onclick=\"deleteImage('" + arr[i] + "')\" type=\"button\" class=\"close\"  aria-label=\"Close\">" +
                                    "<span  aria-hidden=\"true\">&times;</span></button>";
                            item += "<img  class=\"img-responsive img-rounded px-2\" src=\"" + "..\\images\\" + data.category.name + "\\" + arr[i] + ".png" + "\"  ></img>";
                            item += "</div>";
                            if (arr[i] != "")
                            {
                                
                                $("#imagesDiv").append(item);
                                maxbound = arr[i];
                            }
                        }
                    }
                });
            }
            
                 function setDefault(item){
                     
            item.src='../images/noImage.png';
            item.className="img-responsive";
        }
            function deleteImage(i) {
                deletedindexes += i + "&&";
                document.getElementById('imgdiv' + i).style.display = "none";
            }
            function fillTable() {
                $.ajax({url: '../GetProducts', //servlet url
                    type: 'GET', //servlet request type
                    dataType: 'json', //For output type
                    data: {'offset': currentpage},
                    success: function (data, textStatus, jqXHR) {
                        $("#DataTable").empty();
                        var item = "<thead><tr><th>#</th><th>Product Name</th><th>Product Price</th><th>Product Quantity</th><th>Product Description</th><th>Image</th></tr></thead>";
                        $("#DataTable").append(item);
                        for (var i = 0; i < data.length; i++) {
                            var img = "";
                            var imagearr = data[i].images.split("&&");
                            if (imagearr.length > 0)
                            {
                                var rel = imagearr[0];
                                if (imagearr[0] == "") {
                                    rel = imagearr[1];
                                }
                                img = "..\\images\\" + data[i].category.name + "\\" + rel + ".png";
                            }
                            item = "<tr onclick=\"test(" + data[i].productID + ")\">" +
                                    "<td>" + data[i].productID + "</td>" +
                                    "<td>" + data[i].name + "</td>" +
                                    "<td>" + data[i].price + "</td>" +
                                    "<td>" + data[i].quantity + "</td>" +
                                    "<td>" + data[i].description + "</td>" +
                                    "<td><img src=\"" + img + "\" class=\"img-responsive img-rounded px-2\" width=100 height=100 onerror='setDefault(this)'></img></td>" +
                                    "</tr>";
                            $("#DataTable").append(item);
                        }

                        if (currentpage == 0)
                        {
                            document.getElementById("btnprev").disabled = true;
                        } else
                        {
                            document.getElementById("btnprev").disabled = false;
                        }
                        if (data.length < 10)
                        {
                            document.getElementById("btnnext").disabled = true;
                        } else
                        {
                            document.getElementById("btnnext").disabled = false;
                        }
                    }
                });
            }
            function btnPrev() {
                currentpage--;
                fillTable();
            }
            function btnNext() {
                currentpage++;
                fillTable();

            }
            function btnSaveEditProduct(event) {
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
                    formdata.append("id", curid);
                    formdata.append("name", productname);
                    formdata.append("price", productPrice);
                    formdata.append("quantity", productQuantity);
                    formdata.append("desc", productDesc);
                    formdata.append("imgLength", files.length);
                    formdata.append("catgorey", catgorey);
                    formdata.append("catgoreyID", catgoreyID);
                    formdata.append("deletedImages", deletedindexes);
                    formdata.append("originalImages", originalImages);
                    formdata.append("maxbound", maxbound);
                    for (var i = 0; i < files.length; i++)
                    {
                        formdata.append("file" + (i), files[i]);
                    }
                    $.ajax({
                        url: '../ProductEditServlet',
                        type: 'POST',
                        data: formdata,
                        async: false,
                        cache: false,
                        contentType: false,
                        processData: false,
                        success: function () {
                            deletedindexes = "";
                            curid = null;
                            curimgsize = null;
                             $("#modal-edit").modal("hide");
                             fillTable();
                        },
                        error: function () {

                        }
                    });
                } else {
                    showModal("Data Validation Fails");
                    //error handle
                }
                return false;

            }
        </script>
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
    </head>

    <body class="color" onload="fillTable();">
        <div class="modal fade modal-ext" id="modal-edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document" >
                <!--Content-->
                <div class="modal-content">
                    <!--Header-->
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <div class="col-lg-9">
                            <form onsubmit="return btnSaveEditProduct(event);" role="form" id="addProductForm" enctype="multipart/form-data">

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
                                    <label>Add Images</label>
                                    <input type="file" accept="image/*" multiple id="inputImages">
                                </div>
                                <div class="form-group">
                                    <label>Category</label>
                                    <select class="form-control" id="selectCatgories">                                 
                                    </select>
                                </div>
                                <button type="submit" id="btnSave"  class="btn btn-default">Save</button>
                            </form>
                        </div>
                        <div class="col-lg-3 pre-scrollable" id="imagesDiv" style="height: 450px;overflow-y: scroll;">
                        </div>

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
                                All Products
                            </h1>
                            <ol class="breadcrumb">
                                <li>
                                    <i class="fa fa-dashboard"></i>  <a href="index.jsp">Dashboard</a>
                                </li>
                                <li class="active">
                                    <i class="fa fa-file"></i> Products
                                </li>
                                <ul class="pager">
                                <li >
                                    <a ><button id="btnprev" onclick="btnPrev()" type="button" class="btn btn-link btn-sm">Previous</button></a>
                                </li>
                                <li >
                                    <a ><button  id="btnnext" onclick="btnNext()" type="button" class="btn btn-link btn-sm">Next</button></a>
                                </li>
                                </ul>
                            </ol>
                        </div>
                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.container-fluid -->
                <table class="table" id="DataTable">
                </table>
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
