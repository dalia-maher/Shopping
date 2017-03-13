<%-- 
    Document   : contactUs
    Created on : Feb 28, 2017, 6:29:11 PM
    Author     : Dalia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Pendent Store a Ecommerce Online Shopping Category Flat Bootstarp Resposive Website Template | Contact :: w3layouts</title>
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
        function sendMail() {
            var body = document.getElementById("msg").innerHTML;
            window.open('mailto:dalia.maher94@gmail.com?subject=contactUs&body=' + body);
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
<!-- contact -->
	<div class="contact-bottom">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d55251.73336023828!2d31.005420945024103!3d30.05884544177691!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x88f29d027c44f959!2sInformation+Technology+Institute!5e0!3m2!1sen!2s!4v1489292418263" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
        </div>
	<div class="contact">
		<div class="container">
			<div class="col-md-4 contact-left">
                            <h3>Address</h3>
                            <p>ITI - Smart Village - Cairo-Alex Road KM 28
                                <span>EWD Track - Intake 37</span></p>
                            <ul>
                                <li>Free Phone :+1 078 4589 2456</li>
                                <li>Telephone :+1 078 4589 2456</li>
                                <li><a href="mailto:dalia.maher94@gmail.com">info@example.com</a></li>
                            </ul>
			</div>
			<div class="col-md-8 contact-left">
                            <h3>Contact Form</h3>
                            <form action="javascript:sendMail();">
                                <input type="text" id="name" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
                                <input type="email" id="from" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required="">
                                <input type="text" id="telephone" value="Telephone" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Telephone';}" required="">
                                <textarea id="msg" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message...';}" required="">Message...</textarea>
                                <input type="submit" value="Submit" >
                            </form>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //contact -->
<!-- footer -->
<%@ include file="footer.html" %>
<!-- for bootstrap working -->
		<script src="js/bootstrap.js"> </script>
<!-- //for bootstrap working -->
</body>
</html>
