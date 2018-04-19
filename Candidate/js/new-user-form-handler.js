$(function () {
    $(".datepicker").datepicker();
});

var currentBoxNumber = 0;
$(".inp--width").keyup(function (event) {
    if (event.keyCode == 13) {
        textboxes = $("input.inp--width");
        currentBoxNumber = textboxes.index(this);
        console.log(textboxes.index(this));
        if (textboxes[currentBoxNumber + 1] != null) {
            nextBox = textboxes[currentBoxNumber + 1];
            nextBox.focus();
            nextBox.select();
            event.preventDefault();
            return false;
        }
    }
});

/* -----------------------------------------------------------------------------
MENU
----------------------------------------------------------------------------- */
$('#nav-icon2').click(function () {
    $(this).toggleClass('open');
    $('#nav--header ul').slideToggle();
    //$('.background-menu--open').toggleClass("m2m");
});

$("div.infoToggler").click(function () {
    $(this).find('img').toggle();
    $('.profile-navigation__nav').slideToggle();

});


$("div.toggle-icon").click(function () {
    $(this).next().slideToggle();
});

$('.div1').show();
/*----------------------------------------------------------------------
Show country and related divs - p2

if($('#nz').is(':checked')) { 
	 $('.div1').show();
}
if($('#Australia').is(':checked')) { 
	 $('.div2').show();
}
if($('#UK').is(':checked')) { 
	 $('.div3').show();
}
if($('#USA').is(':checked')) { 
	 $('.div4').show();
}

$('.country').click(function () {
    $('.work-status').hide();
    $('.' + $(this).data("divclass")).show();
});


-----------------------------------------------------------------------*/


/*----------------------------------------------------------------------
Show work category - p3
-----------------------------------------------------------------------*/

function evaluate() {
    var item = $(this);
    var relatedItem = $("." + item.attr("data-related-item")).parent();

    if (item.is(":checked")) {
        relatedItem.fadeIn();
    } else {
        relatedItem.fadeOut();
    }

}
//$('input[type="checkbox"]').click(evaluate).each(evaluate);	

/*----------------------------------------------------------------------
Checkbox radio
-----------------------------------------------------------------------*/

//$("input:checkbox").on('click', function() {
//  var $box = $(this);
//  if ($box.is(":checked")) {
//	var group = "input:checkbox[name='" + $box.attr("name") + "']";
//	//$(group).prop("checked", false);
//	$box.prop("checked", true);
//  } else {
//	$box.prop("checked", false);
//  }
//});	


/*----------------------------------------------------------------------
Checkbox radio
-----------------------------------------------------------------------*/
$(document).scroll(function () {
    var y = $(this).scrollTop();
    if (y > 700) {
        $('.emergency-contact').fadeIn(800);
        $('.work-email-phone').fadeIn(1000);

    } else {
        $('.emergency-contact').fadeOut();
        $('.work-email-phone').fadeIn(800);
    }

});

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



/* -----------------------------------------------------------------------------
  ADD REFEREES btn
----------------------------------------------------------------------------- */
var referees = 0;
var nextRowID = 0;
function add_fields() {
    referees++;
    var objTo = document.getElementById('referees_fileds')
    var divtest = document.createElement("div");
    var id1 = ++nextRowID;
    divtest.innerHTML = '<div class="remove"><div class="deleteMe">x</div><div class="add-referees-form m-b" style="overflow: hidden;padding-bottom: 2rem;"><h2 style="font-size: 1.7rem;" class="pad_l m-b center">Referee Details</h2><div class="layout layout--middle pnn1"><div class="layout__item pad_l"><div class="radio-input-grid__parent"><div class="radio-input-grid"><div class=" radio-input-grid__row"><div class="radio-input-grid__column"><input class="radio-input" value="currently_interviewing" name="name_title" id="mr' + id1 + '" type="radio"><label for="mr' + id1 + '">Mr </label></div><div class="radio-input-grid__column"><input class="radio-input" name="name_title" id="dr' + id1 + '" type="radio"><label for="dr' + id1 + '">Dr </label></div><div class="radio-input-grid__column"><input class="radio-input" name="name_title" id="mrs' + id1 + '" type="radio"><label for="mrs' + id1 + '">Mrs </label></div> <div class="radio-input-grid__column"><input class="radio-input" name="name_title" id="ms' + id1 + '" type="radio"><label for="ms' + id1 + '">Ms </label></div><div class="radio-input-grid__column"><input class="radio-input" name="name_title" id="miss' + id1 + '" type="radio"><label for="miss' + id1 + '">Miss </label></div></div></div></div></div></div><div class="layout layout--middle pnn1 pad_l"><div class="layout__item sm-1of3"><div class="layout__item"><label class="a--pseudo req" for="first_name-r' + id1 + '">First Name</label><input type="text" class="main-f required-entry1" id="first_name-r' + id1 + '" maxlength="20" /></div></div><div class="layout__item sm-1of3"><div class="layout__item"><label class="a--pseudo" for="middle_name-r' + id1 + '">Middle Name</label><input type="text" class="main-f" id="middle_name-r' + id1 + '" maxlength="20" /></div></div><div class="layout__item sm-1of3"><div class="layout__item"><label class="a--pseudo req" for="last_name-r' + id1 + '">Last Name</label><input type="text" id="last_name-r' + id1 + '" class="main-f required-entry1" maxlength="20"/></div></div></div><div class="layout layout--middle pnn1 pad_l"><div class="layout__item sm-1of2"><div class="layout__item w"><label class="a--pseudo" for="phone-l-a-r' + id1 + '">Landline Phone</label><div class="w"><input id="phone-l-a-r' + id1 + '" class="w-xs inp--width" maxlength="8" type="text" placeholder="Area"><input id="phone-l-n-r' + id1 + '" class="w-xl inp--width" maxlength="20" type="text" placeholder="Number"></div></div></div><div class="layout__item sm-1of2 fr"><div class="layout__item w"><label class="a--pseudo req" for="phone-l-a2-r' + id1 + '">Mobile Phone</label><div class="w"><input maxlength="8" id="phone-l-a2-r' + id1 + '" class="w-xs inp--width required-entry1" type="text" placeholder="Area"><input maxlength="20" id="phone-l-n2-r' + id1 + '" class="w-xl inp--width required-entry1" type="text" placeholder="Number"></div></div></div></div><div class="layout layout--middle pnn1 pad_l"><div class="layout__item sm-1of2"><div class="layout__item w" style="float: left;"><label class="a--pseudo" for="phone-f-a-r' + id1 + '">Fax</label><div class="w"><input id="phone-f-a-r' + id1 + '" class="w-xs inp--width" maxlength="8" type="text" placeholder="Area"><input id="phone-f-n-r' + id1 + '" class="w-xl inp--width" maxlength="20" type="text" placeholder="Number"></div></div></div><div class="layout__item sm-1of2 fr"><label class="a--pseudo req w" for="email-r' + id1 + '">Personal Email</label><input id="email-r' + id1 + '" class="w-xxl required-entry1" maxlength="50" type="text"></div>	</div><div class="layout layout--middle pnn1 pad_l"><div class="layout__item sm-1of2"><label class="a--pseudo req w" for="referee-company' + id1 + '">Referee Company</label><input id="referee-company' + id1 + '" class="w-xxl required-entry1" maxlength="50" type="text"></div><div class="layout__item sm-1of2 fr"><label class="a--pseudo req w" for="referee-position' + id1 + '">Referee Position</label><input id="referee-position' + id1 + '" class="w-xxl required-entry1" maxlength="50" type="text"></div><div class="layout__item sm-1of2 fr"><label class="a--pseudo w" for="reporting-relationship' + id1 + '">Reporting Relationship</label><input id="reporting-relationship' + id1 + '" class="w-xxl" maxlength="50" type="text"></div><div class="layout__item sm-1of2"><label class="a--pseudo w" for="times-to-contact' + id1 + '">Times to Contact</label><input id="times-to-contact' + id1 + '" class="w-xxl" maxlength="50" type="text"></div><button class="save-referee" hidden>Save</button></div></div>';

    objTo.appendChild(divtest);
}

$(document).on("click", ".deleteMe", function () {
    $(this).closest(".remove").remove();
    referees--;
});


/* -----------------------------------------------------------------------------
  ADD COMPANY btn
----------------------------------------------------------------------------- */
var company = 0;
var nextRowID = 0;
function add_company_fields() {
    var id = ++nextRowID;
    company++;
    var objTo = document.getElementById('company_fileds')
    var divtest = document.createElement("div");
    divtest.innerHTML = '<div class="remove"><div class="deleteMe2">x</div><div class="add-company-form m-b" style="overflow: hidden;padding-bottom: 2rem;"><h2 style="font-size: 1.7rem;" class="pad_l m-b center"></h2><div class="layout layout--middle pnn1"><div class="layout__item pad_l w"><label class="a--pseudo req w" for="name-of-contact' + id + '">Name of Contact</label><input runat="server" name="nameOfContact' + id + '" id="name_of_contact' + id + '" maxlength="50" class="w-xxl required-entry2" type="text"></div><div class="layout__item pad_l w"><label class="a--pseudo req w" for="contacts-position' + id + '">Contacts Position</label><input id="contacts-position' + id + '" class="w-xxl required-entry2" maxlength="50" type="text"></div><div class="layout__item pad_l w"><label class="a--pseudo req w" for="company-name' + id + '">Company Name</label><input id="company-name' + id + '" class="w-xxl required-entry2" maxlength="50" type="text"></div></div></div></div>';
    objTo.appendChild(divtest);
}


$(document).on("click", ".deleteMe2", function () {
    $(this).closest(".remove").remove();
    company--;
});

$('.med-cond-explanation').hide();
$('.criminal-rec-explanation').hide();
$(document).on("click", "#yes_med", function () {
    $('.med-cond-explanation').show();
});

$(document).on("click", "#no_med", function () {
    $('.med-cond-explanation').hide();
});

$(document).on("click", "#yes_criminal", function () {
    $('.criminal-rec-explanation').show();
});

$(document).on("click", "#no_criminal", function () {
    $('.criminal-rec-explanation').hide();
});


/* -----------------------------------------------------------------------------
  FORM VALIDATION
  
  1. page New User - Profile Info 1.html
  2. page New User - Profile Info 2.html
  3. page New User - Profile Info 3.html
  4. page New User - Profile Info 4.html
  5. page New User - Profile Info 5.html
  
----------------------------------------------------------------------------- */


/* -----------------------------------------------------------------------------
  1. page New User - Profile Info 1.html
----------------------------------------------------------------------------- */


//$('input:submit').click(function () {

//    if (this.classList.contains("updateReferee") || this.classList.contains("removeReferee") || this.classList.contains("removeCompany") || this.classList.contains("updateCompany")) {

//    } else if (this.classList.contains("save-referee")) {
//        var value = $('.required-entryr').filter(function () {
//            return this.value === '';
//        });

//        if (value.length == 0) {
//            return true;

//        } else if (value.length > 0) {
//            swal({ title: "", text: "Please fill in all the fields with asterisks next to them.", animation: false, type: "error" })
//            return false;
//        }
//    } else if (this.classList.contains("save-company")) {
//        var value = $('.required-entryc').filter(function () {
//            return this.value === '';
//        });

//        if (value.length == 0) {
//            return true;

//        } else if (value.length > 0) {
//            swal({ title: "", text: "Please fill in all the fields with asterisks next to them.", animation: false, type: "error" })
//            return false;
//        }
//    }
//    else if (this.classList.contains("save-profile")) {
//        console.log("ssss");
//    }
//    else {

//        var value = $('.required-entry').filter(function () {
//            return this.value === '';
//        });

//        if (value.length == 0) {
//            return true;

//        } else if (value.length > 0) {
//            swal({ title: "", text: "Please fill in all the fields with asterisks next to them. (ONLY FIRST AND LAST NAMES--!TEST!)", animation: false, type: "error" })
//            return false;
//        }
//    }
//});


/* -----------------------------------------------------------------------------
  2. page New User - Profile Info 2.html
----------------------------------------------------------------------------- */

$("#tab-areas #all-areas-nz").click(function () {
    if ($("#tab-areas #all-areas-nz").is(':checked')) {
        $("#tab-areas input[type=checkbox]").each(function () {
            $(this).prop("checked", true);
        });

    } else {
        $("#tab-areas input[type=checkbox]").each(function () {
            $(this).prop("checked", false);
        });
    }
});

$("#tab-areas #all-areas-ni").click(function () {
    if ($("#tab-areas #all-areas-ni").is(':checked')) {
        $('input[id=all-areas-ni]').prop("checked", true);
        $('input[id=auck-all]').prop("checked", true);
        $('input[id=auck-all]').prop("checked", true);
        $('input[id=auck-cen]').prop("checked", true);
        $('input[id=auck-east]').prop("checked", true);
        $('input[id=auck-north]').prop("checked", true);
        $('input[id=auck-south]').prop("checked", true);
        $('input[id=auck-west]').prop("checked", true);
        $('input[id=ham]').prop("checked", true);
        $('input[id=nplth]').prop("checked", true);
        $('input[id=palm]').prop("checked", true);
        $('input[id=rot]').prop("checked", true);
        $('input[id=taur]').prop("checked", true);
        $('input[id=well-all]').prop("checked", true);
        $('input[id=well-cbd]').prop("checked", true);
        $('input[id=well-l-h]').prop("checked", true);
        $('input[id=well-por]').prop("checked", true);
        $('input[id=well-u-h]').prop("checked", true);
        $('input[id=whan]').prop("checked", true);

    } else {
        $("#tab-areas #all-areas-ni").each(function () {
            $('#all-areas-ni').prop("checked", false);
            $('input[id=auck-all]').prop("checked", false);
            $('input[id=auck-all]').prop("checked", false);
            $('input[id=auck-cen]').prop("checked", false);
            $('input[id=auck-east]').prop("checked", false);
            $('input[id=auck-north]').prop("checked", false);
            $('input[id=auck-south]').prop("checked", false);
            $('input[id=auck-west]').prop("checked", false);
            $('input[id=ham]').prop("checked", false);
            $('input[id=nplth]').prop("checked", false);
            $('input[id=palm]').prop("checked", false);
            $('input[id=rot]').prop("checked", false);
            $('input[id=taur]').prop("checked", false);
            $('input[id=well-all]').prop("checked", false);
            $('input[id=well-cbd]').prop("checked", false);
            $('input[id=well-l-h]').prop("checked", false);
            $('input[id=well-por]').prop("checked", false);
            $('input[id=well-u-h]').prop("checked", false);
            $('input[id=whan]').prop("checked", false);
        });
    }
});

$("#tab-areas #all-areas-si").click(function () {
    if ($("#tab-areas #all-areas-si").is(':checked')) {
        $('input[id=dun]').prop("checked", true);
        $('input[id=chris]').prop("checked", true);
        $('input[id=nel]').prop("checked", true);

    } else {
        $("#tab-areas #all-areas-si").each(function () {
            $('#all-areas-si').prop("checked", false);
            $('input[id=dun]').prop("checked", false);
            $('input[id=chris]').prop("checked", false);
            $('input[id=nel]').prop("checked", false);
        });
    }
});

$("#tab-areas #auck-all").click(function () {
    if ($("#tab-areas #auck-all").is(':checked')) {
        $('input[id=auck-cen]').prop("checked", true);
        $('input[id=auck-east]').prop("checked", true);
        $('input[id=auck-north]').prop("checked", true);
        $('input[id=auck-south]').prop("checked", true);
        $('input[id=auck-west]').prop("checked", true);

    } else {
        $("#tab-areas #auck-all").each(function () {
            $('#auck-all').prop("checked", false);
            $('input[id=auck-cen]').prop("checked", false);
            $('input[id=auck-east]').prop("checked", false);
            $('input[id=auck-north]').prop("checked", false);
            $('input[id=auck-south]').prop("checked", false);
            $('input[id=auck-west]').prop("checked", false);
        });
    }
});

$("#tab-areas #well-all").click(function () {
    if ($("#tab-areas #well-all").is(':checked')) {
        $('input[id=well-cbd]').prop("checked", true);
        $('input[id=well-l-h]').prop("checked", true);
        $('input[id=well-por]').prop("checked", true);
        $('input[id=well-u-h]').prop("checked", true);

    } else {
        $("#tab-areas #well-all").each(function () {
            $('#well-all').prop("checked", false);
            $('input[id=well-cbd]').prop("checked", false);
            $('input[id=well-l-h]').prop("checked", false);
            $('input[id=well-por]').prop("checked", false);
            $('input[id=well-u-h]').prop("checked", false);
        });
    }
});

function termos() {
    var workhours = $("#work-hours input:checked").length > 0;
    var emptype = $("#emp-type input:checked").length > 0;
    var tabareas = $("#tab-areas input:checked").length > 0;
    var aboutus = $("#about-us")[0].selectedIndex >= 1;
    var workstat = $("input[name='workstat']:checked").val();
    if (workhours && emptype && aboutus && tabareas && workstat) {
        return 1;
    }
}

$('#submitButton').click(function () {
    if (termos() == 1) {
        return true;
    } else {
        swal({ title: "", text: "Please fill in all the fields with asterisks next to them.", animation: false, type: "error" })
        return false;
    }
});


/* -----------------------------------------------------------------------------
  3. page New User - Profile Info 3.html
----------------------------------------------------------------------------- */
function areas() {
    var areas = $("#areas-of-interest input:checked").length > 0;
    var skills = $("#skills input:checked").length > 0;

    if (areas && skills) {
        return 1;
    }
}

$('#submitButton2').click(function () {

    if (areas() == 1) {
    } else {
        swal({ title: "", text: "Please fill in all the fields with asterisks next to them.", animation: false, type: "error" })
        return false;
    }

});

/* -----------------------------------------------------------------------------
  4. page New User - Profile Info 4.html
----------------------------------------------------------------------------- */
function skillspage() {
    var skillsname = $("#skill-name input:checked").length > 0;
    var skillslist = $("#skills-list input:checked").length > 0;

    if (skillsname && skillslist) {
        return 1;
    }
}

$('#submitButton3').click(function () {

    if (skillspage() == 1) {
    } else {
        swal({ title: "", text: "Please fill in all the fields with asterisks next to them.", animation: false, type: "error" })
        return false;
    }

});



/* -----------------------------------------------------------------------------
  5. page New User - Profile Info 5.html
----------------------------------------------------------------------------- */
function test() {
    var value11 = $('.required-entry1').filter(function () {
        return this.value === '';
    });
    var value22 = $('.required-entry2').filter(function () {
        return this.value === '';
    });

    var medical = $("#medical input:checked").length > 0;
    var criminal = $("#criminal input:checked").length > 0;
    var refereesnumber = $('#referees_fileds .remove').length > 1;
    var yesmed = $('#yes_med').is(':checked');
    var yescriminal = $('#yes_criminal').is(':checked');
    var nomed = $('#no_med').is(':checked');
    var nocriminal = $('#no_criminal').is(':checked');
    var commentmed = $('#comment_med').val();
    var commentcriminal = $('#comment_criminal').val();

    if (((value11.length == 0) && (value22.length == 0) && medical && criminal && refereesnumber && yesmed && commentmed && yescriminal && commentcriminal) || ((value11.length == 0) && (value22.length == 0) && medical && criminal && refereesnumber && nomed && nocriminal) || ((value11.length == 0) && (value22.length == 0) && medical && criminal && refereesnumber && yesmed && commentmed && nocriminal) || ((value11.length == 0) && (value22.length == 0) && medical && criminal && refereesnumber && nomed && yescriminal && commentcriminal)) {
        return 1;
    }
}

$('#no_med').click(function () {
    $('.comment_med').val('');
});

$('#no_criminal').click(function () {
    $('#comment_criminal').val('');
});

$('#submitButton4').click(function () {

    if (test() == 1) {
        return true;
    } else {
        swal({ title: "", text: "Please fill in all the fields with asterisks next to them.", animation: false, type: "error" })
        return false;
    }

});

//LOGOUT
$('#logout').click(function () {
    PageMethods.Logout_Click(onSucess, onError);
    function onSucess(result) {
    }
    function onError(error) {
        console.log(error);
        console.log("Error: " + error.get_message());
    }
})