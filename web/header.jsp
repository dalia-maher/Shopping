<%-- 
    Document   : header
    Created on : Mar 4, 2017, 9:54:29 PM
    Author     : Dalia
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- top-header -->
 <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css">
    <script>
     $( document ).ready(function() {
        //console.log( "ready!" );
            getShoppingList();
        });   
    function validateCredit(value) {
       if($("#credit").val() != ""){
        $.post("CheckCredit", {credit: value},
            function (response) {
                if (response == "true") {
                    $("#addBtn").show();
                    $("#creditValidation").html("");
                    //return true;
                } else {
                    $("#creditValidation").html("Invalid Card ID!");
                     $("#credit").val("");
                    //return false;
                }
            });
        } else {
            $("#creditValidation").html("Please, Enter the Card Code");
        }
    }

    function addCredit(id) {
        
        $.post("UdateUserCredit", {creditID: id},
        function (response) {
            if (response == "false") {
                $("#wrongAdded").html("Try agin, Not added successfully!");
                $("#credit").val("");
                $("#creditValidation").hide();
                $("#wrongAdded").show();
                $("#myModal").modal("show");
            
            } else  {
                $("#myModal").modal("hide");
                $("#validCredit").modal("show");
                $("#newCredit").html(response);
                getLastCredit();
                setTimeout(function(){
                    $('#validCredit').modal('hide')
                }, 2000);
            }
        });          
    }
    function getShoppingList(){
        $.ajax({
            url: "CheckOut",
            type: 'GET',
            dataType: 'JSON',
            success: function (data, textStatus, jqXHR) {
                var list = data;
                //alert(list.length);
                var total_price=0;
                $("#simpleCart_quantity").html(list.length);
                for (var i = 0; i < list.length; i++) {
                    total_price += list[i].product.price * list[i].quantity;
                }
                $("#total_price_carts").html("EGP " + total_price);
            }
        });
    }
    
    function deleteCart(){
        $.ajax({
            url: "DeleteAllCart",
            type: 'POST',
            success: function (data, textStatus, jqXHR) {
                if(data=="true");
                //alert(list.length);

                $("#simpleCart_quantity").html(0);
                $("#total_price_carts").html("EGP " + 0);
            }
        });
    }
    function previewModal(){
        $('#myModal').modal('show');
    }
</script>

 <!--Modal--> 
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

         <!--Modal content-->
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
                        <li><p id="wrongAdded"></p></li>
                        <li>
                            <label id="creditValidation" style="color:red;"></label>
                        </li>
                    </ul>
                </div>

            </div>
            <div class="modal-footer">

                <button type="button" id="addBtn" Style="display:none" class="btn btn-default btn btn-outline-secondary btn-md" data-dismiss="modal" onclick="addCredit($('#credit').val())">Add</button>
            </div>
        </div>

    </div>
</div>
<div class="modal fade" id="validCredit" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content -->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Current Credit</h4>
            </div>
            <div class="modal-body">
                <div class="reg">
                    <ul>
                        <li class="text-info">Your credit now is </li>
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
                        <c:set var="loggedInUser" value="${sessionScope.loggedInUser}"/>
                        <li class="top_link">Email:<a href="#"><c:out value="${loggedInUser.getEmail()}"/></a></li>
                        <li class="top_link"><a href="Logout">Logout</a></li>
                        <li class="top_link"><a href="javascript:previewModal();" >Add Credit</a></li>
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
                <p><a href="javascript:deleteCart();" class="simpleCart_empty">Empty Cart</a></p>
                <div class="clearfix"> </div>
            </div>				 
        </div>
        <div class="clearfix"></div>	
    </div>
</div>
<!-- //logo-cart -->
