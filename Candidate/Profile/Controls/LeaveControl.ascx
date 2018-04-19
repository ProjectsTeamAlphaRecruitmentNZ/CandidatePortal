<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LeaveControl.ascx.vb" Inherits="LeaveControl" %>
<sf:Connection ID="SIFConn" runat="server"></sf:Connection>

<div class="modal fade leaveModal" id="addLeave"  role="dialog" aria-labelledby="leaveModalLabel" aria-hidden="true">		
     <div class="keyWrap"><asp:HiddenField ID ="key" runat="server"/></div><asp:HiddenField ID ="LeaveKeyBox" runat="server"/>
                      <div class="modal-dialog" id="leaveModalDialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                             
                            <img src="../img/skills-2.png" height="30" style="position: relative;top: 0.5rem;"> <h3 class="form_title b-w2">LEAVE FORM</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body"> 
                              <section>
			                       <h2 class="center">Add Leave</h2>
				                    <label class="req">Type</label>
                                  <sf:StayinFrontDataSource ID="TypeDS" runat="server"
                                            Connection="SIFConn" Item="LeaveType" Mode="Enumeration" AddBlankRow="true">
                                    </sf:StayinFrontDataSource> 
                                  <div>
                                      <asp:DropdownList ID="LeaveTypeBox"  runat="server" DataSourceID="TypeDS"  DataValueField="Value" DataTextField="Display" ></asp:DropdownList>
									</div>
				                    <label class="req">Start Date</label>
				                    <asp:TextBox ID="StartDateBox" class="datepicker startDate required-entry input--width"   data-date-format='yy-mm-dd' runat="server"></asp:TextBox>
				                    <label class="req">End Date</label>
				                    <asp:TextBox ID="EndDateBox" class="datepicker endDate required-entry input--width"   data-date-format='yy-mm-dd' runat="server"></asp:TextBox>
				                    <label class="req">Reason</label>
				                    <asp:TextBox ID="ReasonBox" class=" required-entry input--width" TextMode="MultiLine" runat="server"></asp:TextBox>
				                     <h2 class="m-b req" style="font-size: 1.4rem;"> Do you want this leave to be payed? </h2>
				                    <div class="radio-input-grid m-b1">
					                    <div class="radio-input-grid__row">
                                            <asp:RadioButtonList runat="server" ID="payed_list" RepeatDirection="Horizontal">			            
                                                <asp:ListItem class="radio-input-grid__column radio-input-grid__cw-1 yes_payed" ID="yes_payed" value="Yes">Yes</asp:ListItem>            
			                                    <asp:ListItem class="radio-input-grid__column radio-input-grid__cw-1 no_payed"  ID="no_payed" value="No">No</asp:ListItem>                       
			                            </asp:RadioButtonList>
					                    </div>
				                    </div>
				                    <div class="payed-leave-rec-explanation m-b1" style="display:none">
					                    <label class="req" style="width:100%">How many days/hours are you requesting for?</label>
					                    <asp:TextBox ID="PaidHoursBox" class="required-entry input--width"   runat="server"></asp:TextBox>
				                    </div>                                   
		                        </section>
                         </div>
                          <div class="modal-footer">
                          <asp:Button ID="saveLeave" runat="server" class="save-profile btn btn-primary" onclientclick="if(!checkDates(this)) return false;" Text="Add Leave" />
                            <button type="button" id="close-modal" class="btn btn-secondary"  data-dismiss="modal">Close</button>
                          </div>
                        </div>
                    </div>
</div>