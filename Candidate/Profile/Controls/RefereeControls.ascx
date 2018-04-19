<%@ Control Language="VB" AutoEventWireup="false" CodeFile="RefereeControls.ascx.vb"  Inherits="RefereeControls" %>

<sf:Connection ID="SIFConn" runat="server"></sf:Connection>
<div class="modal fade" id="addReferee"  role="dialog" aria-labelledby="refereeModalLabel" aria-hidden="true">		
    <div class="keyWrapReferee"><asp:HiddenField ID ="key" runat="server"/></div><asp:HiddenField ID ="RefereeKeyBox" runat="server"/>
                      <div class="modal-dialog" id="refereeModalDialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <img src="../img/user.png" height="30" style="position: relative;top: 0.5rem;"> <h3 class="form_title b-w2">Referee Edit</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
                    <section>
				 <div class="m-b">
						<div class="gear">
							<label class="req">First Name</label>
							<span class="datainfo"><asp:TextBox ID="FNEdit" CssClass="RefereeFirstName inp--width" runat="server"></asp:TextBox></span>
						</div>
						<div class="gear">
							<label class="req">Last Name</label>
							<span class="datainfo"><asp:TextBox ID="LNEdit" CssClass="RefereeLastName inp--width" runat="server"></asp:TextBox></span>
						</div>
						
                        <div class="gear">
					        <label>Landline Phone</label>
					        <span class="datainfo inline">
                                <asp:TextBox id="PhoneLands" class="RefereeLand inp--width" name="alt_phone_l" placeholder="000 0000000 or 0000000000"  runat="server" ></asp:TextBox>
                                
					        </span>
				        </div>
						<div class="gear">
					        <label class="req">Mobile Phone</label>
					        <span class="datainfo">
                                <asp:TextBox id="PhoneMobiles" class="RefereeMobile inp--width" name="alt_phone_l" placeholder="000 0000000 or 0000000000"  runat="server" ></asp:TextBox>
                            </span>
				        </div>
				        <div class="gear">
					        <label>Personal Email</label>
					        <span class="datainfo"><asp:TextBox ID="EmailEdit" runat="server" class="inp--width"></asp:TextBox></span>
				        </div>
                     <div class="gear">
							<label class="req">Position</label>
							<span class="datainfo"><asp:TextBox class="RefereePos inp--width" ID="PositionEdit" runat="server" ></asp:TextBox></span>
						</div>
                     <div class="gear">
							<label class="req">Company Name</label>
							<span class="datainfo"><asp:TextBox class="RefereeComp inp--width" ID="CompanyEdit" runat="server" ></asp:TextBox></span>
						</div>
						<div class="gear">
					        <label>Reporting relationship</label>
					        <span class="datainfo"><asp:TextBox ID="RepRel" runat="server" class="inp--width"></asp:TextBox></span>
				        </div>
                     <div class="gear">
					        <label>Time to contact</label>
					        <span class="datainfo">
                                <asp:TextBox ID="TimeToCont" runat="server" class="inp--width"></asp:TextBox>
					        </span>
				        </div>
				</div>	
			</section>
        </div>
                          <div class="modal-footer">
                          <asp:Button ID="RefereeSave" runat="server" OnClientClick="if(!checkReferee(this)) return false;" class="save-profile btn btn-primary" Text="Save changes" />
                            <button type="button" id="close-modal" class="btn btn-secondary" data-dismiss="modal">Close</button>
                       </div>
                        </div>
                    </div>
                    </div>    