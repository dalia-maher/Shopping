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
        <title>Pendent Store an E-commerce Online Shopping Website </title>
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
            jQuery(document).ready(function($) {
                $(".scroll").click(function(event){		
                    event.preventDefault();
                    $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
                });
            });
        </script>
        <!-- start-smoth-scrolling -->
        <!-- start menu -->
        <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/megamenu.js"></script>
        <script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
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
                                        <h1>maiores alias consequatur aut perferendis</h1>
                                        <p>Itaque earum rerum hic tenetur a sapiente delectus, 
                                            ut aut reiciendis voluptatibus maiores alias consequatur 
                                            aut perferendis doloribus asperiores repellat.</p>
                                        <div class="buy">
                                            <a href="productDescription.jsp">Explore</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="banner-info">
                                <div class="banner-info1">
                                    <div class="banner-inf">
                                        <h1>asperiores alias consequatur aut perferendis</h1>
                                        <p>Alias earum rerum hic tenetur a sapiente delectus, 
                                            ut aut reiciendis voluptatibus maiores alias consequatur 
                                            aut perferendis doloribus asperiores repellat.</p>
                                        <div class="buy">
                                            <a href="productDescription.jsp">Explore</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="banner-info">
                                 <div class="banner-info1">
                                    <div class="banner-inf">
                                        <h1>doloribus alias consequatur aut perferendis</h1>
                                        <p>Repellat earum rerum hic tenetur a sapiente delectus, 
                                            ut aut reiciendis voluptatibus maiores alias consequatur 
                                            aut perferendis doloribus asperiores repellat.</p>
                                        <div class="buy">
                                            <a href="productDescription.jsp">Explore</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
	</div>
<!-- //banner -->
<!-- cate -->
	<div class="cate">
            <div class="container">
                <div class="cate-left">
                    <h3>Necklaces<span>Our Catelog</span></h3>
                </div>
                <div class="cate-right">
                <!-- slider -->
                    <ul id="flexiselDemo1">			
                        <li>
                            <div class="sliderfig-grid">
                                <img src="images/a.jpg" alt=" " class="img-responsive" />
                            </div>
                        </li>
                        <li>
                            <div class="sliderfig-grid">
                                <img src="images/b.jpg" alt=" " class="img-responsive" />
                            </div>
                        </li>
                        <li>
                            <div class="sliderfig-grid">
                                <img src="images/c.jpg" alt=" " class="img-responsive" />
                            </div>
                        </li>
                        <li>
                            <div class="sliderfig-grid">
                                <img src="images/d.jpg" alt=" " class="img-responsive" />
                            </div>
                        </li>
                    </ul>
                    <script type="text/javascript">
                        $(window).load(function() {
                            $("#flexiselDemo1").flexisel({
                                visibleItems: 4,
                                animationSpeed: 1000,
                                autoPlay: true,
                                autoPlaySpeed: 3000,    		
                                pauseOnHover: true,
                                enableResponsiveBreakpoints: true,
                                responsiveBreakpoints: { 
                                    portrait: { 
                                        changePoint:480,
                                        visibleItems: 3
                                    }, 
                                    landscape: { 
                                        changePoint:640,
                                        visibleItems:4
                                    },
                                    tablet: { 
                                        changePoint:768,
                                        visibleItems: 3
                                    }
                                }
                            });
                        });
                    </script>
                    <script type="text/javascript" src="js/jquery.flexisel.js"></script>
                </div>
<!-- //slider -->
                <div class="clearfix"> </div>
            </div>
        </div>
<!-- //cate -->
<!-- cate-bottom -->
<!-- //cate-bottom -->
<!-- welcome -->
	<div class="welcome">
            <div class="container">
                <div class="welcome-info">
                    <h3>Welcome To Our Store!</h3>
                    <p class="non">Repellat molestiae non recusandae<span>Asperiores repellat</span></p>
                    <p class="rep">Perferendis doloribus asperiores repellat</p>
                    <div class="buy wel">
                        <br/><br/>
                    </div>
                </div>
            </div>
	</div>
<!-- //welcome -->
<!-- banner-bottom1 -->
	<div class="banner-bottom1">
	</div>
<!-- //banner-bottom1 -->
<!-- banner-bottom -->
	<div class="banner-bottom">
            <div class="container">
                <div class="product-one">
                    <div class="col-md-2 product-left"> 
                        <div class="p-one simpleCart_shelfItem jwe">
                            <a href="productDescription.jsp">
                                <img src="images/1-.jpg" alt="" class="img-responsive" />
                                <div class="mask">
                                    <span>Quick View</span>
                                </div>
                            </a>
                            <div class="product-left-cart">
                                <div class="product-left-cart-l">
                                    <p><a class="item_add" href="#"><i></i> <span class=" item_price">$729</span></a></p>
                                </div>
                                <div class="product-left-cart-r">
                                    <a href="#"> </a>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 product-left"> 
                        <div class="p-one simpleCart_shelfItem jwe">
                            <a href="productDescription.jsp">
                                <img src="images/3-.jpg" alt="" class="img-responsive" />
                                <div class="mask">
                                    <span>Quick View</span>
                                </div>
                            </a>
                            <div class="product-left-cart">
                                <div class="product-left-cart-l">
                                    <p><a class="item_add" href="#"><i></i> <span class=" item_price">$729</span></a></p>
                                </div>
                                <div class="product-left-cart-r">
                                    <a href="#"> </a>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 product-left"> 
                        <div class="p-one simpleCart_shelfItem jwe">
                            <a href="productDescription.jsp">
                                <img src="images/2-.jpg" alt="" class="img-responsive" />
                                <div class="mask">
                                    <span>Quick View</span>
                                </div>
                            </a>
                            <div class="product-left-cart">
                                <div class="product-left-cart-l">
                                    <p><a class="item_add" href="#"><i></i> <span class=" item_price">$729</span></a></p>
                                </div>
                                <div class="product-left-cart-r">
                                    <a href="#"> </a>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 product-left"> 
                        <div class="p-one simpleCart_shelfItem jwe">
                            <a href="productDescription.jsp">
                                <img src="images/4-.jpg" alt="" class="img-responsive" />
                                <div class="mask">
                                    <span>Quick View</span>
                                </div>
                            </a>
                            <div class="product-left-cart">
                                <div class="product-left-cart-l">
                                    <p><a class="item_add" href="#"><i></i> <span class=" item_price">$729</span></a></p>
                                </div>
                                <div class="product-left-cart-r">
                                    <a href="#"> </a>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 product-left"> 
                        <div class="p-one simpleCart_shelfItem jwe">
                            <a href="productDescription.jsp">
                                <img src="images/5-.jpg" alt="" class="img-responsive" />
                                <div class="mask">
                                    <span>Quick View</span>
                                </div>
                            </a>
                            <div class="product-left-cart">
                                <div class="product-left-cart-l">
                                    <p><a class="item_add" href="#"><i></i> <span class=" item_price">$729</span></a></p>
                                </div>
                                <div class="product-left-cart-r">
                                    <a href="#"> </a>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 product-left"> 
                        <div class="p-one simpleCart_shelfItem jwe">
                            <a href="productDescription.jsp">
                                <img src="images/6-.jpg" alt="" class="img-responsive" />
                                <div class="mask">
                                    <span>Quick View</span>
                                </div>
                            </a>
                            <div class="product-left-cart">
                                <div class="product-left-cart-l">
                                    <p><a class="item_add" href="#"><i></i> <span class=" item_price">$729</span></a></p>
                                </div>
                                <div class="product-left-cart-r">
                                    <a href="#"> </a>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="product-one">
                    <div class="col-md-2 product-left"> 
                        <div class="p-one simpleCart_shelfItem jwe">							
                            <a href="productDescription.jsp">
                                <img src="images/7-.jpg" alt="" class="img-responsive" />
                                <div class="mask">
                                    <span>Quick View</span>
                            </div>
                            </a>
                            <div class="product-left-cart">
                                <div class="product-left-cart-l">
                                    <p><a class="item_add" href="#"><i></i> <span class=" item_price">$729</span></a></p>
                                </div>
                                <div class="product-left-cart-r">
                                    <a href="#"> </a>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 product-left"> 
                        <div class="p-one simpleCart_shelfItem jwe">
                            <a href="productDescription.jsp">
                                <img src="images/13-.jpg" alt="" class="img-responsive" />
                                <div class="mask">
                                    <span>Quick View</span>
                                </div>
                            </a>
                            <div class="product-left-cart">
                                <div class="product-left-cart-l">
                                    <p><a class="item_add" href="#"><i></i> <span class=" item_price">$729</span></a></p>
                                </div>
                                <div class="product-left-cart-r">
                                    <a href="#"> </a>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 product-left"> 
                        <div class="p-one simpleCart_shelfItem jwe">
                            <a href="productDescription.jsp">
                                <img src="images/9-.jpg" alt="" class="img-responsive" />
                                <div class="mask">
                                    <span>Quick View</span>
                                </div>
                            </a>
                            <div class="product-left-cart">
                                <div class="product-left-cart-l">
                                    <p><a class="item_add" href="#"><i></i> <span class=" item_price">$729</span></a></p>
                                </div>
                                <div class="product-left-cart-r">
                                    <a href="#"> </a>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 product-left"> 
                        <div class="p-one simpleCart_shelfItem jwe">
                            <a href="productDescription.jsp">
                                <img src="images/10-.jpg" alt="" class="img-responsive" />
                                <div class="mask">
                                    <span>Quick View</span>
                                </div>
                            </a>
                            <div class="product-left-cart">
                                <div class="product-left-cart-l">
                                    <p><a class="item_add" href="#"><i></i> <span class=" item_price">$729</span></a></p>
                                </div>
                                <div class="product-left-cart-r">
                                    <a href="#"> </a>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 product-left"> 
                        <div class="p-one simpleCart_shelfItem jwe">							
                            <a href="productDescription.jsp">
                                <img src="images/11-.jpg" alt="" class="img-responsive" />
                                <div class="mask">
                                    <span>Quick View</span>
                                </div>
                            </a>
                            <div class="product-left-cart">
                                <div class="product-left-cart-l">
                                    <p><a class="item_add" href="#"><i></i> <span class=" item_price">$729</span></a></p>
                                </div>
                                <div class="product-left-cart-r">
                                    <a href="#"> </a>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 product-left"> 
                        <div class="p-one simpleCart_shelfItem jwe">
                            <a href="productDescription.jsp">
                                <img src="images/12-.jpg" alt="" class="img-responsive" />
                                <div class="mask">
                                    <span>Quick View</span>
                                </div>
                            </a>
                            <div class="product-left-cart">
                                <div class="product-left-cart-l">
                                    <p><a class="item_add" href="#"><i></i> <span class=" item_price">$729</span></a></p>
                                </div>
                                <div class="product-left-cart-r">
                                    <a href="#"> </a>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
	</div>
<%@ include file="footer.html" %>
    </body>
</html>
