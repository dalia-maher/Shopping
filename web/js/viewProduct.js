function beginRetrieving()
{
//setInterval(getProductDetails, 10);
}
function increase_by_one(field) {
    nr = parseInt(document.getElementById(field).value);
    if (nr < document.getElementById("qq").value)
        document.getElementById(field).value = nr + 1;
}

function decrease_by_one(field) {
    nr = parseInt(document.getElementById(field).value);
    if (nr > 0) {
        if ((nr - 1) > 0) {
            document.getElementById(field).value = nr - 1;
        }
    }
}
function getProductDetails() {
    console.log("get Product");
    var id = $("#productID").val();
    //var id = document.getElementById("productID").
    var data = {"productID": id};
    $.ajax({url: '/Shopping/DisplayProductDetails',
        type: 'GET',
        dataType: 'json',
        data: data,
        success: viewProduct
    });
}
var catname;
var arr;
function viewProduct(responseTxt, statusTxt, xhr) {
    if (statusTxt === "success")
    {
        $("#productName").html(responseTxt.name);
        $("#categoryName").html(responseTxt.category.name);
        $("#price").html(responseTxt.price + " EGP");
        if (responseTxt.quantity === 0)
        {
            //$("#addBtn").hide();
            var btn = document.getElementById("btn").style.display = 'none';
            //alert(btn);
            $("#quantity").replaceWith("<span class='item_price qwe'>Out of Stock</span>");
            //document.getElementById("addBtn").removeChild(btn);
            $("#increase").hide();
            $("#decrease").hide();
        } else
        {
            $("#qq").val(responseTxt.quantity);
            $("#quantity").val(1);
            $("#quantity").prop("readonly", true);
            //$("#quantity").attr("readonly");
        }
        $("#productDescription").html(responseTxt.description);

        // var images = responseTxt.images;
        var data = responseTxt.images;
        arr = data.split("&&");
        var ProName = responseTxt.name;
        ProName = ProName.replace(/\s/g, "");
        catName = responseTxt.category.name;
        var item="<div class=\"flexslider\">\
  <ul class=\"slides\">";
        var hasImage=false;
        for (var i = 0; i < arr.length; i++) {
            if (arr[i]!="") {
                item+="<li data-thumb='images/" + catName + "/" + arr[i] + ".png'><img data-imagezoom='true' src='images/" + catName + "/" + arr[i] + ".png' /></li>";
          hasImage=true;
            }
        }
        if (!hasImage) {
        item+="<li data-thumb='images/noImage.png'><img data-imagezoom='true' src='images/noImage.png' /></li>";
        }
        item+=" </ul></div>";
         $("#div2").html(item);
  $('.flexslider').flexslider({
    animation: "slide",
    controlNav: "thumbnails"
  });
    }
}
