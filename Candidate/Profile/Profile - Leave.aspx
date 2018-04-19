<%@ Page Language="vb" MasterPageFile="Profile.Master" AutoEventWireup="false" CodeFile="Profile - Leave.aspx.vb" Inherits="Profile1" %>
<%@ MasterType VirtualPath="~/Profile/Profile.Master" %>
<%@ Reference VirtualPath="~/Portal.Master" %>
<%@ Register TagPrefix="LM" TagName="LeaveModal" Src="~/Profile/Controls/LeaveControl.ascx" %>
<%@ Register TagPrefix="LM" TagName="MissedShiftModal" Src="~/Profile/Controls/MissedShiftControl.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ProfileTitle" runat="server">
<title> Alpha Jobs Profile - Leave </title>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ProfileContent" runat="server">
    <form runat="server" method="post">
        <div id="main">
          <div class="info-1">
	        <section>
		        <div class="center">
			        <img src="../img/leave.png" height="38" style="position: relative;top: 1rem;"> <h3 class="form_title b-w2"> Leave, Missed Shift</h3> 
		        </div>
	        </section>
	        <hr>
	        <section>
		        <div>
			        <i><i class="fa fa-info"></i> You can add leave here.</i>
		        </div>
		        <div class="center mt">
			        <input id="add-missed-shift-btn" class="button btn button-toggle" type="button"  data-toggle="modal" data-target="#addMissedShift" value="+ Add Missed Shift">
			        <input id="add-leave-btn" class="button btn button-action" value="+ New Leave"  data-toggle="modal" data-target="#addLeave" type="button">
		        </div>
                <!------------------------------------------------------------------------------
                    Leave FORM
                ----------------------------------------------------------------------------->		
                <LM:LeaveModal ID="Leave" runat="server"></LM:LeaveModal>
                <!------------------------------------------------------------------------------
                    Missed shift FORM
                ----------------------------------------------------------------------------->		
                <LM:MissedShiftModal ID="MissedShift" runat="server"></LM:MissedShiftModal>
            <div class="margin3">
                <i><i class="fa fa-info"></i> All Leave Details</i>
                <div class='tabs'>                   
                  <input id="tab1" type="radio" name="tabs" checked>
                  <label for="tab1">Annual Leave</label>
                  <input id="tab2" type="radio" name="tabs">
                  <label for="tab2">Sick Leave</label> 
                  <input id="tab3" type="radio" name="tabs">
                  <label for="tab3">ACC Leave</label>
                  <input id="tab4" type="radio" name="tabs">
                  <label for="tab4"> Bereavement Leave</label>
                  <input id="tab5" type="radio" name="tabs">
                  <label for="tab5"> Missed Shift</label>
                  <section id="content1">
                      <asp:Table ID="TableAnnualLeave" runat="server" CssClass="table-availability table-expenses"> 
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell>Added On</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Start Date</asp:TableHeaderCell>
                        <asp:TableHeaderCell>End Date</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Payed</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Hours Claimed</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Reason</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                </asp:Table>  			           
                  </section> 
                  <section id="content2">
                    <asp:Table ID="TableSickLeave" runat="server" CssClass="table-availability table-expenses"> 
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell>Added On</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Start Date</asp:TableHeaderCell>
                        <asp:TableHeaderCell>End Date</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Payed</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Hours Claimed</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Reason</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                </asp:Table>  			            
                  </section> 
                  <section id="content3">
                      <asp:Table ID="TableACCLeave" runat="server" CssClass="table-availability table-expenses"> 
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell>Added On</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Start Date</asp:TableHeaderCell>
                        <asp:TableHeaderCell>End Date</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Payed</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Hours Claimed</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Reason</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                </asp:Table>  			            
                  </section> 
                  <section id="content4">
                    <asp:Table ID="TableBereavementLeave" runat="server" CssClass="table-availability table-expenses"> 
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell>Added On</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Start Date</asp:TableHeaderCell>
                        <asp:TableHeaderCell>End Date</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Payed</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Hours Claimed</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Reason</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                        </asp:Table>                      
                  </section>
                  <section id="content5">
                    <asp:Table ID="TableMissedShift" runat="server" CssClass="table-availability table-expenses"> 
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell>Added On</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Start Date</asp:TableHeaderCell>
                        <asp:TableHeaderCell>End Date</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Reason</asp:TableHeaderCell>
                    </asp:TableHeaderRow></asp:Table>
                  </section>  
                </div>
                 <asp:Label runat="server" ID="AnnualLeaveModals"> 
			            </asp:Label> 
                 <asp:Label runat="server" ID="SickLeaveModals">			            
			            </asp:Label>
                <asp:Label runat="server" ID="ACCLeaveModals">			            
			            </asp:Label> 
                 <asp:Label runat="server" ID="BereavementLeaveModals">		            
			            </asp:Label> 
                    <asp:Label runat="server" ID="MissedShiftModals">			            
			            </asp:Label> 
                </div>
	        </section>
          </div>
        </div>
    </form>  
    <script type="text/javascript">   
        $("#ProfileLeave").addClass("active");
        /* -----------------------------------------------------------------------------
        Leave page
        ----------------------------------------------------------------------------- */
        if ($('#content1 tr').length < 2) {
            $('#content1').append("<i style='padding-left:2rem'>No annual leave added yet.<i>");
        }
        if ($('#content2 tr').length < 2) {
            $('#content2 ').append("<i style='padding-left:2rem'>No sick leave added yet.<i>");
        }
        if ($('#content3  tr').length < 2) {
            $('#content3').append("<i style='padding-left:2rem'>No ACC leave added yet.<i>");
        }
        if ($('#content4 tr').length < 2) {
            $('#content4 ').append("<i style='padding-left:2rem'>No bereavement leave added yet.<i>");
        }
        if ($('#content5 tr').length < 2) {
            $('#content5 ').append("<i style='padding-left:2rem'>No missed shift added yet.<i>");
        }
        /* -----------------------------------------------------------------------------
        Leave modal explanation hide
        ----------------------------------------------------------------------------- */

        $('.yes_payed').find('input').click(function () {
            $('.payed-leave-rec-explanation').show();
        });
        $('.no_payed').find('input').click(function () {
            $('.payed-leave-rec-explanation').hide();
        });
        function setKeyOfLeaveModal() {
            $(".leaveModal .keyWrap input[type='hidden']").each(function () {
                var modalDiv = $(this);
                var key = parseInt($(this).val());
                if (key > 0) {
                    modalDiv.parent().parent().attr("id", "addLeave" + key);
                }
            });
        }

        function setKeyOfMSModal() {
            $(".missedShiftModal .keyWrap input[type='hidden']").each(function () {
                var modalDiv = $(this);
                var key = parseInt($(this).val());
                if (key > 0) {
                    modalDiv.parent().parent().attr("id", "addMissedShift" + key);
                }
            });
        }
        $(document).ready(function () {
            setKeyOfLeaveModal();
            setKeyOfMSModal();
            $('.yes_payed').find('input').each(function () {
                if ($(this).is(':checked')) {

                    $(this).parent().parent().parent().parent().parent().parent().parent().parent().find('.payed-leave-rec-explanation').show();

                } else {

                    $(this).parent().parent().parent().parent().parent().parent().parent().parent().find('.payed-leave-rec-explanation').hide();
                }
            }
            );
        });
        function checkDates(ele) {
            var el = ele.parentNode.parentNode;
            var start =$(el).find(".startDate").val();
            var end = $(el).find(".endDate").val();
            console.log(start);
            console.log(end);
            var startArr = start.split("/");
            var endArr = end.split("/");
            var yearComp = endArr[2] - startArr[2]

            if (yearComp >= 0) {
                var monthComp = endArr[1] - startArr[1]
                if (monthComp >= 0) {
                    var dayComp = endArr[0] - startArr[0]
                    if (dayComp >= 0) {
                        return true;
                    } else {
                        swal({ title: "", text: "Start Date cannot be less than End Date!", animation: false, type: "error" })
                        return false;
                    }
                } else {
                    swal({ title: "", text: "Start Date cannot be less than End Date!", animation: false, type: "error" })
                    return false;
                }
            } else {
                swal({ title: "", text: "Start Date cannot be less than End Date!", animation: false, type: "error" })
                return false;
            }
        }
    </script>
</asp:Content>
