<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ExpensesControl.ascx.vb" Inherits="ExpensesControl" %>
<sf:Connection ID="SIFConn" runat="server"></sf:Connection>

<div class="modal fade" id="addExpenses"  role="dialog" aria-labelledby="expensesModalLabel" aria-hidden="true">		
     <div class="keyWrap"><asp:HiddenField ID ="key" runat="server"/></div><asp:HiddenField ID ="ExpKeyBox" runat="server"/>
                      <div class="modal-dialog" id="expensesModalDialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                             
                            <img src="../img/skills-2.png" height="30" style="position: relative;top: 0.5rem;"> <h3 class="form_title b-w2">EXPENSES FORM</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
                            
                              <section>
			                        <h2 class="center">Add Expenses</h2>
			                        <label class="req">Expense Date</label>
			                        <asp:TextBox ID="ExpDateBox" CssClass="datepicker required-entry inp--width"   data-date-format='yy-mm-dd' runat="server" ></asp:TextBox>
			                        <input class="hidden" id="claimed-date">
			                        
			                        <sf:StayinFrontDataSource ID="JobAssignDS" runat="server" ClassName="JobAssignment" Filter='<%# "Candidate.Username=""" + Session("UserName") + """" %>'
                                    Connection="SIFConn" Item="JobAssignments" Mode="TopLevelFolder" AddBlankRow="true">
                                        <Parameters>
                            <asp:Parameter Name="key" />
                        </Parameters>
                                <Columns> 
                            <sf:KeyColumn Name="Key" />
                                     <sf:MemberColumn Member="Job.JobTitle" Name="Name" />
                        </Columns>
                                    </sf:StayinFrontDataSource> 
							        <label class="req">Assignment</label>
							        <span class="datainfo">
                                        <asp:DropDownList ID="JobBox" runat="server" DataSourceID="JobAssignDS" DataValueField="Key" AppendDataBoundItems="true" DataTextField="Name">
                                                                                <asp:ListItem Text="" Value="" ></asp:ListItem>
							            </asp:DropDownList>

							        </span>
			                        <label class="req">Vendor</label>
			                        <asp:TextBox id="VendorBox" CssClass="required-entry inp--width" runat="server"></asp:TextBox>
			                        <label class="req">Amount ($)</label>
			                        <asp:TextBox id="AmountBox" CssClass="required-entry inp--width" Type="Number" runat="server"></asp:TextBox>
			                        <label>Comment</label>
			                        <asp:TextBox id="CommentBox" TextMode="MultiLine" CssClass="comment-expenses" runat="server"></asp:TextBox>
			                        <%--<div class="added-fields-container"></div>
			                        <div class="m-b"><i><i class="fa fa-info"></i> If you'd like to add another expanses you have had on the same day press the button below.</i></div>
			                        <input type="button" class="add-expenses" value="+ Add Another Expenses">   --%>     			 
			                        <div class="radio-input-grid m-b1">
				                        <label class="req">Attachment:</label>
				                        <div>
					                        <input type="file" id="attach1" multiple size="50" onChange="addFile()" style="display:none;"  class="required-entry">
                                            <%--<asp:FileUpload ID="photoUpload" runat="server"   BorderStyle="None"></asp:FileUpload>
			                            <asp:Label ID="lblPhotoUpload" ForeColor="Red" runat="server"></asp:Label>--%>
					                        <button  class="button btn" id="add-files" onclick="onSubmitForm(); return false;">Add Files</button>
					                        <input id="cancel-file" style="display:none;" type="button" value="Cancel Files" onChange="checkFile()" class="button btn">
                                            <div id="fileList">
                                            </div>
				                        </div>
				                        <br>
				                        <p id="demo"></p>				 
			                        </div>			                        
		                        </section>
                         </div>
                          <div class="modal-footer">
                          <asp:Button ID="saveExp" runat="server" class="save-profile btn btn-primary" Text="Add Expenses" />
                            <button type="button" id="close-modal" class="btn btn-secondary" data-dismiss="modal">Close</button>
                          </div>
                        </div>
                    </div>
</div>