<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Admin - Credits</title>

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
            var i = 0;
            var valuesArray = [];
            var amountArray = [];
            function addController() {

            var item = "<tr><td><input type='text' class='form-control'/></td><td>\
                                    <select class='form-control'>\
                                        <option>10</option>\
                                        <option>25</option>\
                                        <option>50</option>\
                                        <option>100</option>\
                                        <option>200</option>\
                                        <option>500</option>\
                                        <option>1000</option>\
                                        <option>2000</option>\
                                        <option>5000</option>\
                                        <option>10000</option>\
                                    </select>\
                                </td>\
                                <td><a class=' glyphicon glyphicon-remove-circle delete' onclick ='javascript:removeRow($(this))'></a></td><tr>";
            $("#table").append(item);
            i++;
            }
            function removeRow(row)
            {
            row.closest('tr').remove();
            }
            function addCredits(){
            valuesArray = [];
            amountArray = [];
            var sum = 0;
            $("#showTable").html("<tr><td>Number Of Cards</td><td>Values</td></tr>");
            $('tr > td > input').each(function() {
            if (this.value != "" && parseInt(this.value))
                    valuesArray.push(this.value);
            });
            $('tr > td > select option:selected').each(function() {
            amountArray.push(this.value);
            });
            if (valuesArray.length > 0)
            {
            $("#modal-save").modal("show");
            for (var i = 0; i < valuesArray.length; i++) {
            sum += parseInt(valuesArray[i]) * parseInt(amountArray[i]);
            $("#showTable").append("<tr><td>" + valuesArray[i] + "</td><td>" + amountArray[i] + "</td></tr>");
            }
            $("#showTable").append("<tr><td>Total Payment</td><td>" + sum + "</td></tr>");
            }
            }
            function sendData(){
            $.ajax({
            url: '../GenerateCredits',
                    type: 'POST',
                    data: 'firstarr=' + valuesArray + "&secondarr=" + amountArray,
                    dataType: 'json',
                    success: function (data) {
                    console.log(data);
                    $("#modal-save").modal("hide");
                    $("#modal-Credit").modal("show");
                    $("#showTableCredit").html("<tr><td>Number</td><td>value</td> </tr>");
                    for (var i = 0; i < data.length; i++) {
                    $("#showTableCredit").append("<tr><td>" + data[i].cardID + "</td><td>" + data[i].cardValue + "</td></tr>");
                    }

                    },
                    error: function () {
                    }
            });
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

    <body class="color">
        <div class="modal fade modal-ext" id="modal-save" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document" >
                <!--Content-->
                <div class="modal-content">
                    <!--Header-->
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <div class="col-lg-9">
                            <table class="table" id="showTable">
                            </table>
                            <button type="button" class="btn btn-default" onclick="sendData()">Approve</button>
                        </div>


                    </div>
                    <!--Body-->

                </div>
                <!--/.Content-->
            </div>
        </div>

        <div class="modal fade modal-ext" id="modal-Credit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document" >
                <!--Content-->
                <div class="modal-content">
                    <!--Header-->
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <div class="col-lg-9">
                            <table class="table" id="showTableCredit">
                                <tr>
                                    <td>Number</td>
                                    <td>value</td> 
                                </tr>
                            </table>
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
                                Credit Cards
                                <small>Subheading</small>
                            </h1>
                            <ol class="breadcrumb">
                                <li>
                                    <i class="fa fa-dashboard"></i>  <a href="index.jsp">Dashboard</a>
                                </li>
                                <li class="active">
                                    <i class="fa fa-file"></i> Credits
                                </li>
                            </ol>
                        </div>
                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.container-fluid -->
                <div class="form-group">                    
                    Add Credits
                    <a href="javascript:addController();" class="pull-right" style="margin-right: 10px;">
                        Add
                        <span class="glyphicon glyphicon-plus-sign " ></span>
                    </a>

                    <div>
                        <table class="table" id="table">
                            <tr>
                                <td>
                                    Credit Amount 
                                </td>
                                <td>
                                    Credit Value
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control"/> 
                                </td>
                                <td>
                                    <select class="form-control">
                                        <option>10</option>
                                        <option>25</option>
                                        <option>50</option>
                                        <option>100</option>
                                        <option>200</option>
                                        <option>500</option>
                                        <option>1000</option>
                                        <option>2000</option>
                                        <option>5000</option>
                                        <option>10000</option>
                                    </select>
                                </td>
                                <td><a class=" glyphicon glyphicon-remove-circle delete" onclick ="javascript:removeRow($(this))"></a></td>

                            </tr>
                        </table>
                        <button type="button" class="btn btn-default" onclick="addCredits();">Save</button>
                    </div>
                </div>
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
