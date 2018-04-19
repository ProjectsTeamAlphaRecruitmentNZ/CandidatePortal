
/* -----------------------------------------------------------------------------
 Public Holidays
----------------------------------------------------------------------------- */	 
	   $( ".datepicker" ).datepicker({ dateFormat: 'dd-mm-yy' });
	   
	   
	   $('label.reset-icon-div').click(function(){
        var input = $(this).prev('input:first');
        input.val('');
	   });
	   
	   var newyearday = "01-01-"+(new Date().getFullYear());
	   var dayafternewyear = "02-01-"+(new Date().getFullYear());
	   var ANZACDay = "25-04-"+(new Date().getFullYear());
	   var ChristmasDay = "25-12-"+(new Date().getFullYear());
	   var BoxingDay = "26-12-"+(new Date().getFullYear());
	   var WaitangiDay = "06-02-"+(new Date().getFullYear());
	   $('#new-year-day').val(newyearday);
	   $('#day-after-new-year').val(dayafternewyear);
	   $('#WaitangiDay').val(WaitangiDay);
	   $('#ANZACDay').val(ANZACDay);
	   $('#ChristmasDay').val(ChristmasDay);
	   $('#BoxingDay').val(BoxingDay);

	   var now=new Date();
	   now.setDate(1);
	   var month=now.setMonth(5);
	   var year=now.getFullYear();
	   var firstDay=now.getDay();
	   var firstMon=1+(1-firstDay+7)%7;
	   var QueensBirthday= firstMon+"-06-"+year;
	   $('#QueensBirthday').val(QueensBirthday);
	   
	   var now2=new Date();
	   now2.setDate(1);
	   var month2=now2.setMonth(9);
	   var year2=now2.getFullYear();
	   var firstDay2=now2.getDay();
	   var firstMon2=1+(1-firstDay2+7)%7;
	   var fourthMon2=firstMon2+21;
	   var LabourDay= fourthMon2+"-10-"+year;
	   $('#LabourDay').val(LabourDay);
	   
	/* -----------------------------------------------------------------------------
	check if Public Holiday falls on monday
	------------------------------------------------------------------------------ */
	   var newyeardayIsWeekend = new Date();
		newyeardayIsWeekend.getFullYear();
		newyeardayIsWeekend.setMonth(0);
		newyeardayIsWeekend.setDate(1);
		
		if(newyeardayIsWeekend.getDay() == 6 || newyeardayIsWeekend.getDay() == 0){
			$('#holidayClass1').addClass("holiday");
			if (newyeardayIsWeekend.getDay() == 0){
				 var newyeardayIsSunday = "03-01-"+(new Date().getFullYear());
				$('.message1').html("Following Tuesday <b>" +newyeardayIsSunday+"</b> is a day off work as holiday falls on Sunday!");
			}else{
				 var newyeardayIsSaturday = "03-01-"+(new Date().getFullYear());
				$('.message1').html("Following Monday <b>" +newyeardayIsSaturday+"</b> is a day off work as holiday falls on Saturday!");
			}
		} 
	   
	   var dayafternewyearIsWeekend = new Date();
		dayafternewyearIsWeekend.getFullYear();
		dayafternewyearIsWeekend.setMonth(0);
		dayafternewyearIsWeekend.setDate(2);

		if(dayafternewyearIsWeekend.getDay() == 6 || dayafternewyearIsWeekend.getDay() == 0){
			$('#holidayClass2').addClass("holiday");
			if (dayafternewyearIsWeekend.getDay() == 0){
				 var dayafternewyearIsSunday = "04-01-"+(new Date().getFullYear());
				$('.message2').html("Following Tuesday <b>" +dayafternewyearIsSunday+"</b> is a day off work as holiday falls on Sunday!");
			}else{
				 var dayafternewyearIsSaturday = "04-01-"+(new Date().getFullYear());
				$('.message2').html("Following Monday <b>" +dayafternewyearIsSaturday+"</b> is a day off work as holiday falls on Saturday!");
			}
		}
	   
	   var WaitangiDayIsWeekend = new Date();
		WaitangiDayIsWeekend.getFullYear();
		WaitangiDayIsWeekend.setMonth(1);
		WaitangiDayIsWeekend.setDate(6);

		if(WaitangiDayIsWeekend.getDay() == 6 || WaitangiDayIsWeekend.getDay() == 0){
			$('#holidayClass3').addClass("holiday");
			if (WaitangiDayIsWeekend.getDay() == 0){
				 var WaitangiDayIsSunday = "07-02-"+(new Date().getFullYear());
				$('.message3').html("Following Monday <b>" +WaitangiDayIsSunday+"</b> is a day off work as holiday falls on Sunday!");
			}else{
				 var WaitangiDayIsSaturday = "08-02-"+(new Date().getFullYear());
				$('.message3').html("Following Monday <b>" +WaitangiDayIsSaturday+"</b> is a day off work as holiday falls on Saturday!");
			}
		}
	   
	   var ANZACDayIsWeekend = new Date();
		ANZACDayIsWeekend.getFullYear();
		ANZACDayIsWeekend.setMonth(3);
		ANZACDayIsWeekend.setDate(25);

		if(ANZACDayIsWeekend.getDay() == 6 || ANZACDayIsWeekend.getDay() == 0){
			$('#holidayClass4').addClass("holiday");
			if (ANZACDayIsWeekend.getDay() == 0){
				 var ANZACDayIsSunday = "26-04-"+(new Date().getFullYear());
				$('.message4').html("Following Monday <b>" +ANZACDayIsSunday+"</b> is a day off work as holiday falls on Sunday!");
			}else{
				 var ANZACDayIsSaturday = "27-04-"+(new Date().getFullYear());
				$('.message4').html("Following Monday <b>" +ANZACDayIsSaturday+"</b> is a day off work as holiday falls on Saturday!");
			}
		}
	   
	   var ChristmasDayIsWeekend = new Date();
		ChristmasDayIsWeekend.getFullYear();
		ChristmasDayIsWeekend.setMonth(11);
		ChristmasDayIsWeekend.setDate(25);

		if(ChristmasDayIsWeekend.getDay() == 6 || ChristmasDayIsWeekend.getDay() == 0){
			$('#holidayClass5').addClass("holiday");
			if (ChristmasDayIsWeekend.getDay() == 0){
				 var ChristmasDayIsSunday = "27-12-"+(new Date().getFullYear());
				$('.message5').html("Following Tuesday <b>" +ChristmasDayIsSunday+"</b> is a day off work as holiday falls on Sunday!");
			}else{
				 var ChristmasDayIsSaturday = "27-12-"+(new Date().getFullYear());
				$('.message5').html("Following Monday <b>" +ChristmasDayIsSaturday+"</b> is a day off work as holiday falls on Saturday!");
			}
		}
	   
	   var BoxingDayIsWeekend = new Date();
		BoxingDayIsWeekend.getFullYear();
		BoxingDayIsWeekend.setMonth(11);
		BoxingDayIsWeekend.setDate(26);

		if(BoxingDayIsWeekend.getDay() == 6 || BoxingDayIsWeekend.getDay() == 0){
			$('#holidayClass6').addClass("holiday");
			if (BoxingDayIsWeekend.getDay() == 0){
				 var BoxingDayIsSunday = "28-12-"+(new Date().getFullYear());
				$('.message6').html("Following Tuesday <b>" +BoxingDayIsSunday+"</b> is a day off work as holiday falls on Sunday!");
			}else{
				 var BoxingDayIsSaturday = "28-12-"+(new Date().getFullYear());
				$('.message6').html("Following Monday <b>" +BoxingDayIsSaturday+"</b> is a day off work as holiday falls on Saturday!");
			}
		}
	   
	    var aucklandAnniversary = new Date();
		aucklandAnniversary.getFullYear();
		aucklandAnniversary.setMonth(0);
		aucklandAnniversary.setDate(29);

		if(aucklandAnniversary.getDay() == 0){ /*SUNADAY*/
			var aucklandAnniversary0 = "30-01-"+(new Date().getFullYear());
			$('#aucklandAnniversary').val(aucklandAnniversary0);
		}
	   
	   else if(aucklandAnniversary.getDay() == 1){/*MONDAY*/
		   	var aucklandAnniversary1 = "29-01-"+(new Date().getFullYear());
			$('#aucklandAnniversary').val(aucklandAnniversary1);
		}
	   
	    else if(aucklandAnniversary.getDay() == 2){/*TUESDAY*/
		   	var aucklandAnniversary2 = "28-01-"+(new Date().getFullYear());
			$('#aucklandAnniversary').val(aucklandAnniversary2);
		}
	   
	   else if(aucklandAnniversary.getDay() == 3){/*WEDNESDAY*/
		   	var aucklandAnniversary3 = "27-01-"+(new Date().getFullYear());
			$('#aucklandAnniversary').val(aucklandAnniversary3);
		}
	   
	   else if(aucklandAnniversary.getDay() == 4){/*THURSDAY*/
		   	var aucklandAnniversary4 = "26-01-"+(new Date().getFullYear());
			$('#aucklandAnniversary').val(aucklandAnniversary4);
		}
	   
	   else if(aucklandAnniversary.getDay() == 5){/*FRIDAY*/
		   	var aucklandAnniversary5 = "01-02-"+(new Date().getFullYear());
			$('#aucklandAnniversary').val(aucklandAnniversary5);
		}
	   
	   else if(aucklandAnniversary.getDay() == 6){/*SATURDAY*/
		   	var aucklandAnniversary6 = "31-01-"+(new Date().getFullYear());
			$('#aucklandAnniversary').val(aucklandAnniversary6);
		}
	   
	   else{
		   alert("Something went wrong! Check admin.js! Search for AucklandAnniversary")
	   }
	        

function EasterMonday(Y) {
    var C = Math.floor(Y/100);
    var N = Y - 19*Math.floor(Y/19);
    var K = Math.floor((C - 17)/25);
    var I = C - Math.floor(C/4) - Math.floor((C - K)/3) + 19*N + 15;
    I = I - 30*Math.floor((I/30));
    I = I - Math.floor(I/28)*(1 - Math.floor(I/28)*Math.floor(29/(I + 1))*Math.floor((21 - N)/11));
    var J = Y + Math.floor(Y/4) + I + 2 - C + Math.floor(C/4);
    J = J - 7*Math.floor(J/7);
    var L = I - J;
    var M = 3 + Math.floor((L + 40)/44);
    var D = L + 28 - 31*Math.floor(M/4);
	
	var eastermonday = L + 29 - 31*Math.floor(M/4);
	if (eastermonday>31){
		var eastermonday2 = eastermonday -31;
		var eastermondaymonth = M + 1;	
	}
	
	else{
		var eastermonday2 = eastermonday;
		var eastermondaymonth = M;
	}
    return padout(eastermonday2) + '-' + padout(eastermondaymonth);
}
	
function GoodFriday(Y) {
    var C = Math.floor(Y/100);
    var N = Y - 19*Math.floor(Y/19);
    var K = Math.floor((C - 17)/25);
    var I = C - Math.floor(C/4) - Math.floor((C - K)/3) + 19*N + 15;
    I = I - 30*Math.floor((I/30));
    I = I - Math.floor(I/28)*(1 - Math.floor(I/28)*Math.floor(29/(I + 1))*Math.floor((21 - N)/11));
    var J = Y + Math.floor(Y/4) + I + 2 - C + Math.floor(C/4);
    J = J - 7*Math.floor(J/7);
    var L = I - J;
    var M = 3 + Math.floor((L + 40)/44);
    var D = L + 28 - 31*Math.floor(M/4);
	
	var goodfriday = L + 26 - 31*Math.floor(M/4);

	if (goodfriday<1){
		var goodfriday2 = goodfriday +31;
		var goodfridaymonth = M - 1;	
	}
	
	else{
		var goodfriday2 = goodfriday;
		var goodfridaymonth = M;
	}
	
	return padout(goodfriday2) + '-' + padout(goodfridaymonth);
}
	   
	   

function padout(number) { return (number < 10) ? '0' + number : number; }
var Y =(new Date().getFullYear());

	   $('#EasterMonday').val(EasterMonday(Y)+"-"+Y);
	   $('#GoodFriday').val(GoodFriday(Y)+"-"+Y);
	   


$('#public-holidays-reset-btn').on("click", function(){
			swal({
					title: "Are you sure?",
					text: "You will not be able to recover these dates!",
					type: "warning",
					showCancelButton: true,
					confirmButtonColor: "#DD6B55",
					confirmButtonText: "Yes",
					cancelButtonText: "No",
					closeOnConfirm: false,
					closeOnCancel: false,
					animation: false
				},
				function(isConfirm) {
					if (isConfirm) {
						swal({title: "Fields has been reset!", text:"", animation: false, type:"success"})
						
						$('#aucklandAnniversary').val("");  
						$('#GoodFriday').val("");  
						$('#EasterMonday').val("");  
						$('#QueensBirthday').val("");
						$('#LabourDay').val("");
						
					} else {
						swal({title:"Canceled!", text: "",animation: false, type:"error"})
					}
			}
				 	);
			
			
	   });
	   




/* -----------------------------------------------------------------------------
ADD FILE Expenses form
----------------------------------------------------------------------------- */
function addFile(){
	var x = document.getElementById("myFile");
	var txt = "";
	$('#cancel-file').hide();
	if ('files' in x) {
		if (x.files.length == 0) {
			txt = "Select one or more files.";
		} else {
			for (var i = 0; i < x.files.length; i++) {    
				var file = x.files[i];
				if ('name' in file) {
				txt += "" + (i+1) + ". </strong>" + file.name + "<br>";
					$('#cancel-file').show();
					$('#demo').show();
				}
			}
		}
	} 
	else {
		if (x.value == "") {
			txt += "Select one or more files.";
		} else {
			txt += "The files property is not supported by your browser!";
			txt  += "<br>The path of the selected file: " + x.value; 
		}
	}
	document.getElementById("demo").innerHTML = txt;
	document.getElementById("display-demo").innerHTML = txt;

	
}

function addFile1(){
	var x = document.getElementById("myFile1");
	var txt = "";
	$('#cancel-file1').hide();
	if ('files' in x) {
		if (x.files.length == 0) {
			txt = "Select one or more files.";
		} else {
			for (var i = 0; i < x.files.length; i++) {    
				var file = x.files[i];
				if ('name' in file) {
				txt += "" + (i+1) + ". </strong>" + file.name + "<br>";
					$('#cancel-file1').show();
					$('#demo1').show();
				}
			}
		}
	} 
	else {
		if (x.value == "") {
			txt += "Select one or more files.";
		} else {
			txt += "The files property is not supported by your browser!";
			txt  += "<br>The path of the selected file: " + x.value; 
		}
	}
	document.getElementById("demo1").innerHTML = txt;
	document.getElementById("display-demo1").innerHTML = txt;

}
/* -----------------------------------------------------------------------------
  scroll-to-top-btn
----------------------------------------------------------------------------- */	
	$(window).scroll(function() {
		if ($(this).scrollTop() >= 50) {        // If page is scrolled more than 50px
			$('#return-to-top').fadeIn(200);    // Fade in the arrow
		} else {
			$('#return-to-top').fadeOut(200);   // Else fade out the arrow
		}
	});
	$('#return-to-top').click(function() {      // When arrow is clicked
		$('body,html').animate({
			scrollTop : 0                       // Scroll to top of body
		}, 500);
	});	

/* -----------------------------------------------------------------------------
MENU
----------------------------------------------------------------------------- */

	$('#nav-icon2').click(function(){
		$(this).toggleClass('open');
		$('#nav--header ul').slideToggle();
		$('.background-menu--open').toggleClass("m2m");
	});

	$("div.infoToggler").click(function() {
		$(this).find('img').toggle();
		$('.profile-navigation__nav').slideToggle();

	});


	$( "div.toggle-icon" ).click(function() {
		$(this).next().slideToggle();
	});


/* -----------------------------------------------------------------------------
  Templates
----------------------------------------------------------------------------- */   
	   var textarea1 = document.getElementById("template-header");
	   var textarea2 = document.getElementById("template-css");
	   var textarea3 = document.getElementById("template-footer");

		textarea1.oninput = function() {
		  textarea1.style.height = "";
		  textarea1.style.height = Math.min(textarea1.scrollHeight, 300) + "px";
		};
	   textarea2.oninput = function() {
		  textarea2.style.height = "";
		  textarea2.style.height = Math.min(textarea2.scrollHeight, 700) + "px";
		};
	   textarea3.oninput = function() {
		  textarea3.style.height = "";
		  textarea3.style.height = Math.min(textarea3.scrollHeight, 300) + "px";
		};
	   
	   
	   $('#new-template-form').hide();
	   $('#add-new-template-btn').on("click", function(){
			$('#new-template-form').fadeIn();
	   });
	   
	   $('#new-template-save-btn').on("click", function(){
			$('#new-template-form').fadeOut();
	   });
	   
	   $('#new-template-cancel-btn').on("click", function(){
		   $('#new-template-form').fadeOut();
		   $('#template-name').val(""); 
		   $('#template-css-name').val("");
		   $('#template-favicon').val("");
		   $('#template-head-title').val("");
		   $('#template-header').val("");
		   $('#template-css').val("");
		   $('#template-footer').val("");
		   $('#template-header').css("height", "7.45rem");
		   $('#template-css').css("height", "7.5rem");
		   $('#template-footer').css("height", "7.5rem");
	   });

	   $('.delete2').on('click',function(event){
			var boton = "button";
			swal({
					title: "Are you sure?",
					text: "You will not be able to recover this CSS file!",
					type: "warning",
					showCancelButton: true,
					confirmButtonColor: "#DD6B55",
					confirmButtonText: "Yes",
					cancelButtonText: "No",
					closeOnConfirm: false,
					closeOnCancel: false,
					animation: false
				},
				function(isConfirm) {
					if (isConfirm) {
						swal({title: "Deleted!", text:"", animation: false, type:"success"})
						 $(".confirm").click(function(){
							 $('#tc1').hide();
						 });
						/*
						$(".confirm").click(function(){
							window.location.reload();
						});
						*/
					} else {
						swal({title:"Canceled!", text: "",animation: false, type:"error"})
					}
				});
		});
	   
	   $('#form-edit').hide();
	   $('.edit2').on('click',function(event){
		  $('#form-edit').fadeIn();
		  $('#tc1').hide();
	   });
	   
	    $('#new-template-cancel-btn-edit').on('click',function(event){
		  $('#form-edit').fadeOut();
		  $('#tc1').show();
	   });
	   
	   $('#new-template-save-btn-edit').on('click',function(event){
		  $('#form-edit').fadeOut();
		  $('#tc1').show();
		   window.location.reload();
	   });
	   
	   
	   $('#cancel-file').click(function(e){
						$('#myFile').val("");
						$('#demo').hide();
						$('#cancel-file').hide();
		});
		$('#cancel-file1').click(function(e){
						$('#myFile1').val("");
						$('#demo1').hide();
						$('#cancel-file1').hide();
		});

	   