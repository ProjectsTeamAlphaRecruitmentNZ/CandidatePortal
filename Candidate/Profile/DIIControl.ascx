<%@ Control Language="VB" AutoEventWireup="false" className="DIIControl" CodeFile="DIIControl.ascx.vb" Inherits="DIIControl" %>
<sf:Connection ID="SIFConn" runat="server"></sf:Connection>
<div class="modal fade" id="addDII"  role="dialog" aria-labelledby="DIIModalLabel" aria-hidden="true">		
    <div class="keyDIIWrap"><asp:HiddenField ID ="key1" runat="server"/></div>
    <asp:HiddenField ID ="IncKeyBox1" runat="server"/>
                      <div class="modal-dialog" id="DIIModalDialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <img src="../img/skills-2.png" height="30" style="position: relative;top: 0.5rem;"> <h3 class="form_title b-w2">DEATH, INJURY, ILLNESS</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
<section>
    <div class="pad-1" id="dii-form">	
			<div class="add-form-dii">
			<h2 class="center">NOTIFICATION OF A NOTIFIABLE INCIDENT</h2>
				<div style="background-color:#f4f4f4; padding:2rem;">	
					<p>Use this form to notify WorkSafe New Zealand of a notifiable event as required by Section 56 of the Health and Safety at Work Act 2015. As defined in the act, a notifiable event means any of the following events that arise from work:</p>
					<div class=" toggle-icon infoToggler"><a href="javascript:void(0)" class="toggle-icon"><i class="fa fa-info"></i>&nbsp;<i>Terms</i></a></div>
					<div class="toggle-p">
						<p><strong>PCBU:</strong>A PCBU is a 'person conducting a business or undertaking'. A PCBU may be an individual person or an organisation. It does not include workers or officers of PCBUs, volunteer associations with no employees, or home occupiers that employ or engage a tradesperson to carry out residential work. A PCBU must ensure, so far as is reasonably practicable, the health and safety of workers, and that other persons are not put at risk by its work. This is called the 'primary duty of care'.</p>
						<p><strong>HSR:</strong> Health and Safety Representative</p>
						<p><strong>Worker:</strong>A worker is an individual who carries out work in any capacity for a PCBU. It includes an employee, a contractor or sub-contractor, an apprentice or trainee, a person on work experience or a work trial, or a volunteer worker. Workers have their own health and safety duty to take reasonable care to keep themselves and others healthy and safe when carrying out work.</p>
					</div>
				</div>
				<div class="pad-1">
				<fieldset>
					<div class="toggle-icon">
						<div class="infoToggler">
							<img src="../img/arrow-right-grey.png" class="toggle-icon-img im2"/>
							<img src="../img/arrow-down-grey.png" class="toggle-icon-img hidden im2"/>
							<h3 class="s t" style="text-align: left;">Notifier Details</h3>
						</div>
					</div>
					<div class="toggle-p">
						 <sf:StayinFrontDataSource ID="NotifierTypeDS1" runat="server"
                                Connection="SIFConn" Item="Type" Mode="Enumeration" AddBlankRow="False">
                        </sf:StayinFrontDataSource> 
						<div class="radioButtonList center">
							<label class="desc">Are you making this notification as a:</label>
                            <asp:RadioButtonList ID="notifier_type1" runat="server" RepeatDirection="Horizontal" DataSourceID="NotifierTypeDS1"  CssClass="control control--radio" DataValueField="Value" ></asp:RadioButtonList>
						</div>
						<div>
							<label class="desc req" for="fname-injury-form">First Name</label>
							<div>
                                <asp:TextBox  class="inp--width" ID="NotifierFirstName1" runat="server" ></asp:TextBox>			  
							</div>
						</div>
						<div>
							<label class="desc req" for="lname-injury-form">Last Name</label>
							<div>
                                <asp:TextBox  class="inp--width" ID="NotifierLastName1" runat="server"></asp:TextBox>
							</div>
						</div>
						<div>
							<label class="desc req" for="phone-injury-form">Phone</label>
							<div >
						<span class="datainfo inline"><asp:TextBox ID="PhoneAreaBox1" class="phone_l_a" pattern ="[0-9]{2,5}" placeholder="Area" runat="server"></asp:TextBox><asp:TextBox ID="PhoneNumBox1" class="phone_l_n_edit" pattern ="[0-9]{6,9}" placeholder="Number" runat="server"></asp:TextBox></span>
							</div>
						</div>
						<div>
							<label class="desc req" for="mphone-injury-form">Mobile</label>
							<div>
                                <span class="datainfo inline"><asp:TextBox ID="MobileAreaBox1" class="phone_l_a" pattern ="[0-9]{2,5}" placeholder="Area" runat="server"></asp:TextBox><asp:TextBox ID="MobileNumBox1" class="phone_l_n_edit" pattern ="[0-9]{6,9}" placeholder="Number" runat="server"></asp:TextBox></span>
							</div>
						</div>
						<div>
							<label class="desc req" for="email-injury-form">Email</label>
							<div>
                                <asp:TextBox  class="inp--width" ID="EmailBox1" runat="server"></asp:TextBox>			  
							</div>
						</div>
						<div>
							<label class="desc req" for="address-injury-form">Address</label>

							<div>
                                <asp:TextBox  class="inp--width" ID="AddressBox1" runat="server"></asp:TextBox>			  
							</div>
						  </div>
						<div>
							<label class="desc req" for="city-injury-form">City</label>
							<div>
                                <asp:TextBox  class="inp--width" ID="CityBox1" runat="server"></asp:TextBox>			  
							</div>
						</div>
						<div>
							<label class="desc req" for="post-code-injury-form">Post Code</label>
							<div>
                                <asp:TextBox  class="inp--width" ID="PostCodeBox1" runat="server"></asp:TextBox>			  
							</div>
						</div>
					</div>
					</fieldset>
					<fieldset>
						<div class="toggle-icon">
							<div class="infoToggler">
								<img src="../img/arrow-right-grey.png" class="toggle-icon-img im2"/>
								<img src="../img/arrow-down-grey.png" class="toggle-icon-img hidden im2"/>
								<h3 class="s t" style="text-align: left;">Details of event</h3>
							</div>
						</div>
						<div class="toggle-p">
							<div>
								<label class="desc req" for="date-dii-injury-form">Date of event:</label>
								<div>
                                <asp:TextBox  class="inp--width datepicker" ID="DateBox1" runat="server"></asp:TextBox>
								</div>
							</div>
							<div>
								<label class="desc req" for="time-dii-injury-form">Time of event:</label>
								<div>
									<asp:TextBox  class="inp--width timepicker" ID="IncTimeBox1" runat="server"></asp:TextBox>
								</div>
							</div>
							<div>
								<label class="desc req" for="address-event-dii-form">Event address:</label>
								<div>
									<asp:TextBox  class="inp--width" ID="IncidentAddressBox1" runat="server"></asp:TextBox>	
								</div>
							</div>
							<div>
								<label class="desc req" for="city-event-dii-form">City:</label>
								<div>
									<asp:TextBox  class="inp--width" ID="IncidentCityBox1" runat="server"></asp:TextBox>		
								</div>
							</div>
							<div>
								<label class="desc" for="post-code-event-dii-form">Post Code:</label>
								<div>
									<asp:TextBox  class="inp--width" ID="IncidentPostCodeBox1" runat="server"></asp:TextBox>			
								</div>
							</div>
							<div>
								<label class="desc req" for="desc-event-dii-form">Provide a description of what happened:</label>
								<div>
									<asp:TextBox TextMode="MultiLine" class="inp--width" ID="DescriptionBox1" runat="server"></asp:TextBox>
								</div>
							</div>
							<div>
								<label class="desc" style="width:100%!important;">Confirm that the site has been preserved, as required by section 55 of the Act: <asp:CheckBox ID="SitePreservedBox1" runat="server" Checked="false" /></label>
							</div>
							<div>
								<label class="desc req" for="inc-injury-form">Have you notified any other agency?</label>
								<sf:StayinFrontDataSource ID="NotifiedDS1" runat="server"
                                Connection="SIFConn" Item="notified" Mode="Enumeration" AddBlankRow="true">
                        </sf:StayinFrontDataSource> 
								<div>
                                    <asp:DropdownList ID="NotifiedBox1"    runat="server" DataSourceID="NotifiedDS1"  DataValueField="Value" ></asp:DropdownList>
									
								</div>
							</div>	
							<div>
								<label class="desc req" for="agname-injury-form">Notified agency name:</label>
								<div>
									<asp:TextBox  class="inp--width" ID="AgencyNameBox1" runat="server"></asp:TextBox>
								</div>
							</div>
							<div>
								<label class="desc req" for="agphone-injury-form">Notified agency phone number:</label>
								<div>
									<span class="datainfo inline"><asp:TextBox ID="AgencyPhoneAreaBox1" class="phone_l_a" pattern ="[0-9]{2,5}" placeholder="Area" runat="server"></asp:TextBox><asp:TextBox ID="AgencyPhoneNumBox1" class="phone_l_n_edit" pattern ="[0-9]{6,9}" placeholder="Number" runat="server"></asp:TextBox></span>
								</div>
							</div>	
							<div>
								<div class=" toggle-icon infoToggler"><label class="desc">Nature of Injury
										<a href="javascript:void(0)" class="hideMe9"><i class="fa fa-info"></i></a>

								</label></div> 
										<div id="hideMe9 "class="toggle-p" style="background-color:#f4f4f4;margin-bottom:0.5rem;">
											<p><strong>Important:</strong>&nbsp;If the event you are attempting to notify us of does not appear in this list then notification is not required, and this form cannot be used. </p>
										</div>                                
                                <sf:StayinFrontDataSource ID="NatureIngDS1" runat="server"  Filter="HSGroup.code='NI'"
                                    Connection="SIFConn" Item="HS" Mode="TopLevelFolder" AddBlankRow="true">
                                     <Parameters>
                            <asp:Parameter Name="key" />
                        </Parameters>
                                <Columns> 
                            <sf:KeyColumn Name="Key" />
                                     <sf:MemberColumn Member="Name" Name="Name" />
                        </Columns>
                        </sf:StayinFrontDataSource>
								<div>
                                    <asp:DropdownList ID="NatureBox"  DataValueField="Key" DataTextField="Name" AppendDataBoundItems="true" runat="server" DataSourceID="NatureIngDS1" >
                                        <asp:ListItem Text="" Value="" ></asp:ListItem>
                                    </asp:DropdownList>									
								</div>
							</div>                           
							<div>
								<label class="desc req" for="body-parts-dii-form">Body Part(s) affected:</label>
                                 <sf:StayinFrontDataSource ID="BPDS1" runat="server"  Filter="HSGroup.code='BP'"
                                    Connection="SIFConn" Item="HS" Mode="TopLevelFolder">
                                      <Parameters>
                            <asp:Parameter Name="key" />
                        </Parameters>
                                <Columns> 
                            <sf:KeyColumn Name="Key" />
                                     <sf:MemberColumn Member="Name" Name="Name" />
                        </Columns>
                        </sf:StayinFrontDataSource>
								<div>
                                    <asp:DropdownList ID="BodyPartsBox"  DataValueField="Key" AppendDataBoundItems="true"  DataTextField="Name" runat="server" DataSourceID="BPDS1" >
                                        <asp:ListItem Text="" Value="" ></asp:ListItem>
                                    </asp:DropdownList>		
								</div>
							</div>	
							<div>
								<label class="desc req" for="desc-injury-dii-form">Injury description (Briefly describe the injury):</label>
								<div>
									<asp:TextBox TextMode="Multiline" class="inp--width" ID="InjuryDescBox1" runat="server"></asp:TextBox>
								</div>
							</div>
							<div>
								<label class="desc req" for="treatment-dii-form">Treatment Attempted</label>
                                <sf:StayinFrontDataSource ID="TADS1" runat="server"  Filter="HSGroup.code='TA'"
                                    Connection="SIFConn" Item="HS" Mode="TopLevelFolder" AddBlankRow="true">
                                    <Parameters>
                            <asp:Parameter Name="key" />
                        </Parameters>
                                <Columns> 
                            <sf:KeyColumn Name="Key" />
                                     <sf:MemberColumn Member="Name" Name="Name" />
                        </Columns>
                        </sf:StayinFrontDataSource>
								<div>
                                    <asp:DropdownList ID="TreatmentBox"  DataValueField="Key" DataTextField="Name"  AppendDataBoundItems="true" runat="server" DataSourceID="TADS1" >
                                        <asp:ListItem Text="" Value="" ></asp:ListItem>
                                    </asp:DropdownList>				
								</div>
							</div>
						</div>
					</fieldset>
					<fieldset>
						<div class="toggle-icon">
							<div class="infoToggler">
								<img src="../img/arrow-right-grey.png" class="toggle-icon-img im2"/>
								<img src="../img/arrow-down-grey.png" class="toggle-icon-img hidden im2"/>
								<h3 class="s t" style="text-align: left;">Injured/Ill person details</h3>
							</div>
						</div>	
						<div class="toggle-p">
						<div>
							<label class="desc req" for="fname-injured-dii-form">First Name</label>
							<div>
                              <asp:TextBox  class="inp--width" ID="InjNameBox" runat="server"></asp:TextBox>			  
							</div>
						</div>
						<div>
							<label class="desc req" for="lname-injured-dii-form">Last Name</label>
							<div>
                              <asp:TextBox  class="inp--width" ID="InjLastNameBox" runat="server"></asp:TextBox>			  
							</div>
						</div>
						<div>
							<label class="desc req" for="DOB-injured-dii-form">Date of birth</label>
                            <input type="text" name="birthday" id="birthday" class="dropdate" runat="server">
						</div>
						<div>
							<label class="desc req" for="inc-injury-form">Gender</label>
                            
							<div>
                            <asp:DropdownList ID="GenderBox"   runat="server"  >
                                <asp:ListItem Value=""></asp:ListItem>
                                <asp:ListItem Value="Male"></asp:ListItem>
                                <asp:ListItem Value="Female"></asp:ListItem>
                                <asp:ListItem Value="Other"></asp:ListItem>
                            </asp:DropdownList>
								
							</div>
						</div>	
						<div>
							<label class="desc req" for="address-injured-dii-form">Residential address</label>
							<div>
                              <asp:TextBox TextMode="MultiLine"  class="inp--width" ID="InjAddrBox" runat="server"></asp:TextBox>
                            </div>
						</div>
						<div>
							<label class="desc req" for="city-injured-dii-form">City</label>
							<div>
                              <asp:TextBox  class="inp--width" ID="InjCityBox" runat="server"></asp:TextBox>
                            </div>
						</div>
						<div>
							<label class="desc req" for="post-injured-dii-form">Post Code</label>
							<div>
                              <asp:TextBox  class="inp--width" ID="InjPostCodeBox" runat="server"></asp:TextBox>
                            </div>
						</div>
						<div>
							<label class="desc req" for="phone-injured-dii-form">Injured person's phone number</label>
							<div>
							  <span class="datainfo inline"><asp:TextBox ID="InjPhoneBoxA" class="phone_l_a" pattern ="[0-9]{2,5}" placeholder="Area" runat="server"></asp:TextBox><asp:TextBox ID="InjPhoneBoxN" class="phone_l_n_edit" pattern ="[0-9]{6,9}" placeholder="Number" runat="server"></asp:TextBox></span>
                            </div>
						</div>
						<div>
							<label class="desc req" for="type-dii-form">Affected person type</label>
                            <sf:StayinFrontDataSource ID="PersonTypeDS1" runat="server"
                                Connection="SIFConn" Item="HS_Event_inj_affected_type" Mode="Enumeration" AddBlankRow="True">
                        </sf:StayinFrontDataSource>
							<div>
                               <asp:DropdownList ID="InjPersonTypeBox"  runat="server" DataSourceID="PersonTypeDS1"  DataValueField="Value" ></asp:DropdownList>							
							</div>
						</div>	
						<div>
							<label class="desc req" for="hours-dii-form">How many hours had the person been at work when the incident occurred</label>
							<div>
                              <asp:TextBox  class="inp--width" ID="InjHoursBox" runat="server"></asp:TextBox></div>
						</div>
					</div>	
					</fieldset>
					<fieldset>
				   		<div class="toggle-icon">
							<div class="infoToggler">
								<img src="../img/arrow-right-grey.png" class="toggle-icon-img im2"/>
								<img src="../img/arrow-down-grey.png" class="toggle-icon-img hidden im2"/>
								<h3 class="s t" style="text-align: left;">PCBU Details</h3>
							</div>
						</div>
					<div class="toggle-p">
						<div>
							<label>Legal name of the business</label>
							<div>
                                <asp:TextBox class="inp--width" ID="pcbu_nameBox1" runat="server" Enabled="false"></asp:TextBox></div>
						</div>
						<div>
							<label>NZ business number</label>
							<div>
                               <asp:TextBox class="inp--width" ID="pcbu_nzbnBox1" runat="server" Enabled="false" ></asp:TextBox>	
							</div>
						</div>
						<div class="editor-label">
							<label>Industry</label>
                            <sf:StayinFrontDataSource ID="IndustryDS1" runat="server"  Filter="HSGroup.code='Ind'"
                                    Connection="SIFConn" Item="HS" Mode="TopLevelFolder" AddBlankRow="true">
                                <Parameters>
                            <asp:Parameter Name="key" />
                        </Parameters>
                                <Columns> 
                            <sf:KeyColumn Name="Key" />
                                     <sf:MemberColumn Member="Name" Name="Name" />
                        </Columns>
                        </sf:StayinFrontDataSource>
							<div>
                                <asp:DropdownList ID="IndustryBox1"  runat="server"  DataValueField="Key" AppendDataBoundItems="true" DataTextField="Name" DataSourceID="IndustryDS1" >
                                    <asp:ListItem Text="" Value="" ></asp:ListItem>
                                </asp:DropdownList>			
							</div>
						</div>
						<div>
							<label>Other</label>
							<div>
                               <asp:TextBox class="inp--width" ID="OtherBox1" runat="server" Enabled="false" Text="Human Recources &amp; Recruitment"></asp:TextBox>			  
							</div>
						</div>
						<div>
							<label class="req">Address</label>
							<div>
                                <asp:TextBox class="inp--width" ID="PCBUAddressBox1" runat="server" Enabled="false" ></asp:TextBox>			  
							</div>
						</div>
						<div>
							<label>City</label>
							<div>
                                <asp:TextBox class="inp--width" ID="PCBUCityBox1" runat="server" Enabled="false" ></asp:TextBox>			  
							</div>
						</div>
						<div>
							<label>Post Code</label>
							<div>
                                <asp:TextBox class="inp--width" ID="PCBUPostCodeBox1" runat="server" Enabled="false" ></asp:TextBox>			  
							</div>
						</div>
						<div>
							<label class="req">Contact person name</label>
							<div>
                                <asp:TextBox class="inp--width" ID="ContactPersonBox1" runat="server" Enabled="false" ></asp:TextBox>			  
							</div>
						</div>
						<div>
							<label>Email</label>
							<div>
                                <asp:TextBox class="inp--width" ID="PCBUEmailBox1" runat="server" Enabled="false" Text="colin@alphajobs.co.nz"></asp:TextBox>			  
							</div>
						</div>
						<div>
							<label>PCBU phone no. (mobile)</label>
							<div>
                                <span class="datainfo inline"><asp:TextBox ID="PCBUMA1" Enabled="false" class="phone_l_a" pattern ="[0-9]{2,5}" placeholder="Area" runat="server"></asp:TextBox><asp:TextBox Enabled="false" ID="PCBUMN1" class="phone_l_n_edit" pattern ="[0-9]{6,9}" placeholder="Number" runat="server"></asp:TextBox></span>
							</div>
						</div>
						<div>
							<label>PCBU phone no. (land line)</label>
							<div>
                                <span class="datainfo inline"><asp:TextBox ID="PCBUPA1" Enabled="false" class="phone_l_a" pattern ="[0-9]{2,5}" placeholder="Area" runat="server"></asp:TextBox><asp:TextBox Enabled="false" ID="PCBUPN1" class="phone_l_n_edit" pattern ="[0-9]{6,9}" placeholder="Number" runat="server"></asp:TextBox></span>
							</div>
						</div>
					</div>
					</fieldset>
					<fieldset>
						<div class="toggle-icon">
							<div class="infoToggler">
								<img src="../img/arrow-right-grey.png" class="toggle-icon-img im2"/>
								<img src="../img/arrow-down-grey.png" class="toggle-icon-img hidden im2"/>
								<h3 class="s t h-and-s" style="text-align: left;">Health and Safety Representative (HSR) detail</h3>
							</div>
						</div>
						<div class="toggle-p">
							<div>
								<label style="width:80%!important;">There is an HSR working for this organisation</label>
								<span><asp:CheckBox ID="hsr_workingBox1" runat="server" Checked="false" /> Yes</span>
							</div>
							<div>
								<label style="width:80%!important;">They are NZQA qualified to use their powers</label>
								<span><asp:CheckBox ID="hsr_nzqaBox1" runat="server" Checked="false" /> Yes</span>
							</div>
						</div>
					</fieldset>
					<fieldset id="declarationBlock">
					<div class="rem">
						<div>
							<div>
							   <asp:CheckBox ID="declarationBox1" runat="server" Checked="false" />
								<span class="req"></span>I declare that to the best of my knowledge, the information provided in this notification is true and correct.
							</div>
						</div>    
						<div>
							<label class="req">Name</label>
						</div>
						<div class="dec-name">
                           <asp:TextBox class="declarationInput" ID="DecFirstNameBox1" runat="server" Enabled="false"></asp:TextBox>			  
                           <asp:TextBox class="declarationInput" ID="DeclastNameBox1" runat="server" Enabled="false"></asp:TextBox>		
							<label id="firstNameLabel" for="DeclarationDetails_FirstName">First</label>
							<label id="lastNameLabel" for="DeclarationDetails_LastName">Last</label>
						</div>
                        <div class="layout layout--middle pnn1 pad_l">
                        <div class="layout__item sm-1of2">
						<div class="declarationLabel ">
							<label class="req" for="DeclarationDetails_FirstName">Adress</label>
						</div>
                        <asp:TextBox class="inp--width" ID="DecAddrBox1" runat="server" Enabled="false" ></asp:TextBox>			  
                        </div>
                            <div class="layout__item sm-1of2 fr">
						<div class="declarationLabel">
							<label class="req" for="DeclarationDetails_FirstName">City</label>
						</div>
                        <asp:TextBox class="inp--width" ID="DecCityBox1" runat="server" Enabled="false" ></asp:TextBox>			  
                        </div>
                        </div>
                        <div class="layout layout--middle pnn1 pad_l">
                        <div class="layout__item sm-1of2">
						<div class="declarationLabel">
							<label class="req" for="DeclarationDetails_FirstName">Post Code</label>
						</div>
                        <asp:TextBox class="inp--width" ID="DecPCBox1" runat="server" Enabled="false" ></asp:TextBox>			  
                            </div>
                             <div class="layout__item sm-1of2 fr">
						<div class="declarationLabel">
							<label class="req" for="DeclarationDetails_FirstName">Email</label>
						</div>
                        <asp:TextBox class="inp--width" ID="DecEmailBox1" runat="server" Enabled="false" ></asp:TextBox>			  
                            </div>
                        </div>
                         <div class="layout layout--middle pnn1 pad_l">
                        <div class="layout__item sm-1of2">
						<div class="declarationLabel">
							<label class="req" for="DeclarationDetails_FirstName">Phone</label>
						</div>
						<span class="datainfo inline"><asp:TextBox ID="DecPhoneAreaBox1" class="phone_l_a" pattern ="[0-9]{2,5}" placeholder="Area" runat="server"></asp:TextBox><asp:TextBox ID="DecPhoneNumBox1" class="phone_l_n_edit" pattern ="[0-9]{6,9}" placeholder="Number" runat="server"></asp:TextBox></span>
						<input id="oldphone" name="oldphone" value="(022)345 16 39" type="hidden">
						<input id="newphone" name="newphone" value="" type="hidden">
                            </div>
                             <div class="layout__item sm-1of2 fr">
						<div class="declarationLabel">
							<label class="req" for="DeclarationDetails_FirstName">Date</label>
						</div>

						<asp:TextBox  class="declarationInput datepicker" ID="DecDateBox1" runat="server"></asp:TextBox>			  
                            </div>
                        </div>
						<div class="declarationLabel">
							<label class="req" for="DeclarationDetails_FirstName">Designation</label>
						</div>
                        <asp:TextBox  class="declarationInput " ID="DesignationBox1" runat="server"></asp:TextBox>			  
						<div class="note1 rem">
							<i>Note: the above declaration is considered to be an electronic signature that is reliable as appropriate for the purpose of this notification</i>
						</div>
					 </div>
					</fieldset>
					
				</div>
			</div>	
		</div>
</section>
</div>
                          <div class="modal-footer">
                          <asp:Button ID="saveDII" runat="server" class="save-profile btn btn-primary" Text="Save Changes" />
                            <button type="button" id="close-modal" class="btn btn-secondary" data-dismiss="modal">Close</button>
                       </div>
                        </div>
                    </div>
                    </div>