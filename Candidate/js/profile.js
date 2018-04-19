/* -----------------------------------------------------------------------------
Notification
----------------------------------------------------------------------------- */
	
$(function () {
    $('#notification-close').click(function(){
		$('.notification').hide();
		$('#notification-mt').hide();
	});
});

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
Toggle
----------------------------------------------------------------------------- */

		$("div.infoToggler").click(function() {
			$(this).find('img').toggle();
			$(this).find('span').toggle();
		});

		$('.toggle-p').hide();   
		//	$( "div.toggle-icon" ).click(function() {
		//	$(this).next().slideToggle();
		//});
		

/* -----------------------------------------------------------------------------
MENU
----------------------------------------------------------------------------- */

	$('#nav-icon2').click(function(){
		$(this).toggleClass('open');
		$('#nav--header ul').slideToggle();
		$('.background-menu--open').toggleClass("m2m");
	});
	
	$("div.infoToggler2").click(function() {
			$(this).find('img').toggle();
			$('.profile-navigation__nav').slideToggle();

		});

		  
		$( "div.toggle-icon2" ).click(function() {
			$(this).next().slideToggle();
		});
		

/* -----------------------------------------------------------------------------
FORM
----------------------------------------------------------------------------- */
$('.button-action').on("click", function(){
    $('.form-hidden').slideToggle();
    $('.hidethisform').hide();
});

$('.button-toggle').on("click", function(){
    $('.hidethisform').slideToggle();
    $('.form-hidden').hide();
});

$( function() {
    $( ".datepicker" ).datepicker();
} );

$(".add-available-period").click(function() {
	$(".added-fields-container").append('<div class="remove"><div ng-app="DatePicker" style="margin-top:4.5rem"><div class="deleteMe3">x</div><label class="req">Start Date</label><input type="text" class="datepicker start-date required-entry"/><label class="req">End Date</label><input type="text" class="datepicker end-date required-entry"/><label class="req">Comment</label><textarea size=25 type="text" class="comment-availability required-entry" /></textarea></div></div>');
    $( ".datepicker" ).datepicker({ dateFormat: 'dd-mm-yy' });
});
$(document).on("click",".deleteMe3", function(){
    $(this).closest(".remove").remove();
});

	   $('#save-dates-btn').click(function() { 
		   var value = $('.required-entry').filter(function () {
				return this.value === '';
			  });
			  if (value.length == 0) {
				  swal({title: "", text:"Your request has been submitted!", animation: false, type:"success"})
				  $(".confirm").click(function(){
					  window.location.reload();
				  });
				  $('#availability-form').hide();
			  } else if (value.length > 0) {
				  swal({title: "", text:"Please fill in all the fields.", animation: false, type:"error"})
				  $('#availability-form').show();
			  }

		   
	   }); 

	   $('#cancel-dates-btn').click(function() {     
		   $('.datepicker').val('');
		   $('.comment-availability').val('');
		   $(".remove").remove();
		   $(".resp").hide();
		   $('.form-hidden').hide();
	   });


