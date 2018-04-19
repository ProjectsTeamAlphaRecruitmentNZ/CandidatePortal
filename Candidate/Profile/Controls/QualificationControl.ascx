<%@ Control Language="VB" AutoEventWireup="false" CodeFile="QualificationControl.ascx.vb"  Inherits="QualificationControl" %>

<sf:Connection ID="SIFConn" runat="server"></sf:Connection>
<div class="modal fade" id="addQualification"  role="dialog" aria-labelledby="refereeModalLabel" aria-hidden="true">		
    <div class="keyWrapQualification"><asp:HiddenField ID ="key" runat="server"/></div><asp:HiddenField ID ="QualificationKeyBox" runat="server"/>
                      <div class="modal-dialog" id="qualificationModalDialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <img src="../img/user.png" height="30" style="position: relative;top: 0.5rem;"> <h3 class="form_title b-w2">Qualification Edit</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
                    <section>
				 <div class="m-b">
						<div class="gear">
							<label class="req">Degree</label>
							<span class="datainfo"><asp:TextBox  ID="DegreeField" CssClass="Degree inp--width" runat="server"></asp:TextBox></span>
						</div>
						<div class="gear">
							<label class="req">Field Of Study</label>
							<span class="datainfo"><asp:TextBox  ID="FieldField" CssClass="Field inp--width" runat="server"></asp:TextBox></span>
						</div>
						
                        
				        <div class="gear">
					        <label>School</label>
					        <span class="datainfo"><asp:TextBox ID="SchoolField" runat="server" class="School inp--width"></asp:TextBox></span>
				        </div>
                     <div class="gear">
					        <label>From Year</label>
					        <span class="datainfo inline">
            <asp:DropdownList id="FromYearField" CssClass="FromYear required-entryq main-f inp--width " name="toYear-r' + id1 +'" maxlength="50" runat="server" ></asp:DropdownList>
                                
					        </span>
				        </div>
						<div class="gear">
					        <label class="req">To  Year</label>
					        <span class="datainfo">
            <asp:DropdownList id="ToYearField" CssClass="ToYear required-entryq main-f inp--width " name="toYear-r' + id1 +'" maxlength="50" runat="server" ></asp:DropdownList>
                            </span>
				        </div>
                     <div class="gear">
							<label class="req">Description</label>
							<span class="datainfo"><asp:TextBox CssClass="Description inp--width" ID="DescriptionField" runat="server" ></asp:TextBox></span>
						</div>
                     
				</div>	
			</section>
        </div>
                          <div class="modal-footer">
                          <asp:Button ID="updateQualification" runat="server" OnClientClick="if(!checkQualification(this)) return false;" class="save-profile btn btn-primary" Text="Save changes" />
                            <button type="button" id="close-modal" class="btn btn-secondary" data-dismiss="modal">Close</button>
                       </div>
                        </div>
                    </div>
                    </div>    