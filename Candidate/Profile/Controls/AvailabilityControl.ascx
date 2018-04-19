<%@ Control Language="VB" AutoEventWireup="false" CodeFile="AvailabilityControl.ascx.vb" Inherits="ProfileAvailabilityControl" %>


<sf:Connection ID="SIFConn" runat="server"></sf:Connection>
<div class="modal fade" id="addAvailability"  role="dialog" aria-labelledby="AvailabilityModalLabel" aria-hidden="true">	
    <div class="keyWrap"><asp:HiddenField ID ="key" runat="server"/></div><asp:HiddenField ID ="UnTimeKeyBox" runat="server"/>
                      <div class="modal-dialog" id="AvailabilityModalDialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <img src="../img/skills-2.png" height="30" style="position: relative;top: 0.5rem;"> <h3 class="form_title b-w2">Add Unavailable Time</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
				            <section>
					            <div class="availabilityForm">
					                <label class="req">Start Date</label>
                                    <asp:TextBox class="inp--width" ID="StartDateBox" CssClass="datepicker required-entry inp--width" runat="server"></asp:TextBox>
                                    <label class="req">End Date</label>
				                    <asp:TextBox ID="EndDateBox" CssClass="datepicker required-entry inp--width"   data-date-format='yy-mm-dd' runat="server"></asp:TextBox>
				                    <label class="req">Comment</label>
				                    <asp:TextBox ID="CommentBox" CssClass=" required-entry inp--width" TextMode="MultiLine" runat="server"></asp:TextBox>				
					            </div>
					            <%--<div class="added-fields-container"></div>
					            <div style="margin-top:2rem;"><i><i class="fa fa-info"></i> If you'd like to add few unavailable periods press the button below.</i></div>
					            <input type="button" class="add-available-period" value="+ Add Another Unavailable Time">--%>
					            </section>
				                </div>
                          <div class="modal-footer">
                          <asp:Button ID="addAvailabileTime" runat="server" class="save-profile btn btn-primary" onclientclick="if(!checkDates(this)) return false;"  Text="Save changes" />
                            <button type="button" id="close-modal" class="btn btn-secondary" data-dismiss="modal">Close</button>
                       </div>
                        </div>
                    </div>
                    </div>