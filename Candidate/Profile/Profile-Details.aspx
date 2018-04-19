<%@ Page Language="vb" MasterPageFile="Profile.Master" AutoEventWireup="false" EnableEventValidation="false"  CodeFile="Profile-Details.aspx.vb" Inherits="Profile1" %>
<%@ MasterType VirtualPath="../Profile/Profile.Master" %>
<%@ Reference VirtualPath="../Portal.Master" %>
<%@ Register TagPrefix="EF" TagName="DeclarationModal" Src="~/Profile/Controls/DeclarationControl.ascx" %>
<%@ Register TagPrefix="EF" TagName="SkillsEdit" Src="~/Profile/Controls/Skills.ascx" %>
<%@ Register TagPrefix="EF" TagName="PersonalDetailsEdit" Src="~/Profile/Controls/PersonalInfo.ascx" %>
<%@ Register TagPrefix="EF" TagName="RefereeEdit" Src="~/Profile/Controls/RefereeControls.ascx" %>
<%@ Register TagPrefix="EF" TagName="QualificationEdit" Src="~/Profile/Controls/QualificationControl.ascx" %>
<%@ Register TagPrefix="EF" TagName="AgencyEdit" Src="~/Profile/Controls/AgencyControl.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ProfileTitle" runat="server">
<title> Alpha Jobs Profile - General </title>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ProfileContent" runat="server">
    <form runat="server" method="post">
    <sf:Connection ID="SIFConnection1" runat="server"></sf:Connection>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
      <div class="info-1">
<section class="center">
	<div class="s-2">
		<div>
	        <h3 style="display:inline-block;text-transform: uppercase" class="form_title"> 
			    <asp:Literal ID="first_name" runat="server"></asp:Literal> 
			    <asp:Literal ID="last_name" runat="server"></asp:Literal>
		    </h3> 
		</div>

		<div class="m-b" style="height:16rem">
			<div class="profile-photo">
				<img id="photo-profile" class="circle-img" src="../img/person.jpg" alt="photo"/>
			</div>
			<div class="s-3">
				<ul class="nav-btn">
                  <li class="button-dropdown">
                    <a href="javascript:void(0)" class="dropdown-toggle edit-btn m-b">
                      Edit Profile <%--<span>▼</span>--%>
                    </a>
                    <ul class="dropdown-menu">
                      <li>
                        <a href="#workHistory">
                          Work History
                        </a>
                      </li>
                      <li>
                        <a href="#skills">
                          Skills
                        </a>
                      </li>
                      <li>
                        <a href="#personalInfo">
                          Personal Information
                        </a>
                      </li>
                      <li>
                        <a href="#documents">
                          Documents
                        </a>
                      </li>
                    </ul>
                  </li>
                </ul>
			</div>
		</div>
	</div>
</section>	
</div>

<!------------------------------------------------------------------------------
WORK HISTORY
----------------------------------------------------------------------------->			
<div class="info-1">
	<section id="workHistory">
	<div class="space">
		<img src="../img/work-history.png" height="32" style="position: relative;top: 0.7rem;"> <h3 class="form_title b-w2"> Work History</h3> 
	</div>
	<asp:Label id="CandWorkHistory" runat="server">
              
    </asp:Label>
	
	<div class="experience-field space">
			<h3>Web Developer (Information Technology Industry) </h3>
			<h4 style="font-weight: lighter;"><span>Alpha Recruitment | Auckland, New Zealand </span></h4>
			<div class="d-info">
				<span>November 2016 - Now </span>
                <span class="b white-space-prewrap">
RESPONSIBILITIES:	
•	Develop new user-facing features
•	Build reusable code and libraries for future use
•	Ensure the technical feasibility of UI/UX designs
•	Assure that all user input is validated before submitting to back-endCollaborate with other team members and stakeholders
•	Creating static page templates using HTML, CSS, JavaScript, JQuery</span>
				<span class="b"><label>Report to:</label> Colin Mathieson </span>
			</div>
		</div>

		
		
		
	</section>
</div>								
<!------------------------------------------------------------------------------
Skills
----------------------------------------------------------------------------->			
<div class="edit" type="button" class="btn btn-primary" data-toggle="modal" data-target="#editSkills">
			<i class="fa fa-pencil" aria-hidden="true"></i></div>       
        <div class="info-1">
	        <section id="skills">
	        <div class="space">
		        <img src="../img/skills-2.png" height="34" style="position: relative;top: 0.7rem;"> <h3 class="form_title b-w2"> Skills</h3> 
	        </div>
	        <div id="skills-pill">
	            <asp:Label id="CandidateSkills" runat="server">
                          
                </asp:Label>
	        </div>
	        </section>
        </div>	
        <%--Skills Modal--%>
				<div class="modal fade" id="editSkills"  role="dialog" aria-labelledby="skillsModalLabel" aria-hidden="true">				    
                      <div class="modal-dialog" id="skillsModalDialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <img src="../img/skills-2.png" height="30" style="position: relative;top: 0.5rem;"> <h3 class="form_title b-w2">Edit Skills</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
                            <EF:SkillsEdit ID="SkillsEdit" runat="server"></EF:SkillsEdit>
                         </div>
                          <div class="modal-footer">
                          <asp:Button ID="saveSkills" runat="server" class="save-profile btn btn-primary" CausesValidation = "false" Text="Save changes" />
                            <button type="button" id="close-modal" class="btn btn-secondary" data-dismiss="modal">Close</button>
                       </div>
                        </div>
                    </div>
                    </div>
                 <%--End Modal--%>
<!------------------------------------------------------------------------------
PERSONAL INFORMATION
----------------------------------------------------------------------------->
<div class="edit" type="button" class="btn btn-primary" data-toggle="modal" data-target="#editPersonalInfo">
			<i class="fa fa-pencil" aria-hidden="true"></i></div>
			<div class="info-1">
			
				<section id="personalInfo">
				<div>
					<img src="../img/personal-information.png" height="30" style="position: relative;top: 0.5rem;"> <h3 class="form_title b-w2"> Personal Information</h3> 
				 </div>
				 <div class="m-b">
                     
                     <div class="gear">
							<label>Phone:</label>
							<span class="datainfo"><asp:Literal ID="Phone" runat="server"></asp:Literal></span>
						</div>
                     <div class="gear">
							<label>Mobile:</label>
							<span class="datainfo"><asp:Literal ID="Mobile" runat="server"></asp:Literal></span>
						</div>
                     <div class="gear">
							<label>Email:</label>
							<span class="datainfo"><asp:Literal ID="Email" runat="server"></asp:Literal></span>
						</div>
                     <div class="gear">
							<label>Alternative Email:</label>
							<span class="datainfo"><asp:Literal ID="AltEmail" runat="server"></asp:Literal></span>
						</div>
						<div class="gear">
							<label>Address:</label>
							<span class="datainfo"><asp:Literal ID="candidateAddress" runat="server"></asp:Literal></span>
						</div>
                     <div class="gear">
							<label>Suburb:</label>
							<span class="datainfo"><asp:Literal ID="Suburb" runat="server"></asp:Literal></span>
						</div>
						<div class="gear">
							<label>City:</label>
							<span class="datainfo"><asp:Literal ID="candidateCity" runat="server"></asp:Literal></span>
						</div>
						<div class="gear">
							<label>Post Code:</label>
							<span class="datainfo"><asp:Literal ID="candidatePostCode" runat="server"></asp:Literal></span>
						</div>
                     <div class="gear">
							<label>Country:</label>
							<span class="datainfo"><asp:Literal ID="Country" runat="server"></asp:Literal></span>
						</div>
						<div class="gear">
							<label>Date of Birth (dd/mm/year):</label>
							<span class="datainfo"><asp:Literal ID="candidateDOB1" runat="server"></asp:Literal>/<asp:Literal ID="candidateDOB2" runat="server"></asp:Literal>/<asp:Literal ID="candidateDOB3" runat="server"></asp:Literal></span>
						</div>
						<div class="gear">
							<label>Place of Birth:</label>
							<span class="datainfo"><asp:Literal ID="CandidatePlaceOfBirth" runat="server"></asp:Literal></span>
						</div>
						<div class="gear">
							<label>Linkedin Page:</label>
							<span class="datainfo"><a href="#" target="_blank"> <asp:Literal ID="candidateLinkedIn" runat="server"></asp:Literal></a></span>
						</div>
						<div class="gear">
							<label>Skype Name:</label>
							<span class="datainfo"><asp:Literal ID="candidateSkypeName" runat="server"></asp:Literal></span>
						</div>
                     <div class="gear">
							<label>Gender:</label>
							<span class="datainfo"><asp:Literal ID="Gender" runat="server"></asp:Literal></span>
						</div>
                     <div class="gear">
							<label>Drivers License:</label>
							<span class="datainfo checkthisdiv"><asp:Literal ID="CandidateDriversLicense" runat="server"></asp:Literal></span>
						</div>
						<div class="gear">
							<label>Own Transport:</label>
							<span class="datainfo checkthisdiv"> <asp:Literal ID="CandidateOwnTransport" runat="server"></asp:Literal></span>
						</div>						
						<div class="gear">
							<label>Smoker:</label>
							<span class="datainfo checkthisdiv"><asp:Literal ID="CandidateSmoker" runat="server"></asp:Literal></span>
						</div>
                     <div class="gear">
							<label>Availability:</label>
							<span class="datainfo"><asp:Literal ID="Availability" runat="server"></asp:Literal></span>
						</div>
				</div>
				</section>
				<%--Personal Info, Emergency Contact and Work Contact Modal--%>
				<div class="modal fade" id="editPersonalInfo"  role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">				    
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <img src="../img/personal-information.png" height="30" style="position: relative;top: 0.5rem;"> <h3 class="form_title b-w2">Edit Personal Information</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
                            <EF:PersonalDetailsEdit ID="PersonalDetailsID" runat="server"></EF:PersonalDetailsEdit>
                         </div>
                          <div class="modal-footer">
                          <asp:Button ID="savePersonalInfo" runat="server" OnClientClick="checkS();" class="save-profile btn btn-primary" Text="Save changes" />
                            <button type="button" id="close-modal" class="btn btn-secondary" data-dismiss="modal">Close</button>
                       </div>
                        </div>
                    </div>
                 <%--End Modal--%>
				</div>
                </div>
<!------------------------------------------------------------------------------
Emergency Contact
----------------------------------------------------------------------------->
				<div class="info-1">
				<section>
				<img src="../img/emergency-contact.png" height="30" style="position: relative;top: 0.7rem;"> <h3 class="form_title b-w2"> Emergency Contact</h3> 
      			<div class="m-b"> 
					<div class="gear">
						<label>Name:</label>
						<span class="datainfo"> <asp:Literal ID="CandidatesEmergencyContact2" runat="server"/> <asp:Literal ID="CandidatesEmergencyContact3" runat="server"/></span>
					</div>
					<div class="gear">
						<label>Phone:</label>
						<span class="datainfo"><asp:Literal ID="CandidatesEmergencyContactPhone1" runat="server"/> <asp:Literal ID="CandidatesEmergencyContactPhone2" runat="server"/></span>
					</div>
                      <div class="gear">
						<label>Email:</label>
						<span class="datainfo"><asp:Literal ID="EmEmail" runat="server"/> <asp:Literal ID="Literal2" runat="server"/></span>
					</div>
					<div class="gear">
						<label>Relationship:</label>
						<span class="datainfo"><asp:Literal ID="CandidatesEmergencyContactRelationship" runat="server"/></span>
					</div>					
				</div>	
			</section>
			</div>
<!------------------------------------------------------------------------------
If you want Alpha to contact you at work
----------------------------------------------------------------------------->
		<%--	<div class="info-1">
			<section>
			<img src="../img/work-contacts.png" height="30" class="aw-img"> <h3 class="form_title b-w2 aw"> If you want Alpha to contact you at work </h3> 
			<div class="m-b">
				<div class="gear">
					<label>Work Phone:</label>
					<span class="datainfo"><asp:Literal ID="CandidatesWorkPhone1" runat="server"/> <asp:Literal ID="CandidatesWorkPhone2" runat="server"/>  <span class="hideIfNull"><i> Extension:</i></span> <span class="checkIfEmpty"><asp:Literal ID="CandidatesWorkPhone3" runat="server"/></span></span>
				</div>
				<div class="gear">
					<label>Work Email:</label>
					<span class="datainfo"><asp:Literal ID="CandidatesWorlEmail" runat="server"/></span>
				</div>
			  </section>
			</div>	--%>
			
<!------------------------------------------------------------------------------
Referees
----------------------------------------------------------------------------->
			<div class="info-1">
			<section>
				<img src="../img/user.png" height="32" style="position: relative;top: 0.5rem;"> <h3 class="form_title b-w2"> Referees</h3> 
      			<div id="referees">
      			    <asp:label id="candidatesreferees" runat="server">
                              
                    </asp:label>
                      <asp:label id="candidatesrefereesmodal" runat="server">
                              
                    </asp:label>
                      <div class="add" type="button" class="btn btn-primary" data-toggle="modal" data-target="#addReferee">
			<i class="fa fa-plus-circle" aria-hidden="true"></i></div>
				</div>

				</section>
			
                <%--Referees Modal--%>
				
                            <EF:RefereeEdit ID="RefereeEdit" runat="server"></EF:RefereeEdit>
                         
                 <%--End Modal--%>
                			</div>
        <!------------------------------------------------------------------------------
Qualifications
----------------------------------------------------------------------------->

        <div class="info-1">
			<section>
				<img src="../img/user.png" height="32" style="position: relative;top: 0.5rem;"> <h3 class="form_title b-w2">Qualifications</h3> 
      			<div id="qualifications">
      			    <asp:label id="candidatesqualifications" runat="server">
                              
                    </asp:label>
                      <asp:label id="candidatesqualificationsmodal" runat="server">
                              
                    </asp:label>
                      <div class="add" type="button" class="btn btn-primary" data-toggle="modal" data-target="#addQualification">
			<i class="fa fa-plus-circle" aria-hidden="true"></i></div>
				</div>

				</section>
			</div>	
                <%--Qualifications Modals--%>
				
                            <EF:QualificationEdit ID="QualificationEdit" runat="server"></EF:QualificationEdit>
                         
                 <%--End Modal--%>
         <!------------------------------------------------------------------------------
Agencies
----------------------------------------------------------------------------->

        <div class="info-1">
			<section>
				<img src="../img/user.png" height="32" style="position: relative;top: 0.5rem;"> <h3 class="form_title b-w2">Agencies</h3> 
      			<div id="companies">
      			    <asp:label id="candidatesagencies" runat="server">
                              
                    </asp:label>
                      <asp:label id="candidatesagenciesmodal" runat="server">
                              
                    </asp:label>
                      <div class="add" type="button" class="btn btn-primary" data-toggle="modal" data-target="#addAgency">
			<i class="fa fa-plus-circle" aria-hidden="true"></i></div>
				</div>

				</section>
			</div>	
                <%--Agencies Modal--%>
				
                            <EF:AgencyEdit ID="AgencyEdit" runat="server"></EF:AgencyEdit>
                         
                 <%--End Modal--%>

<!------------------------------------------------------------------------------
Documents
----------------------------------------------------------------------------->
			<div class="info-1">
			<section id="documents">
				<img src="../img/my-docs.png" height="30" style="position: relative;top: 0.5rem;"> <h3 class="form_title b-w2"> Documents</h3> 
      			<div class="m-b"> 
					<p>CV.pdf</p>			
				</div>	
			</section>
			</div>	
                <%--<EF:DeclarationModal ID="DeclarationControl" runat="server"></EF:DeclarationModal>--%>
    </form>

    <script type="text/javascript">   
        /* -----------------------------------------------------------------------------
            JAVASCRIPT
            ----------------------------------------------------------------------------- */
        $("#ProfileDetails").addClass("active");
        function ValidateEmailId(email, input) {
            var value = email;
            var atposition = value.indexOf("@");
            var dotposition = value.lastIndexOf(".");
            if (atposition < 1 || dotposition < atposition + 2 || dotposition + 2 >= value.length) {

                input.css("border-color", "red");
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

jQuery(document).ready(function (e) {
    function t(t) {
        e(t).bind("click", function (t) {
            t.preventDefault();
            e(this).parent().fadeOut()
        })
    }
    e(".dropdown-toggle").click(function () {
        var t = e(this).parents(".button-dropdown").children(".dropdown-menu").is(":hidden");
        e(".button-dropdown .dropdown-menu").hide();
        e(".button-dropdown .dropdown-toggle").removeClass("active");
        if (t) {
            e(this).parents(".button-dropdown").children(".dropdown-menu").toggle().parents(".button-dropdown").children(".dropdown-toggle").addClass("active")
        }
    });
    e(document).bind("click", function (t) {
        var n = e(t.target);
        if (!n.parents().hasClass("button-dropdown")) e(".button-dropdown .dropdown-menu").hide();
    });
    e(document).bind("click", function (t) {
        var n = e(t.target);
        if (!n.parents().hasClass("button-dropdown")) e(".button-dropdown .dropdown-toggle").removeClass("active");
    })
});


/* -----------------------------------------------------------------------------
Hide if empty
----------------------------------------------------------------------------- */
    $(function(){
        if ($(".checkIfEmpty").text().length == 0){
            $(".hideIfNull").hide();
        }
    });
        
   $(".checkthisdiv").text(function(i, text) {
        return text.replace("False", "No");
    });
    $(".checkthisdiv").text(function(i, text) {
        return text.replace("True", "Yes");
    });
    $("span.checkthisdiv:empty")
    .text("No")   
    
    $(".refereeDetails:empty").parent().hide();

/* -----------------------------------------------------------------------------
Date Dropdown
----------------------------------------------------------------------------- */    
    $(function() {
			$(".dropdate").dateDropdowns({
			    defaultDateFormat: 'dd/mm/yyyy',
			    submitFormat: "dd/mm/yyyy",
			    daySuffixes: false
			});
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
         /*-----------------------------------
               UPDATE REFEREE
               -------------------------------------*/
        $(".updateRef").click(function () {
            
            var number = $(this).attr("number");
            var key = $(this).attr("key");

            var firstNameInput = $("#fnRef" + number )
            var firstName = firstNameInput.val()
            var lastNameInput = $("#lnRef" + number)
            var lastName = lastNameInput.val()

            var mobileAreaInput = $("#areaRef" + number)
            var mobileArea = mobileAreaInput.val()
            var mobileNumInput = $("#numRef" + number)
            var mobileNum = mobileNumInput.val()
            var emailInput = $("#emailRef" + number)
            var email = emailInput.val()
            var refereeCompanyInput = $("#companyRef" + number)
            var refereeCompany = refereeCompanyInput.val()
            var refereePositionInput = $("#positionRef" + number)
            var refereePos = refereePositionInput.val()
            var refereeRelInput = $("#relRef" + number)
            var refereeRel = refereeRelInput.val()
            var timeToContInput = $("#timeRef" + number)
            var timeToCont = timeToContInput.val()

            var emailCheck = ValidateEmailId(email, emailInput)

            
            if (emailCheck !== false) {
                PageMethods.EditReferee_Click(key, firstName, lastName, mobileArea, mobileNum, email, refereeCompany, refereePos, refereeRel, timeToCont, onSucess, onError);
                function onSucess(result) {
                    console.log(result)

                    var rows = parseInt(result)
                    if (rows > 0) {
                        window.location.reload()
                    }
                }
                function onError(error) {
                    console.log(error);
                    console.log("Error: " + error.get_message());
                }
            }
        });
        $(".removeRef").click(function () {
            if (confirm("Do you really want to delete?") == true) {
                var key = $(this).attr("key");
                PageMethods.RemoveReferee_Click(key, onSucess, onError);
                function onSucess(result) {
                    console.log(result);
                    var rows = parseInt(result)
                    if (rows > 0) {
                        window.location.reload()
                    }
                }

                function onError(error) {
                    console.log(error);

                    console.log("Error: " + error.get_message());
                }
            } else { return false; }
        });
        $(".removeQualification").click(function () {
            if (confirm("Do you really want to delete?") == true) {
                var key = $(this).attr("key");
                PageMethods.RemoveQualification_Click(key, onSucess, onError);
                function onSucess(result) {
                    console.log(result);
                    var rows = parseInt(result)
                    if (rows > 0) {
                        window.location.reload()
                    }
                }

                function onError(error) {
                    console.log(error);

                    console.log("Error: " + error.get_message());
                }
            } else { return false; }
        });
        $(".removeAgency").click(function () {
            if (confirm("Do you really want to delete?") == true) {
                var key = $(this).attr("key");
                PageMethods.RemoveAgency_Click(key, onSucess, onError);
                function onSucess(result) {
                    console.log(result);
                    var rows = parseInt(result)
                    if (rows > 0) {
                        window.location.reload()
                    }
                }

                function onError(error) {
                    console.log(error);

                    console.log("Error: " + error.get_message());
                }
            } else { return false; }
        });
       /*-----------------------------------
               CHECK REFEREE > 2
               -------------------------------------*/

        var referees = $('.removeRef').length;
        if (referees < 3) {
            $('.removeRef').attr('disabled', 'disabled');
        }

        function setKeyOfModal() {
            $(".keyWrapReferee input[type='hidden']").each(function () {
                var modalDiv = $(this);
                var key = parseInt($(this).val());
                if (key > 0) {

                    modalDiv.parent().parent().attr("id", "addReferee" + key);
                }
            });
            $(".keyWrapQualification input[type='hidden']").each(function () {
                var modalDiv = $(this);
                var key = parseInt($(this).val());
                if (key > 0) {

                    modalDiv.parent().parent().attr("id", "addQualification" + key);
                }
            });
            $(".keyWrapAgency input[type='hidden']").each(function () {
                var modalDiv = $(this);
                var key = parseInt($(this).val());
                if (key > 0) {

                    modalDiv.parent().parent().attr("id", "addAgency" + key);
                }
            });
        }
        $(document).ready(function () {

            setKeyOfModal();


            $('#declare').modal({
                backdrop: 'static',
                keyboard: false  // to prevent closing with Esc button (if you want this too)
            });

            $('.declare-button').attr("disabled", "disabled");
            $('#declare').modal('show');
            $('#declare input[type="radio"]').each(function () {
                $(this).click(function () {
                    var creditYes = $('.credit-yes').find('input').prop('checked');
                    var creditNo = $('.credit-no').find('input').prop('checked');
                    var criminalYes = $('.criminal-yes').find('input').prop('checked');
                    var criminalNo = $('.criminal-no').find('input').prop('checked');
                    console.log(creditYes);
                    console.log(creditNo);
                    if ((creditYes || creditNo) && (criminalYes || criminalNo)){
                        $('.declare-button').removeAttr("disabled");
                        $('.declare-button').click(function (e) {
                            e.preventDefault();
                            $('#declare').modal('hide');
                        });
                    }
                    
                });
            });
        });
        function checkReferee(el) {
            var element = $($(el).parent()[0]).parent()[0];
            var fn = $($($(element).find(".RefereeFirstName")[0])[0]).val();
            var ln = $($($(element).find(".RefereeLastName")[0])[0]).val();
            var mobile = $($($(element).find(".RefereeMobile")[0])[0]).val();
            var pos = $($($(element).find(".RefereePos")[0])[0]).val();
            var comp = $($($(element).find(".RefereeComp")[0])[0]).val();
            var land = $($($(element).find(".RefereeLand")[0])[0]).val();
            if (fn === "" || ln === "" || mobile === "" || pos === "" || comp === "") {
                swal({
                    title: "",
                    text: 'Please fill all required fields.',
                    type: 'error',
                    closeOnConfirm: false,
                    animation: false
                });
                return false;
            }

            if (/^([0-9\s -]{6,16})$/.test(mobile) === false) {
                swal({
                    title: "",
                    text: 'Please enter a mobile phone matching the pattern: 000 0000000 or 0000000000.',
                    type: 'error',
                    closeOnConfirm: false,
                    animation: false
                });
                return false;
            }
            if (land !== "" && land !== " ") {
                if (/^([0-9\s -]{6,16})$/.test(land) === false) {
                    swal({
                        title: "",
                        text: 'Please enter a landline phone matching the pattern: 000 0000000 or 0000000000.',
                        type: 'error',
                        closeOnConfirm: false,
                        animation: false
                    });
                    return false;
                }
            }
            return true;
            
        };
        function checkQualification(el) {
            var element = $($(el).parent()[0]).parent()[0];
            var degree = $($($(element).find(".Degree")[0])[0]).val();
            var field = $($($(element).find(".Field")[0])[0]).val();
            var school = $($($(element).find(".School")[0])[0]).val();
            var fromYear = $($($(element).find(".FromYear")[0])[0]).val();
            var toYear = $($($(element).find(".ToYear")[0])[0]).val();
            var description = $($($(element).find(".Description")[0])[0]).val();
            if (degree === "" || field === "" || school === "" || fromYear === " " || toYear === " " || description === "") {
                swal({
                    title: "",
                    text: 'Please fill all required fields.',
                    type: 'error',
                    closeOnConfirm: false,
                    animation: false
                });
                return false;
            }
 
            return true;

        };
        function checkAgency(el) {
            var element = $($(el).parent()[0]).parent()[0];
            var nameOfContact = $($($(element).find(".NoC")[0])[0]).val();
            var position = $($($(element).find(".PoC")[0])[0]).val();
            var agencyName = $($($(element).find(".AgencyName")[0])[0]).val();
            var dateApplied = $($($(element).find(".DateApplied")[0])[0]).val();
            var role = $($($(element).find(".Role")[0])[0]).val();
            if (nameOfContact === "" || position === "" || agencyName === "" || dateApplied === " " || role === "") {
                swal({
                    title: "",
                    text: 'Please fill all required fields.',
                    type: 'error',
                    closeOnConfirm: false,
                    animation: false
                });
                return false;
            }
            return true;
        };
    </script>
</asp:Content>
