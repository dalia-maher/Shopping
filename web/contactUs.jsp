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
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
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
<script src="js/menu_jquery.js"></script>
<script src="js/simpleCart.min.js"> </script>
<link href='http://fonts.googleapis.com/css?family=Monda:400,700' rel='stylesheet' type='text/css'>
</head>
	
<body>
<!-- header -->    
    <%@ include file="header.html" %>
<!------>
<div class="mega_nav">
	 <div class="container">
		 <div class="menu_sec">
		 <!-- start header menu -->
		<ul class="megamenu skyblue">
			<li class="active grid"><a class="color1" href="index.html">Home</a></li>
			<li class="grid"><a class="color1" href="#">Category</a>
                            <div class="megapanel">
                                <div class="row">
                                    <div class="col1">
                                        <div class="h_nav">
                                            
                                                <ul>
                                                    <%@ include file="categoryItems.html" %>
                                                </ul>	
                                        </div>							
                                    </div>
                                    <div class="col1">
                                        <div class="h_nav">
                                           
                                            <ul>
                                                <li><a href="products.jsp">Glasses</a></li>
                                                <li><a href="products.jsp">Women</a></li>
                                                <li><a href="products.jsp">Brands</a></li>
                                                <li><a href="products.jsp">Kids</a></li>
                                                <li><a href="products.jsp">Accessories</a></li>
                                                <li><a href="products.jsp">Style Videos</a></li>
                                            </ul>	
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
<!-- contact -->
	<div class="contact-bottom">
		<iframe src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d96908.54934770924!2d-73.74913540000001!3d40.62123259999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1sanimal+rescue+service+near+Inwood%2C+New+York%2C+NY%2C+United+States!5e0!3m2!1sen!2sin!4v1436335928062" frameborder="0" style="border:0" allowfullscreen></iframe>
	</div>
	<div class="contact">
		<div class="container">
			<div class="col-md-4 contact-left">
				<h3>Address</h3>
				<p>est eligendi optio cumque nihil impedit quo minus id quod maxime
					<span>26 56D Rescue,US</span></p>
				<ul>
					<li>Free Phone :+1 078 4589 2456</li>
					<li>Telephone :+1 078 4589 2456</li>
					<li>Fax :+1 078 4589 2456</li>
					<li><a href="mailto:info@example.com">info@example.com</a></li>
				</ul>
			</div>
			<div class="col-md-8 contact-left">
				<h3>Contact Form</h3>
				<form>
					<input type="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
					<input type="email" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required="">
					<input type="text" value="Telephone" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Telephone';}" required="">
					<textarea type="text"  onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message...';}" required="">Message...</textarea>
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
