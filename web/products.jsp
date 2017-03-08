

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pendent Store a E-Commerce Online Shopping Category Flat Bootstrap Responsive Website Template | Products :: w3layouts</title>
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
        
         <script>
                                function getProduct() {
                                    var catId = $("#catId").text();
                                    var url = "displayProduct?numberOfPro=" + $("#result").children().length
                                    +"&categoryID=" + catId;
                                    $.get(url, displayProduct, 'json');

                                }
                                function displayProduct(responseTxt, statusTxt, xhr) {
                                    // var messages = responseTxt.
                                    serverPath = $("#serverPath").text();
                                    //serverPath = serverPath.replace(/\\/g, "\\\\");
                                    if (statusTxt == "success") {
                                    console.log(responseTxt.length + "size");
                                    for (i = 0; i < responseTxt.length;i++)
                                    {   var ProName=responseTxt[i].name;
                                        ProName=ProName.replace(/\s/g, "");
                                        var catName = responseTxt[i].category.name;
                                        catName = catName.replace(/\s/g, "");
                                        var data = responseTxt[i].images;
                                        var arr = data.split("&&");
                                        alert(arr[0]);
                                        $("#result").append("<div class='products-grd'>" +
                                            "<div class='p-one simpleCart_shelfItem prd' > "+
                                            "<a href='productDescription.jsp?productID="+responseTxt[i].productID+"&categoryID="+responseTxt[i].category.categoryID+"'>" +
                                            "<img src=\"" + "images/"+catName+"/"+arr[0]+".jpg" + "\"alt='Error' class='img-responsive' />" +
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
                            }

                            </script>

        <script type="text/javascript">
jQuery(document).ready(function ($) {
    $(".scroll").click(function (event) {
        event.preventDefault();
        $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
    });
    $("#serverPath").hide();
    $("#catId").hide();
    getProduct();
});
        </script>
        <!-- start-smoth-scrolling -->
        <!-- start menu -->
        <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/megamenu.js"></script>
        <script>$(document).ready(function () {
    $(".megamenu").megamenu();

});</script>
        
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
        <p id="serverPath"><%=getServletContext().getRealPath("")%></p>
        <p id="catId">${param.categoryID}</p>
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
        <!-- products -->
        <div class="products">
            <div class="container">
                <div class="products-grids">
                    <div class="col-md-12 products-grid-left">
                        <div id="result" class="products-grid-lft">
                           
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //products -->
            <%@ include file="footer.html" %>
    </body>
</html>
