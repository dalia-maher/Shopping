<%-- 
    Document   : login
    Created on : Feb 28, 2017, 6:28:19 PM
    Author     : Dalia
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login | Sugar Store</title>
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
        <script>
        function validateCookies() {
            if(navigator.cookieEnabled) {
                return true;
            } else {
                document.getElementById("loginValidation").innerHTML = "You must enable cookies in your browser to log in.";
                return false;
            }
        }
        </script>
    </head>
	
    <body>
        <!-- header -->
    <%@ include file="header.jsp" %>
        <!-- //header -->
           
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
        <!-- login-page -->
        <div class="login">
            <div class="container">
                <div class="login-grids">
                    <div class="col-md-6 log">
                        <h3>Login</h3>
                        <div class="strip"></div>
                        <p>Welcome, please enter the following to continue.</p>
                        <p>If you have previously registered with us, you can just log in.</p>
                        <form method="post" action="Login" onsubmit="return validateCookies();">
                            <h5>Email:</h5>	
                            <input name="email" type="text" value="" required>
                            <h5>Password:</h5>
                            <input name="password" type="password" value="" required>
                            <label style="color:red;" id="loginValidation"></label><br/><br/>
                            <input type="submit" value="Login">
                        </form>
                        <script>
                            var msg = '<c:out value="${param.attempt}"/>';
                            if(msg == "1") {
                                document.getElementById("loginValidation").innerHTML = "Invalid user credentials!";
                            } else {
                                document.getElementById("loginValidation").innerHTML = "";
                            }
                        </script>
                    </div>
                    <div class="col-md-6 login-right">
                        <h3>New Registration</h3>
                        <div class="strip"></div>
                        <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple items in your shopping cart, view your orders in your account and more.</p>
                        <a href="register.jsp" class="button">Create An Account</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!-- //login-page -->
        <!-- footer -->
        <%@ include file="footer.html" %>
    </body>
</html>
