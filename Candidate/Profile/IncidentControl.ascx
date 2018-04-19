<%@ Control Language="VB" AutoEventWireup="false"  CodeFile="IncidentControl.ascx.vb"  className="IncidentControl" Inherits="IncidentControl" %>
<sf:Connection ID="SIFConn" runat="server"></sf:Connection>

<div class="modal fade" id="addIncident"  role="dialog" aria-labelledby="incidentModalLabel" aria-hidden="true">	
    <div class="keyWrap"><asp:HiddenField ID ="key" runat="server"/></div>
    <asp:HiddenField ID ="IncKeyBox" runat="server"/>
                      <div class="modal-dialog" id="incidentModalDialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <img src="../img/skills-2.png" height="30" style="position: relative;top: 0.5rem;"> <h3 class="form_title b-w2">INCIDENT</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
<section>
    <div class="pad-1" id="incident-form">
			<div class="add-form-injury">
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
                        <sf:StayinFrontDataSource ID="NotifierTypeDS" runat="server"
                                Connection="SIFConn" Item="Type" Mode="Enumeration" AddBlankRow="False">
                        </sf:StayinFrontDataSource> 
						<div class="radioButtonList center">

							<label class="desc">Are you making this notification as a:</label>
                            <asp:RadioButtonList ID="notifier_type" runat="server" RepeatDirection="Horizontal" DataSourceID="NotifierTypeDS"  CssClass="control control--radio" DataValueField="Value" required></asp:RadioButtonList>
        
						</div>
						<div>
							<label class="desc req" for="fname-injury-form">First Name</label>
							<div>
                                <asp:TextBox  class="inp--width" ID="NotifierFirstName" runat="server"></asp:TextBox>			  
							</div>
						</div>
						<div>
							<label class="desc req" for="lname-injury-form">Last Name</label>
							<div>
                                <asp:TextBox  class="inp--width" ID="NotifierLastName" runat="server"></asp:TextBox>
							  <%--<input id="lname-injury-form" name="lname-injury-form" type="text" class="field text fn" value="" size="8" tabindex="1">--%>
							</div>
						</div>
						<div>
							<label class="desc req" for="phone-injury-form">Phone</label>
							<div >
						<span class="datainfo inline"><asp:TextBox ID="PhoneAreaBox" class="phone_l_a" pattern ="[0-9]{2,5}" placeholder="Area" runat="server"></asp:TextBox><asp:TextBox ID="PhoneNumBox" class="phone_l_n_edit" pattern ="[0-9]{6,9}" placeholder="Number" runat="server"></asp:TextBox></span>

<%--							  <input id="phone-injury-form" name="phone-injury-form" type="text" class="field text fn" value="" size="8" tabindex="1">--%>
							</div>
						</div>
						<div>
							<label class="desc req" for="mphone-injury-form">Mobile</label>
							<div>
                                <span class="datainfo inline"><asp:TextBox ID="MobileAreaBox" class="phone_l_a" pattern ="[0-9]{2,5}" placeholder="Area" runat="server"></asp:TextBox><asp:TextBox ID="MobileNumBox" class="phone_l_n_edit" pattern ="[0-9]{6,9}" placeholder="Number" runat="server"></asp:TextBox></span>
							</div>
						</div>
						<div>
							<label class="desc req" for="email-injury-form">Email</label>
							<div>
                                <asp:TextBox  class="inp--width" ID="EmailBox" runat="server"></asp:TextBox>			  
							</div>
						</div>
						<div>
							<label class="desc req" for="address-injury-form">Address</label>

							<div>
                                <asp:TextBox  class="inp--width" ID="AddressBox" runat="server"></asp:TextBox>			  
							</div>
						  </div>
						<div>
							<label class="desc req" for="city-injury-form">City</label>
							<div>
                                <asp:TextBox  class="inp--width" ID="CityBox" runat="server"></asp:TextBox>			  
							</div>
						</div>
						<div>
							<label class="desc req" for="post-code-injury-form">Post Code</label>
							<div>
                                <asp:TextBox  class="inp--width" ID="PostCodeBox" runat="server"></asp:TextBox>			  
							</div>
						</div>
					</div>
					</fieldset>
					<fieldset>
						<div class="toggle-icon">
							<div class="infoToggler">
								<img src="../img/arrow-right-grey.png" class="toggle-icon-img im2"/>
								<img src="../img/arrow-down-grey.png" class="toggle-icon-img hidden im2"/>
								<h3 class="s t" style="text-align: left;">Details of Incident</h3>
							</div>
						</div>
						<div class="toggle-p">
							<div>
								<label class="desc req" for="date-inc-injury-form">Date of incident:</label>
								<div>
                                <asp:TextBox  class="inp--width datepicker" ID="DateBox" runat="server"></asp:TextBox>			  
								</div>
							</div>
							<div>
								<label class="desc req" for="time-inc-injury-form">Time of incident:</label>
								<div>
                                     <asp:TextBox  class="inp--width timepicker" ID="IncTimeBox" runat="server"></asp:TextBox>
									
								</div>
							</div>
							<div>
								<label class="desc req" for="place-inc-injury-form">Place of incident:</label>
                                <sf:StayinFrontDataSource ID="PlaceOfIncDS" runat="server"
                                Connection="SIFConn" Item="incident_place" Mode="Enumeration" AddBlankRow="true">
                        </sf:StayinFrontDataSource> 
								<div>
                                    <asp:DropdownList ID="IncidentPlaceBox"  runat="server" DataSourceID="PlaceOfIncDS"  DataValueField="Value" ></asp:DropdownList>
									
								</div>
							</div>
							<div>
								<label class="desc req" for="address-inc-injury-form">Incident address:</label>
								<div>
                                <asp:TextBox  class="inp--width" ID="IncidentAddressBox" runat="server"></asp:TextBox>			  
								</div>
							</div>
							<div>
								<label class="desc req" for="city-inc-injury-form">City:</label>
								<div>
                                <asp:TextBox  class="inp--width" ID="IncidentCityBox" runat="server"></asp:TextBox>			  
								</div>
							</div>
							<div>
								<label class="desc req" for="post-code-inc-injury-form">Post Code:</label>
								<div>
                                <asp:TextBox  class="inp--width" ID="IncidentPostCodeBox" runat="server"></asp:TextBox>			  
								</div>
							</div>
							<div>
								<div class=" toggle-icon infoToggler"><label class="desc toggle-icon infoToggler">What happened?
										<a href="javascript:void(0)" class="hideMe7"><i class="fa fa-info"></i></a>
								</label></div>
										<div id="hideMe7" class="toggle-p" style="background-color:#f4f4f4;margin-bottom:0.5rem;">
											<p><strong>Important:</strong>&nbsp;If the event you are attempting to notify us of does not appear in this list then notification is not required, and this form cannot be used.</p>
										</div>
                                 <sf:StayinFrontDataSource ID="WHDS" runat="server"  Filter="HSGroup.code='WH'"
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
                                    <asp:DropdownList ID="SelectWHBox"  DataValueField="Key" DataTextField="Name" runat="server" AppendDataBoundItems="true" DataSourceID="WHDS" >
                                        <asp:ListItem Text="" Value="" Selected></asp:ListItem>
                                    </asp:DropdownList>
								</div>
							</div>
							<div>
								<label class="desc">What was the principal cause of the incident?</label>
                                 <sf:StayinFrontDataSource ID="PCDS" runat="server"  Filter="HSGroup.code='PC'"
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
                                    <asp:DropdownList ID="PCBOX" DataValueField="Key" DataTextField="Name" runat="server" DataSourceID="PCDS"  AppendDataBoundItems="true">
                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                    </asp:DropdownList>
                                </div>
							</div>
							<div>
								<label class="desc" for="desc-inc-injury-form">Provide a description of what happened:</label>
								<div>
                                <asp:TextBox TextMode="MultiLine" class="inp--width" ID="DescriptionBox" runat="server"></asp:TextBox>			  
								</div>
							</div>
							<div>
								<label class="desc" for="det-inc-injury-form">Provide details about the people involved in the incident:</label>
								<div>
                                <asp:TextBox TextMode="MultiLine" class="inp--width" ID="PeopleInvolvedBox" runat="server"></asp:TextBox>			  
								</div>
							</div>
							<div>
								<label class="desc" for="inc-injury-form">The incident occurred:</label>
								<div>

									<select>
										<option value="  "></option>
										<option value="Indoors">Indoors</option>
										<option value="Outdoors">Outdoors</option>
									</select>
								</div>
							</div>
							<div>
								<label class="desc req" for="weather-injury-form">Weather conditions at time of incident:</label>
								<div>
                                <asp:TextBox TextMode="MultiLine" class="inp--width" ID="WeatherBox" runat="server"></asp:TextBox>			  
								</div>
							</div>
							<div>
								<label class="desc req" for="inc-injury-form">Was a significant hazard involved?</label>
                                <sf:StayinFrontDataSource ID="HazardDS" runat="server"
                                Connection="SIFConn" Item="hazard_involved" Mode="Enumeration" AddBlankRow="true">
                        </sf:StayinFrontDataSource> 
								<div>
                                    <asp:DropdownList ID="HazardBox" runat="server" DataSourceID="HazardDS"  DataValueField="Value" ></asp:DropdownList>                    
								</div>
							</div>	
							<div>
								<label class="desc" style="width:100%!important;">Confirm that the site has been preserved, as required by section 55 of the Act: <asp:CheckBox ID="SitePreservedBox" runat="server" Checked="false" /></label>
							</div>
							<div>
								<label class="desc req" for="inc-injury-form">Have you notified any other agency?</label>
                                <sf:StayinFrontDataSource ID="NotifiedDS" runat="server"
                                Connection="SIFConn" Item="notified" Mode="Enumeration" AddBlankRow="true">
                        </sf:StayinFrontDataSource> 
								<div>
                                    <asp:DropdownList ID="NotifiedBox"   runat="server" DataSourceID="NotifiedDS"  DataValueField="Value" ></asp:DropdownList>
									
								</div>
							</div>	
							<div>
								<label class="desc req" for="agname-injury-form">Notified agency name:</label>
								<div>
                                <asp:TextBox TextMode="MultiLine" class="inp--width" ID="AgencyNameBox" runat="server"></asp:TextBox>			  
								</div>
							</div>
							<div>
								<label class="desc req" for="agphone-injury-form">Notified agency phone number:</label>
								<div>
                                <span class="datainfo inline"><asp:TextBox ID="AgencyPhoneAreaBox" class="phone_l_a" pattern ="[0-9]{2,5}" placeholder="Area" runat="server"></asp:TextBox><asp:TextBox ID="AgencyPhoneNumBox" class="phone_l_n_edit" pattern ="[0-9]{6,9}" placeholder="Number" runat="server"></asp:TextBox></span>
								</div>
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
                                <asp:TextBox class="inp--width" ID="pcbu_nameBox" runat="server" Enabled="false"></asp:TextBox>
                            </div>
						</div>
						<div>
							<label>NZ business number</label>
							<div>
                               <asp:TextBox class="inp--width" ID="pcbu_nzbnBox" runat="server" Enabled="false" ></asp:TextBox>			  
<%--								<input value="1,277,480" maxlength="14" size="14" disabled="disabled" type="text">--%>
							</div>
						</div>
						<div class="editor-label">
							<label>Industry</label>
                            <sf:StayinFrontDataSource ID="IndustryDS" runat="server"  Filter="HSGroup.code='Ind'"
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
                                <asp:DropdownList ID="IndustryBox"  Enabled="false"  runat="server" DataValueField="Key" DataTextField="Name" AppendDataBoundItems="true" DataSourceID="IndustryDS" required>
                                    <asp:ListItem Text="" Value="" ></asp:ListItem>
                                </asp:DropdownList>											
<%--								<select disabled="disabled" id="group_Ind" name="group_Ind"> 
									<option>&lt;Optional&gt;</option>
									<option>Accommodation and Food Services</option>
									<option>Administrative and Support Services</option>
									<option>Agriculture</option>
									<option>Arts and Recreation Services</option>
									<option>Construction</option>
									<option>Education and Training</option>
									<option>Electricity, Gas, Water and Waste Services</option>
									<option>Financial and Insurance Services</option>
									<option>Fishing</option>
									<option>Forestry</option>
									<option>Health Care and Social Assistance</option>
									<option>Information Media and Telecommunications</option>
									<option>Manufacturing</option>
									<option>Mining - Minerals</option>
									<option>Mining - Other Services</option>
									<option>Mining - Petroleum</option>
									<option>Not Elsewhere Included</option>
									<option selected="">Other Services</option>
									<option>Professional, Scientific and Technical Services</option>
									<option>Public Administration and Safety</option>
									<option>Rental, Hiring and Real Estate Services</option>
									<option>Retail Trade</option>
									<option>Transport, Postal and Warehousing</option>
									<option>Wholesale Trade</option>
								</select>--%>
							</div>
						</div>
						<div>
							<label>Other</label>
							<div>
                               <asp:TextBox class="inp--width" ID="OtherBox" runat="server" Enabled="false" Text="Human Recources &amp; Recruitment"></asp:TextBox>			  
<%--								<input value="Human Recources &amp; Recruitment" maxlength="100" size="100" disabled="disabled" type="text">--%>
							</div>
						</div>
						<div>
							<label class="req">Address</label>
							<div>
                                <asp:TextBox class="inp--width" ID="PCBUAddressBox" runat="server" Enabled="false" ></asp:TextBox>			  
								<%--<input value="L3, 27 Gillies Ave, Newmartket" maxlength="255" size="255" disabled="disabled" required="true" type="text">--%>
							</div>
						</div>
						<div>
							<label>City</label>
							<div>
                                <asp:TextBox class="inp--width" ID="PCBUCityBox" runat="server" Enabled="false" ></asp:TextBox>			  
								<%--<input value="Auckland" maxlength="60" size="60" disabled="disabled" required="true" type="text">--%>
							</div>
						</div>
						<div>
							<label>Post Code</label>
							<div>
                                <asp:TextBox class="inp--width" ID="PCBUPostCodeBox" runat="server" Enabled="false" ></asp:TextBox>			  
<%--								<input value="1149" maxlength="10" size="10" disabled="disabled" type="text">--%>
							</div>
						</div>
						<div>
							<label class="req">Contact person name</label>
							<div>
                                <asp:TextBox class="inp--width" ID="ContactPersonBox" runat="server" Enabled="false" ></asp:TextBox>			  
								<%--<input value="Colin Mathieson" maxlength="100" size="100" disabled="disabled" required="true" type="text">--%>
							</div>
						</div>
						<div>
							<label>Email</label>
							<div>
                                <asp:TextBox class="inp--width" ID="PCBUEmailBox" runat="server" Enabled="false" Text="colin@alphajobs.co.nz"></asp:TextBox>			  
								<%--<input value="colin@alphajobs.co.nz" maxlength="128" size="128" disabled="disabled" type="text">--%>
							</div>
						</div>
						<div>
							<label>PCBU phone no. (mobile)</label>
							<div>
                                <span class="datainfo inline"><asp:TextBox ID="PCBUMA" Enabled="false" class="phone_l_a" pattern ="[0-9]{2,5}" placeholder="Area" runat="server"></asp:TextBox><asp:TextBox Enabled="false" ID="PCBUMN" class="phone_l_n_edit" pattern ="[0-9]{6,9}" placeholder="Number" runat="server"></asp:TextBox></span>
								<%--<input value="021452324" maxlength="15" size="15" class="smallTxt" disabled="disabled" placeholder="Number" type="text">--%>
							</div>
						</div>
						<div>
							<label>PCBU phone no. (land line)</label>
							<div>
                                <span class="datainfo inline"><asp:TextBox ID="PCBUPA" Enabled="false" class="phone_l_a" pattern ="[0-9]{2,5}" placeholder="Area" runat="server"></asp:TextBox><asp:TextBox Enabled="false" ID="PCBUPN" class="phone_l_n_edit" pattern ="[0-9]{6,9}" placeholder="Number" runat="server"></asp:TextBox></span>
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
								<span><asp:CheckBox ID="hsr_workingBox" runat="server" Checked="false" /> Yes</span>
							</div>
							<div>
								<label style="width:80%!important;">They are NZQA qualified to use their powers</label>
								<span><asp:CheckBox ID="hsr_nzqaBox" runat="server" Checked="false" /> Yes</span>
							</div>
						</div>
					</fieldset>
					<fieldset id="declarationBlock">
					<div class="rem">
						<div>
							<div>
							   <asp:CheckBox ID="declarationBox" runat="server" Checked="false" />
								<span class="req"></span>I declare that to the best of my knowledge, the information provided in this notification is true and correct.
							</div>
						</div>    
						<div>
							<label class="req">Name</label>
						</div>
						<div class="dec-name">
                           <asp:TextBox class="declarationInput" ID="DecFirstNameBox" runat="server" Enabled="false"></asp:TextBox>			  
                           <asp:TextBox class="declarationInput" ID="DeclastNameBox" runat="server" Enabled="false"></asp:TextBox>		
							<%--<input class="declarationInput" value="Anna" required="true" disabled="" type="text">
							<input class="declarationInput" value="Satanina" required="true" disabled="" type="text">--%>
							<label id="firstNameLabel" for="DeclarationDetails_FirstName">First</label>
							<label id="lastNameLabel" for="DeclarationDetails_LastName">Last</label>
						</div>
                        <div class="layout layout--middle pnn1 pad_l">
                        <div class="layout__item sm-1of2">
						<div class="declarationLabel ">
							<label class="req" for="DeclarationDetails_FirstName">Adress</label>
						</div>
                        <asp:TextBox class="inp--width" ID="DecAddrBox" runat="server" Enabled="false" ></asp:TextBox>			  
<%--						<input value="108/47 Hobson Street" maxlength="255" size="255" class="declarationInput" required="true" type="text">--%>
                        </div>
                            <div class="layout__item sm-1of2 fr">
						<div class="declarationLabel">
							<label class="req" for="DeclarationDetails_FirstName">City</label>
						</div>
                        <asp:TextBox class="inp--width" ID="DecCityBox" runat="server" Enabled="false" ></asp:TextBox>			  
						<%--<input value="Auckland" maxlength="60" size="60" class="declarationInput oldaddress" required="true" type="text">--%>
                        </div>
                        </div>
                        <div class="layout layout--middle pnn1 pad_l">
                        <div class="layout__item sm-1of2">
						<div class="declarationLabel">
							<label class="req" for="DeclarationDetails_FirstName">Post Code</label>
						</div>
                        <asp:TextBox class="inp--width" ID="DecPCBox" runat="server" Enabled="false" ></asp:TextBox>			  
						<%--<input value="1010" maxlength="10" size="10" class="declarationInput oldaddress" required="true" type="text">--%>
                            </div>
                             <div class="layout__item sm-1of2 fr">
						<div class="declarationLabel">
							<label class="req" for="DeclarationDetails_FirstName">Email</label>
						</div>
                        <asp:TextBox class="inp--width" ID="DecEmailBox" runat="server" Enabled="false" ></asp:TextBox>			  

						<%--<input class="declarationInput" value="anna.satanina@gmail.com" required="true" disabled="" type="text">--%>
                            </div>
                        </div>
                         <div class="layout layout--middle pnn1 pad_l">
                        <div class="layout__item sm-1of2">
						<div class="declarationLabel">
							<label class="req" for="DeclarationDetails_FirstName">Phone</label>
						</div>
						<span class="datainfo inline"><asp:TextBox ID="DecPhoneAreaBox" class="phone_l_a" pattern ="[0-9]{2,5}" placeholder="Area" runat="server"></asp:TextBox><asp:TextBox ID="DecPhoneNumBox" class="phone_l_n_edit" pattern ="[0-9]{6,9}" placeholder="Number" runat="server"></asp:TextBox></span>

<%--						<input value="022 345 16 39" type="hidden">
						<input value="022 345 16 39" maxlength="15" size="15" class="declarationInput oldphone" required="true" type="text">--%>

						<input id="oldphone" name="oldphone" value="(022)345 16 39" type="hidden">
						<input id="newphone" name="newphone" value="" type="hidden">
                            </div>
                             <div class="layout__item sm-1of2 fr">
						<div class="declarationLabel">
							<label class="req" for="DeclarationDetails_FirstName">Date</label>
						</div>

						<asp:TextBox  class="declarationInput datepicker" ID="DecDateBox" runat="server"></asp:TextBox>			  
                            </div>
                        </div>
						<div class="declarationLabel">
							<label class="req" for="DeclarationDetails_FirstName">Designation</label>
						</div>
                        <asp:TextBox  class="declarationInput " ID="DesignationBox" runat="server"></asp:TextBox>			  
						<%--<input value="" maxlength="100" size="100" class="declarationInput" type="text" id="designation">--%>                    
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
                          <asp:Button ID="saveIncident" runat="server" class="save-profile btn btn-primary" Text="Add Incident" />
                            <button type="button" id="close-modal" class="btn btn-secondary" data-dismiss="modal">Close</button>
                       </div>
                        </div>
                    </div>
                    </div>