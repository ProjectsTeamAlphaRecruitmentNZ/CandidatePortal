<%@ Page Language="vb" MasterPageFile="Profile.Master" AutoEventWireup="false" CodeFile="Profile - Availability.aspx.vb" Inherits="Profile1" %>
<%@ MasterType VirtualPath="~/Profile/Profile.Master" %>
<%@ Reference VirtualPath="~/Portal.Master" %>
<%@ Register TagPrefix="MF" TagName="AvailabilityModal" Src="~/Profile/Controls/AvailabilityControl.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ProfileTitle" runat="server">
<title> JobsOnline Profile - Availability </title>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ProfileContent" runat="server">
    <form runat="server" method="post">
        <div id="main">
          <div class="info-1">
            <section class="center">
	            <div>
		            <img src="../img/availability.png" height="30" style="position: relative;top: 0.8rem;"><h2 class="b-w2">Availability</h2>
	            </div>
            </section>
            <hr>
            <section>
                <div>
                    <i><i class="fa fa-info"></i> Availability can be one of the most important factors in your job search. Please add your unavailable time here.</i>
                </div>
	            <div>
			        <div>
				        <div class="center mt">
					        <input class="btn button button-action" id="add-period-formbtn" value="Add Unavailable Time"  data-toggle="modal" data-target="#addAvailability" type="button">
				        </div>
				        <!--------------------------------------------------------------
				          ADD UNAVAILABLE TIME
				        ---------------------------------------------------------------->
                         <%--MODALS--%>
        <%--Add Incident--%>
        
                              <MF:AvailabilityModal ID="AvailabilityControl" runat="server"></MF:AvailabilityModal>
                        
        				
                          
        <%--End Modal--%>
				        <!--------------------------------------------------------------
				          FINISH of ADD UNAVAILABLE TIME
				        ---------------------------------------------------------------->					
			        </div>
			        <div class="request-availability-table">
				        <asp:Table ID="TableAvailability" runat="server" CssClass="table-availability"> 
                            <asp:TableHeaderRow>
                                <asp:TableHeaderCell>Added On</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Start Date</asp:TableHeaderCell>
                                <asp:TableHeaderCell>End Date</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Reason</asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                        </asp:Table>  			        
                        <asp:Label runat="server" ID="AvailabilityModals"> 
			            </asp:Label> 
			        </div>
		        </div>   
            </section>
          </div>
        </div>      
    </form>
    <script type="text/javascript">   
        $("#ProfileAvailability").addClass("active");
        function setKeyOfModal() {
            $(".keyWrap input[type='hidden']").each(function () {
                var modalDiv = $(this);
                var key = parseInt($(this).val());
                if (key > 0) {
                    console.log(modalDiv.parent().parent())
                    modalDiv.parent().parent().attr("id", "addAvailability" + key);
                }
            });
        }
        $(document).ready(function () {

            setKeyOfModal();
        });
        function checkDates(ele) {
            var el = ele.parentNode.parentNode;
            var start = $(el).find(".startDate").val();
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
