<%-- 
    Document   : checkout
    Created on : Feb 28, 2017, 6:29:37 PM
    Author     : Dalia
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Pendent Store a E-commerce Online Shopping Category Flat Bootstarp Resposive Website Template | Checkout :: w3layouts</title>
        <!-- for-mobile-apps -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Pendent Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- js -->
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- //js -->
        <!-- //for-mobile-apps -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- start-smoth-scrolling -->
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });

            function increase_by_one(field, productID, price) {
                console.log("id = " + productID);
                nr = parseInt(document.getElementById(field).value);
                var quantity = getLastQuantity(productID);
                quantity.success(function (data) {
                    if(parseInt(data) != 0 && nr < parseInt(data)) {
                        document.getElementById(field).value = nr + 1;
                        $('#total').html(parseFloat($('#total').html()) + price);
                        $('#total_price').html(parseFloat($('#total_price').html()) + price);
                        $('#sum_price' + productID).html((parseFloat($('#sum_price' + productID).html()) + price));
                        $("#total_price_carts").html("EGP " + $('#total').html());
                    }
                });
            }

            function decrease_by_one(field, productID, price) {
                nr = parseInt(document.getElementById(field).value);
                if (nr > 0) {
                    if( (nr - 1) > 0) {
                        document.getElementById(field).value = nr - 1;
                        $('#total').html(parseFloat($('#total').html()) - price);
                        $('#total_price').html(parseFloat($('#total_price').html()) - price);
                        $('#sum_price' + productID).html((parseFloat($('#sum_price' + productID).html()) - price));
                        $("#total_price_carts").html("EGP " + $('#total').html());
                    }
                }
            }
            
            var productsArray = [];
            var productIDsArray = [];
            var quantityArray = [];
            var pricesArray = [];
            var currentCredit;
            function hideDiv(id, price){ 
                  $.ajax({
                    url: "DeleteItemFromCart",
                    type: 'POST',
                    data: "productID=" + id,
                    success: function (data, textStatus, jqXHR) {
                        $('#item' + (id)).fadeOut('slow', function (c) {
                            $('#item' + (id)).remove();
                        });
                        var total = parseFloat($('#total').html());
                        var numOfItems = parseInt($('#numOfItems').html());
                        var qty = parseInt($('#qty' + id).val());
                        $('#numOfItems').html(numOfItems - 1);
                        $('#total').html(total - (price * qty));
                        $('#total_price').html(parseFloat($('#total_price').html()) - (price * qty));
                        $("#simpleCart_quantity").html(numOfItems - 1);
                        $("#total_price_carts").html("EGP " + (total - (price * qty)));
                     }
                });
            }
            function fillCart() {
                $.ajax({
                    url: "CheckOut",
                    type: 'GET',
                    dataType: 'JSON',
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        var list = data;
                        var total_price = 0;
                        $(numOfItems).html(list.length);
                        for (var i = 0; i < list.length; i++) {
                            total_price += list[i].product.price * list[i].quantity;
                            var imgName = list[i].product.images.split("&&")[0];
                            if (imgName == "") {
                                imgName = list[i].product.images.split("&&")[1];
                            }
                            var item = "<div class='cart-header' id='item" + list[i].product.productID + "'>\
                                <input type='hidden' value=" + list[i].product.productID + ">\
                                <div class='close' onclick='hideDiv(" + list[i].product.productID + ", " + list[i].product.price + ")'> </div>\
                                <div class='cart-sec simpleCart_shelfItem'>\
                                    <div class='cart-item cyc'>\
                                        <img src='images/" + list[i].product.category.name + "/" + imgName+ ".png" + "' class='img-responsive' alt=''/></div>\
                                    <div class='cart-item-info'>\
                                        <p>" + list[i].product.name + "</p><br/>\
                                        <ul class='qty'>\
                                            <div class='cart-quantity'>\
                                              Qty: <input class='qty1' id='qty" + list[i].product.productID + "' type='text' value='" + list[i].quantity + "' name='qty' readonly/>\
                                              <button onclick='increase_by_one(\"qty" + list[i].product.productID + "\"," + list[i].product.productID + "," + list[i].product.price + ")'>+</button>\
                                              <button onclick='decrease_by_one(\"qty" + list[i].product.productID + "\"," + list[i].product.productID + "," + list[i].product.price + ")'>-</button>\
                                            </div>\
                                            <li><p>Price Per Unit : <i id='price'>" + list[i].product.price + "</i></p></li>\
                                        </ul>\
                                        <div class='delivery'>\
                                            <p>Price : <i id='sum_price" + list[i].product.productID + "'>" + list[i].product.price * list[i].quantity + "</i> EGP</p>\
                                            <span>Delivered in 2-3 business days</span>\
                                            <div class='clearfix'></div>\
                                        </div>\
                                       </div>\
                                    <div class='clearfix'></div>\
                                </div></div>";
                            $("#items").append(item);
                        }
                        $("#total").html(total_price);
                        total_price += 150;
                        $("#total_price").html(total_price + " EGP");
                    }
                });
            }
            function addOrder() {
                productsArray = [];
                productIDsArray = [];
                quantityArray = [];
                pricesArray = [];
                $("#showTable").html("<tr><td>Order(s)</td><td>Total Price</td></tr>");
                $('.cart-item-info > p').each(function() {
                    if(this.innerHTML != "")
                        productsArray.push(this.innerHTML);
                });
                $('.cart-header > input').each(function() {
                    if(this.value != "")
                        productIDsArray.push(parseInt(this.value));
                });
                $('.delivery > p > i').each(function() {
                    if(this.innerHTML != "")
                        pricesArray.push(parseFloat(this.innerHTML));
                });
                $('.cart-quantity > input').each(function() {
                    if(this.value != "")
                        quantityArray.push(parseInt(this.value));
                });
                if(productsArray.length > 0) {
                    $("#modal-save").modal("show");
                    for (var i = 0; i < productsArray.length; i++) {
                        $("#showTable").append("<tr><td>" + productsArray[i] + " x " + quantityArray[i] + "</td><td>" + pricesArray[i] + "</td></tr>");
                    }
                    $("#showTable").append("<tr><td>Delivery Charges</td><td>150.00</td></tr>");
                    $("#showTable").append("<tr><td><b>Total Payment</b></td><td><b>" + $("#total_price").html() + "</b></td></tr>");
                }
            }
            
            function checkCredit(msg) {
                if(msg == "credit") {
                    var count = 0;
                    $('div > input').each(function() {
                        count++;
                    });
                    if(count > 0) {
                        currentCredit = getLastCredit();
                        currentCredit.success(function (data) {
                            if(data != -1) {
                                if(parseFloat(data) >= parseFloat($("#total_price").html())) {
                                    addOrder();
                                }
                                else {
                                    showModal("Sorry, you don't have enough credit!");
                                }
                            }
                        });
                    }
                    else {
                        showModal("You don't have items in the shopping cart!");
                    }
                } else if(msg == "log") {
                    showModal("You must log in first to continue!");
                }
            }

            function showModal(msg) {
                $("#msg").html(msg);
                $("#modal-registerd").modal("show");
                setTimeout(function () {
                    $("#modal-registerd").modal("hide");
                }, 2000);
            }

            function sendOrder() {
                console.log(productIDsArray);
                $.ajax ({
                    url: 'PlaceOrder',
                    type: 'POST',
                    data: 'productsArr=' + productIDsArray + "&quantityArr=" + quantityArray + "&total=" + parseFloat($("#total_price").html()),
                    success: function (data) {
                        console.log(data);
                        for(var i = 0; i < productIDsArray.length; i++) {
                            hideDiv(productIDsArray[i], pricesArray[i]);
                        }
                        $("#modal-save").modal("hide");
                        $("#simpleCart_quantity").html(0);
                        $("#total_price_carts").html("EGP " + 0);
                    },
                    error: function () {
                    }
                });
            }
            
            function getLastQuantity(productID){
                return $.ajax({
                   url:"GetLastQuantity",
                   type: "GET",
                   data: 'productID=' + productID
               });
            }

            function getLastCredit(){
                return $.ajax({
                   url:"GetLastCredit",
                   type: "GET"
               });
            }       
        </script>
        <!-- start-smoth-scrolling -->
        <!-- start menu -->
        <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/megamenu.js"></script>
        <script>
            $(document).ready(function () {
                $(".megamenu").megamenu();
            });
        </script>
        <link href='http://fonts.googleapis.com/css?family=Monda:400,700' rel='stylesheet' type='text/css'>
        <style type="text/css">
            .qty1 { width: 30px; }
        </style>
    </head>

    <body onload="fillCart()">
        <!-- header -->
        <%@ include file="header.jsp" %>
        <div class="mega_nav">
            <div class="container">
                <div class="menu_sec">
                    <!-- start header menu -->
                    <ul class="megamenu skyblue">
                        <li class="active grid"><a class="color1" href="index.jsp">Home</a></li>
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
                    <form action ="SearchProducts" method ="get">
                        <div class="search">
                            <input type="text" value="" placeholder="Search..." name = "keyword">
                            <input type="submit" value="">
                        </div><br/>
                        <a href="searchPage.jsp" >Advanced Search</a>
                    </form>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!---->
        <!-- Modal -->
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
                                <tr>
                                    <td>Number</td>
                                    <td>value</td> 
                                </tr>
                            </table>
                            <button type="button" class="btn btn-default" onclick="sendOrder()">Submit Order</button>
                        </div>
                    </div>
                    <!--Body-->
                </div>
                <!--/.Content-->
            </div>

        </div>
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

        <!-- check-out -->
        <div class="container">
            <div class="check">
                <div class="col-md-3 cart-total">
                    <div class="price-details">
                        <h3>Price Details</h3>
                        <span>Total</span>
                        <span class="total1" id="total">0.00</span>
                        <span>Delivery Charges</span>
                        <span class="total1">150.00</span>
                        <div class="clearfix"></div>		 
                    </div>
                    <ul class="total_price">
                        <li class="last_price"><h4>TOTAL</h4></li>
                        <li class="last_price"><span id="total_price"></span></li>
                    </ul> 
                    <div class="clearfix"></div>
                    <c:if test="${sessionScope.loggedInUser != null}">
                        <a class="order" href="javascript:checkCredit('credit');">Place Order</a>
                    </c:if>
                    <c:if test="${sessionScope.loggedInUser == null}">
                        <a class="order" href="javascript:checkCredit('log');">Place Order</a>
                    </c:if>
                </div>
                <div class="col-md-9 cart-items" id="items">
                    <h1>My Shopping Cart (<i id="numOfItems"></i>)</h1>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!-- //check-out -->
        <!-- footer -->
        <%@ include file="footer.html" %>
        <!-- //footer -->
    </body>
</html>
