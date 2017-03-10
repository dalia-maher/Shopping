<%-- 
    Document   : productDescription
    Created on : Feb 28, 2017, 6:23:05 PM
    Author     : Dalia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
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
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });



        </script>
        <!-- start-smoth-scrolling -->
        <!-- start menu -->
        <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/megamenu.js"></script>
        <script>$(document).ready(function () {
                $(".megamenu").megamenu();
            });</script>
        <!--<script src="js/menu_jquery.js"></script>-->
        <script src="js/simpleCart.min.js"></script>
        <script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
        <link href='http://fonts.googleapis.com/css?family=Monda:400,700' rel='stylesheet' type='text/css'>
        <script src="js/viewProduct.js"></script>
    </head>

    <body>
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
        <!-- single-page -->
        <div class="single">
            <div class="container">
                <div class="single-page" >
                    <input type="text" id="productID" hidden value = "${param.productID}" />
                    <div id="div2" class="col-md-5 zoom-grid flexslider details-lft-inf">
<!--                        <div class="flexslider" id = "imgs">
                            <ul class="slides">
                                <li data-thumb="images/s1.jpg" id="li1">
                                    <div class="thumb-image"> <img id="img1" src="images/s1.jpg" data-imagezoom="true" class="img-responsive" alt="" /> </div>
                                </li>
                                <li data-thumb="images/s2.jpg">
                                    <div class="thumb-image"> <img src="images/s2.jpg" data-imagezoom="true" class="img-responsive" alt="" /> </div>
                                </li>
                                <li data-thumb="images/s3.jpg">
                                    <div class="thumb-image"> <img src="images/s3.jpg" data-imagezoom="true" class="img-responsive" alt="" /> </div>
                                </li> 
                            </ul>
                        </div>-->
                    </div> 
                    <script src="js/imagezoom.js"></script>
                    <!-- FlexSlider -->
                    <script defer src="js/jquery.flexslider.js"></script>

                    <script>
            // Can also be used with $(document).ready()
            $(window).load(function () {

                $('.flexslider').flexslider({
                    animation: "slide",
                    controlNav: "thumbnails"
                });
                getProductDetails();

            });
                    </script>
                    <div class="details-left-info">
                        <h3 id = "productName"></h3>
                        <h4 id = "categoryName"></h4>
                        <div class="simpleCart_shelfItem">
                            <p><h2><span class="item_price qwe" id = "price"></span></h2></p>
                            <p class="qty">Quantity :</p><input min="1" type="number" id="quantity" name="quantity" value="1" class="form-control input-small">
                            <div class="single-but item_add">
                                <input type="submit" value="add to cart">
                            </div>
                        </div>

                        <p class="desc"></p>
                    </div>
                    <div class="clearfix"></div>				 	
                </div>

                <!-- collapse -->
                <div class="panel-group collpse" id="accordion" role="tablist">
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingOne">
                            <h4 class="panel-title">
                                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-controls="collapseOne">
                                    Description
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                            <div class="panel-body" id = "productDescription"></div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingTwo">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-controls="collapseTwo">
                                    additional information
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                            <div class="panel-body">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingThree">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-controls="collapseThree">
                                    reviwes(5)
                                </a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingFour">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-controls="collapseFour">
                                    help
                                </a>
                            </h4>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                            <div class="panel-body">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                            </div>
                        </div>
                    </div>
                </div>
                <!-- collapse -->
                <!-- related products -->
                <div class="related-products">
                    <h3>Related Products</h3>
                    <div class="col-md-4 related products-grid">
                        <img src="images/19.jpg" alt=" " class="img-responsive" />
                        <div class="simpleCart_shelfItem rel">
                            <p><span class="overline">$ 1000</span> <span class="item_price val">$ 729</span></p>
                            <div class="single-but item_add">
                                <input type="submit" value="add to cart">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 related products-grid">
                        <img src="images/18.jpg" alt=" " class="img-responsive" />
                        <div class="simpleCart_shelfItem rel">
                            <p><span class="overline">$ 1000</span> <span class="item_price val">$ 729</span></p>
                            <div class="single-but item_add">
                                <input type="submit" value="add to cart">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 related products-grid">
                        <img src="images/20.jpg" alt=" " class="img-responsive" />
                        <div class="simpleCart_shelfItem rel">
                            <p><span class="overline">$ 1000</span> <span class="item_price val">$ 729</span></p>
                            <div class="single-but item_add">
                                <input type="submit" value="add to cart">
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <!-- //related products -->
            </div>
        </div>
        <!-- single -->
        <%@ include file="footer.html" %>
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />

        <!-- for bootstrap working -->
        <!-- //for bootstrap working -->
    </body>
</html>
