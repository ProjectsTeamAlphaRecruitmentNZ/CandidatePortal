<%@ Page Language="vb" MasterPageFile="~/NewUser/NewUser.Master" AutoEventWireup="false" EnableEventValidation="false" CodeFile="NewUser-ProfileInfo-5.aspx.vb" Inherits="ProfileInfo5" %>
<%@ Register TagPrefix="RF" TagName="RefereeForm" Src="~/NewUser/RefereeControls.ascx" %>
<%@ Register TagPrefix="RF" TagName="RefereeForms" Src="~/NewUser/Controls/RefereesControls.ascx" %>
<%@ Register TagPrefix="RF" TagName="CompanyForm" Src="~/NewUser/CompanyControls.ascx" %>
<%@ Register TagPrefix="RF" TagName="CompanyForms" Src="~/NewUser/Controls/AgenciesControls.ascx" %>
<%@ Register TagPrefix="QF" TagName="QualificationForm" Src="~/NewUser/QualificationControls.ascx" %>
<%@ Register TagPrefix="QF" TagName="QualificationsForm" Src="~/NewUser/Controls/QualificationsControls.ascx" %>
<%@ MasterType VirtualPath="~/NewUser/NewUser.Master" %>
<%@ Reference VirtualPath="~/Portal.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="NewUserTitle" runat="server">
    <title> JobsOnline Registration - Referees </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NewUserScripts" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/new-user-profile-info.css">
    <script src="../js/yearPicker.js"></script>
        <script>
            $(function () {
                $(".datepicker").datepicker({ dateFormat: 'dd/mm/yy' })
            });
           
            $('#new_candidates_onboarding_job_info').on('keyup keypress', function (e) {
                var keyCode = e.keyCode || e.which;
                if (keyCode === 13) {
                    e.preventDefault();
                    return false;
                }
            });
    
        function handleFileSelect(evt) {
            var files = evt.target.files; // FileList object

            // files is a FileList of File objects. List some properties.
            var output = [];
            for (var i = 0, f; f = files[i]; i++) {
                output.push('<li><strong>', escape(f.name), '</strong> (', f.type || 'n/a', ') - ',
                    f.size, ' bytes, last modified: ',
                    f.lastModifiedDate ? f.lastModifiedDate.toLocaleDateString() : 'n/a',
                    '</li>');
            }
            document.getElementById('list').innerHTML = '<ul>' + output.join('') + '</ul>';
        }
        //document.getElementById('files').addEventListener('change', handleFileSelect, false);

        function ValidateEmailId(email, input) {
                
            var value = email;
            var atposition = value.indexOf("@");
            var dotposition = value.lastIndexOf(".");              
            if (atposition < 1 || dotposition < atposition + 2 || dotposition + 2 >= value.length) {

                input.css("border-color","red");
                swal({
                    title: "",
                    text: 'Please enter a valid e-mail address.',
                    type: 'error',
                    closeOnConfirm: false,
                    animation: false
                });
                return false;
            } else {
                return true; 
            }
            }
            $(document).ready(function () {
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
        <h3 class="form_title">Last Step</h3>  
          <p class="form_subtitle">We just need a few more details then you’re done!</p> 
    </section>
    <form class="new_candidates_onboarding_job_info pad-1" id="new_candidates_onboarding_job_info" method="POST" runat="server" enctype="multipart/form-data">
        <sf:Connection ID="SIFConnection" runat="server"></sf:Connection>
        <div class=" headTitle">
      	        <div class="center">
      		        <h2 class="x-1 mrg-t animation-h2 " id="headTitleCenter"><span><img src="../img/icon-s-referees.png" class="WRolesIcon" alt="RF"/></span><span class="colourfulTitle">Final Details</span></h2>
      	        </div>
            </div>
<!--Qualification HTML -->
        
            <div class="headSubTitleNoBorder">
      	        <div class="center">
      		        <h2 class="x-1  mrg-t animation-h2 " id="headSubTitleCenter"><p><img src="../img/iconQualification.svg" class="WRolesIcon" alt="RF"/></p><p class="colourfulTitle">Qualification</p></h2>
                      <p class="headerSubDescription">Optional <asp:Label runat="server" ID="test"></asp:Label></p>
      	        </div>
            </div>
         <section>   
                         <asp:hiddenField id="UserCounter"   runat="server"></asp:hiddenField> 

            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
                <Scripts><asp:ScriptReference Path="../js/new-user-form-handler.js"/></Scripts>
            </asp:ScriptManager>
             <asp:Label id="qualification_fileds" runat="server"></asp:Label> 
            <div class="add-qualification-form-base m-b" style="overflow: hidden;padding-bottom: 2rem;">
                <div class="cornerNumBase"><p>Add Qualification</p></div>
                <QF:QualificationForm ID="QualificationControlID" runat="server"></QF:QualificationForm>
                <br />
                <div class="center">
                    <asp:Button ID="saveQualification" OnClientClick="return true;" runat="server" class="btn button save-qualification" Text="Save"/>
                </div>
            </div>
         </section>
<!--Referee HTML -->
        <div class=" headSubTitle">
      	    <div class="center">
      		    <h2 class="x-1  mrg-t animation-h2 " id="headSubTitleCenter"><p><img src="../img/iconReferee.svg" class="WRolesIcon" alt="RF"/></p><p class="colourfulTitle">Your Referees</p></h2>
                  <p class="headerSubDescription">Please specify at least 2 referees</p>
      	    </div>
        </div>      
       <section>
            <%--<asp:Label id="referees_fileds" runat="server"></asp:Label>--%> 
           <asp:Label runat="server" ID="RefereeForms"> 
			            </asp:Label> 
            
                <RF:RefereeForm ID="RefereeControlID" runat="server"></RF:RefereeForm>
                
            </section>
<!--Approached Companies HTML-->
        <div class=" headSubTitle">
      	<div class="center">
      		<h2 class="x-1  mrg-t animation-h2 " id="headSubTitleCenter"><p><img src="../img/iconCompany.svg" class="WRolesIcon" alt="RF"/></p><p class="colourfulTitle">Other Agencies</p>
                  
      		</h2>
              <p class="headerSubDescription">Agencies you have applied to recently</p>
      	</div> </div>
        <section>
		    
            <asp:Label id="companys_fileds" runat="server"></asp:Label> 
            <div class="add-company-form-base m-b" style="overflow: hidden;padding-bottom: 2rem;">
                <div class="cornerNumBase"><p>Add Agency</p></div>
                <RF:CompanyForm ID="CompanyControlID" runat="server"></RF:CompanyForm>		
                <br/>
                <div class="center">
                    <asp:Button ID="saveCompany"  OnClientClick="return true;" runat="server" class="btn button save-company" Text="Save"/>
                </div>
            </div>
            </section>
        <!--Declarations HTML-->
        <div class=" headSubTitle">
      	    <div class="center">
      		    <h2 class="x-1  mrg-t animation-h2 " id="headSubTitleCenter"><p><img src="../img/human-rights.svg" class="colourfulIcon" alt="RF"/></p><p class="colourfulTitle">Declarations</p></h2>
      	    </div>
        </div>
        <section>
		<div class="mt4">
   			<h2 class="m-b font-s"><p class="req text-align-justify">Do you have any medical conditions or substance dependency that may affect your ability to effectively carry out the functions and responsibilities of the position applied for, or may be aggravated or further contribued to by the functions and responsibilities of the position applied for?</p></h2>
			<div class="radio-input-grid m-b1">
				<div class="radio-input-grid__row" id="medical">
                    <asp:RadioButtonList runat="server" ID="med_cond_list" RepeatLayout="Flow" CssClass="RadioCheck1"  RepeatDirection="Horizontal">
                            <asp:ListItem class="radio-input-grid__column radio-input-grid__cw-2"  id="yes_med" Value="Yes">Yes</asp:ListItem>            
			                <asp:ListItem class="radio-input-grid__column radio-input-grid__cw-2"  id="no_med" Value="No">No</asp:ListItem>                       
			        </asp:RadioButtonList>
					  
						<%--<input class="radio-input" name="med-cond" id="yes-med" type="radio">
						<label for="yes-med">Yes </label>
					  </div>
					  <div class="radio-input-grid__column">
						<input class="radio-input" name="med-cond" id="no-med" type="radio">
						<label for="no-med">No</label>
					  </div>--%>
				</div>
			</div>
  			<div class="med-cond-explanation m-b1" style="display:none">
  				<label class="req">Please specify</label>
  				<asp:TextBox runat="server" TextMode="MultiLine"  id="comment_med" CssClass ="comment_med"></asp:TextBox>
  			</div>
   			<h2 class="m-b req font-s text-align-justify"> Have you had any previous criminal convictions? Its important that you declare any convictions. Failure to declare may result in termination of Assignment/Role</h2>
   			<div class="radio-input-grid m-b1" id="criminal">
                <div class="radio-input-grid__row">
                    <asp:RadioButtonList runat="server" ID="criminal_cond_list" RepeatLayout="Flow" CssClass="RadioCheck" RepeatDirection="Horizontal">			            
                            <asp:ListItem class="radio-input-grid__column radio-input-grid__cw-2"  id="yes_criminal" Value="Yes" >Yes</asp:ListItem>            
			                <asp:ListItem class="radio-input-grid__column radio-input-grid__cw-2"  id="no_criminal" Value="No" >No</asp:ListItem>                       
			        </asp:RadioButtonList>
					  <%--<div class="radio-input-grid__column">
						<input class="radio-input" name="criminal-rec" id="yes-criminal" type="radio">
						<label for="yes-criminal">Yes </label>
					  </div>
					  <div class="radio-input-grid__column">
						<input class="radio-input" name="criminal-rec" id="no-criminal" type="radio">
						<label for="no-criminal">No</label>
					  </div>--%>
				</div>
			</div>
  			<div class="criminal-rec-explanation m-b1" style="display:none">
  				<label class="req">Please specify</label>
                <asp:TextBox runat="server" TextMode="MultiLine"  id="comment_criminal" CssClass ="comment_criminal" ></asp:TextBox>
  			</div>
   		</div>
      </section>
      <%--<hr>--%>
        <section class="xs-text-right">
		    <div class="pad_l">
		        <asp:Label Visible="false" ForeColor="Red" CssClass="msgvalidation" ID="lblMessage" runat="server">Please fill out all mandatory fields*</asp:Label>
                <!--<button type="submit" runat="server" class="buttonNext button button--primary saveCity" id="next_btn1"  onclick=" if(!check5()) return false;"  onserverclick="next_btn_Click" Text="Continue" >
                    <span>Finish</span><img src="../img/right-arrow.svg" alt="&#8594"/>
                </button>-->
                <button type="submit" runat="server" class="buttonNext button button--primary saveCity" id="next_btn" onclick=" if(!check5()) return false;"  onserverclick="next_btn_Click" Text="Continue" >
   	                <span>Continue</span><img src="../img/right-arrow.svg" alt="&#8594"/>
                </button>	  	    

		    </div>
  	  	</section>
    </form>
     <script>
            function check5() {
                var checkrefs = $('.add-referees-form').length;
                if (checkrefs < 2) {
                    swal({ title: "", text: "You must have at least 2 referees.", animation: false, type: "error" })
                    return false;
                }
                var value;
                value = $(".RadioCheck").find("input").is(":checked");
                var medicalRadio = $("#medical input[type='radio']:checked").val();
                var criminalRadio = $("#criminal input[type='radio']:checked").val();
                if (medicalRadio === "Yes") {
                    
                    if ($("#ctl00_ctl00_portalBody_NewUserContent_comment_med").val()==="") {
                        swal({ title: "", text: "Please specify medical conditions.", animation: false, type: "error" })
                        return false;
                    }
                }
                if (criminalRadio === "Yes") {

                    if ($("#ctl00_ctl00_portalBody_NewUserContent_comment_criminal").val() === "") {
                        swal({ title: "", text: "Please specify criminal convictions.", animation: false, type: "error" })
                        return false;
                    }
                }
                
                if (value) {
                    return true;
                } else {
                    swal({ title: "", text: "Please fill in all the fields with asterisks next to them.", animation: false, type: "error" })
                    return false;
                }
            };
            function validateReferee() {
                $(".required-entryrr").each(function () {
                    var valCheck = this.value;
                    console.log(this)
                    console.log(valCheck)
                    if (valCheck === "" || valCheck == null) {
                        
                        swal({ title: "", text: "Please fill in all the fields with asterisks next to them.", animation: false, type: "error" })
                        return false;
                    }
                });
                return true;
            };
         /*-----------------------------------
         ACTIVE NAV
         -------------------------------------*/
         $(".circle:contains('1')").removeClass("active").addClass("done");
         $(".circle:contains('1')").next().addClass("done");
         $(".circle:contains('2')").removeClass("active").addClass("done");
         $(".circle:contains('3')").prev().addClass("done");
         $(".circle:contains('3')").removeClass("active").addClass("done");
         $(".circle:contains('4')").removeClass("active").addClass("done");
         $(".circle:contains('4')").prev().addClass("done");
         $(".circle:contains('5')").prev().addClass("done");
         $(".circle:contains('5')").addClass("active");
         /*-----------------------------------
         STYLE CHECKBOXES
         -------------------------------------*/
         $('.radio-input-grid__row').each(function () {
             var $this = $(this);
             if ($this.find('.radio-input-grid__column').length > 3) {
                 $this.find('.radio-input-grid__column').addClass('radio-input-grid__cw-4');
             }
         });
         /*-----------------------------------
        TOGGLE ONLY ONE DIV
        -------------------------------------*/
         $('.dropMenu--header').click(function () {
             var notThisOne = $(this).parent();
             $(".dropMenu").each(function () {
                 if ($(this).attr("id") !== notThisOne.attr("id")) {
                     $(this).find(".details").slideUp("slow");
                     $(this).find(".img-dropMenu").toggleClass("rotate").not(this).removeClass("rotate2");
                 } else {
                     $(this).find(".details").slideToggle("slow");
                     $(this).find(".img-dropMenu").toggleClass("rotate2");
                 }
             });
         });
         // REMOVE
         
         $(".removeReferee").click(function () {
             if (confirm("Are you sure you want to delete?") == true) {
                 var key = $(this).parent().parent().parent().children("input[type=hidden]").val();
                 
                 PageMethods.RemoveReferee_Click(key, onSucess, onError);
                 function onSucess(result) {
                     var rows = parseInt(result)
                     if (rows > 0) {
                         window.location.reload()
                     }
                 }

             function onError(error) {
                 alert('Server Error');
                 console.log(error.get_message())
                 }
             } else { return false;}
         });
         
         $(".removeCompany").click(function () {
             if (confirm("Are you sure you want to delete?") == true) {
                 var key = $(this).parent().parent().parent().children("input[type=hidden]").val();

                 PageMethods.RemoveCompany_Click(key, onSucess, onError);
                 function onSucess(result) {
                     var rows = parseInt(result)
                     if (rows > 0) {
                         window.location.reload()
                     }
                 }

                 function onError(error) {
                     alert('Server Error');
                     console.log(error.get_message())
                 }
             } else { return false;}
         });
         
         $(".removeQualification").click(function () {
             if (confirm("Are you sure you want to delete?") == true) {
                 var key = $(this).parent().parent().parent().children("input[type=hidden]").val();

                 PageMethods.RemoveQualification_Click(key, onSucess, onError);
                 function onSucess(result) {
                     var rows = parseInt(result)
                     if (rows > 0) {
                         console.log(result)
                        // window.location.reload()
                     }
                 }

                 function onError(error) {
                     alert('Server Error');
                     console.log(error.get_message())
                 }
             } else { return false; }
         });
    </script>
    </asp:Content>