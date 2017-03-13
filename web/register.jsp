<%-- 
    Document   : register
    Created on : Feb 28, 2017, 6:27:50 PM
    Author     : Dalia
--%>

<%@page import="java.sql.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
         <script type="text/javascript" src="js/megamenu.js"></script>
        <!-- //js -->
        <!-- start-smoth-scrolling -->
        <script type="text/javascript">
            jQuery(document).ready(function($) {
                $(".megamenu").megamenu();
                $(".scroll").click(function(event){		
                    event.preventDefault();
                    $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
                });
            });
        </script>
        <!-- start-smoth-scrolling -->
        <!-- start menu -->
        <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
        <link rel="stylesheet" href="css/jquery-ui.css" type="text/css">
        <script src="js/jquery-1.12.4.js"></script>
        <script src="js/jquery-ui.js"></script>
        <link href='http://fonts.googleapis.com/css?family=Monda:400,700' rel='stylesheet' type='text/css'>
        <c:import url="/ShowCategories" />
        <script>
            validEmail = false;
            validUName = false;
            validCredit = false;
            validPassword = false;
            function validateForm(id) {
                value = $("#" + id).val();
                if(id == "email") {
                    $.post("ValidateEmail", {email: value},
                        function(response) {
                            if(response == "true") {
                                $("#emailValidation").html("");
                                validEmail = true;
                            }
                            else if(response == "invalid") {
                                $("#emailValidation").html("Invalid Email format!");
                                validEmail = false;
                            }
                            else {
                                $("#emailValidation").html("Email already exists!");
                                validEmail = false;
                            }
                        });
                }
                else if(id == "uname") {
                    $.post("ValidateUsername", {username: value},
                        function(response) {
                            if(response == "true") {
                                $("#unameValidation").html("");
                                validUName = true;
                            }
                            else {
                                $("#unameValidation").html("Username already exists!");
                                validUName = false;
                            }
                        });
                }
                else if(id == "credit") {
                    $.post("CheckCredit", {credit: value},
                        function(response) {
                            if(response == "true") {
                                $("#creditValidation").html("");
                                validCredit = true;
                            }
                            else {
                                $("#creditValidation").html("Invalid Card ID!");
                                validCredit = false;
                            }
                        });
                }
                else if(id == "password") {
                    password = $("#password").val();
                    repeat = $("#repeat").val();
                    if(password == repeat) {
                        $("#match").html("");
                        validPassword = true;
                    }
                    else {
                        $("#match").html("passwords don't match");
                        validPassword = false;
                    }
                }
                if(validEmail && validUName && validCredit && validPassword)
                    return true;
                return false;
            }
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
                    <div class="search">
                        <form action ="SearchProducts" method ="get">
                            <div class="search">
                                <input type="text" value="" placeholder="Search..." name = "keyword">
                                <input type="submit" value="">
                            </div><br/>
                            <a href="searchPage.jsp" >Advanced Search</a>
                        </form>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!---->
        <!-- reg-form -->
        <div class="reg-form">
            <div class="container">
                <div class="reg">
                    <h3>Register Now</h3>
                    <label style="color: red;" id="validationMsg"></label>
                    <p id='info'>Welcome, please enter the following details to continue.</p>
                    <p id='info2'>If you have previously registered with us, you can just login.</p>

                   
                    <form action="Register" method="post" onsubmit="return validateForm();">

                        <ul>
                            <li class="text-info">First Name: *</li>
                            <li><input type="text" name="fname" value="" required></li>
                        </ul>
                        <ul>
                            <li class="text-info">Last Name: *</li>
                            <li><input type="text" name="lname" value="" required></li>
                        </ul>				 
                        <ul>
                            <li class="text-info">User Name: *</li>
                            <li><input type="text" name="uname" id="uname" value="" onchange="validateForm('uname')" required></li>
                            <li>
                                <label style="color: red; margin-left: 235px;;" id="unameValidation"></label>
                            </li>
                        </ul>				 
                        <ul>
                            <li class="text-info">Email: *</li>
                            <li><input type="text" name="email" id="email" value="" onchange="validateForm('email')" required></li>
                            <li>
                                <label style="color: red; margin-left: 235px;" id="emailValidation"></label>
                            </li>
                        </ul>
                        <ul>
                            <li class="text-info">Password: *</li>
                            <li><input type="password" id="password" name="password" value="" required></li>
                        </ul>
                        <ul>
                            <li class="text-info">Re-enter Password: *</li>
                            <li><input type="password" id="repeat" name="repeat" value="" onchange="validateForm('password')" required>
                            </li>
                            <li>
                                <label style="color: red; margin-left: 235px;" id="match"></label>
                            </li>
                        </ul>
                        <ul>
                            <li class="text-info">Job: *</li>
                            <li><input type="text" name="job" value="" required></li>
                        </ul>
                        <ul>
                            <li class="text-info">Address: *</li>
                            <li><input type="text" name="address" value="" required></li>
                        </ul>
                        <ul>
                            <li class="text-info">Birth Date: *</li>
                            <li><input type="date" name="bdate" required></li>
                        </ul>
                        <ul>
                            <li class="text-info">Credit Card ID:</li>
                            <li><input type="text" name="credit" id="credit" onblur="validateForm('credit')"></li>
                            <li>
                                <label id="creditValidation" style="color:red; margin-left: 235px;"></label>
                            </li>
                        </ul>
                        <c:set var="myCategories" value="${requestScope.categoriesList}" />
                        <ul>
                            <li class="text-info">Interests:</li>
                            <li><ul>
                                <c:set var="myCategories" value="${applicationScope.categoriesList}" />
                                <c:forEach var="category" items= "${myCategories}">
                                    <li><input type="checkbox" name="interest" value="<c:out value="${category.getCategoryID()}"/> "> <c:out value="${category.getName()}"/></li>
                                </c:forEach>
                            </ul></li>
                        </ul>
                        <script> $("#datepicker").datepicker({
                            onSelect: function() { 
                                var dateObject = $(this).datepicker('getDate'); 
                                console.log("date picker = " + dateObject);
                            }
                        });</script>
                       
                        <br/>
                        <input type="submit" value="Register Now"><br/>
                        <% 
                            if(request.getParameter("success") != null) {
                        %>
                                <script>
                                    document.getElementById("info").innerHTML = "";
                                    document.getElementById("info2").innerHTML = "";
                                    document.getElementById("validationMsg").innerHTML = "You're successfully registered! click <a href='login.jsp'>here</a> to login";
                                </script>
                        <%
                            } else if(request.getParameter("failed") != null) {
                        %>
                                <script>
                                    document.getElementById("validationMsg").innerHTML = "Registration Failed";
                                </script>
                        <%
                            }
                        %>
                    </form>
                </div>
            </div>
        </div>
        <!-- footer -->
        <%@ include file="footer.html" %>
    </body>
</html>
