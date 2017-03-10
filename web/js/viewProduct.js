function beginRetrieving()
{
//setInterval(getProductDetails, 10);
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

function viewProduct(responseTxt, statusTxt, xhr) {
    if (statusTxt === "success")
    {
        $("#productName").html(responseTxt.name);
        $("#categoryName").html(responseTxt.category.name);
        $("#price").html(responseTxt.price + "LE");
        $("#quantity").attr("max", responseTxt.quantity);
        $("#productDescription").html(responseTxt.description);
       // var images = responseTxt.images;
        var data = responseTxt.images;
        //var arr = data.split("&&");
//        $("#div2").html("");
        var text = "";
        text = "<div class=\"flexslider\" id = \"imgs\"></div>";
        text += "<div class='flex-viewport' style='overflow: hidden; position: relative;'>"+
                "<ul class='slides' style='width: 1000%; transition-duration: 0.6s; transform: translate3d(-332px, 0px, 0px);'>";
        for (i = 0; i < images; i++)
        text = "<div class=\"flexslider\" id = \"imgs\">";
        text += "<ul>";
        //for (i = 0; i < arr.length; i++)
        {
            var ProName = responseTxt.name;
            ProName = ProName.replace(/\s/g, "");
            var catName = responseTxt.category.name;
            catName = catName.replace(/\s/g, "");
             
            var path = "images/" + catName + "/" + arr[i] + ".jpg";
            //alert(path);
            /* $("#imgs").append("<li data-thumb='"+path+"'>"+
             "<div class='thumb-image'> <img src='"+path+"' data-imagezoom='true' class='img-responsive'"+
             " alt='' /> </div></li>");*/
            text += " <li data-thumb=\"" + path + "\" class='' aria-hidden='true' "+
                    "style='width: 332px; float: left; display: block;'>" +
                    "<div class=\"thumb-image\"><img src=\"" + path + "\" data-imagezoom=\"true\" class=\"img-responsive\""+
                    "alt='' draggable='false'/> </div>"
                    + "</li>";
        }
        var defaultpath = "images/" + catName + "/" + ProName + "0.jpg";
        text += "<li data-thumb='"+defaultpath+"' class='flex-active-slide' aria-hidden='true' "+
                "style='width: 332px; float: left; display: block;'><div class='thumb-image'> "+
                "<img src='"+defaultpath+"' data-imagezoom='true' class='img-responsive' alt=''"+
                "draggable='false'></div></li></ul></div><ol class='flex-control-nav flex-control-thumbs'>";
        for (i = 0; i < images; i++)
        {
            var ProName = responseTxt.name;
            ProName = ProName.replace(/\s/g, "");
            var catName = responseTxt.category.name;
            catName = catName.replace(/\s/g, "");
            var path = "images/" + catName + "/" + ProName + i + ".jpg";
            text+="<li><img src='"+path+"' draggable='false'";
            if(i===0)
                text+="class='flex-active'";
            text+="</li>";
        }
        text+="</ol><ul class='flex-direction-nav'><li class='flex-nav-prev'><a class='flex-prev' "+
                "href='#'>Previous</a></li><li class='flex-nav-next'><a class='flex-next'href='#'>Next</a></li></ul>";
            $("#div2").html(text);
    }
}