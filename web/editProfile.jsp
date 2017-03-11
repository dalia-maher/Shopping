<%-- 
    Document   : editProfile
    Created on : Mar 4, 2017, 10:56:29 AM
    Author     : Mrawi
--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.User"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Pendent Store a Ecommerce Online Shopping Category Flat Bootstarp Resposive Website Template | Register :: w3layouts</title>
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
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
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


        <script src="js/menu_jquery.js"></script>
        <script src="js/simpleCart.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link href='http://fonts.googleapis.com/css?family=Monda:400,700' rel='stylesheet' type='text/css'>
        <c:import url="/ShowCategories" />
    </head>

    <body>
        <script>
            $(function () {
                $("#datepicker").datepicker();
            });
        </script>

        <script>

            function validatePassword() {
                var password = $("#pass").val();
                var confirmPassword = $("#confirm").val();
                if (password == confirmPassword) {
                    document.getElementById("validation").innerHTML = "";
                    return true;
                } else {
                    document.getElementById("validation").innerHTML = "passwords don't match";
                    return false;
                }

            }

        </script>

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
        <!-- edit-form -->

        <c:import url="/ShowCategories"/>
        <div class="reg-form">
            <div class="container">
                <div class="reg">
                    <c:if test="${sessionScope.loggedInUser != null}">


                        <h3>${sessionScope.loggedInUser.userName}</h3>

                        <form action="SaveEditProfile" method="post" onsubmit="return validatePassword()">
                            <ul>
                                <li class="text-info">First Name: </li>
                                <li><input type="text" name="fname" value="${sessionScope.loggedInUser.getFirstName()}" required></li>
                            </ul>
                            <ul>
                                <li class="text-info">Last Name: </li>
                                <li><input type="text" name="lname" value="${sessionScope.loggedInUser.getLastName()}" required></li>
                            </ul>				 
                            <!--<ul>
                                <li class="text-info">Email: </li>
                                <li><input type="text" name="email" value="${sessionScope.loggedInUser.getEmail()}"></li>
                            </ul> -->
                            <ul>
                                <li class="text-info">Password: </li>
                                <li><input type="text" name="password" id="pass" value="${sessionScope.loggedInUser.getPassword()}" required></li>
                            </ul>
                            <ul>
                                <li class="text-info">Re-enter Password:</li>
                                <li><input type="text" name="repeat"  id="confirm" value="${sessionScope.loggedInUser.getPassword()}" required onchange="validatePassword()"/> </li><label id="validation"></label>
                            </ul>
                            <ul>
                                <li class="text-info">Job:</li>
                                <li><input type="text" name="job" value="${sessionScope.loggedInUser.getJob()}"></li>
                            </ul>
                            <ul>
                                <li class="text-info">Address:</li>
                                <li><input type="text" name="address" value="${sessionScope.loggedInUser.getAddresse()}"></li>
                            </ul>
                            <ul>
                                <li class="text-info">BirthDay Date:</li>
                                <li><input type="text" name="bdate" id="datepicker" value="${sessionScope.loggedInUser.getBOD()}"></li>
                            </ul>

                            <c:import url="/ViewProfile" />
                            <ul>
                                <li class="text-info">Interests:</li>
                                <li>
                                    <br/>
                                    <ul>
                                        <c:set var="numberOfMathched" value="0"/>
                                        <c:forEach items= "${applicationScope.categoriesList}" var="category">

                                            <li><input id="${category.categoryID}" type="checkbox"  name ="userInterest"  value="<c:out value="${category.getCategoryID()}"/> ">
                                            <c:out value="${category.getName()}"/></li>

                                        </c:forEach> 
                                        <script>
                                            <c:forEach items= "${requestScope.userInterest}" var="interest">
                                            document.getElementById(${interest.categoryID}).checked = true;

                                            </c:forEach>
                                        </script>
                                    </ul>
                                </li>
                            </ul>
                            <script> $("#datepicker").datepicker({
                                    onSelect: function () {
                                        var dateObject = $(this).datepicker('getDate');
                                        console.log(dateObject);
                                    }
                                });</script>

                            <input type="submit" value="Save">
                        </form>

                    </c:if>
                </div>
            </div>
        </div>
        <!-- footer -->
        <%@ include file="footer.html" %>
    </body>
</html>
