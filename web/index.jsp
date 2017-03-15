<%-- 
    Document   : index.jsp
    Created on : Feb 28, 2017, 8:53:13 AM
    Author     : Mrawi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="beans.User"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sugar Store | Online Shopping </title>
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
        <script type="text/javascript">
jQuery(document).ready(function ($){
    $(".scroll").click(function (event) {
        event.preventDefault();
        $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
    });
    getProduct();
});

function getProduct() {

    var url = "ViewHomeProducts";
    $.get(url, displayProduct, 'json');

}
function displayProduct(responseTxt, statusTxt, xhr) {

    if (statusTxt == "success") {

        console.log(responseTxt.length + "size");
        for (i = 0; i < responseTxt.length; i++)
        {
//                            var ProPrice = responseTxt[i].price;
//                            ProPrice = ProPrice.replace(/\s/g, "");

            var item = responseTxt[Math.floor(Math.random() * responseTxt.length)];
            var catName = item.category.name;
            //alert(catName);
            var data = item.images;
            // var arr = data.split("&&");
            var arr = data.split("&&");
            var img = arr[0];

            
            for (var i = 1; i < arr.length; i++) {
                if (img == "") {
                    img = arr[i];
                } 
            }


            $("#randomProduct").append(" <div class='col-md-2 product-left'>" +
                    "<div class='p-one simpleCart_shelfItem jwe sizeW'> " +
                    "<a href='productDescription.jsp?productID=" + item.productID + "'>" +
                    "<img src=\"" + "images/" + catName + "/" + img + ".png" + "\"alt='Error' onerror='setDefault(this)' class='img-responsive' />" +
                    "<div class='mask'>" +
                    "<span>Quick View</span>" +
                    "</div>" +
                    "</a>" +
                    "<div class='product-left-cart'>" +
                    "<div class='product-left-cart-l'>" +
                    "<p><p class='item_add'><i></i> <span class='item_price valsa'> EGP  " + item.price + "</span></p></p>" +
                    "</div><div class='clearfix'></div></div> </div>" +
                    "</div>");
            // alert(item.name);
             responseTxt.splice(responseTxt.indexOf(item),1);
        }

    }
}

function setDefault(item) {
    item.src = 'images/noImage.png';
    item.className = "img-responsive";
}

        </script>
        <!-- start-smoth-scrolling -->
        <!-- start menu -->
        <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/megamenu.js"></script>
        <script>$(document).ready(function () {
    $(".megamenu").megamenu();
});</script>
        <link href='http://fonts.googleapis.com/css?family=Monda:400,700' rel='stylesheet' type='text/css'>

    </head>
    <body>

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
        <!-- banner -->
        <div class="banner">
            <div class="container">
                <!-- Slider-starts-Here -->
                <script src="js/responsiveslides.min.js"></script>
                <script>
// You can also use "$(window).load(function() {"
$(function () {
    // Slideshow 4
    $("#slider3").responsiveSlides({
        auto: true,
        pager: false,
        nav: true,
        speed: 500,
        namespace: "callbacks",
        before: function () {
            $('.events').append("<li>before event fired.</li>");
        },
        after: function () {
            $('.events').append("<li>after event fired.</li>");
        }
    });
});
                </script>
                <!--//End-slider-script -->
                <div  id="top" class="callbacks_container">
<ul class="rslides" id="slider3">
                        <li>
                            <div class="banner-info">
                                <div class="banner-info1">
                                    <div class="banner-inf">
                                        <h1>Your items are fully insured & deliver to your doorstep</h1>
                                        <p>Whatever you order , your items are fully insured and custom-cleared.
                                        We grantee that you get your items wrapped and repackaged , on case of breakness or loss 
                                        ,you will receive a FULL REFUND.
                                        We ship everywhere in Egypt.</p>
                                        
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="banner-info">
                                <div class="banner-info1">
                                    <div class="banner-inf">
                                        <h1>Good Quality Items </h1>
                                        <h1>Local Prices</h1>
                                        <h1>Delivered to your doorstep</h1>
                                        <p>Shopping is no more a hassle</p>
                                        
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="banner-info">
                                 <div class="banner-info1">
                                    <div class="banner-inf">
                                        <h1>We sell and Deliver anything you want </h1>
                                        <p>Borderless Shopping ,you don't need to travel anywhere.<br>
                                        Easy Payments , just add credit required and pay in your local Currency.</p>
                                        
                                        
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- //banner -->
     
        <!-- cate-bottom -->
        <!-- //cate-bottom -->
        <!-- banner-bottom1 -->
        <div class="banner-bottom1">
        </div>
        <!-- //banner-bottom1 -->
        <!-- banner-bottom -->
        <div class="banner-bottom">
            <div class="container">
                <div class="product-one" id="randomProduct">


                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <%@ include file="footer.html" %>
    </body>
</html>
