<%-- 
    Document   : checkout
    Created on : Feb 28, 2017, 6:29:37 PM
    Author     : Dalia
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Pendent Store a Ecommerce Online Shopping Category Flat Bootstarp Resposive Website Template | Checkout :: w3layouts</title>
        <!-- for-mobile-apps -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Pendent Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- //for-mobile-apps -->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- js -->
        <script src="js/jquery-1.11.1.min.js"></script>
        <!-- //js -->
        <!-- start-smoth-scrolling -->
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
            function hideDiv(id){ 
                  $.ajax({
                    url: "DeleteItemFromCart",
                    type: 'POST',
                    data: "productID=" + id,
                    success: function (data, textStatus, jqXHR) {
                        $('#item' + (id)).fadeOut('slow', function (c) {
                            $('#item' + (id)).remove();
                        });
                        $('#numOfItems').html(parseInt($('#numOfItems').html()) - 1);
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
                                 <div class='close' onclick='hideDiv(" + list[i].product.productID + ")'> </div>\
                                <div class='cart-sec simpleCart_shelfItem'>\
                                    <div class='cart-item cyc'>\
                                        <img src='images/" + list[i].product.category.name + "/" + imgName+ ".png" + "' class='img-responsive' alt=''/></div>\
                                    <div class='cart-item-info'>\
                                        <ul class='qty'>\
                                            <li><p>Quantity : <i id='quantity'"  + list[i].product.productID + ">" + list[i].quantity + "</i></p></li>\
                                            <li><p>Price Per Unit : <i id='price1'>" + list[i].product.price + "</i></p></li>\
                                        </ul>\
                                        <div class='delivery'>\
                                            <p>Price : <i id='sum_price'" + list[i].product.productID + ">" + list[i].product.price * list[i].quantity + "</i></p>\
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
                        $("#total_price").html(total_price);
                    }
                });
            }
        </script>
        <!-- start-smoth-scrolling -->
        <!-- start menu -->
        <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/megamenu.js"></script>
        <script>
            $(document).ready(function () {
                $(".megamenu").megamenu();});
        </script>
        <link href='http://fonts.googleapis.com/css?family=Monda:400,700' rel='stylesheet' type='text/css'>
    </head>

    <body onload="fillCart()">
        <!-- header -->
        <%@ include file="header.jsp" %>
        <!------>
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
                        <li><a class="color1" href="#">catalog</a>
                            <div class="megapanel">
                                <div class="row">
                                    <div class="col1">
                                        <div class="h_nav">
                                            <h4>Popular Brands</h4>
                                            <ul>
                                                <li><a href="products.jsp">Slave Bracelets</a></li>
                                                <li><a href="products.jsp">Rings</a></li>
                                                <li><a href="products.jsp">Necklaces</a></li>
                                                <li><a href="products.jsp">Chokers</a></li>
                                                <li><a href="products.jsp">Cuff Links</a></li>									
                                                <li><a href="products.jsp">Bangles</a></li>
                                            </ul>	
                                        </div>							
                                    </div>
                                    <div class="col1">
                                        <div class="h_nav">
                                            <h4>Style Zone</h4>
                                            <ul>
                                                <li><a href="products.jsp">Men</a></li>
                                                <li><a href="products.jsp">Women</a></li>
                                                <li><a href="products.jsp">Brands</a></li>
                                                <li><a href="products.jsp">Kids</a></li>
                                                <li><a href="products.jsp">Accessories</a></li>
                                                <li><a href="products.jsp">Style Videos</a></li>
                                            </ul>	
                                        </div>							
                                    </div>
                                    <div class="col1">
                                        <div class="h_nav">
                                            <h4>All Jewellery</h4>
                                            <ul>
                                                <li><a href="products.jsp">eum fugiat</a></li>
                                                <li><a href="products.jsp">commodi consequatur</a></li>
                                                <li><a href="products.jsp">illum qui dolorem</a></li>
                                                <li><a href="products.jsp">nihil molestiae</a></li>
                                                <li><a href="products.jsp">eum fugiat</a></li>
                                                <li><a href="products.jsp">consequatur eum</a></li>
                                            </ul>	
                                        </div>												
                                    </div>
                                    <div class="col1">
                                        <div class="h_nav">
                                            <h4>Seating</h4>
                                            <ul>
                                                <li><a href="products.jsp">eum fugiat</a></li>
                                                <li><a href="products.jsp">commodi consequatur</a></li>
                                                <li><a href="products.jsp">illum qui dolorem</a></li>
                                                <li><a href="products.jsp">nihil molestiae</a></li>
                                                <li><a href="products.jsp">eum fugiat</a></li>
                                                <li><a href="products.jsp">consequatur eum</a></li>
                                            </ul>	
                                        </div>						
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col2"></div>
                                    <div class="col1"></div>
                                    <div class="col1"></div>
                                    <div class="col1"></div>
                                    <div class="col1"></div>
                                </div>
                            </div>
                        </li>				

                    </ul> 
                    <div class="search">
                        <form>
                            <input type="text" value="" placeholder="Search...">
                            <input type="submit" value="">
                        </form>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!---->
        <!-- check-out -->

        <div class="container">
            <div class="check">
                <div class="col-md-3 cart-total">
                    <div class="price-details">
                        <h3>Price Details</h3>
                        <span>Total</span>
                        <span class="total1" id="total"></span>
                        <span>Delivery Charges</span>
                        <span class="total1">150.00</span>
                        <div class="clearfix"></div>		 
                    </div>
                    <ul class="total_price">
                        <li class="last_price"> <h4>TOTAL</h4></li>
                        <li class="last_price" id="total_price"><span></span></li>
                    </ul> 
                    <div class="clearfix"></div>
                    <a class="order" href="PlaceOrder">Place Order</a>
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
