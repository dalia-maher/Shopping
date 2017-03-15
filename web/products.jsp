

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products | Sugar Store</title>
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
                if(responseTxt.length <= 0){
                   $("#result").append ("<span><h2>No available products in this category</h2></span>");
                }
                for (i = 0; i < responseTxt.length;i++)
                {   var ProName=responseTxt[i].name;
                    ProName=ProName.replace(/\s/g, "");
                    var catName = responseTxt[i].category.name;
                    var data = responseTxt[i].images;
                   // var arr = data.split("&&");
                    var img=data.split("&&")[0];
                    if(img==""){
                      img=data.split("&&")[1]; 
                    }
                     //alert(img);
                                         
                    $("#result").append("<div class='products-grd'>" +
                        "<div class='p-one simpleCart_shelfItem prd sizeW'> "+
                        "<a href='productDescription.jsp?productID="+responseTxt[i].productID+"'>" +
                        "<img  src=\"" + "images/"+catName+"/"+img+".png" + "\"alt='Error' class='img-responsive' onerror='setDefault(this)'  />" +
                        "<div class='mask'>" +
                        "<span>View Details</span>" +
                        "</div>" +
                        "</a>" +
                        "<h4>" + responseTxt[i].name + "</h4>" +
                        "<p><a class='item_add' href='#'><i></i> <span class=' item_price valsa'> EGP " + responseTxt[i].price + "</span></a></p>" +

                        "</div>" +
                        "</div>");
                    }
                }
            }
        function setDefault(item){
            item.src='images/noImage.png';
            item.className="img-responsive";
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


                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //products -->
        <%@ include file="footer.html" %>
    </body>
</html>
