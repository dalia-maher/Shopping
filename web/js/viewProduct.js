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
        var arr = data.split("&&");
//        $("#div2").html("");
        var ProName = responseTxt.name;
            ProName = ProName.replace(/\s/g, "");
            var catName = responseTxt.category.name;
            catName = catName.replace(/\s/g, "");
        var text = "";
        text = "<div class=\"flexslider\" id=\"slideshow1\">";
        //text+="";
                                
//        text += "<div class='flex-viewport' style='overflow: hidden; position: relative;'>"+
//                "<ul class='slides' style='width: 1000%; transition-duration: 0s; transform: translate3d(-332px, 0px, 0px);'>";
//        var defaultpath = "images/" + catName + "/" +arr[arr.length-1]+ ".jpg";
//        text+="<li data-thumb='"+defaultpath+"'"+
//                "style='width: 332px; float: left; display: block;' class='clone'><div class='thumb-image'> "+
//                "<img src='"+defaultpath+"' data-imagezoom='true' class='img-responsive' alt=''"+
//                "draggable='false'></div></li>";
        for (i = 0; i < arr.length; i++)
        {
            var path = "images/" + catName + "/" + arr[i] + ".jpg";
            //text+="<img src='"+path+"' data-imagezoom='true' class='img-responsive' alt>";
            text+="<div><img id = 'img1' src='"+path+"' data-imagezoom='true' class='img-responsive' alt></div>";
//            text += " <li data-thumb=\"" + path + "\" aria-hidden='true' ";
//            if(i===0)
//                text+="class='flex-active-slide'";
//            text+="style='width: 332px; float: left; display: block;'>" +
//                    "<div class=\"thumb-image\"><img src=\"" + path + "\" data-imagezoom=\"true\" class=\"img-responsive\""+
//                    "alt='' draggable='false'/> </div>"
//                    + "</li>";
        }
        
//        var defaultpath = "images/" + catName + "/" +arr[0]+ ".jpg";
//        text += "<li data-thumb='"+defaultpath+"' class='clone' aria-hidden='true' "+
//                "style='width: 332px; float: left; display: block;'><div class='thumb-image'> "+
//                "<img src='"+defaultpath+"' data-imagezoom='true' class='img-responsive' alt=''"+
//                "draggable='false'></div></li></ul></div><ol class='flex-control-nav flex-control-thumbs'>";
//        for (i = 0; i < arr.length; i++)
//        {
//            var ProName = responseTxt.name;
//            ProName = ProName.replace(/\s/g, "");
//            var catName = responseTxt.category.name;
//            catName = catName.replace(/\s/g, "");
//            var path = "images/" + catName + "/" +arr[i]+ ".jpg";
//            text+="<li><img src='"+path+"' draggable='false'";
//            if(i===0)
//                text+="class='flex-active'";
//            text+="</li>";
//        }
//        text+="</ol><ul class='flex-direction-nav'><li class='flex-nav-prev'><a class='flex-prev' "+
//                "href='#'>Previous</a></li><li class='flex-nav-next'><a class='flex-next'href='#'>Next</a></li></ul>";
            text+="</div>";
            $("#div2").html(text);
    }
}