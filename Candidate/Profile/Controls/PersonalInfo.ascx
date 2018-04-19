<%@ Control Language="vb" AutoEventWireup="false" CodeFile="PersonalInfo.ascx.vb" Inherits="PersonalInfo" %>
<sf:Connection ID="SIFConn" runat="server"></sf:Connection>
<section>
				 <div class="m-b">
                     
                     <div class="gear">
						<label>Phone</label>
						<span class="datainfo inline">
                            <asp:TextBox id="PhoneEdit" class="required-entry phone_l_n_edit inp--width" name="phone_l" placeholder="000 0000000 or 0000000000" pattern ="[0-9\s -]{6,16}" runat="server"></asp:TextBox>
					    
						</span>
					</div>
                     <div class="gear">
						<label class="req">Mobile</label>
						<span class="datainfo inline">
                            <asp:TextBox id="MobileEdit" class="required-entry phone_l_n_edit inp--width" name="phone_l" placeholder="000 0000000 or 0000000000" pattern ="[0-9\s -]{6,16}" runat="server" required></asp:TextBox>
					    
						</span>
					</div>
                     <div class="gear">
						<label class="a--pseudo req w" for="email">Personal Email</label>
				        <span class="datainfo inline">
                            <asp:TextBox id="EmailEdit" class="inp--width" maxlength="50" runat="server" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required>

                            </asp:TextBox>               
						</span>
					</div>
                     <div class="gear">
						<label class="a--pseudo w" for="email">Alternative Email</label>
				        <span class="datainfo inline">
                            <asp:TextBox id="AltEmailEdit" class="inp--width" maxlength="50" runat="server" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$">

                            </asp:TextBox>               
						</span>
					</div>
						<div class="gear">
							<label class="req">Address</label>
							<span class="datainfo"><asp:TextBox  class="inp--width" ID="candidateAddressEdit" runat="server" required></asp:TextBox></span>
						</div>
                     <div class="gear">
							<label class="req">Suburb</label>
							<span class="datainfo"><asp:TextBox  class="inp--width" ID="SuburbEdit" runat="server" required></asp:TextBox></span>
						</div>
						<div class="gear">
							<label class="req">City</label>
							<span class="datainfo"><asp:TextBox class="inp--width" ID="candidateCityEdit" runat="server" required></asp:TextBox></span>
						</div>
						<div class="gear">
							<label class="req">Post Code</label>
							<span class="datainfo"><asp:TextBox class="inp--width" ID="candidatePostCodeEdit" runat="server" required></asp:TextBox></span>
						</div>
                     <div class="gear">
							<label class="req">Country</label>
							<span class="datainfo"><asp:TextBox class="inp--width" ID="CountryEdit" runat="server" required></asp:TextBox></span>
						</div>
						<div class="gear">
							<label class="">Date of Birth (dd/mm/year)</label>
							<div class="w"><input type="text" name="DOBEdit" id="DOBEdit" class="dropdate" runat="server" ></div>
						</div>
						<div class="gear">
							<label>Place of Birth</label>
							<span class="datainfo"><asp:TextBox class="inp--width" ID="POBEdit" runat="server" ></asp:TextBox></span>
						</div>						
						<div class="gear">
							<label>LinkedIn Page</label>
							<span class="datainfo"><a href="#" target="_blank"><asp:TextBox class="inp--width"  ID="LinkedInEdit" runat="server"></asp:TextBox></a></span>
						</div>
						
						<div class="gear">
							<label>Skype Name</label>
							<span class="datainfo"><asp:TextBox class="inp--width"  ID="SkypeEdit" runat="server"></asp:TextBox></span>
						</div>
						<div class="gear">
						    <sf:StayinFrontDataSource ID="CandGender" runat="server" ClassName="Candidate_CandidateGender" 
                            Connection="SIFConn" Item="Candidate_CandidateGender" Mode="Enumeration" AddBlankRow="true">
                            </sf:StayinFrontDataSource> 
							<label>Gender</label>
							<span class="datainfo"><asp:DropDownList ID="GenderEdit" runat="server" DataSourceID="CandGender" DataTextField="Value" DataValueField="Value">
							</asp:DropDownList></span>
						</div>						
						<div class="gear">
							<label>Drivers License</label>
							<span class="datainfo "><asp:CheckBox ID="DriverLicenseEdit" runat="server"></asp:CheckBox></span>
						</div>
						<div class="gear">
							<label>Own Transport</label>
							<span class="datainfo "><asp:CheckBox ID="OwnTransportEdit" runat="server"></asp:CheckBox></span>
						</div>
						<div class="gear">
							<label>Smoker</label>
							<span class="datainfo "><asp:CheckBox ID="SmokerEdit" runat="server"></asp:CheckBox></span>
						</div>
                     <div class="gear">
							<label>Availability</label>
							<span class="datainfo"><asp:TextBox class="inp--width" ID="AvailabilityEdit" runat="server"></asp:TextBox></span>
						</div>
				</div>

</section>
				<div class="modal-header" style="display:inherit;"><img src="../img/emergency-contact.png" height="30" style="position: relative;top: 0.5rem;"> <h3 class="form_title b-w2"> Emergency Contact</h3> 
                </div>
<section>
      			<div class="m-b"> 
					<div class="gear">
						<label class="req">First Name</label>
						<span class="datainfo"> <asp:TextBox class="inp--width" ID="CandidatesEmergencyContactNameEdit" runat="server" required></asp:TextBox></span>
					</div>
                      <div class="gear">
						<label class="req">Last Name</label>
						<span class="datainfo"> <asp:TextBox class="inp--width" ID="CandidatesEmergencyContactLastNameEdit" runat="server" required></asp:TextBox></span>
					</div>
					<div class="gear">
						<label class="req">Phone</label>
						<span class="datainfo inline ">
                            <asp:TextBox id="CandidatesEmergencyContactPhoneEdit" class="phone_l_n_edit phone_l_n_edit inp--width" name="phone_l" placeholder="000 0000000 or 0000000000" pattern ="[0-9\s -]{6,16}" runat="server" required></asp:TextBox></span>
					</div>
                      <div class="gear">
						<label class="a--pseudo w" for="email">Alternative Email</label>
				        <span class="datainfo inline">
                            <asp:TextBox id="EmailEmEdit" class="inp--width" maxlength="50" runat="server" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$">
                            </asp:TextBox>               
						</span>
					</div>
					<div class="gear">
						<label>Relationship</label>
						<span class="datainfo"><asp:TextBox class="inp--width" ID="CandidatesEmergencyContactRelationshipEdit" runat="server"></asp:TextBox></span>
					</div>					
				</div>	
			</section>
            
<%--<div class="modal-header" style="display:inherit;"><img src="../img/work-contacts.png" height="30" class="aw-img"> <h3 class="form_title b-w2 aw"> If you want Alpha to contact you at work </h3> 
</div>
			<section><div class="m-b">
				<div class="gear">
					<label>Work Phone</label>
					<span class="datainfo inline"><asp:TextBox ID="WorkPhoneEditArea" runat="server" class="phone_l_a" pattern ="[0-9]{2,5}" placeholder="Area"></asp:TextBox><asp:TextBox ID="WorkPhoneEditNum" runat="server" class="phone_l_n_edit" pattern ="[0-9]{6,9}" placeholder="Number"></asp:TextBox></span>
				</div>
				<div class="gear">
					<label>Work Email</label>
					<span class="datainfo"><asp:TextBox ID="WorkEmailEdit" runat="server" class="inp--width"></asp:TextBox></span>
				</div>
                </div>
			  </section>--%>