function beginRetrieving()
{
//setInterval(getProductDetails, 10);
}

function getProductDetails() {
    console.log("get Product");
   var id = $("#productID").val();
   console.log("id = "+id);
    //var id = document.getElementById("productID").
    var data = {"productID": id};
    $.ajax({url: '/Shopping/DisplayProductDetails',
        type: 'GET',
        dataType: 'json',
        data: data,
        success: viewProduct
    });
}

function viewProduct(responseTxt, statusTxt, xhr) {
    if (statusTxt === "success")
    {
        $("#productName").html(responseTxt.name);
        $("#categoryName").html(responseTxt.category.name);
        $("#price").html(responseTxt.price + "LE");
        $("#quantity").attr("max", responseTxt.quantity);
        $("#productDescription").html(responseTxt.description);
        var images = responseTxt.images;
//        $("#div2").html("");
        var text = "";
        text = "<div class=\"flexslider\" id = \"imgs\">";
        text += "<ul>";
        for (i = 0; i < images; i++)
        {
            var ProName = responseTxt.name;
            ProName = ProName.replace(/\s/g, "");
            var catName = responseTxt.category.name;
            catName = catName.replace(/\s/g, "");
            var path = "images/" + catName + "/" + ProName + i + ".jpg";
            /* $("#imgs").append("<li data-thumb='"+path+"'>"+
             "<div class='thumb-image'> <img src='"+path+"' data-imagezoom='true' class='img-responsive'"+
             " alt='' /> </div></li>");*/
            text += " <li data-thumb=\"" + path + "\">" +
                    "<div class=\"thumb-image\"><img src=\"" + path + "\" data-imagezoom=\"true\" class=\"img-responsive\"  /> </div>"
                    + "</li>";
        }
        text += "</ul></div>";
        $("#div2").html(text);
    }
}