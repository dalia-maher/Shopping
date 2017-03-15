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
        <title>Search Results | Sugar Store</title>
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


        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
            
             function setDefault(item){
            item.src='images/noImage.png';
            item.className="img-responsive";
        }
        </script>
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
        </script>
        <!-- //the jScrollPane script -->

    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div class="mega_nav">
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
        <!-- products -->
        <div class="products">
            <div class="container">
                <div class="products-grids">
                    <div class="col-md-12 products-grid-left">
                        <div id="result" class="products-grid-lft">
                            <c:if test="${!empty searchResults}">
                                <c:forEach items="${searchResults}" var="product">
                                    <c:set var="img" value="${fn:split(product.images,'&&')}"/>
                                    <c:set var="imgName" value="${img[0]}"/>
                                   <c:if test="${imgName eq null}">
                                        <c:set var="imgName" value="${img[1]}" />
                                    </c:if>
                                    <div class='products-grd'>
                                        <div class='p-one simpleCart_shelfItem prd' >
                                            <a href='productDescription.jsp?productID="${product.productID}"'>
                                                <img src="images/${product.getCategory().getName()}/${imgName}.png" alt='Error' class='img-responsive' onerror='setDefault(this)'/>
                                                <div class='mask'>
                                                    <span>Quick View</span>
                                                </div>
                                            </a>
                                            <h4>${product.name}</h4>
                                            <p><a class='item_add' href='#'><i></i> <span class=' item_price valsa'> ${product.price}</span></a></p>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty searchResults}">
                                <center>
                                    <h3><c:out value="no search data."/></h3>
                                </center>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //products -->
        <%@ include file="footer.html" %>
    </body>
</html>

