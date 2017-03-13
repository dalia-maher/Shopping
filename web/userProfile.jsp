<%-- 
    Document   : viewProfile
    Created on : Mar 3, 2017, 7:31:48 PM
    Author     : Mrawi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="beans.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
         <link href='http://fonts.googleapis.com/css?family=Monda:400,700' rel='stylesheet' type='text/css'>
        <!-- js -->
        <script src="js/jquery-1.11.1.min.js"></script>
        <!-- //js -->
        <!-- start-smoth-scrolling -->
        <script type="text/javascript">
                 function getLastCredit(){
                    $.ajax({
                        url:"GetLastCredit",
                        type: "GET",
                        success: function (data, textStatus, jqXHR) {
                            if(data != -1){
                                //alert(data);
                                $("#lastCredit").html("EGP "+data);
                            }
                        }
                    });
                }       
               jQuery(document).ready(function ($) {
                $(".megamenu").megamenu();
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
                getLastCredit();
            });
            
        </script>
        <!-- start-smoth-scrolling -->
        <!-- start menu -->
        <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/megamenu.js"></script>

        <script src="js/jquery-1.12.4.js"></script>
        <script src="js/jquery-ui.js"></script>
       
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
        <!-- profie-form -->
        
        <div class="reg-form">
            <div class="container">
                <div class="reg">
                    <c:if test="${sessionScope.loggedInUser != null}">
                        
                        <h3>${sessionScope.loggedInUser.getUserName()}</h3>

                    <form>
                        <ul>
                            <li class="text-info">First Name: </li>
                         
                            <li><p> ${sessionScope.loggedInUser.getFirstName()}</p></li>
                        </ul>
                        <hr>
                        <ul>
                            <li class="text-info">Last Name: </li>
                             
                            <li><p>${sessionScope.loggedInUser.getLastName()}</p></li>
                        </ul>
                        <hr>
                        <ul>
                            <li class="text-info">Email: </li>
                            
                            <li><p>${sessionScope.loggedInUser.getEmail()}</p></li>
                        </ul>
                        <hr>
                        <ul>
                            <li class="text-info">Password: </li>
                            
                            <li><p>${sessionScope.loggedInUser.getPassword()}</p></li>
                        </ul>
                        <hr>
                        <ul>
                            <li class="text-info">Job:</li>
                            
                            <li><p>${sessionScope.loggedInUser.getJob()}</p></li>
                        </ul>
                        <hr>
                        <ul>
                            <li class="text-info">Address:</li>
                            
                            <li><p>${sessionScope.loggedInUser.getAddresse()}</p></li>

                        </ul>
                        <hr>
                        <ul>
                            <li class="text-info">BirthDay Date:</li>
                            
                            <li><p>${sessionScope.loggedInUser.getBOD()}</p></li>
                        </ul>
                        <hr>
                        <ul>
                            <li class="text-info">Credit:</li>
                            
                            <li><p id="lastCredit">EGP ${sessionScope.loggedInUser.getCredit()}</p></li>
                        </ul>
                        <hr>
                       <c:import url="/ViewProfile" />
                        <ul>
                            <li class="text-info">Interests:</li>
                            <li>
                                <br/>
                                <ul>
                                   <c:forEach  items= "${requestScope.userInterest}" var="interest">
                                       <li><c:out value="${interest.getName()}"/></li>
                                    </c:forEach>
                                </ul>
                            </li>
                        </ul>
                        <input type="submit" value="Edit Profile" formaction="editProfile.jsp"/>
                        <input type="submit" id="btn" value="My Orders" formaction="GetOrders"/>
                    </form>
                    </c:if>
                    
                </div>
            </div>
        </div>

        <!-- footer -->
        <%@ include file="footer.html" %>

    </body>
</html>
