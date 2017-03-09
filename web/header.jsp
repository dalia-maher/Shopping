<%-- 
    Document   : header
    Created on : Mar 4, 2017, 9:54:29 PM
    Author     : Dalia
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="beans.User"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- top-header -->
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script>
        
    function validateCredit(value) {
       
        $.post("CheckCredit", {credit: value},
                function (response) {
                    if (response == "true") {
                        $("#creditValidation").html("");
                        //return true;
                    } else {
                        $("#creditValidation").html("Invalid Card ID!");
                        //return false;
                    }
                });

    }

    function addCredit(id) {
        $.post("UdateUserCredit", {creditID:id},
                function (response) {
                    if (response == "false") {
                       
                        $("#wrongAdded").html("Try agin ,Not added successfully!");
                        $("#credit").val("");
                        $("#creditValidation").hide();
                        $("#wrongAdded").show();
                        $("#myModal").modal("hide");
                        $("#myModal").modal("show");
                        
   
                    } else  {
                        
                        $("#myModal").modal("hide");
                        $("#validCredit").modal("show");
                         $("#newCredit").html(response);
                    }
                });
    }
</script>

 <!--Modal--> 
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

         Modal content
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Add Credit</h4>
            </div>
            <div class="modal-body">
                <div class="reg">
                    <ul>
                        <li class="text-info">Credit Card Code:</li>
                        <li><input type="text" name="credit" id="credit" onblur="validateCredit($('#credit').val())"></li>
                        <p id="wrongAdded"></p>
                        <li>
                            <label id="creditValidation" style="color:red;"></label>
                        </li>
                    </ul>
                </div>

            </div>
            <div class="modal-footer">

                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="addCredit($('#credit').val())">Add</button>
            </div>
        </div>

    </div>
</div>
<div class="modal fade" id="validCredit" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content -->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Current Credit</h4>
            </div>
            <div class="modal-body">
                <div class="reg">
                    <ul>
                        <li class="text-info">Your credit now is</li>
                        <li id="newCredit"></li>
                    </ul>
                </div>

            </div>
           
        </div>

    </div>
</div>
 <div class="top_bg">
    <div class="container">
        <div class="header_top-sec">
            <div class="top_right">
                <ul>
                    <li><a href="contactUs.jsp">Contact</a></li>
                </ul>
            </div>
            <div class="top_left">
                <ul>
                    <c:if test="${sessionScope.loggedInUser != null}">
                        <%User user = (User) session.getAttribute("loggedInUser");%>
                        <li class="top_link">Email:<a href="#"><%=user.getEmail()%></a></li>
                        <li class="top_link"><a href="Logout">Logout</a></li>
                        <!-- to do: set credit pop-up -->
                        <li class="top_link"><a href="#" data-toggle="modal" data-target="#myModal">Add Credit</a></li>
                        <li class="top_link"><a href="userOrders.jsp">My Orders</a></li>
                        <li class="top_link"><a href="userProfile.jsp">My Account</a></li>					
                    </c:if>
                    <c:if test="${sessionScope.loggedInUser == null}">
                        <li class="top_link"><a href="login.jsp">Login</a></li>					
                    </c:if>
                </ul>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!-- top-header -->
<!-- logo-cart -->
<div class="header_top">
    <div class="container">
        <div class="logo">
            <a href="index.jsp">Pendent Store</a>			 
        </div>
        <div class="header_right">
            <div class="cart box_1">
                <a href="checkout.jsp">
                <div class="total"><h3>
                    <span class="simpleCart_total"></span><span id="total_price_carts" >EGP 0</span> (<span id="simpleCart_quantity" class="simpleCart_quantity">${fn:length(shoppingList)}</span> items)</h3>
                    
                </div>
                    <img src="images/cart1.png" alt=""/>
                </a>
                <p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>
                <div class="clearfix"> </div>
            </div>				 
        </div>
        <div class="clearfix"></div>	
    </div>
</div>
<!-- //logo-cart -->
