<%@ Page Language="vb" MasterPageFile="NewUser.Master" AutoEventWireup="false" CodeFile="NewUser-ProfileInfo-1.aspx.vb" Inherits="ProfileInfo1" %>
<%@ MasterType VirtualPath="~/NewUser/NewUser.Master" %>
<%@ Reference VirtualPath="~/Portal.Master" %>

<asp:Content ContentPlaceHolderID="NewUserTitle" runat="server">
<title> JobsOnline Registration - General </title>
</asp:Content>
<asp:Content ContentPlaceHolderID="NewUserScripts" runat="server">
    <%--<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.3.1/angular.min.js"></script>--%>
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
        <link href="../css/PopUp.css" rel="Stylesheet" type="text/css" /> 

    <script src="../js/jquery.date-dropdowns.js" type="text/javascript"></script>
    <script src="../js/nhpup_1.1.js"></script>
    
    
    <script>

        eventCancel = function (e) {
            e.get_postBackElement().disabled = true;
            if (!e)
                if (window.event) e = window.event;
                else return;
            if (e.cancelBubble != null) e.cancelBubble = true;
            if (e.stopPropagation) e.stopPropagation();
            if (e.preventDefault) e.preventDefault();
            if (window.event) e.returnValue = false;
            if (e.cancel != null) e.cancel = true;
        }
        $(function() {
			$(".dropdate").dateDropdowns({
			    defaultDateFormat: 'dd/mm/yyyy',
			    submitFormat: "dd/mm/yyyy",
			    daySuffixes: false
			});
		});
   /*-----------------------------------
   Move to next field on ENTER
   Move to previous field on BACKSPACE
   ------------------------------------*/       
        $(document).ready(function () {
            
            document.getElementById("ctl00_ctl00_portalBody_NewUserContent_email").type = "email";
        $("input").not( $(":button") ).keypress(function (evt) {
            if (evt.keyCode == 13) {
                iname = $(this).val();
                if (iname !== 'Submit'){    
                    var fields = $(this).parents('form:eq(0),body').find('button,input,textarea,select');
                    var index = fields.index( this );
                    if ( index > -1 && ( index + 1 ) < fields.length ) {
                        fields.eq( index + 1 ).focus();
                    }
                    return false;
                }
            }
            if  ((evt.keyCode == 8) && $(this).val() =='') {
                iname = $(this).val();
                var fields = $(this).parents('form:eq(0),body').find('button,input,textarea,select');
                var index = fields.index( this );
                if ( index > -1 && ( index - 1 ) < fields.length ) {
                    fields.eq( index - 1 ).focus();
                }
                return false;   
            }
        });
    });
        $(document).ready(function () {
            var exist = document.getElementById("<%=exist.ClientID %>").value;
            var isNew = document.getElementById("<%=isNewUser.ClientID %>").value;
            var isDirect = document.getElementById("<%=IsDirect.ClientID %>").value;

           
            let original_color = "linear-gradient(-90deg,#2cbdf3,#2f8bf4 )";
            var next_btn = $(".buttonNext");
            console.log("wwww")
            if (exist === "True") {

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
                        //console.log(valuable)
                        //next_btn.css("background", '#aaaaaa');
                        //next_btn.attr("disabled", "true");
                        //next_btn.attr("onmouseover", "nhpup.popup('Please fill out the form to continue.');");
                    }
                }
            }
            var userCounter = document.getElementById("<%=UserCounter.ClientID %>").value
            console.log("UC:"+userCounter);
        var next_btn = $("input:submit");

        if (parseInt(userCounter) === 4) {
            $(".circle:contains('1')").removeClass("done").addClass("active");
            $(".circle:contains('2')").removeClass("active").addClass("done");
            $(".circle:contains('3')").removeClass("active").addClass("done");
            $(".circle:contains('4')").removeClass("active").removeClass("done");
            $(".circle:contains('5')").removeClass("active").removeClass("done");
            $(".label:contains('5')").parent().parent().removeAttr('href');
            $(".label:contains('6')").parent().parent().removeAttr('href');


        } else if (parseInt(userCounter) === 5) {
            $(".circle:contains('1')").removeClass("done").addClass("active");
            $(".circle:contains('2')").removeClass("active").addClass("done");
            $(".circle:contains('3')").removeClass("active").addClass("done");
            $(".circle:contains('4')").removeClass("active").addClass("done");
            $(".circle:contains('5')").removeClass("active").removeClass("done");
            $(".label:contains('6')").parent().parent().removeAttr('href');


        } else if (parseInt(userCounter) === 3) {
            $(".circle:contains('1')").removeClass("done").addClass("active");
            $(".circle:contains('2')").removeClass("active").addClass("done");
            $(".circle:contains('3')").removeClass("active").removeClass("done");
            $(".circle:contains('4')").removeClass("active").removeClass("done");
            $(".circle:contains('5')").removeClass("active").removeClass("done");
            $(".label:contains('4')").parent().parent().removeAttr('href');
            $(".label:contains('5')").parent().parent().removeAttr('href');
            $(".label:contains('6')").parent().parent().removeAttr('href');



        } else if (parseInt(userCounter) === 1) {
            $(".label:contains('2')").parent().parent().removeAttr('href');

            $(".label:contains('3')").parent().parent().removeAttr('href');
            $(".label:contains('4')").parent().parent().removeAttr('href');
            $(".label:contains('5')").parent().parent().removeAttr('href');
            $(".label:contains('6')").parent().parent().removeAttr('href');


        } else if (parseInt(userCounter) === 6) {
            $(".circle:contains('1')").removeClass("done").addClass("active");
            $(".circle:contains('2')").removeClass("active").addClass("done");
            $(".circle:contains('3')").removeClass("active").addClass("done");
            $(".circle:contains('4')").removeClass("active").addClass("done");
            $(".circle:contains('5')").removeClass("active").addClass("done");


        }else{
            $(".label:contains('3')").parent().parent().removeAttr('href');
            $(".label:contains('4')").parent().parent().removeAttr('href');
            $(".label:contains('5')").parent().parent().removeAttr('href');
            $(".label:contains('6')").parent().parent().removeAttr('href');


        }
        $('.done').each(function () {
            $(this).find('.label').val();
            var lab = $(this).find('.label');
            lab.html('<img src="../img/check-symbol.svg" class="imgTick">');
        });
    });
     
        function toggleMap() {
            var x = document.getElementById("map");
            var b = $(".toggleMap");
            if (x.style.display === "none") {
                x.style.display = "block";
                
                b.css("color", "#fff");
                b.css("background", "#444545");
                b.css("border", "none");
            } else {
                x.style.display = "none";
                b.css("color", "#444545");
                b.css("background", "#fff");
                b.css("border", "1px solid #444545");
            }
        }
            
	</script>
    <script  type="text/javascript">
        function SavePage1() {
            
            var isValid = true;  // Set the isValid to flag try initially
            
            $('input, select').each(function () {

               // Loop thru all the elements
                if ($(this).attr("required")) {
                    var name = $(this).val();

                    
                    if (name != "") {  // If not empty do nothing

                    } else {
                        $(this).addClass('invalidRed');
                        if ($(this).is('input')) {
                            $(this).on('keyup', function () {
                                $(this).removeClass('invalidRed');
                            });
                        } else {
                            $(this).on('focus', function () {
                                $(this).removeClass('invalidRed');
                            });
                        }
                        isValid = false; // If one loop is empty set the isValid flag to false
                           // Break out of .each loop 
                    }
                }
            });
            if (isValid) {
               
                var value = document.getElementById("<%=email.ClientID %>").value;
                var value2 = document.getElementById("<%=w_email.ClientID %>").value;
                var atposition = value.indexOf("@");
                var dotposition = value.lastIndexOf(".");
                var atposition2 = value2.indexOf("@");
                var dotposition2 = value2.lastIndexOf(".");

                if ((atposition2 < 1 || dotposition2 < atposition2 + 2 || dotposition2 + 2 >= value2.length) && value2.length != 0) {
                    alert(value)
                    document.getElementById("<%=w_email.ClientID %>").style.borderColor = "red";
                swal({
                    title: "",
                    text: 'Please enter a valid e-mail address.',
                    type: 'error',
                    closeOnConfirm: false,
                    animation: false
                });
                alert('err1')
                sttttt();
            } else if (value2.length == 0) {
                document.getElementById("<%=w_email.ClientID %>").style.borderColor = "lightgrey";
            }
            if (atposition < 1 || dotposition < atposition + 2 || dotposition + 2 >= value.length) {

                document.getElementById("<%=email.ClientID %>").style.borderColor = "red";
                swal({
                    title: "",
                    text: 'Please enter a valid e-mail address.',
                    type: 'error',
                    closeOnConfirm: false,
                    animation: false
                });
                alert('err2')
                return false;
            } else {
                alert('noerr')
                return true;
            }
            }
            else {
                
                swal({
                    title: "",
                    text: 'Please check required fields.',
                    type: 'error',
                    closeOnConfirm: false,
                    animation: false
                });     
            }
        }

    </script>
    
</asp:Content>

<asp:Content ContentPlaceHolderID="NewUserContent" runat="server">
    <form class="new_candidates_onboarding_job_info section--m1" id="new_candidates_onboarding_job_info" runat="server" method="post" data-ng-click="save(model)">
      <section id="sectionHeadIntro">
          <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    <Scripts><asp:ScriptReference Path="../js/new-user-form-handler.js"/></Scripts></asp:ScriptManager>
        <h3 class="form_title">Hello, <asp:Literal ID="litFName" runat="server"></asp:Literal>.</h3>
        <p class="form_subtitle">Tell us a little bit more about yourself.</p>     
      </section>
      <div class=" headTitle">
      	<div class="center">
      		<h2 class="x-1 pad_l mrg-t animation-h2 " id="headTitleCenter"><span><img src="../img/icon-s-generalinfo.png" class="colourfulIcon" alt="GI"/></span><span class="colourfulTitle">General Information</span></h2>
      	</div>
      	
      </div>
        <section>
      <div class="layout layout--middle">
      	  
			</div>
		<div class="layout layout--middle">

                    <asp:Label id="NewCandProfiles" runat="server"></asp:Label> 
                        <asp:HiddenField id="exist"  runat="server"></asp:HiddenField> 

            <asp:hiddenField id="isNewUser"   runat="server"></asp:hiddenField> 	
            <asp:hiddenField id="UserCounter"   runat="server"></asp:hiddenField> 	
				<asp:hiddenField id="IsDirect"   runat="server"></asp:hiddenField> 	

				<div class="layout__item sm-1of3">
					<label class="a--pseudo req"  for="first_name">First Name</label>
					<asp:TextBox id="first_name" class="required-entry inp--width " name="first_name" runat="server" AutoCompleteType="FirstName" required></asp:TextBox>                    
				</div>

			<div class="layout__item sm-1of3">
				<div class="layout__item">
					<label class="a--pseudo" for="middle_name">Middle Name</label>
					<asp:TextBox name="middle_name" id="middle_name" class="inp--width"  AutoCompleteType="MiddleName" runat="server" ></asp:TextBox>
				</div>
			</div>
			<div class="layout__item sm-1of3">
				<div class="layout__item">
					<label class="a--pseudo req" for="last_name">Last Name</label>
					<asp:TextBox id="last_name" class="required-entry inp--width" name="last_name"  AutoCompleteType="LastName" runat="server" required></asp:TextBox>
                    
                </div>
			</div>
		</div>
		<div class="layout layout--middle">
			<div class="layout__item sm-1of2">
				<div class="layout__item w">
					<label class="a--pseudo" for="phone_l_a">Phone</label>
					<div class="w">
					    <asp:TextBox id="phone_l" class="required-entry inp--width" name="phone_l" placeholder="000 0000000 or 0000000000" pattern ="[0-9\s -]{6,16}" runat="server"></asp:TextBox>
					    
                    </div>
				</div>
			</div>
			<div class="layout__item sm-1of2 fr">
				<div class="layout__item w">
					<label class="a--pseudo req" for="phone_l_a2">Mobile</label>
					<div class="w">
                        <asp:TextBox id="phone_m" class="required-entry inp--width" name="phone_m" placeholder="000 0000000 or 0000000000" pattern ="[0-9\s -]{6,16}" runat="server" required></asp:TextBox>
					    
					</div>
				</div>
			</div>			
		</div>
		<div class="layout layout--middle">
			<div class="layout__item sm-1of2 t05">
				<label class="a--pseudo req w" for="email">Personal Email</label>
				<asp:TextBox id="email" class="inp--width" maxlength="50" runat="server" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required></asp:TextBox>
                
			</div>	
			<div class="layout__item sm-1of2 fr t05">
				<label class="a--pseudo w" for="work-email">Alternative Email</label>
				<div class="w">
				    <asp:TextBox id="w_email" class="inp--width" maxlength="50" runat="server" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" AutoCompleteType="Email" ></asp:TextBox>
                    
				</div>
			</div>
		</div> 
		<div class="layout layout--middle">
            <div class="tooltipWorkContact"><button type="button" class="toggleMap" onclick="toggleMap();">Show/Hide Map</button><img src="../img/info-sign.png" alt="&#8594"/><span class="tooltiptext">If you want you can use map to search for location</span></div>

		<div id="map"></div>
        </div>
		<div class="layout layout--middle">
			<div class="layout__item sm-1of2 t05">
				<div class="layout__item w">
					<label class="a--pseudo req" for="address">Address</label>
					<div class="w">
					    <asp:TextBox id="address" class=" address inp--width" AutoCompleteType="HomeStreetAddress" runat="server" required></asp:TextBox>
					</div>
				</div>
			</div>
            <div class="layout__item sm-1of2 fr">
				<div class="layout__item w">
					<label class="a--pseudo" for="suburb">Suburb</label>
					<div class="w">
					    <asp:TextBox id="suburb" class="suburb inp--width" runat="server"></asp:TextBox>
					</div>
				</div>
			</div>
		</div>
		<div class="layout layout--middle">
            <div class="layout__item sm-1of2 ">
				<div class="layout__item w">
					<label class="a--pseudo req" for="city">Town/City</label>
					<div class="w">
                        <sf:Connection ID="Connection1" runat="server"></sf:Connection>
                        <asp:TextBox id="city" onFocus="geolocate();" class="city inp--width" runat="server" placeholder="City" MaxLength="20" required></asp:TextBox>
				        <asp:TextBox id="postCode" class="postCode inp--width" runat="server" AutoCompleteType="HomeZipCode" placeholder="Postcode" MaxLength="5" required></asp:TextBox>
					</div>
				</div>
			</div>
			<div class="layout__item sm-1of2 fr">
				<div class="layout__item w">
					<label class="a--pseudo req" for="country">Country</label>
					<div class="w">
					    <sf:Connection ID="SIFConn" runat="server"></sf:Connection>
					    <sf:StayinFrontDataSource ID="SIFCountry" runat="server" ClassName="stdCountry" 
                            Connection="SIFConn" Item="Countries" Mode="TopLevelFolder">
                            <Columns>
                                <sf:MemberColumn Member="Name" Name="Name" />
                            </Columns>
                        </sf:StayinFrontDataSource>
					    <asp:DropDownList ID="ddlCountry" runat="server"  class="crs-country" DataSourceID="SIFCountry" 
					        AppendDataBoundItems="true" required>
					        <asp:ListItem Text="" Value=""></asp:ListItem>
					    </asp:DropDownList>
					</div>
				</div>
			</div>
		</div>
		<div class="layout layout--middle">
            <div class="layout__item sm-1of2 ">
				<div class="layout__item w">
					<label class="a--pseudo" for="birthPlace">Place of Birth</label>
					<div class="w">
					    <asp:TextBox name="birthPlace" id="birthPlace" class="inp--width" runat="server" ></asp:TextBox>
					 </div>
				</div>
			</div>
			<div class="layout__item sm-1of2 fr">
				<div class="layout__item w">
				     <label class="a--pseudo w" for="DOB-day">Date Of Birth (optional)</label>
				
				    <input type="text" name="birthday" id="birthday" class="dropdate" runat="server">
				
				</div>
			</div>
		</div>
		<div class="layout layout--middle">
            <div class="layout__item sm-1of2 ">
				<div class="layout__item w">
				    <label class="a--pseudo" for="linkedin">LinkedIn Page</label>
					<div class="w">
					    <asp:TextBox name="linkedin" id="linkedin" class="inp--width" runat="server" ></asp:TextBox>
					 </div>
				</div>
			</div>
            <div class="layout__item sm-1of2 fr">
			    <div class="layout__item w">
				    <div class="layout__item w">
				        <label class="a--pseudo" for="skype_name">Skype Name</label>
					    <div class="w">
						    <asp:TextBox name="skype_name" id="skype_name" class="inp--width" runat="server" ></asp:TextBox>
					    </div>
				    </div>
			    </div>
            </div>
		</div>
		<div class="layout layout--middle">			
		    <div class="layout__item sm-1of2 ">
			    <div class="layout__item w">
                    <sf:StayinFrontDataSource ID="CandGender" runat="server" ClassName="Candidate_CandidateGender" 
                        Connection="SIFConn" Item="Candidate_CandidateGender" Mode="Enumeration" AddBlankRow="true">
                    </sf:StayinFrontDataSource> 
                    <label class="a--pseudo " for="gender">Gender (optional)</label>                                   
                    &nbsp;<label class="a--pseudo" for="gender"></label>                                   
                    <asp:DropDownList ID="Gender" runat="server" DataSourceID="CandGender" DataTextField="Value" DataValueField="Value" ></asp:DropDownList>
                   
		        </div>
		    </div>
	        <div class="layout__item sm-1of2 fr">
		        <div class="layout__item w">
			       <label class="a--pseudo" for="gender">Please add your photo.(.jpg, .jpeg, .png, .bmp)</label>      
			        <div class="w">
			            <asp:FileUpload ID="photoUpload" runat="server"   BorderStyle="None"></asp:FileUpload>
			            <asp:Label ID="lblPhotoUpload" ForeColor="Red" runat="server"></asp:Label>
			        </div>
			    </div>
			</div>
		
		</div>
		<div class="floatLeft">
			<label class="a--pseudo" for="driving"> Current Drivers License </label>
			<asp:CheckBox ID="driving" runat="server"  />
			<label class="a--pseudo ml2" for="ownTransport"> Own Transport </label>
			<asp:CheckBox ID="ownTransport" runat="server" />
			<label class="a--pseudo ml2" for="smoker"> Smoker </label>
			<asp:CheckBox ID="smoker" runat="server" />
		</div>	
            <br />
        </section>
        <section>
        <div class="sec-5 section--new-user ov">
			<div class="center">
				<h2 class="x-1 pad_l mrg-t animation-h2">What is your availability to start a role</h2>
			</div>
      		<div class="upArrow u2"></div>
      	</div>
		<div> 
		<div class="layout layout--middle">
				
				<div class="layout__item w">
					<label class="a--pseudo req"  for="alt_first_name">What times are you available for work?</label>
					<asp:TextBox id="availability" class="required-entry inp--width " name="alt_first_name" MaxLength="50"  runat="server" required></asp:TextBox>
				</div>
		</div>
     </div>
      </section>
      <%--<section class="work-email-phone pad-t0">
      <div class="section--new-user ov  tooltipWorkContact">
			<div class="center pd01 ">
				<h2 class="x-1 pad_l mrg-t animation-h2 ">Work Contact Details <img src="../img/info-sign.png" alt="&#8594"/></h2>
                <span class="tooltiptext">If you want Alpha to contact you at work please enter the phone number and/or email address</span>
			</div>
      		<div class="upArrow u2"></div>
      	</div>
		<div>	
     	<div class="layout layout--middle">
			<div class="layout__item sm-1of2">
				<div class="layout__item w">
					<label class="a--pseudo" for="phone-work-a">Work Phone </label>
					<div class="w">
					    <asp:TextBox id="w_phone" class="required-entry inp--width" name="phone_m" placeholder="000 0000000 or 0000000000" pattern ="[0-9\s -]{6,16}" runat="server" ></asp:TextBox>
					    
					 </div>
				</div>
			</div>
			<div class="layout__item sm-1of2 fr t05">
				<div class="layout__item w">
					<label class="a--pseudo" for="w_email">Work Email</label>
				    <asp:TextBox id="w_email" class="inp--width" runat="server"></asp:TextBox>
				</div>
			</div>
		</div>
		  </div>
      </section>--%>
        <section class="pad-t0">
      <div class="section--new-user ov">
			<div class="center pd01">
				<h2 class="x-1 pad_l mrg-t animation-h2">Permanent Employment Details</h2>
			</div>
      		<div class="upArrow u2"></div>
      	</div>
     	<div class="layout layout--middle">
			<div class="layout__item sm-1of2">
				<div class="layout__item w">
					<label class="a--pseudo" for="currEmp">Current Employer</label>
					<asp:TextBox name="currEmp" id="currEmp" class="inp--width" runat="server" ></asp:TextBox>
				</div>
			</div>
			<div class="layout__item sm-1of2 fr">
				<div class="layout__item w">
					<label class="a--pseudo" for="currPos">Current Position</label>
					<asp:TextBox name="currPos" id="currPos" class="inp--width" runat="server" ></asp:TextBox>
				</div>
			</div>
		 </div>
		<div class="layout layout--middle">	
			<div class="layout__item sm-1of2">
				<div class="layout__item w">
					<label class="a--pseudo" for="currSal">Current Salary and Benefits</label>
					<asp:TextBox name="currSal" id="currSal" class="inp--width" runat="server" ></asp:TextBox>
				</div>
			</div>
			<div class="layout__item sm-1of2 fr">
				<div class="layout__item w">
					<label class="a--pseudo" for="sal_sought">Salary Sought</label>
					<asp:TextBox name="sal_sought" id="sal_sought" class="inp--width" runat="server" ></asp:TextBox>
				</div>
			</div>
            </div>
          <div class="layout layout--middle">	
				<div class="layout__item w">
					<label class="a--pseudo" for="notice_time_perm">Notice period required</label>
					<asp:TextBox name="notice_time_perm" id="notice_time_perm" MaxLength="50" class="inp--width" runat="server" ></asp:TextBox>
			</div>
		</div>
      </section>
        <section class='pad-t0'>
        <div class="section--new-user ov">
			<div class="center">
				<h2 class="x-1 pad_l mrg-t animation-h2">Temp / Contract Employment Details</h2>
			</div>
      		<div class="upArrow u2"></div>
      	</div>
     	<div class="layout layout--middle">
			<div class="layout__item sm-1of2 ">
				<div class="layout__item w floatLeft">
					<label class="a--pseudo" for="currAgen">If currently registered, which Agencies?</label>
					<asp:TextBox name="currAgen" id="currAgen" class="inp--width " runat="server" ></asp:TextBox>
				</div>
			</div>
			<div class="layout__item sm-1of2 fr">
				<div class="layout__item w">
					<label class="a--pseudo" for="temp_sought">Temp / Contract Rate Sought</label>
					<asp:TextBox name="temp_sought" id="temp_sought" class="inp--width" runat="server" ></asp:TextBox>
				</div>
			</div>
			<div class="layout layout--middle">
			<div class="layout__item sm-1of2 ">
				<div class="layout__item w floatLeft">
					<label class="a--pseudo" for="current_work_at">Currently working at</label>
					<asp:TextBox name="current_work_at" id="current_work_at" class="inp--width" runat="server" ></asp:TextBox>
				</div>
			</div>
			<div class="layout__item sm-1of2 fr">
				<div class="layout__item w ">
					<label class="a--pseudo" for="notice_time">Notice period required</label>
					<asp:TextBox name="notice_time" id="notice_time" class="inp--width" runat="server" ></asp:TextBox>
				</div>
			</div>
			
			</div>
		</div>
      </section>
      <section>
        <div class="sec-5 section--new-user ov">
			<div class="center">
				<h2 class="x-1 pad_l mrg-t animation-h2">Emergency Contact</h2>
			</div>
      		<div class="upArrow u2"></div>
      	</div>
		<div> 
		<%--<div class="layout layout--middle">
		    <div class="layout__item w">
				<div class="layout__item w">--%>
				   <%-- <label class="a--pseudo" for="title">Title</label>
				    <sf:StayinFrontDataSource ID="AltNameTtile" runat="server" ClassName="stdPersonName" 
                            Connection="SIFConn" Item="stdPersonName_Title" Mode="Enumeration" AddBlankRow="true">
                    </sf:StayinFrontDataSource>
					 <asp:DropDownList ID="AltTitle" runat="server" 
                        DataSourceID="AltNameTtile" DataTextField="Display" DataValueField="Value"></asp:DropDownList>  --%> 
			<%--	</div>
			</div>
		</div>    --%>
		<div class="layout layout--middle">
				
				<div class="layout__item sm-1of2">
					<label class="a--pseudo req"  for="alt_first_name">First Name</label>
					<asp:TextBox id="alt_first_name" class="required-entry inp--width " name="alt_first_name" runat="server" required></asp:TextBox>
				</div>
			<div class="layout__item  sm-1of2 fr">
					<label class="a--pseudo req" for="alt_last_name">Last Name</label>
					<asp:TextBox id="alt_last_name" class="required-entry inp--width" name="alt_last_name"  runat="server" required></asp:TextBox>
			</div>
		</div>
       	<div class="layout layout--middle">
			<div class="layout__item sm-1of2">
				<div class="layout__item w">
					<label class="a--pseudo req" for="phone-n-ec-a">Phone Number</label>
					<div class="w">
                        <asp:TextBox id="alt_phone_l" class="required-entry inp--width" name="alt_phone_l" placeholder="000 0000000 or 0000000000" pattern ="[0-9\s -]{6,16}" runat="server" required></asp:TextBox>
					    
					 </div>
				</div>
			</div>
			<div class="layout__item sm-1of2 fr">
				<div class="layout__item w t05">
                    <label class="a--pseudo " for="alt_email">Email</label>
					<asp:TextBox name="alt_email" id="alt_email" class="inp--width" runat="server" ></asp:TextBox>
					
				</div>
     </div>
               <div class="layout layout--middle">	
				<div class="layout__item w">
					<label class="a--pseudo" for="alt_rel">Relationship</label>
					<asp:TextBox name="alt_rel" id="alt_rel" class="inp--width" runat="server" ></asp:TextBox>
			</div>
      </section>
      <section class="xs-text-right">
          <asp:Label id="session_fileds" runat="server">                    
                </asp:Label> 
         <asp:Button runat="server" class="buttonNext button button--primary saveCity" id="next_btn"  Text="Continue"/>
        <%--<button  runat="server" class="buttonNext button button--primary saveCity" id="next_btn" type="submit" causesvalidation="true" validationgroup="LocationInfoGroup" Text="Continue" >
   	    <span>Continue</span><img src="../img/right-arrow.svg" alt="&#8594"/>
        </button></section>  --%>
    </form>
    <script type="text/javascript"  async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDNBLRExTebnQLKcjqKL1bETbQrhELyxbk&libraries=places&callback=initMap">
    </script>

   <script type="text/javascript">

        //GooGle Map API
        var markers = [];
        function initMap() {
            var uluru = { lat: -25.363, lng: 131.044 };
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 13,
                center: uluru
            });
            var geocoder = new google.maps.Geocoder();
            var addr = $('.address').val();
            var point = "";
            if (addr) {
                //Set map to location
                point = $('.address').val() + ", " + $('.city').val() + ", " + $('.crs-country').val();
            } else {
                point = "27  Gillies Ave, Auckland, New Zealand";
            }
            geocoder.geocode({ 'address': point }, function (results, status) {
                if (status == 'OK') {
                    map.setCenter(results[0].geometry.location);
                    var marker = new google.maps.Marker({
                        map: map,
                        position: results[0].geometry.location
                    });
                    markers.push(marker);
                } else {
                    console.log('Geocode was not successful for the following reason: ' + status);
                }
            });
            map.addListener('click', function (event) {
                geocoder.geocode({
                    'latLng': event.latLng
                }, function (results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        if (results[0]) {
                            //fill fields

                            var address = results[0].formatted_address;
                            var full_addr = [];
                            full_addr = address.split(",");

                            var postCode_m, city_m, pc_city_m, country_m, street_m, suburb_m;
                            city_m = "";
                            if (full_addr.length === 4) {
                                pc_city_m = full_addr[2].trim().split(" ");
                                if (parseInt(full_addr[2].trim()) > 0) {
                                    postCode_m = full_addr[2].trim();
                                    city_m = full_addr[1].trim();
                                } else {
                                    if (pc_city_m.length > 2) {
                                        postCode_m = pc_city_m[pc_city_m.length - 1];

                                        for (i = 0; i < pc_city_m.length - 1; i++) {
                                            city_m = city_m + " " + pc_city_m[i];
                                        }

                                    } else {
                                        postCode_m = pc_city_m[1];
                                        city_m = pc_city_m[0];
                                    }
                                }

                                country_m = full_addr[3].trim();
                                suburb_m = full_addr[1].trim();

                            } else if (full_addr.length === 3) {
                                pc_city_m = full_addr[1].trim().split(" ");
                                if (pc_city_m.length > 2) {
                                    postCode_m = pc_city_m[pc_city_m.length - 1];
                                    for (i = 0; i < pc_city_m.length - 1; i++) {
                                        city_m = city_m + " " + pc_city_m[i];
                                    }

                                } else {
                                    postCode_m = pc_city_m[1];
                                    city_m = pc_city_m[0];
                                }
                                country_m = full_addr[2].trim();
                                suburb_m = null
                            }
                            street_m = full_addr[0].trim();

                            $('.address').val(street_m);
                            $('.crs-country').val(country_m);
                            $('.suburb').val(suburb_m);
                            $('.city').val(city_m);
                            $('.postCode').val(postCode_m);
                        }
                    }
                });
                placeMarkerAndPanTo(event.latLng, map);
            });

            var autocomplete;
            var southWest = new google.maps.LatLng(-49.30697, 163.32275);
            var northEast = new google.maps.LatLng(-32.59742, -176.28662);
            var bounds = new google.maps.LatLngBounds(southWest, northEast);
            function initialize() {

                var input = document.getElementById('ctl00_ctl00_portalBody_NewUserContent_address');
                autocomplete = new google.maps.places.Autocomplete(input, { bounds: bounds });
                autocomplete.addListener('place_changed', fillInAddress);
            }
            function fillInAddress() {
                // Get the place details from the autocomplete object.
                var place = autocomplete.getPlace();

                var address = place.formatted_address;
                geocoder.geocode({ 'address': address }, function (results, status) {
                    if (status == 'OK') {

                        map.setCenter(results[0].geometry.location);
                        var marker = new google.maps.Marker({
                            map: map,
                            position: results[0].geometry.location
                        });
                        deleteMarkers();
                        markers.push(marker);
                    } else {
                        console.log('Geocode was not successful for the following reason: ' + status);
                    }
                });
                var full_addr = [];
                full_addr = address.split(",");

                var postCode_m, city_m, pc_city_m, country_m, street_m, suburb_m;
                city_m = "";
                if (full_addr.length === 4) {
                    pc_city_m = full_addr[2].trim().split(" ");
                    if (parseInt(full_addr[2].trim()) > 0) {
                        postCode_m = full_addr[2].trim();
                        city_m = full_addr[1].trim();
                    } else {

                        if (pc_city_m.length > 2) {
                            postCode_m = pc_city_m[pc_city_m.length - 1];
                            for (i = 0; i < pc_city_m.length - 1; i++) {
                                city_m = city_m + " " + pc_city_m[i];
                            }
                        } else {
                            postCode_m = pc_city_m[1];
                            city_m = pc_city_m[0];
                        }
                    }

                    country_m = full_addr[3].trim();

                    suburb_m = full_addr[1].trim();
                    if (city_m === suburb_m) {
                        suburb_m = null;
                    }

                } else if (full_addr.length === 3) {
                    pc_city_m = full_addr[1].trim().split(" ");
                    if (pc_city_m.length > 2) {
                        postCode_m = pc_city_m[pc_city_m.length - 1];
                        for (i = 0; i < pc_city_m.length - 1; i++) {
                            city_m = city_m + " " + pc_city_m[i];
                        }
                    } else {
                        postCode_m = pc_city_m[1];
                        city_m = pc_city_m[0];
                    }
                    country_m = full_addr[2].trim();
                    suburb_m = null
                } else if (full_addr.length === 2) {
                    var addrFull = $('.address').val().split(",");
                    if (addrFull.length === 3) {
                        pc_city_m = addrFull[1].trim().split(" ");
                        if (pc_city_m.length > 2) {
                            postCode_m = pc_city_m[pc_city_m.length - 1];
                            for (i = 0; i < pc_city_m.length - 1; i++) {
                                city_m = city_m + " " + pc_city_m[i];
                            }

                        } else {
                            postCode_m = pc_city_m[1];
                            city_m = pc_city_m[0];
                        }
                        country_m = addrFull[2].trim();


                        if (postCode_m === undefined) {
                            var pc_pre = full_addr[0];
                            pc_city = pc_pre.trim().split(" ");
                            if (pc_city.length > 2) {
                                postCode_m = pc_city[pc_city.length - 1];
                            } else {
                                postCode_m = pc_city[1];
                            }
                        }
                        full_addr[0] = addrFull[0];
                        suburb_m = null
                    }


                }
                street_m = full_addr[0].trim();

                $('.address').val(street_m);
                $('.crs-country').val(country_m);
                $('.suburb').val(suburb_m);
                $('.city').val(city_m);

                $('.postCode').val(postCode_m);

            }

            google.maps.event.addDomListener(window, 'load', initialize);
        }

        function setMapOnAll(map) {
            for (var i = 0; i < markers.length; i++) {
                markers[i].setMap(map);
            }
        }
        function placeMarkerAndPanTo(latLng, map) {
            deleteMarkers()
            var marker = new google.maps.Marker({
                position: latLng,
                map: map
            });
            map.panTo(latLng);
            markers.push(marker);
        }
        function clearMarkers() {
            setMapOnAll(null);
        }

        function deleteMarkers() {
            clearMarkers();
            markers = [];
        }
    </script>
</asp:Content>
