//$(document).ready(function () {
//    setInterval(getCustomers, 5000);
//});
function beginRetrieving()
{
    setInterval(getCustomers, 2000);
}
function getCustomers() {
    console.log("getcustomers");

    $.ajax({url: '../GetCustomers',
        type: 'GET',
        dataType: 'json',
        success: viewCustomers,
        error: function (jqXHR, textStatus, errorThrown) {
            //alert("error");
        }
    });
}
function viewCustomers(responseTxt, statusTxt, xhr)
{
    
    if (statusTxt === "success")
    {
        console.log("username : " + responseTxt[0].userName);
        
        var table = document.getElementById("users");
        var oldBody = document.getElementById("tbody");
        var newtbody = document.createElement("tbody");
        if (responseTxt.length > 0)
        {
            for (var i = 0; i < responseTxt.length; i++)
            {
                var row = document.createElement("tr");
                var username = document.createElement("td");
                var usernameVal = document.createTextNode(responseTxt[i].userName);
                username.appendChild(usernameVal);
                var name = document.createElement("td");
                var nameVal = document.createTextNode(responseTxt[i].firstName + " " + responseTxt[i].lastName);
                name.appendChild(nameVal);
                var email = document.createElement("td");
                var emailVal = document.createTextNode(responseTxt[i].email);
                email.appendChild(emailVal);
                var credit = document.createElement("td");
                var creditVal = document.createTextNode(responseTxt[i].credit);
                credit.appendChild(creditVal);
                row.appendChild(username);
                row.appendChild(name);
                row.appendChild(email);
                row.appendChild(credit);
                newtbody.appendChild(row);
            }
            newtbody.setAttribute("id","tbody");
            table.replaceChild(newtbody , oldBody);
//            $("#users").html(newtbody);
    }
    }
}