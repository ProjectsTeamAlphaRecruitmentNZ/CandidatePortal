<%@ Control Language="VB" AutoEventWireup="false" CodeFile="AgencyControl.ascx.vb"  Inherits="AgencyControl" %>

<sf:Connection ID="SIFConn" runat="server"></sf:Connection>
<div class="modal fade" id="addAgency"  role="dialog" aria-labelledby="agencyModalLabel" aria-hidden="true">		
    <div class="keyWrapAgency"><asp:HiddenField ID ="key" runat="server"/></div><asp:HiddenField ID ="AgencyKeyBox" runat="server"/>
                      <div class="modal-dialog" id="agencyModalDialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <img src="../img/user.png" height="30" style="position: relative;top: 0.5rem;"> <h3 class="form_title b-w2">Agency Edit</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
                    <section>
				 <div class="m-b">
						<div class="gear">
							<label class="req">Name of Contact</label>
							<span class="datainfo"><asp:TextBox  ID="NoCField" CssClass="NoC inp--width" runat="server"></asp:TextBox></span>
						</div>
						<div class="gear">
							<label class="req">Position of Contact</label>
							<span class="datainfo"><asp:TextBox  ID="PoCField" CssClass="PoC inp--width" runat="server"></asp:TextBox></span>
						</div>
						
                        
				        <div class="gear">
					        <label class="req">Agency Name</label>
					        <span class="datainfo"><asp:TextBox ID="AgencyField" runat="server" class="AgencyName inp--width"></asp:TextBox></span>
				        </div>
                     <div class="gear">
							<label class="req">Date Applied</label>
							<span class="datainfo"><asp:TextBox CssClass="DateApplied inp--width datepicker" ID="DateField" runat="server" ></asp:TextBox></span>
						</div>
                     <div class="gear">
							<label class="req">Role Applied For</label>
							<span class="datainfo"><asp:TextBox CssClass="Role inp--width" ID="RoleField" runat="server" ></asp:TextBox></span>
						</div>
                     
				</div>	
			</section>
        </div>
                          <div class="modal-footer">
                          <asp:Button ID="updateAgency" runat="server" OnClientClick="if(!checkAgency(this)) return false;" class="save-profile btn btn-primary" Text="Save changes" />
                            <button type="button" id="close-modal" class="btn btn-secondary" data-dismiss="modal">Close</button>
                       </div>
                        </div>
                    </div>
                    </div>    