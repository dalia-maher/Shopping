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
                                alert(data);
                                $("#lastCredit").html("EGP "+data);
                              
                                
                            }
                        }
                    });
                }       
               jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
                
               //getLastCredit();
            });
            
        </script>
        <!-- start-smoth-scrolling -->
        <!-- start menu -->
        <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />


        <script type="text/javascript" src="js/megamenu.js"></script>
        <script>$(document).ready(function () {
    $(".megamenu").megamenu();
     
});</script>
        <link rel="stylesheet" href="js/jquery-ui.css">

        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="js/jquery-1.12.4.js"></script>
        <script src="js/jquery-ui.js"></script>
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
        <!-- profie-form -->
        
        <div class="reg-form">
            <div class="container">
                <div class="reg">
                    <c:if test="${sessionScope.loggedInUser != null}">
                        
                        <h3>${sessionScope.loggedInUser.getUserName()}</h3>

                    <form action="editProfile.jsp">
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
                                        <br>

                                    </c:forEach>
                                </ul>
                            </li>
                        </ul>
                        <input type="submit" value="Edit Profile">
                    </form>

                    </c:if>
                    
                </div>
            </div>
        </div>

        <!-- footer -->
        <%@ include file="footer.html" %>

    </body>
</html>
