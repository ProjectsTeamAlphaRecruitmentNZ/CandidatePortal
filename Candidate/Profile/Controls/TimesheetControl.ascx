<%@ Control Language="VB" AutoEventWireup="false" CodeFile="TimesheetControl.ascx.vb" Inherits="TimesheetControl" %>
<sf:Connection ID="SIFConn" runat="server"></sf:Connection>
<div class="modal fade" id="timesheet"  role="dialog" aria-labelledby="TimesheetModalLabel" aria-hidden="true">	
    <div class="keyWrap"><asp:HiddenField ID ="key" runat="server"/></div><asp:HiddenField ID ="TimesheetKeyBox" runat="server"/>
                      <div class="modal-dialog" id="TimesheetModalDialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <img src="../img/timesheet.png" height="30" style="position: relative;top: 0.5rem;"> <h3 class="form_title b-w2">Timesheet #1</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
				            <section>
					            <div class="availabilityForm">
					                <label class="req">Start Date</label>
                                    <asp:TextBox class="inp--width" ID="StartDateBox" CssClass="datepicker required-entry input--width" runat="server"></asp:TextBox>
                                    <label class="req">End Date</label>
				                    <asp:TextBox ID="EndDateBox" class="datepicker required-entry input--width"   data-date-format='yy-mm-dd' runat="server"></asp:TextBox>
				                    <label class="req">Comment</label>
				                    <asp:TextBox ID="CommentBox" class=" required-entry input--width" TextMode="MultiLine" runat="server"></asp:TextBox>				
					            </div>

					            </section>
				                </div>
                          <div class="modal-footer">
                          <asp:Button ID="addAvailabileTime" runat="server" class="save-profile btn btn-primary" Text="Save changes" />
                            <button type="button" id="close-modal" class="btn btn-secondary" data-dismiss="modal">Close</button>
                       </div>
                        </div>
                    </div>
                    </div>