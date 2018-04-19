$(document).ready(function () {
    $(".datepicker").datepicker({ dateFormat: "dd/mm/yy" });
});
/* -----------------------------------------------------------------------------
ADD FILE Expenses form
----------------------------------------------------------------------------- */
$(function() {
   if (location.search.match(/animate=true/)) {
      $('body').hide().slideDown();
   }
});
function addFile(){
	var x = document.getElementById("myFile");
	var txt = "";
	$('#cancel-files-btn').hide();
	$('#upload-files-btn').hide();
	if ('files' in x) {
		if (x.files.length == 0) {
			txt = "Select one or more files.";
		} else {
			for (var i = 0; i < x.files.length; i++) {    
				var file = x.files[i];
				if ('name' in file) {
				txt += "" + (i+1) + ". </strong>" + file.name + "<br>";
					$('#cancel-files-btn').show();
					$('#upload-files-btn').show();
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

	$('#cancel-file').click(function(e){
						$('#myFile').val("");
						$('#demo').hide();
						$('#cancel-file').hide();
	});
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
  GENERAL INFORMATION PAGE
----------------------------------------------------------------------------- */	
//angular.module('RoutingApp').controller('mainController', ['$scope', function ($scope) {
//    $scope.load = function() {
//		/* -----------------------------------------------------------------------------
//  		EDIT INFORMATION
//		----------------------------------------------------------------------------- */
//		$(document).ready(function(){
//			$(".editlink").on("click", function(e){
//			e.preventDefault();
//			var dataset = $(this).prev(".datainfo");
//			var savebtn = $(this).next(".savebtn");
//			var theid   = dataset.attr("id");
//			var newid   = theid+"-form";
//			var currval = dataset.text();

//			dataset.empty();

//			$('<input type="text" name="'+newid+'" id="'+newid+'" value="'+currval+'" class="hlite">').appendTo(dataset);

//			$(this).css("display", "none");
//			savebtn.css("display", "block");
//		  });

//			$(".savebtn").on("click", function(e){
//			e.preventDefault();
//			var elink   = $(this).prev(".editlink");
//			var dataset = elink.prev(".datainfo");
//			var newid   = dataset.attr("id");

//			var cinput  = "#"+newid+"-form";
//			var einput  = $(cinput);
//			var newval  = einput.attr("value");

//			$(this).css("display", "none");
//			einput.remove();
//			dataset.html(newval);

//			elink.css("display", "block");
//		  });
//		});	
//		/* -----------------------------------------------------------------------------
//		PICTURE UPLOAD
//		----------------------------------------------------------------------------- */
//		$('.resp').hide();
//		function readURL(input) {
//				if (input.files && input.files[0]) {
//					var reader = new FileReader();
//					$("#cancel-img").show();
//					$("#save-img").show();	
//					$("#btn-label").hide();
//					reader.onload = function (e) {
//						$('#photo-profile').attr('src', e.target.result);
//					}
//					reader.readAsDataURL(input.files[0]);
//				}
//			}  
//			$("#imgInp").change(function(){
//				readURL(this);
//			});
//			$('#cancel-img').click(function(e){
//				$('#imgInp').val("");
//			    $('#photo-profile').attr("src","https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg");
//			    $("#cancel-img").hide();
//			    $("#save-img").hide();
//			    $("#btn-label").show();
//			});
		
//			$('#save-img').click(function(e){
//				swal({title: "", text:"Your photo has been uploaded!", animation: false, type:"success"})
//				$("#cancel-img").hide();
//			    $("#save-img").hide();
//			    $("#btn-label").show();
//			});

//   };
//   $scope.load();
//}]);


///* -----------------------------------------------------------------------------
//  ROLE AND SKILLS PAGE
//----------------------------------------------------------------------------- */
//angular.module('RoutingApp').controller('role-and-skillsController', ['$scope', function ($scope){
//	$scope.load = function() {	

//	/*----------------------------------------------------------------------
//	Show work category and skills on click
//	-----------------------------------------------------------------------*/
//	function evaluate(){
//		var item = $(this);
//		var relatedItem = $("." + item.attr("data-related-item")).parent();
//		relatedItem.hide();
//		if(item.is(":checked")){
//			relatedItem.fadeIn();
//		}else{
//			relatedItem.fadeOut();   
//		}
//	}
//	$('input[type="checkbox"]').click(evaluate).each(evaluate);	
		
//		$("#submitButton").click(function(){
//		  swal({title: "Saved!", text:"", animation: false, type:"success"})
//		  $(".confirm").click(function(){
//			  window.location.reload();
//		  });
//		});
		
		
//	   };
//	$scope.load();
//}]);
		
	
///* -----------------------------------------------------------------------------
//  WORK HISTORY PAGE
//----------------------------------------------------------------------------- */
//angular.module('RoutingApp').controller('work-historyController', ['$scope', function ($scope){
//	$scope.load = function() {
//		$('.delete2').on('click',function(event){
//			var boton = "button";
//			swal({
//					title: "Are you sure?",
//					text: "You will not be able to recover this work history!",
//					type: "warning",
//					showCancelButton: true,
//					confirmButtonColor: "#DD6B55",
//					confirmButtonText: "Yes",
//					cancelButtonText: "No",
//					closeOnConfirm: false,
//					closeOnCancel: false,
//					animation: false
//				},
//				function(isConfirm) {
//					if (isConfirm) {
//						swal({title: "Deleted!", text:"", animation: false, type:"success"})
//						$('.work-history-cell').remove();
//						$('#message-work-history').show();
//					} else {
//						swal({title:"Canceled!", text: "",animation: false, type:"error"})
//					}
//				}
//			);
//		});
		

		
//		$('#id2').hide();
//		$(".edit2").on('click', function(event) {
//			$('.experience-field2').hide();
//			$('#id2').fadeIn();
//			$('.edit2').hide();
//			$('.delete2').hide();
//			if ($('#now').is(':checked')) {
//				$('.hide-select-date').hide();
//				$('.reason-for-l1').hide();
//			}else{
//				$('.hide-select-date').show();
//				$('.reason-for-l1').show();
//			}
//			$('#company-name-new').val('');
//			$('#position-new').val('');
//			$('#location-new').val('');
//			$('#month-1-new').val('');
//			$('#year-1-new').val('');
//			$('#month-2-new').val('');
//			$('#year-2-new').val('');
//			$('#now-new').removeAttr('checked');
//			$(".hide-select-date-new").show();
//			$('.reason-for-l').show();
//			$('#leaving-reason-new').val('');
//			$('#report-to-name-new').val('');
//			$('#primary-industry-new').val('');
//			$('#description-new').val('');
//			$("#add-position-field").fadeOut();
//		});

//		$(".hide-select-date").show();
//		$("#now").click(function() {
//			if($(this).is(":checked")) {
//				$(".hide-select-date").hide();
//				$("#leaving-reason").removeAttr('value');
//				$("#year-2").removeAttr('value');
//				$('#month-2').find("option:first").attr("selected", true);
//			} else {
//				$(".hide-select-date").show();
//			}
//		});
		
//		$('#cancel-btn-form1').click(function() {
//			$('#id2').fadeOut();
//			$("#save-add-pos-btn").show();
//			$('.experience-field2').show();
//			$('.edit2').show();
//			$('.delete2').show();
//		});
		
//		$('#save-btn-form1').click(function() {
//		    var value1 =$.trim($("#company-name").val());
//			var value2 =$.trim($("#position").val());
//			var value3 =$.trim($("#year-1").val());
//			var value4 =$.trim($("#year-2").val());
//			var value5 =$.trim($("#leaving-reason").val());
//			var value6 =$.trim($("#report-to-name").val());
			

//		    if (((value1.length > 0) && (value2.length > 0) && (value3.length > 0) && (value4.length > 0) && (value5.length > 0) && ($("#primary-industry")[0].selectedIndex >=1) && ($("#month-1")[0].selectedIndex >=1) && ($("#month-2")[0].selectedIndex >=1) && (value6.length > 0) && (!$("#now").is(":checked"))) || (($("#now").is(":checked")) && (value1.length > 0) && (value2.length > 0) && (value3.length > 0) && ($("#primary-industry")[0].selectedIndex >=1) && ($("#month-1")[0].selectedIndex >=1) && (value6.length > 0) )) {
//			    $('#add-qualification-field').fadeOut();
//			    $('.experience-field2').show();
//				$('#id2').fadeOut();
//				$('.edit2').show();
//				$('.delete2').show();
//				$(".edit-position-form").fadeOut();
//				$('.experience-field2').fadeIn();
//				$('.edit2').show();
//				$('.delete2').show();
//			    swal({title: "Saved!",animation: false, type:"success"})
//				$(".confirm").click(function(){
//					window.location.reload();
//				});
			    
//			}else{
//			  swal({title:"", text: "Please fill in all the fields.",animation: false, type:"error"})
//		    }
//		});
		
	
//		$(".hide-select-date").show();
//		$("#now").click(function() {
//			if($(this).is(":checked")) {
//				$(".hide-select-date").hide();
//				$('.reason-for-l1').hide();
//				$('#display-6').hide();
//				$('#display-7').hide();
//			} else {
//				$(".hide-select-date").show();
//				$('.reason-for-l1').show();
//				$('#display-6').show();
//				$('#display-7').show();
//			}
//		});
				
//		$("#add-position-field").hide();
//		$("#add-work-history").click(function() {
//			$("#add-position-field").fadeIn();
//			$('#id2').fadeOut();
//			$("#save-add-pos-btn").show();
//			$('.experience-field2').show();
//			$('.edit2').show();
//			$('.delete2').show();
//		});
		
//		$(".hide-select-date-new").show();
//		$("#now-new").click(function() {
//			if($(this).is(":checked")) {
//				$(".hide-select-date-new").hide();
//				$('.reason-for-l').hide();
//				$('#display-6').hide();
//				$('#display-7').hide();
//			} else {
//				$(".hide-select-date-new").show();
//				$('.reason-for-l').show();
//				$('#display-6').show();
//				$('#display-7').show();
//			}
//		});
		
///* -----------------------------------------------------------------------------
//new work experience form 
//----------------------------------------------------------------------------- */		
//		$("#now-new").click(function() {
//			if($(this).is(":checked")) {
//				$("#leaving-reason-new").removeAttr('value');
//				$("#year-2-new").removeAttr('value');
//				$('#month-2-new').find("option:first").attr("selected", true);
//			} else {
//				$(".hide-select-date").show();
//			}
//		});
		
//		$('#cancel-btn-form2').click(function() {
//			$('#company-name-new').val('');
//			$('#position-new').val('');
//			$('#location-new').val('');
//			$('#month-1-new').val('');
//			$('#year-1-new').val('');
//			$('#month-2-new').val('');
//			$('#year-2-new').val('');
//			$('#now-new').removeAttr('checked');
//			$(".hide-select-date-new").show();
//			$('.reason-for-l').show();
//			$('#leaving-reason-new').val('');
//			$('#report-to-name-new').val('');
//			$('#primary-industry-new').val('');
//			$('#description-new').val('');
//			$("#add-position-field").fadeOut();
//		});

//		$('#save-btn-form2').click(function() {
//		    var value1 =$.trim($("#company-name-new").val());
//			var value2 =$.trim($("#position-new").val());
//			var value3 =$.trim($("#year-1-new").val());
//			var value4 =$.trim($("#year-2-new").val());
//			var value5 =$.trim($("#leaving-reason-new").val());
//			var value6 =$.trim($("#report-to-name-new").val());

//		    if (((value1.length > 0) && (value2.length > 0) && (value3.length > 0) && (value4.length > 0) && (value5.length > 0) && ($("#primary-industry-new")[0].selectedIndex >=1) && ($("#month-1-new")[0].selectedIndex >=1) && ($("#month-2-new")[0].selectedIndex >=1) && (value6.length > 0) && (!$("#now-new").is(":checked"))) || (($("#now-new").is(":checked")) && (value1.length > 0) && (value2.length > 0) && (value3.length > 0) && ($("#primary-industry-new")[0].selectedIndex >=1) && ($("#month-1-new")[0].selectedIndex >=1) && (value6.length > 0) )) {
//				$('#add-qualification-field').fadeOut();
//				$('.experience-field2').show();
//				$('#id2').fadeOut();
//				$('.edit2').show();
//				$('.delete2').show();
//				$(".edit-position-form").fadeOut();
//				$('.experience-field2').fadeIn();
//				$('.edit2').show();
//				$('.delete2').show();
//				$("#add-position-field").fadeOut();
//				swal({title: "Saved!",animation: false, type:"success"})
//				$(".confirm").click(function(){
//					window.location.reload();
//				});
			    
//			}else{
//				swal({title:"", text: "Please fill in all the fields.",animation: false, type:"error"})	
//		    }
		
//		});
			
//	};
//	$scope.load();
//}]);


///* -----------------------------------------------------------------------------
//  QUALIFICATION PAGE
//----------------------------------------------------------------------------- */
//angular.module('RoutingApp').controller('qualificationController', ['$scope', function ($scope){
//	$scope.load = function() {	
//		$('.delete2').on('click',function(event){
//			var boton = "button";
//			swal({
//					title: "Are you sure?",
//					text: "You will not be able to recover this qualification!",
//					type: "warning",
//					showCancelButton: true,
//					confirmButtonColor: "#DD6B55",
//					confirmButtonText: "Yes",
//					cancelButtonText: "No",
//					closeOnConfirm: false,
//					closeOnCancel: false,
//					animation:false
//				},
//				function(isConfirm) {
//					if (isConfirm) {
//						swal({ title: "Deleted!",text: "",animation: false, type:"success"})
//						$('.qualification-cell').remove();
//						$('#message-qualification-gained').show();
//					} else {
//						swal({ title: "Canceled",text: "",animation: false, type:"error"})
//					}
//				}
//			);
//		});
		

//		$('#id2').hide();
//		$(".edit2").on('click', function(event) {
//			$('.experience-field2').hide();
//			$('#id2').fadeIn();
//			$('.edit2').hide();
//			$('.delete2').hide();
//			$('#school').val('');
//			$('#country').val('');
//			$('#degree').val('');
//			$('#year-1st').val('');
//			$('#year-2nd').val('');
//			$('#field-of-study').val('');
//			$('#description1').val('');
//			$('#add-qualification-field').fadeOut();
//		});
		
		
//		$('#add-qualification-field').hide();
//		$('#save-add-qual-btn').on('click',function(event) {
//			$('#add-qualification-field').fadeIn();
//			$('.experience-field2').show();
//			$('#id2').fadeOut();
//			$('.edit2').show();
//			$('.delete2').show();
//		});
		
//		$('#cancel-btn-form-2').on('click',function(event) {
//			$('#school').val('');
//			$('#country').val('');
//			$('#degree').val('');
//			$('#year-1st').val('');
//			$('#year-2nd').val('');
//			$('#field-of-study').val('');
//			$('#description1').val('');
//			$('#add-qualification-field').fadeOut();
//		});
		
//		$('#cancel-btn-form1').on('click',function(event) {
//			$('.experience-field2').show();
//			$('#id2').fadeOut();
//			$('.edit2').show();
//			$('.delete2').show();
//		});
		
//		$('#save-btn-form1').on('click',function(event) {
//		   var message = $(".resp1");
//		   var value = $('.required-entry1').filter(function () {
//				return this.value === '';
//		   });
//		   if (value.length == 0) {
//			  $('#add-qualification-field').fadeOut();
//			  $('.experience-field2').show();
//			  $('#id2').fadeOut();
//			  $('.edit2').show();
//			  $('.delete2').show();
//			  swal({title: "Saved!",animation: false, type:"success"})
//			  $(".confirm").click(function(){
//				  window.location.reload();
//			  });
//			  return true;

//		   } else if (value.length > 0) {
//			   swal({title:"", text: "Please fill in all the fields.",animation: false, type:"error"})
//			  return false;
//		   }
//		});
		
//		$('#btn-add-q').click(function() { 
//		   var value = $('.required-entry').filter(function () {
//				return this.value === '';
//		   });
//		  if (value.length == 0) {
//			  $(".resp").hide();
//			  $('#add-qualification-field').fadeOut();
//			  swal({title: "Saved!",animation: false, type:"success"})
//			  $(".confirm").click(function(){
//				  window.location.reload();
//			  });
//			  return true;

//		  } else if (value.length > 0) {
//			  swal({title:"", text: "Please fill in all the fields.",animation: false, type:"error"})
//			  return false;
//		  }  
//	   });
		

		
//  };
//	$scope.load();
//}]);
	

///* -----------------------------------------------------------------------------
//  Account-info PAGE
//----------------------------------------------------------------------------- */
//angular.module('RoutingApp').controller('account-infoController', ['$scope', function ($scope){
//	$scope.load = function() {	
//	/* -----------------------------------------------------------------------------
//  	EDIT INFORMATION
//	----------------------------------------------------------------------------- */
//	$(document).ready(function(){
//	 $(".editlink").on("click", function(e){
//		e.preventDefault();
//		var dataset = $(this).prev(".datainfo");
//		var savebtn = $(this).next(".savebtn");
//		var theid   = dataset.attr("id");
//		var newid   = theid+"-form";
//		var currval = dataset.text();

//		dataset.empty();

//		$('<input type="text" name="'+newid+'" id="'+newid+'" value="'+currval+'" class="hlite">').appendTo(dataset);

//		$(this).css("display", "none");
//		savebtn.css("display", "block");
//	 });

//	$(".savebtn").on("click", function(e){
//		e.preventDefault();
//		var elink   = $(this).prev(".editlink");
//		var dataset = elink.prev(".datainfo");
//		var newid   = dataset.attr("id");

//		var cinput  = "#"+newid+"-form";
//		var einput  = $(cinput);
//		var newval  = einput.attr("value");

//		$(this).css("display", "none");
//		einput.remove();
//		dataset.html(newval);

//		elink.css("display", "block");
//	  });
//	});	

//	/* -----------------------------------------------------------------------------
//	  Check box checked
//	----------------------------------------------------------------------------- */
//	$(':checkbox').on('change',function(){
//		var th = $(this), name = th.prop('name'); 
//		if(th.is(':checked')){
//			 $(':checkbox[name="'  + name + '"]').not($(this)).prop('checked',false);   
//		}
//	});	

		
//		$(".save").click(function(){
//			swal({title: "Saved!", text:"", animation: false, type:"success"})
//			$(".confirm").click(function(){
//				window.location.reload();
//			});
//		});
		
//		$(".savebtn").click(function(){
//			swal({title: "Saved!", text:"", animation: false, type:"success"})
//			$(".confirm").click(function(){
//				window.location.reload();
//			});
//		});
		

//	   };
//	$scope.load();
//}]);


///* -----------------------------------------------------------------------------
//  Documents PAGE
//----------------------------------------------------------------------------- */
//angular.module('RoutingApp').controller('documentsController', ['$scope', function ($scope){
//	$scope.load = function() {	
		
//	function myFunction(){
//    var x = document.getElementById("myFile");
//    var txt = "";
//    if ('files' in x) {
//        if (x.files.length == 0) {
//            txt = "Select one or more files.";
//        } else {
//            for (var i = 0; i < x.files.length; i++) {
//                txt += "<br><strong>" + (i+1) + ". file</strong><br>";
//                var file = x.files[i];
//                if ('name' in file) {
//                    txt += "name: " + file.name + "<br>";
//                }
//                if ('size' in file) {
//                    txt += "size: " + file.size + " bytes <br>";
//                }
//            }
//        }
//    } 
//    else {
//        if (x.value == "") {
//            txt += "Select one or more files.";
//        } else {
//            txt += "The files property is not supported by your browser!";
//            txt  += "<br>The path of the selected file: " + x.value; // If the browser does not support the files property, it will return the path of the selected file instead. 
//        }
//    }
//    document.getElementById("demo").innerHTML = txt;
//}
			
	   

//	$("#upload-files-btn").click(function(){
//		swal({title: "", text:"Your files have been uploaded!", animation: false, type:"success"})
//		$(".confirm").click(function(){
//			window.location.reload();
//		});
//	});
		
//	$("#cancel-files-btn").click(function(){
//						$('#myFile').val("");
//						$('#demo').hide();
//						$('#cancel-files-btn').hide();
//						$('#upload-files-btn').hide();
//	});
		

//	};
//	$scope.load();
//}]);




///* -----------------------------------------------------------------------------
//  Change Password PAGE
//----------------------------------------------------------------------------- */
//angular.module('RoutingApp').controller('change-passwordController', ['$scope', function ($scope){
//	$scope.load = function() {	

//	function resetForm(){
//        var oldP=$("#oldPassword").value="";
//        var newP=$("#newPassword").value="";
//        var confirmP =$("#confirmPassword").value="";
//	}	
	
//	var strength = {
//	   0: "Very weak ",
//	   1: "Weak",
//	   2: "Medium",
//	   3: "Strong",
//	   4: "Very Strong"
//	 }

//	 var password = document.getElementById('newPassword');
// 	 var meter = document.getElementById('password-strength-meter');
// 	 var text = document.getElementById('password-strength-text');
		
//	 password.addEventListener('input', function() {
//	   var val = password.value;
//	   var result = zxcvbn(val);

//	   // Update the password strength meter
//		  meter.value = result.score;
//	   // Update the text indicator
//	   if (val !== "") {
//		 text.innerHTML = "" + strength[result.score];
//	   } else {
//		 text.innerHTML = "";
//	   }

//		if (meter.value >= 3) {
//			$('.qm-1').hide();
//			$('.qm-2').show();
//			$('.resp3').hide();
//			document.getElementById("theImage2").style.visibility = "visible";
//			return true;

//	   } else {
//		   document.getElementById("theImage").style.visibility = "visible";  
//		   $('.qm-1').show();
//		   $('.qm-2').hide();
//		   $('.resp3').show();
//			$('.resp3').html('<div class="error1"><p>Please make sure password has at least strong strength!</p></div>');
//			return false;
//	   }
// 	});

//	$('#newPassword').keyup(function() {

//	  // If value is not empty
//	  if ($(this).val().length == 0) {
//		// Hide the element
//		$('.desc-pass').hide();
//		$('.qm-1').hide();
//		$('.qm-2').hide();
//		 $('.resp3').hide();
//	  } else {
//		// Otherwise show it
//		$('.desc-pass').show();
//	  }
//	}).keyup();

//    $(document).on('keyup', '.error1', function () {
//        $(this).next('.resp').hide('slow');
//    });

//	setInterval(function(){
//			$("#theImage").toggleClass("backgroundRed");
//		 },400)

//		var firstField = document.getElementById('newPassword');
//		var secField =   document.getElementById('confirmPassword');
//		var image =    document.getElementById('theImage3');
//		var image2 =    document.getElementById('theImage4');

//		function equals() {
//			if(firstField.value == secField.value) {
//				image.style.display = 'block';
//				image2.style.display = 'none';
//			}
//			else {
//				image.style.display = 'none';
//				image2.style.display = 'block';
//			}
//		}
//		firstField.onkeyup = equals;
//		secField.onkeyup = equals;

//	$('#confirmPassword').keyup(function() {

//	  // If value is not empty
//	  if ($(this).val().length == 0) {
//		// Hide the element
//		$('.qm-3').hide();
//		$('.qm-4').hide();
//	  } else {
//		// Otherwise show it
//		$('.qm-3').show();
//		$('.qm-4').show();
//	  }
//	}).keyup();

		
//	$(function FormSubmission() {
//		$("#next1").click(function () {
//					var password = $("#newPassword").val();	
//					var nextbtn = document.getElementById("next1");
//					var oldPassword = $("#oldPassword").val();
//					var confirmPassword = $("#confirmPassword").val();

//					if (password != confirmPassword) {
//						/*$('.resp3').show();
//						$('.resp3').html('<div class="error1"><p>Password and confirmed password does not match.</p></div>');
//						*/
//						swal({title:"", text: "Password and confirmed password does not match." ,animation: false, type:"error"})
//						return false;
//					}

//					if (meter.value < 2) {
//						swal({title:"", text: "Please make sure password has at least strong strength!" ,animation: false, type:"error"})
//						return false;
//					}	

//					if (password == "" || confirmPassword == "" || oldPassword == "") {
//						swal({title:"", text: "Please fill in all the fields." ,animation: false, type:"error"})
//						return false;
//					}

//			swal({title: "", text:"Your new password has been saved!", animation: false, type:"success"})
//			$(".confirm").click(function(){
//				window.location.reload();
//			});
//			return true;
//		});     
//	});
		
//		$("#clear-btn").click(function () {
//			$('.resp3').hide();
//			document.getElementById('password-strength-text').innerHTML = "";
//			document.getElementById('password-strength-meter').value="";
//			$('.qm-1').hide();
//			$('.qm-2').hide();
//			$('.qm-3').hide();
//			$('.qm-4').hide();
//		});

//	   };
//	$scope.load();
//}]);






///* -----------------------------------------------------------------------------
//REFEREES
//----------------------------------------------------------------------------- */	
//angular.module('RoutingApp').controller('refereesController', ['$scope', function ($scope){
//	$scope.load = function() {	
//		var allRadios = document.getElementsByClassName('radio-input');
//        var booRadio;
//        var x = 0;
//        for(x = 0; x < allRadios.length; x++){

//            allRadios[x].onclick = function() {
//                if(booRadio == this){
//                    this.checked = false;
//                    booRadio = null;
//                }else{
//                    booRadio = this;
//                }
//            };
//        }
//				$('.delete2').on('click',function(event){
//			var boton = "button";
//			swal({
//					title: "Are you sure?",
//					text: "You will not be able to recover this referee!",
//					type: "warning",
//					showCancelButton: true,
//					confirmButtonColor: "#DD6B55",
//					confirmButtonText: "Yes",
//					cancelButtonText: "No",
//					closeOnConfirm: false,
//					closeOnCancel: false,
//					animation:false
//				},
//				function(isConfirm) {
//					if (isConfirm) {
//						swal({ title: "Deleted!",text: "",animation: false, type:"success"})
//						$('.referee-template').remove();
//					} else {
//						swal({ title: "Canceled",text: "",animation: false, type:"error"})
//					}
//				}
//			);
//		});
		
//		$("#add-new-referee-form").hide();
//		$("#add-new-referee-btn").click(function () {
//			$("#add-new-referee-form").fadeIn();
//			$(".referee-form-edit").hide();
//			$("#ref-temp--01").show();
//		});
		
//		$("#btn-add-q").click(function () {
//			var value = $('.required-entry1').filter(function () {
//			return this.value === '';
//			});

//			if (value.length == 0) {
//				$("#add-new-referee-form").hide();
//				swal({title: "Saved!",animation: false, type:"success"})
//				$(".confirm").click(function(){
//					window.location.reload();
//				});
//				return true;

//			} else if (value.length > 0) {
//				swal({ title: "",text: "Please fill in all the fields with asterisks next to them.",animation: false, type:"error"})
//				return false;
//			} 
//		});
		
//		$("#cancel-btn-form-2").click(function () {
//			$("#add-new-referee-form").fadeOut();
//			$('input:radio').removeAttr('checked');
//			$('#first_name-r').val('');
//			$('#middle_name-r').val('');
//			$('#last_name-r').val('');
//			$('#phone-l-a-r').val('');
//			$('#phone-l-n-r').val('');
//			$('#phone-l-a2-r').val('');
//			$('#phone-l-n2-r').val('');
//			$('#phone-f-a-r').val('');
//			$('#phone-f-n-r').val('');
//			$('#email-r').val('');
//			$('#referee-company').val('');
//			$('#referee-position').val('');
//			$('#times-to-contact').val('');
//			$('#reporting-relationship').val('');
//		});
		
//		$("div.infoToggler").click(function() {
//			$(this).find('img').toggle();
//			$(this).find('span').toggle();
//		});
	   
//		$('.toggle-p').hide();   
//			$( "div.toggle-icon" ).click(function() {
//			$(this).next().slideToggle();
//		}); 
		
//		$(".referee-form-edit").hide();
//		$('.edit2').click(function() {   
//			$("#ref-temp--01").hide();
//			$(".referee-form-edit").fadeIn();
//			$("#add-new-referee-form").hide();
//		});
		
//		$('#cancel-btn-form1').click(function() {   
//			$("#ref-temp--01").fadeIn();
//			$(".referee-form-edit").hide();
//		});

//		$('#save-btn-form1').click(function() { 
//			var value = $('.required-entry').filter(function () {
//			return this.value === '';
//			});

//			if (value.length == 0) {
//				$("#ref-temp--01").hide();
//				$(".referee-form-edit").fadeIn();
//				$("#add-new-referee-form").hide();
//				swal({title: "Saved!",animation: false, type:"success"})
//				$(".confirm").click(function(){
//					window.location.reload();
//				});
//				return true;

//			} else if (value.length > 0) {
//				swal({ title: "",text: "Please fill in all the fields with asterisks next to them.",animation: false, type:"error"})
//				return false;
//			} 
//		});
		
		
//   };
//   $scope.load();
//}]);

/* -----------------------------------------------------------------------------
  SCROLL TO TOP
----------------------------------------------------------------------------- */
$(window).scroll(function () {
    if ($(this).scrollTop() >= 50) {        // If page is scrolled more than 50px
        $('#return-to-top').fadeIn(200);    // Fade in the arrow
    } else {
        $('#return-to-top').fadeOut(200);   // Else fade out the arrow
    }
});
$('#return-to-top').click(function () {      // When arrow is clicked
    $('body,html').animate({
        scrollTop: 0                       // Scroll to top of body
    }, 500);
});	







