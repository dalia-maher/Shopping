<%-- 
Document   : productDescription
Created on : Feb 28, 2017, 6:23:05 PM
Author     : Dalia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Product Description | Sugar Store</title>
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
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".megamenu").megamenu();
                $('.flexslider').flexslider({
                    animation: "slide",
                    controlNav: "thumbnails"
                });
                getProductDetails();
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
            function addToCart() {
                var quantity = document.getElementById("quantity").value;
                $.ajax({
                    url: "AddingToCart",
                    type: 'POST',
                    data: "prooductID=" + ${param.productID} + "&quantity=" + quantity,
                    success: function (data, textStatus, jqXHR) {
                        //alert(data);
                        if (data == 1) {
                            //alert("Done2");
                            //updateItems();
                            getShoppingList();
                        }
                    }
                });
            }
             function setDefault(item){
            item.src='images/noImage.png';
            item.className="img-responsive";
        }
        </script>

        <!-- start-smoth-scrolling -->
        <!-- start menu -->
        <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/megamenu.js"></script>

        <link href='http://fonts.googleapis.com/css?family=Monda:400,700' rel='stylesheet' type='text/css'>
        <script src="js/viewProduct.js"></script>
        <style>
            #slideshow1 {
                margin: 10px auto;
                position: relative;
                width: 332px;
                height: 300px;
                padding: 10px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
                float: left; 
                display: block;
            }
            #img1
            {
                width: 90%;
                height: 90%;
            }
            #slideshow1 > div {
                position: absolute;
                top: 10px;
                left: 10px;
                right: 10px;
                bottom: 10px;
            }
            #div2{
                width: 300px;
            }
        </style>
        <script>
            $("#slideshow1 > div:gt(0)").hide();
            setInterval(function () {
                $('#slideshow1 > div:first')
                    .fadeOut()
                    .next()
                    .fadeIn()
                    .end()
                    .appendTo('#slideshow1');
            }, 5000);
        </script>
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

                    <!---->

                    <script>
                $("#slideshow1 > div:gt(0)").hide();
                setInterval(function () {
                    $('#slideshow1 > div:first')
                        .fadeOut()
                        .next()
                        .fadeIn()
                        .end()
                        .appendTo('#slideshow1');
                }, 5000);
                    </script>

 <!--<form method="post" action="AddingToCart?prooductID=${param.productID}">-->
                    <div class="details-left-info">
                        <h3 id = "productName"></h3>
                        <h4 id = "categoryName"></h4>
                        <div class="simpleCart_shelfItem">
                            <p><span class="item_price qwe" id="price"></span></p>
                            <div class="clearfix"> </div>

                            <!--<div class="clearfix"> </div>-->

                            <p class="qty">Quantity :</p><input type="text" id="quantity" name="quantity" value="1" class="form-control input-small">
                            <input type="number" hidden id = "qq"/>
                            <button onclick="increase_by_one('quantity');" id="increase">+</button>
                            <button onclick="decrease_by_one('quantity');" id="decrease"/>-</button>
                            <div class="single-but item_add">

                            <input onclick="addToCart();"  type="submit" value="add to cart" id = "btn">
                            </div>
                        </div>
                        <!-- </form>-->
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
                            <div class="panel-body" id='productDescription'>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                      
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                            <div class="panel-body">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingFour">
                         
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
                <div class="related-products" id="relatedProducts">
                    <h3>Related Products</h3>
                   
                    <c:import url="/RelatedProducts" />
                    <c:if test="${fn:length(requestScope.peroductList) gt 0}">
                        <c:forEach  begin="1" end="3" items= "${requestScope.peroductList}" var="rProduct">
                            <c:set var="img" value="${fn:split(rProduct.images,'&&')}"/>
                            <c:set var="imgName" value="${img[0]}"/>
                                   <c:if test="${imgName eq null}">
                                        <c:set var="imgName" value="${img[1]}" />
                                    </c:if>
                              <div class="col-md-4 related products-grid">
                              <a href='productDescription.jsp?productID=${rProduct.getProductID()}'>
                                   <img src="images/${rProduct.getCategory().getName()}/${imgName}.png" alt=" " class="img-responsive" onerror='setDefault(this)' />
                                         <div class='mask'> 
                                            <span>View Details</span> 
                                        </div>
                                    </a>    
                           
                            <div class="simpleCart_shelfItem rel">
                                <p><span class="item_price val"> EGP <c:out value="${rProduct.getPrice()}"/></span></p>
                           
                            </div>
                        </div>
                         </c:forEach>
                    </c:if>


                    
                    <div class="clearfix"> </div>
                </div>
                <!-- //related products -->
            </div>
        </div>
        <!-- single -->
        <%@ include file="footer.html" %>
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />

        <!-- for bootstrap working -->
        <style>
            .panel-default>.panel-heading {
                color: #333;
                background-color: #ff6e6e;
                border-color: #ddd;
            }   
        </style>
        <!-- //for bootstrap working -->
    </body>
</html>