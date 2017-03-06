<%-- 
    Document   : productDescription
    Created on : Feb 28, 2017, 6:23:05 PM
    Author     : Dalia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Pendent Store a Ecommerce Online Shopping Category Flat Bootstarp Resposive Website Template | Single :: w3layouts</title>
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
        <script src="js/simpleCart.min.js"> </script>
        <link href='http://fonts.googleapis.com/css?family=Monda:400,700' rel='stylesheet' type='text/css'>
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
                                    <div class="col1">
                                        <div class="h_nav">
                                           
                                            <ul>
                                                <li><a href="products.jsp">Glasses</a></li>
                                                <li><a href="products.jsp">Women</a></li>
                                                <li><a href="products.jsp">Brands</a></li>
                                                <li><a href="products.jsp">Kids</a></li>
                                                <li><a href="products.jsp">Accessories</a></li>
                                                <li><a href="products.jsp">Style Videos</a></li>
                                            </ul>	
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
        <!-- single-page -->
        <div class="single">
            <div class="container">
                <div class="single-page">					 
                    <div class="col-md-5 zoom-grid flexslider details-lft-inf">
			<div class="flexslider">
                            <ul class="slides">
                                <li data-thumb="images/s1.jpg">
                                    <div class="thumb-image"> <img src="images/s1.jpg" data-imagezoom="true" class="img-responsive" alt="" /> </div>
                                </li>
                                <li data-thumb="images/s2.jpg">
                                    <div class="thumb-image"> <img src="images/s2.jpg" data-imagezoom="true" class="img-responsive" alt="" /> </div>
                                </li>
                                <li data-thumb="images/s3.jpg">
                                    <div class="thumb-image"> <img src="images/s3.jpg" data-imagezoom="true" class="img-responsive" alt="" /> </div>
                                </li> 
                            </ul>
			</div>
		</div> 
		<script src="js/imagezoom.js"></script>
                <!-- FlexSlider -->
                    <script defer src="js/jquery.flexslider.js"></script>
                    <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />

                    <script>
                        // Can also be used with $(document).ready()
                        $(window).load(function() {
                            $('.flexslider').flexslider({
                                animation: "slide",
                                controlNav: "thumbnails"
                            });
                        });
                    </script>
                    <div class="details-left-info">
                        <h3>autem quibusdam officiis debitis aut</h3>
                            <h4>Pellentesque pretium </h4>
                            <div class="simpleCart_shelfItem">
                            <p><span class="item_price qwe">$ 729</span> <a href="#">Click for offer</a></p>
                            <div class="col-rad">
                                <div class="col-rad-left">
                                    <select class="arrival">
                                        <option>Color</option>
                                        <option>Green</option>
                                        <option>Violet</option>
                                        <option>Pink</option>
                                    </select>
                                </div>
                                <div class="col-rad-right">
                                    <section>
                                        <div class="row">
                                            <div class="colr ert">
                                                <label class="radio"><input type="radio" name="radio" checked=""><i></i>14Kt</label>
                                            </div>
                                            <div class="colr">
                                                <label class="radio"><input type="radio" name="radio"><i></i>10Kt</label>
                                            </div>
                                        </div>						
                                    </section>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                            <div class="col-rad tyy">
                                <div class="col-rad-left">
                                    <p>Diamond</p>
                                </div>
                                <div class="col-rad-right">
                                    <section>
                                        <div class="row">
                                            <div class="colr ert">
                                                <label class="radio"><input type="radio" name="radio1" checked=""><i></i>SI GH</label>
                                            </div>
                                            <div class="colr">
                                                <label class="radio"><input type="radio" name="radio1"><i></i>VS GH</label>
                                            </div>
                                            <div class="colr">
                                                <label class="radio"><input type="radio" name="radio1"><i></i>VVS EF</label>
                                            </div>
                                        </div>						
                                    </section>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                            <p class="qty">Qty ::</p><input min="1" type="number" id="quantity" name="quantity" value="1" class="form-control input-small">
                            <div class="single-but item_add">
                                <input type="submit" value="add to cart">
                            </div>
                        </div>
                        <div class="flower-type">
                            <p>Model  ::<a href="#">Gem Stone</a></p>
                            <p>Carrets  ::<a href="#">22</a></p>
                        </div>
                        <p class="desc">Proin vestibulum scelerisque tempus. Phasellus at fermentum erat. Pellentesque mattis velit eget elit condimentum gravida. Donec vehicula mollis velit, a eleifend est hendrerit quis. Etiam pulvinar at ex eget cursus. Etiam luctus orci ut tortor rhoncus, sit amet faucibus lorem finibus. Nulla id ornare arcu. or lowest node and working upwards) are as follows:</p>
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
                            <div class="panel-body">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                            </div>
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
        <!-- for bootstrap working -->
                        <script src="js/bootstrap.js"> </script>
        <!-- //for bootstrap working -->
    </body>
</html>
