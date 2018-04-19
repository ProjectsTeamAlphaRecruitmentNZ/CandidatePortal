var pageCount = document.getElementById("ctl00_ctl00_portalBody_NewUserContent_UserCounter").value
if(parseInt(pageCount) === 4){
    $("#pageFive").click(function(){return false;});
}else if(parseInt(pageCount) === 3){
    $("#pageFive").click(function(){return false;});
    $("#pageFour").click(function(){return false;});
}else if(parseInt(pageCount) === 2){
    $("#pageFive").click(function(){return false;});
    $("#pageFour").click(function(){return false;});
    $("#pageThree").attr('onclick','return false;');
}
else if(parseInt(pageCount) === 5){
}else{
$("#pageFive").click(function(){return false;});
    $("#pageFour").click(function(){return false;});
    $("#pageThree").click(function(){return false;});
    $("#pageTwo").click(function(){return false;});
}
