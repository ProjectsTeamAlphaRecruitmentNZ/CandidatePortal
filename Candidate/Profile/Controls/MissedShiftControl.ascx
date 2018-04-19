<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MissedShiftControl.ascx.vb" Inherits="MissedShiftControl" %>
<sf:Connection ID="SIFConn" runat="server"></sf:Connection>

<div class="modal fade missedShiftModal" id="addMissedShift"  role="dialog" aria-labelledby="missedShiftModalLabel" aria-hidden="true">		
     <div class="keyWrap"><asp:HiddenField ID ="key1" runat="server"/></div><asp:HiddenField ID ="MissedShiftKeyBox" runat="server"/>
                      <div class="modal-dialog" id="missedShiftModalDialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                             
                            <img src="../img/skills-2.png" height="30" style="position: relative;top: 0.5rem;"> <h3 class="form_title b-w2">Missed Shift Form</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body"> 
                              <section>
			                       <h2 class="center">Add Missed Shift</h2>
				                    
				                    <label class="req">Start Date</label>
				                    <asp:TextBox ID="StartDateBox1" CssClass="datepicker  startDate required-entry inp--width"   data-date-format='yy-mm-dd' runat="server"></asp:TextBox>
				                    <label class="req">End Date</label>
				                    <asp:TextBox ID="EndDateBox1" CssClass="datepicker endDate required-entry inp--width"   data-date-format='yy-mm-dd' runat="server"></asp:TextBox>
				                    <label class="req">Reason</label>
				                    <asp:TextBox ID="ReasonBox1" CssClass=" required-entry inp--width" TextMode="MultiLine" runat="server"></asp:TextBox>				                                                
		                        </section>
                         </div>
                          <div class="modal-footer">
                          <asp:Button ID="saveMissedShift" runat="server" onclientclick="if(!checkDates(this)) return false;" class="save-profile btn btn-primary" Text="Add Missed Shift" />
                            <button type="button" id="close-modal" class="btn btn-secondary" data-dismiss="modal">Close</button>
                          </div>
                        </div>
                    </div>
</div>