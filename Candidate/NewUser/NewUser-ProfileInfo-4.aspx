<%@ Page Language="vb" MasterPageFile="~/NewUser/NewUser.Master" AutoEventWireup="false" CodeFile="NewUser-ProfileInfo-4.aspx.vb" Inherits="ProfileInfo4" %>
<%@ MasterType VirtualPath="~/NewUser/NewUser.Master" %>
<%@ Reference VirtualPath="~/Portal.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NewUserTitle" runat="server">
    <title> JobsOnline Registration - Skills </title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="NewUserScripts" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/3and4p.css">
    <style>
    /*-----------------------------------
     Style ONLY for this page
     -------------------------------------*/
    /*.radio-input-grid__column > input[type="radio"] + label, 
    .radio-input-grid__column > input[type="checkbox"] + label{line-height: 1.2rem;height: 25px;}*/
@media screen and (max-width:400px)
    {.radio-input-grid__column > input[type="radio"] + label, 
    .radio-input-grid__column > input[type="checkbox"] + label{line-height: 1rem;height: 35px;}
    .radio-input-grid__cw-4, .radio-input-grid__cw-3 {width: 49% !important;}
}

    </style>
     
    <script type="text/javascript"> 
        $(document).ready(function () {
            var linkSaved = $(".label:contains('5')").parent().parent().attr("href");
            var exist = document.getElementById("<%=exist.ClientID %>").value;
            var isNew = document.getElementById("<%=isNewUser.ClientID %>").value;
            var isDirect = document.getElementById("<%=IsDirect.ClientID %>").value;

            if (exist === "True" || isDirect === "True") {

            } else {
                if (isNew === "True") {
                var valuable  = 0
                var next_btn = $(".buttonNext");
                $('input[type="checkbox"]').each(function(){
                    if($(this).is( ":checked" )){
                        valuable++;
                        }
                });

                console.log("value:" + valuable);
                let original_color = "linear-gradient(-90deg,#2cbdf3,#2f8bf4 );";
                if (valuable > 0) {
                    next_btn.removeAttr("disabled");
                    next_btn.removeAttr("onmouseover");
                    next_btn.css("backgroundColor", original_color);
                    $(".label:contains('5')").parent().parent().attr("href", linkSaved);
                } else {
                    $(".label:contains('5')").parent().parent().removeAttr("href");

                    next_btn.attr("disabled", "true");
                    next_btn.attr("onmouseover", "nhpup.popup('Please fill out the form to continue.');");
                }
                $('input').change(function () {
                    if ($(this).is(":checked")) { valuable++; } else { valuable = valuable - 1; }
                    if (valuable > 0) {
                        next_btn.removeAttr("disabled");
                        next_btn.removeAttr("onmouseover");
                        next_btn.css("background", original_color);
                        $(".label:contains('5')").parent().parent().attr("href", linkSaved);

                    } else {
                        $(".label:contains('5')").parent().parent().removeAttr("href");

                        next_btn.css("background", '#aaaaaa');
                        next_btn.attr("disabled", "true");
                        next_btn.attr("onmouseover", "nhpup.popup('Please fill out the form to continue.');");
                    }
                });
                }
            }
            $('.done').each(function () {
                $(this).find('.label').val();
                var lab = $(this).find('.label');
                lab.html('<img src="../img/check-symbol.svg" class="imgTick">');
            });
            });
            </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="NewUserContent" runat="server">
    
 
    <section id="sectionHeadIntroOneLine">
        <h3 class="form_title">Tell us about your skills.</h3>
    </section>
    <div class=" headTitle">
      	<div class="center">
      		<h2 class="x-1 pad_l mrg-t animation-h2 " id="headTitleCenter"><span><img src="../img/icon-s-skills.png" class="WRolesIcon" alt="GI"/></span><span class="colourfulTitle">Your skills</span></h2>
      	</div>
        </div>
    <form class="new_candidates_onboarding_job_info pad-1 new-user--page3" id="new_candidates_onboarding_job_info" method="POST" runat="server">
        <hr>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    <Scripts><asp:ScriptReference Path="../js/new-user-form-handler.js"/></Scripts></asp:ScriptManager>
        <section>
            <div id="skill-name">
                <h2 class="req h2-17 center">Select categories to add your skills</h2>
               <br />
            </div>
            <div id="skill-list">
                <asp:Label id="candSkillValues" runat="server">
                </asp:Label>
                <h2 class="h2-17" style="margin-top:1rem;">Summary:</h2><br />

                <div id="summary" class="skills-pill color-skills display-inline"></div>
            </div>
        </section>
        <%--<hr> --%>
        <section class="xs-text-right">
		    <div class="pad_l">
            <asp:HiddenField id="exist"  runat="server"></asp:HiddenField> 
		    <asp:hiddenField id="isNewUser"   runat="server"> </asp:hiddenField>
            <asp:hiddenField id="UserCounter"   runat="server"></asp:hiddenField> 
                                                <asp:hiddenField id="IsDirect"   runat="server"></asp:hiddenField> 	
<button type="submit" runat="server" class="buttonNext button button--primary saveCity" id="next_btn"  onserverclick="next_btn_Click" Text="Continue" >
   	    <span>Continue</span><img src="../img/right-arrow.svg" alt="&#8594"/>
        </button>
		    </div>
  	  	</section>
    </form>
    
        <script>
        /*-----------------------------------
        ACTIVE NAV
        -------------------------------------*/
            var userCounter = document.getElementById("<%=UserCounter.ClientID %>").value;

            if (parseInt(userCounter) === 5) {
                $(".circle:contains('6')").removeClass("active").removeClass("done");

                $(".label:contains('5')").parent().parent().removeAttr('href');
                $(".label:contains('6')").parent().parent().removeAttr('href');
            } else if (parseInt(userCounter) === 6) {
                $(".circle:contains('5')").removeClass("active").addClass("done");

                $(".circle:contains('6')").removeClass("active").removeClass("done");
                
            }
        $(".circle:contains('1')").removeClass("active").addClass("done");
        $(".circle:contains('1')").next().addClass("done");
        $(".circle:contains('2')").removeClass("active").addClass("done");
        $(".circle:contains('4')").prev().addClass("done");
        $(".circle:contains('3')").prev().addClass("done");
        $(".circle:contains('3')").addClass("done");
        $(".circle:contains('4')").prev().addClass("done");
        $(".circle:contains('4')").addClass("active");     
        /*-----------------------------------
        STYLE CHECKBOXES
        -------------------------------------*/
        $('.radio-input-grid__row').each(function() {
              var $this = $(this); 
              if($this.find('.radio-input-grid__column').length > 3) {
                  $this.find('.radio-input-grid__column').addClass('radio-input-grid__cw-4');
              }
        }); 
         /*-----------------------------------
        TOGGLE ONLY ONE DIV
        -------------------------------------*/
         $('.dropMenu--header').click(function (){
             var notThisOne = $(this).parent();
             $(".dropMenu").each(function() {
                  if ($(this).attr("id") !== notThisOne.attr("id")) {  
                      $(this).find(".details").slideUp("slow");
                      $(this).find(".img-dropMenu").toggleClass("rotate").not(this).removeClass("rotate2");
                  } else {
                    $(this).find(".details").slideToggle("slow"); 
                    $(this).find(".img-dropMenu").toggleClass("rotate2");               
                  }   
             }); 
            });

            $(".dropMenu--header").click(function () {
                var currentColor = $(this).css("background-color");
                var activeColor = 'rgb(46, 129, 138)'
                if (currentColor === activeColor) {

                    $(this).css("background-color", "rgba(65, 61, 52)");
                } else {
                    $(".dropMenu--header").each(function () {
                        $(this).css("background-color", "rgba(65, 61, 52)");
                    });
                    $(this).css("background-color", activeColor);
                }
            });
            $("input").click(function () {
                let original_color = "linear-gradient(-90deg,#2cbdf3,#2f8bf4 )";
                var next_btn = $(".buttonNext");
                if ($("#aspnetForm input:checkbox:checked").length === 0) {
                    next_btn.css("background", '#aaaaaa');
                    next_btn.attr("disabled", "true");
                    next_btn.attr("onmouseover", "nhpup.popup('Please fill out the form to continue.');");
                } else {
                    next_btn.removeAttr("disabled");
                    next_btn.removeAttr("onmouseover");
                    next_btn.css("background", original_color);
                }
                var checked = $(this).is(":checked");
                var name = $($($(this).parent()[0]).find(".centerLabel"))[0].innerHTML;
                if (checked) {

                    $("#summary").append("<span class='summSpan'>" + name + "</span>");
                } else {
                    $(".summSpan").remove(":contains('" + name + "')");
                }
            });
            $(".radio-check").each(function () {

                var checked = $(this).is(":checked");

                if (checked) {
                    var name = $($($(this).parent()[0]).find(".centerLabel"))[0].innerHTML;
                    $("#summary").append("<span class='summSpan'>" + name + "</span>");
                }
            });
    </script>
</asp:Content>