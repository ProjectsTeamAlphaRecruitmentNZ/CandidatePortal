<%@ Page Language="vb" MasterPageFile="~/NewUser/NewUser.Master" AutoEventWireup="false" EnableEventValidation="false" CodeFile="NewUser-ProfileInfo-6.aspx.vb" Inherits="ProfileInfo6" %>
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
        <p class="form_subtitle">We just need few more details and you’re done!</p> 
    </section>
    <form class="new_candidates_onboarding_job_info pad-1" id="new_candidates_onboarding_job_info" method="POST" runat="server" enctype="multipart/form-data">
        <sf:Connection ID="SIFConnection" runat="server"></sf:Connection>
        <asp:Label runat="server" id="test"></asp:Label>
        <section>
            <div class="input-style w floatLeft">
                <div class="rel" id="declareHead" >
                    <!--<img src="../img/exclamation-sign-in-a-circle.png" />-->
                    <span class="agreement"><h1>Please read the following before signing this Declaration</h1></span>
                </div>
                <div class="text-align-justify">
                    <p class="margin-top-3rem paragraph-style">
                        "This application form is a source of information which will be used by our company to assist in considering your suitability for the position for which you are applying.  If you are successful in obtaining a position, the information will be used by the company employing you to determine your eligibility for promotion (if any) or alternate positions (if any) and where the company is considering disciplinary action and/or termination in relation to you.  If you are unsuccessful <asp:Label runat="server" id="CompanyName3"></asp:Label> will retain the information (unless you object) for use in any future vacancies.
                    </p>
                    <p class="margin-top-3rem paragraph-style">
                        By signing this declaration you endorse that all information provided by you is true and correct in all respects.  You authorise <asp:Label runat="server" id="CompanyName2"></asp:Label> to collect information from any third party including, but not limited to, your designated referees and educational institutes you have attended.  You understand that you are entitled to have access to the information contained in this form, except insofar as it relates to any exemption provided by the Privacy Act 1993."
                    </p>
                    <div class="margin-top-3rem margin-bottom-3rem paragraph-style">
                        <div class="w req">
                            <asp:CheckBox ID="Agree" runat="server" idnotserver="AgreeCheck" />
                            <label class="a--pseudo" for="driving"> I agree with the above declaration </label>
                        </div>
                    </div>
                    <p class="margin-top-3rem paragraph-style">
                        Should our clients require a credit check to be carried out pertaining to a specific role that you have applied for; do you give us permission to conduct this process on your behalf?  
                    </p>
                    <br />
                    <div class="radio-input-grid__row" id="creditcheck">
                        <asp:RadioButtonList runat="server" ID="creditcheck" RepeatLayout="Flow" CssClass="RadioCheck1"  RepeatDirection="Horizontal">
                                <asp:ListItem class="radio-input-grid__column radio-input-grid__cw-2"  id="yes_cc" Value="Yes">Yes</asp:ListItem>            
			                    <asp:ListItem class="radio-input-grid__column radio-input-grid__cw-2"  id="no_cc" Value="No">No</asp:ListItem>                       
			            </asp:RadioButtonList>
                    </div>	
                
                <br />
                <br />
                <hr />
                <br />
                <div class="layout__item w">
			       <label class="a--pseudo " for="gender">Please add your CV.(.doc, .docx, .pdf)</label>      
			        <div class="w">
			            <asp:FileUpload ID="CVUpload" clientID="cvUpload" runat="server"   BorderStyle="None"  ></asp:FileUpload>
			            <asp:Label ID="lblCVUpload" ForeColor="Red" runat="server"></asp:Label>
			        </div>
                    <button id="clear" type="button" onclick="clearCV()" class="  button removeQualification">Clear</button>
			    </div>
                <!--<div class="img_area" runat="server">
                    <asp:Image id="CompanyLogo" runat="server"
                       AlternateText="Company Logo"
                       
                       ImageUrl="../img/logo_alpha.png" 
                       Style="display: block;margin: auto;"/>
                    <%--<img src="../img/logo_alpha.png" alt="alpha_logo" height="55">
                    <img src="../img/logo_triangle.png" alt="triangle_logo" height="40">
                    <img src="../img/logo_projectplus.png" alt="projectplus_logo" height="40">
                    <img src="../img/logo_healthwise.png" alt="healthwise_logo" height="40">
                    <img src="../img/logo_freightwise.png" alt="freightwise_logo" height="40">--%>
                </div>-->
            </div>             
		</section>
      <%--<hr>--%>
        <section class="xs-text-right">
		    <div class="pad_l">
		        <asp:Label Visible="false" ForeColor="Red" CssClass="msgvalidation" ID="lblMessage" runat="server">Please fill out all mandatory fields*</asp:Label>
                <button type="submit" runat="server" class="buttonNext button button--primary saveCity" id="next_btn" onclick="if(!check()) return false;"   onserverclick="next_btn_Click" Text="Continue" >
   	                <span>Finish</span><img src="../img/right-arrow.svg" alt="&#8594"/>
                </button>  	  	    
		    </div>
  	  	</section>
    </form>
    <script>
            function clearCV() {
                console.log("w")
                console.log($("[clientid='cvUpload']"))
                $("[clientid='cvUpload']").val(null);
            }
            function check() {
                var checkVal = $("[idnotserver='AgreeCheck'] input").prop("checked");
                if (checkVal == false) {
                    swal({ title: "", text: "Please confirm that you understand Candidate Declaration by clicking 'I Agree' box.", animation: false, type: "error" })
                }
                return checkVal;
            }
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
         $(".circle:contains('5')").removeClass("active").addClass("done");
         $(".circle:contains('6')").prev().addClass("done");
         $(".circle:contains('6')").addClass("active");
         /*-----------------------------------
         STYLE CHECKBOXES
         -------------------------------------*/
         
         /*-----------------------------------
        TOGGLE ONLY ONE DIV
        -------------------------------------*/
         // REMOVE
    </script>
    </asp:Content>