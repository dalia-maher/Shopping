<%-- 
    Document   : searchResults
    Created on : Mar 6, 2017, 2:36:11 AM
    Author     : TahanyFawzy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Products | Sugar Store</title>
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

            function getCatgories() {
                $.ajax({url: 'AddCatgorey', //servlet url
                    type: 'GET', //servlet request type
                    dataType: 'json', //For output type
                    success: function (data, textStatus, jqXHR) {
                        $("#selectCatgories").empty();
                        $("#selectCatgories").append($("<option></option>").attr("id", "-1").text("All"));
                        for (var i = 0; i < data.length; i++) {
                            $("#selectCatgories").append($("<option></option>").attr("id", data[i].categoryID).text(data[i].name));
                        }
                    }
                });
            }
            window.onload = function () {
                getCatgories();

            }
            function searchBtnClicked() {
                var productName = $("#txtSearch").val();
                var maxPrice = $("#txtMaxPrice").val();
                var minPrice = $("#txtMinPrice").val();
                var catgoreyID = $("#selectCatgories option:selected").attr("id");
                if (maxPrice == "")
                    maxPrice = 0;
                if (minPrice == "")
                    minPrice = 0;
                $.ajax({url: "AdvancedSearch",
                    data: "keyword=" + productName + "&minP=" + minPrice + "&maxP=" + maxPrice + "&catgoreyID=" + catgoreyID,
                    dataType: 'JSOn',
                    success: function (responseTxt, textStatus, jqXHR) {
                        $("#result").html("");
                        for (i = 0; i < responseTxt.length; i++)
                        {
                            var ProName = responseTxt[i].name;
                            var catName = responseTxt[i].category.name;
                            var image = responseTxt[i].images.split("&&");
                            var src = image[0];
                            if (src == "")
                                src = image[1];
                            $("#result").append("<div class='products-grd'>" +
                                    "<div class='p-one simpleCart_shelfItem prd sizeW' > " +
                                    "<a href='productDescription.jsp?productID=" + responseTxt[i].productID + "'>" +
                                    "<img src=\"" + "images/" + catName + "/" + src + ".png" + "\"alt='Error' class='img-responsive' onerror='setDefault(this)'  />" +
                                    "<div class='mask'>" +
                                    "<span>Quick View</span>" +
                                    "</div>" +
                                    "</a>" +
                                    "<h4>" + responseTxt[i].name + "</h4>" +
                                    "<p><a class='item_add' href='#'><i></i> <span class=' item_price valsa'> $" + responseTxt[i].price + "</span></a></p>" +
                                    "</div>" +
                                    "</div>");
                        }
                    }
                });

            }

            function setDefault(item) {
                item.src = 'images/noImage.png';
                item.className = "img-responsive";
            }
        </script>
        <!-- //the jScrollPane script -->
        <style>
            .sizeW{
                width: 300px;
                height: 300px;
            }
            img {
                max-width: 200px;
                max-height: 200px;
            }
        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div class="mega_nav wrapper">
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
                        <div  class="products-grid-lft">

                            <div class="search">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-10 col-md-offset-1">
                                            <div class="form-section">
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <input type="email" id="txtSearch" class="form-control" id="location" placeholder="Enter Name or Description">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="form-group">
                                                            <label class="sr-only" for="checkin">Min Price</label>
                                                            <div class="input-group">
                                                                <input type="number" id="txtMinPrice" class="form-control" id="checkin" placeholder="Min Price">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="form-group">
                                                            <label class="sr-only" for="checkout">Max Price</label>
                                                            <div class="input-group">
                                                                <input type="number" id="txtMaxPrice" class="form-control" id="checkout" placeholder="Max Price">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="form-group">
                                                            <label class="sr-only" for="guest">Guest</label>
                                                            <select id="selectCatgories" name="guest" class="form-control">

                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <button type="submit" onclick="searchBtnClicked()" class="btn btn-default btn-primary">Search</button>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <!--Products-->
                                                    <div class="products">
                                                        <div class="">
                                                            <div class="products-grids">
                                                                <div class="col-md-12 products-grid-left">
                                                                    <div id="result" class="products-grid-lft">

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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

