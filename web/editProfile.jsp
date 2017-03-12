<%-- 
    Document   : editProfile
    Created on : Mar 4, 2017, 10:56:29 AM
    Author     : Mrawi
--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.User"%>
 <c:import url="/ShowCategories" />
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
        <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
         <link href='http://fonts.googleapis.com/css?family=Monda:400,700' rel='stylesheet' type='text/css'>
        <!-- js -->
        <script src="js/jquery-1.11.1.min.js"></script>
        <!-- //js -->
         <!-- the jScrollPane script -->
        <script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
        <script type="text/javascript" id="sourcecode">
            $(function () {
            $('.scroll-pane').jScrollPane();
            });
        </script>
        <!-- //the jScrollPane script -->

        <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".megamenu").megamenu();
            $(".scroll").click(function (event) {
            event.preventDefault();
            $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
    });
   
});
        </script>
      <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/megamenu.js"></script>
     
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
 
       
    </head>

    <body>
        <!-- header -->
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
                                <li><input type="date" name="bdate" value="${sessionScope.loggedInUser.getBOD()}"></li>
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
