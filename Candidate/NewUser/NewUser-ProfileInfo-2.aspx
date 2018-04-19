<%@ Page Language="vb" MasterPageFile="~/NewUser/NewUser.Master" AutoEventWireup="false" CodeFile="NewUser-ProfileInfo-2.aspx.vb" Inherits="ProfileInfo2" %>
<%@ MasterType VirtualPath="~/NewUser/NewUser.Master" %>
<%@ Reference VirtualPath="~/Portal.Master" %>


<asp:Content ContentPlaceHolderID="NewUserTitle" runat="server">
    <title> JobsOnline Registration - Details </title>
</asp:Content>

<asp:Content ContentPlaceHolderID="NewUserScripts" runat="server">
    <%--<link rel="stylesheet" type="text/css" href="../css/new-user-profile-info.css">--%>
    <script type="text/javascript" src="../js/new-user-form-handler.js"></script>
    <script>
        function pageSave() {
            var checkHidden = $('.visa-cond').attr('style');
            
            if (checkHidden === "") {
                var dateCheck = $('#expDate').val();
                var hoursCheck = $('#workHour').val();
                var restCheck = $('#restrictions').val();
                console.log(hoursCheck)
                if (dateCheck === "" || hoursCheck === "" || restCheck === "") {
                    swal({ title: "", text: "Please fill in visa additional fields.", animation: false, type: "error" })
                    return false;
                }
            }
            saveVisa();
            return true;
        }
        $( function() {            
                $(".datepicker").datepicker("option", "dateFormat", "dd/mm/yy");            
        });
        $(document).ready(function () {
            $("label:contains('English')").parent().find("input").attr("checked", "checked")
            var checkedValue = false;
            $("#category_J input").each(function () {
                var valCheck = $(this).attr('checked');
                if (valCheck) {
                    checkedValue = true;
                } 
            });
            if (!checkedValue){
                $("label:contains('No Clearance')").parent().find("input").attr("checked", "checked")
            }

            var exist = document.getElementById("<%=exist.ClientID %>").value;
            var isNew = document.getElementById("<%=isNewUser.ClientID %>").value;
            var isDirect = document.getElementById("<%=IsDirect.ClientID %>").value;

            var userCounter = document.getElementById("<%=UserCounter.ClientID %>").value;
            var hoursW = document.getElementById("<%=Hours.ClientID %>").value;
            $('#workHour').val(hoursW);
            let original_color = "linear-gradient(-90deg,#2cbdf3,#2f8bf4 )";
            $('#expDate').val(document.getElementById('expDate').defaultValue);
            var next_btn = $(".buttonNext");
            if (exist === "True" ) {
              
            } else {

                if (isNew === "True") {
                    var valuable = 0
                    $('input').each(function () {
                        if ($(this).is(":checked")) { valuable++; } else { }
                    });
                    console.log(valuable)
                    if (valuable > 0) {
                        next_btn.removeAttr("disabled");
                        next_btn.removeAttr("onmouseover");
                        next_btn.css("background", original_color);
                    } else {
                        console.log(valuable)
                        next_btn.css("background", '#aaaaaa');
                        next_btn.attr("disabled", "true");
                        next_btn.attr("onmouseover", "nhpup.popup('Please fill out the form to continue.');");
                    }                                   
                }
            }
            if (parseInt(userCounter) === 4) {
                $(".circle:contains('1')").removeClass("active").addClass("done");
                $(".circle:contains('2')").removeClass("done").addClass("active");
                $(".circle:contains('3')").removeClass("active").addClass("done");
                $(".circle:contains('4')").removeClass("active").removeClass("done");
                $(".circle:contains('5')").removeClass("active").removeClass("done");
                $(".label:contains('5')").parent().parent().removeAttr('href');
                $(".label:contains('6')").parent().parent().removeAttr('href');


            } else if (parseInt(userCounter) === 5) {
                $(".circle:contains('1')").removeClass("active").addClass("done");
                $(".circle:contains('2')").removeClass("done").addClass("active");
                $(".circle:contains('3')").removeClass("active").addClass("done");
                $(".circle:contains('4')").removeClass("active").addClass("done");
                $(".circle:contains('5')").removeClass("active").removeClass("done");
                $(".label:contains('6')").parent().parent().removeAttr('href');


            } else if (parseInt(userCounter) === 6) {
                $(".circle:contains('1')").removeClass("active").addClass("done");
                $(".circle:contains('2')").removeClass("done").addClass("active");
                $(".circle:contains('3')").removeClass("active").addClass("done");
                $(".circle:contains('4')").removeClass("active").addClass("done");
                $(".circle:contains('5')").removeClass("active").addClass("done");

            } else if (parseInt(userCounter) === 5) {
                $(".label:contains('4')").parent().parent().removeAttr('href');
                $(".label:contains('5')").parent().parent().removeAttr('href');

                $(".circle:contains('1')").removeClass("active").addClass("done");
                $(".label:contains('4')").parent().parent().removeAttr('href');
                $(".label:contains('5')").parent().parent().removeAttr('href');
                $(".label:contains('6')").parent().parent().removeAttr('href');


                $(".circle:contains('2')").removeClass("done").addClass("active");
                $(".circle:contains('3')").removeClass("active").removeClass("done");
                $(".circle:contains('4')").removeClass("active").removeClass("done");
                $(".circle:contains('5')").removeClass("active").removeClass("done");
            } else {
                $(".label:contains('3')").parent().parent().removeAttr('href');

                $(".label:contains('4')").parent().parent().removeAttr('href');
                $(".label:contains('5')").parent().parent().removeAttr('href');

                $(".circle:contains('1')").removeClass("active").addClass("done");
                $(".label:contains('4')").parent().parent().removeAttr('href');
                $(".label:contains('5')").parent().parent().removeAttr('href');

                $(".circle:contains('2')").removeClass("done").addClass("active");
                $(".circle:contains('3')").removeClass("active").removeClass("done");
                $(".circle:contains('4')").removeClass("active").removeClass("done");
                $(".circle:contains('5')").removeClass("active").removeClass("done");
                $(".label:contains('6')").parent().parent().removeAttr('href');

            }

            $('.done').each(function () {
                $(this).find('.label').val();
                var lab = $(this).find('.label');
                lab.html('<img src="../img/check-symbol.svg" class="imgTick">');
            });
            });
        $(function() {
            $("#ProfileGroup").attr("name","ProfileGroup");
        });
        
    </script>
    
    <style>
    /*-----------------------------------
     Style ONLY for this page
     -------------------------------------*/
@media screen and (max-width:400px){
    .radio-input-grid__column > input[type="radio"] + label, 
    .radio-input-grid__column > input[type="checkbox"] + label{line-height: 1rem;height: 35px;}
    .radio-input-grid__cw-4, .radio-input-grid__cw-3 {width: 49% !important;}
}
@media screen and (max-width:600px){
    .radio-input-grid__column > input[type="radio"] + label, 
    .radio-input-grid__column > input[type="checkbox"] + label{line-height: 1.2rem;height: 25px;font-size:1.2rem}
    .radio-input-grid__cw-5 {width: 16% !important;}
    .radio-input-grid__cw-2 {width: 49% !important;}
    .radio-input-grid__cw-5{width: 32% !important;}
}
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="NewUserContent" runat="server">  
    <section id="sectionHeadIntro">
        <h3 class="form_title">Tell us about your job search.</h3>
        
      
    </section>
    <div class=" headTitle">
      	<div class="center">
      		<h2 class="x-1 pad_l mrg-t animation-h2 " id="headTitleCenter"><span><img src="../img/icon-s-profiledetails.png" class="colourfulIcon" alt="GI"/></span><span class="colourfulTitle">Profile Details</span></h2>
      	</div>
      	
      </div>
    <form class="new_candidates_onboarding_job_info pad-1 new-user--page2" id="new_candidates_onboarding_job_info" method="POST" runat="server">
        <hr>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    <Scripts><asp:ScriptReference Path="../js/new-user-form-handler.js"/></Scripts></asp:ScriptManager>
        <section>
        
            <asp:HiddenField id="exist"  runat="server"></asp:HiddenField> 
            <asp:hiddenField id="isNewUser"   runat="server"></asp:hiddenField> 	
            <asp:hiddenField id="UserCounter"   runat="server"></asp:hiddenField> 	
            <asp:hiddenField id="Hours"   runat="server"></asp:hiddenField> 	
                        <asp:hiddenField id="IsDirect"   runat="server"></asp:hiddenField> 	

            <asp:Label id="CandProfiles" runat="server">
              
            </asp:Label> 

        </section>
        <section class="xs-text-right">
		    <div class="pad_l">
		     		        <button type="submit" runat="server" class="buttonNext button button--primary saveCity" id="next_btn" onclick="if(!pageSave()) return false;"  onserverclick="next_btn_Click" Text="Continue" >
   	    <span>Continue</span><img src="../img/right-arrow.svg" alt="&#8594"/>
        </button>
  	  		    <!--<button type="submit" name="commit" class="button button button--primary" id="submitButton" data-disable-with="Next">Save and Continue</button>-->
  	  	    </div>
  	  	</section>
    </form>
    <script type="text/javascript">    
        $('.radio-input-grid__row').each(function() {
              var $this = $(this); 
              if ($this.find('.radio-input-grid__column').length == 3) {
                  $this.find('.radio-input-grid__column').addClass('radio-input-grid__cw-3');
              }else if($this.find('.radio-input-grid__column').length == 5) {
                  $this.find('.radio-input-grid__column').addClass('radio-input-grid__cw-5');
              }else if(($this.find('.radio-input-grid__column').length > 8) && ($this.find('.radio-input-grid__column').length < 16)) {
                  $this.find('.radio-input-grid__column').addClass('radio-input-grid__cw-5');
              }else if(($this.find('.radio-input-grid__column label').text().length < 100) && ($this.find('.radio-input-grid__column label').text().length >50) && ($this.find('.radio-input-grid__column').length == 4)) {
                  $this.find('.radio-input-grid__column').removeClass('radio-input-grid__cw-3').addClass('radio-input-grid__cw-2');     
              }else if($this.find('.radio-input-grid__column').length > 3) {
                  $this.find('.radio-input-grid__column').addClass('radio-input-grid__cw-4');
              }
        }); 
        
       var allRadios = document.getElementsByClassName('radio-check');
        var booRadio;
        var x = 0;
        for(x = 0; x < allRadios.length; x++){

            allRadios[x].onclick = function() {
                if(booRadio == this){
                    this.checked = false;
                    booRadio = null;
                }else{
                    booRadio = this;
                }
            };
        }
        //Default No Clearence
        
        // AUCKland Wellington All Areas and New Zealand All Areas
        $('.radio-check').each(function(){ 
        $(this).change(function(){
         //All New Zealand
        if($(this).parent('div').find('label').text() === ' All Areas - New Zealand '){           
             if($(this).parent('div').find('input').is(':checked')){
             $(this).parent('div').find('input').attr('checked', true);
               $(this).parent('div').parent('div').find('input').each(function(){
               if($(this).parent('div').find('label').text() !== ' All Areas - New Zealand '){
                    if(!$(this).is(':checked')){$(this).trigger('click')}
                    }});
             }
            else{
            $(this).parent('div').find('input').attr('checked', false);
            $(this).parent('div').parent('div').find('input').each(function(){
               if($(this).parent('div').find('label').text() !== ' All Areas - New Zealand '){
                    if($(this).is(':checked')){$(this).trigger('click')}
                    }});
            }
        }
        else{
        if($(this).parent('div').find('input').is(':checked')){
            $(this).parent('div').find('input').attr('checked', true);
            
            //Auckland
            if($(this).parent('div').find('label').text() !== ' Auckland - All Areas '){
                if($('label:contains("Auckland - Central")').parent('div').find('input').is(':checked') &&
                $('label:contains("Auckland - East")').parent('div').find('input').is(':checked') &&
                $('label:contains("Auckland - North")').parent('div').find('input').is(':checked') &&
                $('label:contains("Auckland - South")').parent('div').find('input').is(':checked') &&
                $('label:contains("Auckland - West")').parent('div').find('input').is(':checked')){
                    if(!$('label:contains("Auckland - All Areas")').parent('div').find('input').is(':checked'))
                    {
                        $('label:contains("Auckland - All Areas")').parent('div').find('input').trigger('click');
                    }
                }else{
                    if($('label:contains("Auckland - All Areas")').parent('div').find('input').is(':checked'))
                        {
                        $('label:contains("Auckland - All Areas")').parent('div').find('input').trigger('click');
                        }
                    }                
            }
            //Wellington            
            if($(this).parent('div').find('label').text() !== ' Wellington - All Areas '){
                if($('label:contains("Wellington - CBD")').parent('div').find('input').is(':checked') &&
                $('label:contains("Wellington - Lower Hutt")').parent('div').find('input').is(':checked') &&
                $('label:contains("Wellington - Porirua")').parent('div').find('input').is(':checked') &&
                $('label:contains("Wellington - Upper Hutt")').parent('div').find('input').is(':checked')){
               
                    if(!$('label:contains("Wellington - All Areas")').parent('div').find('input').is(':checked'))
                    {
                        $('label:contains("Wellington - All Areas")').parent('div').find('input').trigger('click');
                    }
                }else{
                    if($('label:contains("Wellington - All Areas")').parent('div').find('input').is(':checked'))
                        {
                        $('label:contains("Wellington - All Areas")').parent('div').find('input').trigger('click');
                        }
                    }   
            }
        }else{
                    $(this).parent('div').find('input').attr('checked', false)
                    //New Zealand

                    if($('label:contains("All Areas - New Zealand")').parent('div').find('input').is(':checked')){
                     $('label:contains("All Areas - New Zealand")').parent('div').find('input').trigger('click');
                     }
                    //Auckland
                    if($(this).parent('div').find('label').text() === ' Auckland - Central ' || 
                    $(this).parent('div').find('label').text() === ' Auckland - East ' || 
                    $(this).parent('div').find('label').text() === ' Auckland - North ' || 
                    $(this).parent('div').find('label').text() === ' Auckland - South ' || 
                    $(this).parent('div').find('label').text() === ' Auckland - West '){
                        $('label:contains("Auckland - All Areas")').parent('div').find('input').trigger('click')
                    }
                    //Wellington
                    if($(this).parent('div').find('label').text() === ' Wellington - CBD ' || 
                    $(this).parent('div').find('label').text() === ' Wellington - Lower Hutt ' || 
                    $(this).parent('div').find('label').text() === ' Wellington - Porirua ' || 
                    $(this).parent('div').find('label').text() === ' Wellington - Upper Hutt '){
                        $('label:contains("Wellington - All Areas")').parent('div').find('input').trigger('click')
                    }
             }  }            
            });
        });
      //Auckland
      if($('label:contains("Auckland - All Areas")').parent('div').find('input').is(':checked'))
      {     
            $('label:contains("Auckland - Central")').parent('div').find('input').attr('checked', true);
            $('label:contains("Auckland - East")').parent('div').find('input').attr('checked', true);
            $('label:contains("Auckland - North")').parent('div').find('input').attr('checked', true); 
            $('label:contains("Auckland - South")').parent('div').find('input').attr('checked', true);
            $('label:contains("Auckland - West")').parent('div').find('input').attr('checked', true);
      };
      $('label:contains("Auckland - All Areas")').parent('div').find('input').change(function(){
        if($('label:contains("Auckland - All Areas")').parent('div').find('input').is(':checked')){
            if(!$('label:contains("Auckland - Central")').parent('div').find('input').is(':checked')){
            $('label:contains("Auckland - Central")').parent('div').find('input').trigger('click');}
            if(!$('label:contains("Auckland - East")').parent('div').find('input').is(':checked')){
            $('label:contains("Auckland - East")').parent('div').find('input').trigger('click');}
            if(!$('label:contains("Auckland - North")').parent('div').find('input').is(':checked')){
            $('label:contains("Auckland - North")').parent('div').find('input').trigger('click');}
            if(!$('label:contains("Auckland - South")').parent('div').find('input').is(':checked')){
            $('label:contains("Auckland - South")').parent('div').find('input').trigger('click');}
            if(!$('label:contains("Auckland - West")').parent('div').find('input').is(':checked')){
            $('label:contains("Auckland - West")').parent('div').find('input').trigger('click');}            
      }else{
            if($('label:contains("Auckland - Central")').parent('div').find('input').is(':checked')){
            $('label:contains("Auckland - Central")').parent('div').find('input').trigger('click');}
            if($('label:contains("Auckland - East")').parent('div').find('input').is(':checked')){
            $('label:contains("Auckland - East")').parent('div').find('input').trigger('click');}
            if($('label:contains("Auckland - North")').parent('div').find('input').is(':checked')){
            $('label:contains("Auckland - North")').parent('div').find('input').trigger('click');}
            if($('label:contains("Auckland - South")').parent('div').find('input').is(':checked')){
            $('label:contains("Auckland - South")').parent('div').find('input').trigger('click');}
            if($('label:contains("Auckland - West")').parent('div').find('input').is(':checked')){
            $('label:contains("Auckland - West")').parent('div').find('input').trigger('click');}
      }
      });
      //Wellington
      if($('label:contains("Wellington - All Areas")').parent('div').find('input').is(':checked'))
      {     
            $('label:contains("Wellington - CBD")').parent('div').find('input').attr('checked', true);
            $('label:contains("Wellington - Lower Hutt")').parent('div').find('input').attr('checked', true);
            $('label:contains("Wellington - Porirua")').parent('div').find('input').attr('checked', true); 
            $('label:contains("Wellington - Upper Hutt")').parent('div').find('input').attr('checked', true);
      };
      $('label:contains("Wellington - All Areas")').parent('div').find('input').change(function(){
        if($('label:contains("Wellington - All Areas")').parent('div').find('input').is(':checked')){
            if(!$('label:contains("Wellington - CBD")').parent('div').find('input').is(':checked')){
            $('label:contains("Wellington - CBD")').parent('div').find('input').trigger('click');}
            if(!$('label:contains("Wellington - Lower Hutt")').parent('div').find('input').is(':checked')){
            $('label:contains("Wellington - Lower Hutt")').parent('div').find('input').trigger('click');}
            if(!$('label:contains("Wellington - Porirua")').parent('div').find('input').is(':checked')){
            $('label:contains("Wellington - Porirua")').parent('div').find('input').trigger('click');}
            if(!$('label:contains("Wellington - Upper Hutt")').parent('div').find('input').is(':checked')){
            $('label:contains("Wellington - Upper Hutt")').parent('div').find('input').trigger('click');}
      }else{
            if($('label:contains("Wellington - CBD")').parent('div').find('input').is(':checked')){
            $('label:contains("Wellington - CBD")').parent('div').find('input').trigger('click');}
            if($('label:contains("Wellington - Lower Hutt")').parent('div').find('input').is(':checked')){
            $('label:contains("Wellington - Lower Hutt")').parent('div').find('input').trigger('click');}
            if($('label:contains("Wellington - Porirua")').parent('div').find('input').is(':checked')){
            $('label:contains("Wellington - Porirua")').parent('div').find('input').trigger('click');}
            if($('label:contains("Wellington - Upper Hutt")').parent('div').find('input').is(':checked')){
            $('label:contains("Wellington - Upper Hutt")').parent('div').find('input').trigger('click');}
      }
      });
      //VisaConditions
      $(".visa-cond").hide();
      visaVisibility();
       function visaVisibility(){
//        if($("input:radio[name='A0']").is(":checked")) {
        if($("input:radio[value='{7D35B6D0-0A5E-4127-B212-7005FCE0EF8F}']").is(":checked") || $("input:radio[value='{A38D6CE5-7B11-4193-8598-EC15128AAFBA}']").is(":checked") || 
            $("input:radio[value='{C5296361-A2C3-45F4-AE3A-180DE36B6D1C}']").is(":checked") || $("input:radio[value='{843DC134-49CC-4AF5-9176-C2E3161982F6}']").is(":checked")) {
         $(".visa-cond").show();      
        }else{
        $(".visa-cond").hide();  
        }
       }
    $("input:radio[name='A0']").click(function(){
            visaVisibility();         
        });
        
      function saveVisa() {
             var restrictionsInput = $("#restrictions")
             var restrictions = restrictionsInput.val();
             var expDateInput = $("#expDate");
             var expDate = expDateInput.val();

             var workHourInput = $("#workHour");
             var workHour = workHourInput.val();
             var key = '<%= Session("Username").ToString().ToLower() %>';
             var pageUrl = '<%= ResolveUrl("~/NewUser/NewUser-ProfileInfo-2.aspx/SaveVisa_Click") %>';
             $.ajax({
                type: "POST",
                async: false,
                url: pageUrl,
                data: JSON.stringify({ 'key': key, 'expDate': expDate , 'restrictions': restrictions , 'hours': workHour }),
                dataType: "json",
                contentType: "application/json",
                success: function(response) {
                    console.log(response);
                    return true;
                },
                failure: function(response) {
                    alert("Server Error")
                    console.log(response);
                }
            });
             return true;
        }
        $("input").click(function () {
            let original_color = "linear-gradient(-90deg,#2cbdf3,#2f8bf4 )";
            var next_btn = $(".buttonNext");
            console.log($("#aspnetForm input:checkbox:checked").length)
            console.log($("#aspnetForm input:radio:checked").length)
            if ($("#aspnetForm input:checkbox:checked").length === 0 && $("#aspnetForm input:radio:checked").length === 0) {
                
                next_btn.css("background", '#aaaaaa');
                next_btn.attr("disabled", "true");
                next_btn.attr("onmouseover", "nhpup.popup('Please fill out the form to continue.');");
            } else {
                next_btn.removeAttr("disabled");
                next_btn.removeAttr("onmouseover");
                next_btn.css("background", original_color);
            }
        });
        
    </script>
</asp:Content>
