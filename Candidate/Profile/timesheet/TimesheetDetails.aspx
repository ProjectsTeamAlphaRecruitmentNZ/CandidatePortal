<%@ Page Language="vb" MasterPageFile="Timesheet.Master" AutoEventWireup="false" CodeFile="TimesheetDetails.aspx.vb" Inherits="Profile1" %>
<%@ MasterType VirtualPath="~/Profile/timesheet/Timesheet.Master" %>
<%@ Reference VirtualPath="~/Portal.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ProfileTitle" runat="server">
<title> JobsOnline Profile - Timesheet Details </title>
<link href="../../css/timesheet template.css" rel="stylesheet" type="text/css" />
    <link href="../../css/timesheet.css" rel="stylesheet" type="text/css" />

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ProfileContent" runat="server">
  <form method="post" name="theform" id="theform" runat="server">
      <asp:HiddenField runat="server" ID="TSKey"/>
    <div id="dvContents">
        <div class="col" class="rel">
            <div style="height: 16.6rem;overflow: hidden;" class="hide-print">
                <img src="../../img/1.jpg" style="width: 100%;">
            </div>
	        <div class="header-details center">
		        <div class="pad-04">	
			        <img src="../../img/timesheet.png" alt="" class="hide-print pos-img" width="30">
			        <h2 class="header--title">Timesheet Details</h2>
                    <asp:Label runat="server" ID="test">
            
            </asp:Label>
		        </div>
	        </div>	
	        <div class="mt"></div>
	        <hr/>
	        <div>
		        <div class="instraction">
		              <a href="Online Timesheet Instructions New April 2014.pdf" target="_blank" class="hide-print"><i class="fa fa-info"></i> Online Timesheet Instruction</a>
	            </div>
		        <div class="ml3 pb2">
			         <div>
			            <label class="subheader">Week Ending :</label>
			            <span class="datainfo"> <asp:Literal ID="WeekEnding" runat="server"/></span>
			        </div>
			        <div>
			            <label class="subheader">Job Title :</label>
			            <span class="datainfo"> <asp:Literal ID="Job" runat="server"/></span>
			        </div>
			        <div>
			            <label class="subheader">Assignment Period :</label>
			            <span class="datainfo"> <asp:Literal ID="StartDate" runat="server"/> - <asp:Literal ID="EndDate" runat="server"/></span>
			        </div>
			        <div>
			            <label class="subheader">Client :</label>
			            <span class="datainfo"> <asp:Literal ID="Organisation" runat="server"/> - <asp:Literal ID="Department" runat="server"/></span>
			        </div>
			        <div>
			            <label class="subheader">Reports To :</label>
			            <span class="datainfo">  <asp:Literal ID="ReportTo1" runat="server"/> <asp:Literal ID="ReportTo2" runat="server"/></span>
			        </div>
		        </div>
	         </div>
        </div>
        <div class="col margin2" id="timesheetContent">
            <button class="clearAll" type="button" id ="clearAll">Clear All</button>
            <asp:Table ID="TableTimesheet" runat="server" CssClass="  timesheet-table"> 
                            <asp:TableHeaderRow>
                                <asp:TableHeaderCell>Date</asp:TableHeaderCell>
                                <asp:TableHeaderCell CssClass="w5">Day</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Start</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Break Start</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Break Finish</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Finish</asp:TableHeaderCell>
                                <asp:TableHeaderCell CssClass=" timeCol3 brdr-right-none">Hours</asp:TableHeaderCell>
                                <asp:TableHeaderCell CssClass="timeCol4  brdr-left-none"></asp:TableHeaderCell>
                                <asp:TableHeaderCell>Leave</asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                        </asp:Table>

            <asp:Label runat="server" ID="TimesheetContent">
            
            </asp:Label>
            <asp:Label runat="server" ID="writeDayTable">
            
            </asp:Label>
            <asp:Button runat="server" ID="SaveTime" CssClass="btnTimesheet ui-state-default ui-corner-all ui-button-text uibutton uipagebutton" Text="Save and Exit"/>
            <asp:Button runat="server" ID="SubmitTime" CssClass="btnTimesheet ui-state-default ui-corner-all ui-button-text uibutton uipagebutton" Text="Submit"/>

        </div>
		<div id="leavedialog" title="Select Leave Type" class="normal">
			<div id='Annualleavetype' class='ui-state-default ui-corner-all uibutton uileavetypebutton'>Annual Leave</div>
			<div id='Bereavementleavetype' class='ui-state-default ui-corner-all uibutton uileavetypebutton'>Bereavement Leave</div>
			<div id='Sickleavetype' class='ui-state-default ui-corner-all uibutton uileavetypebutton'>Sick Leave</div>
			<div id='Statleavetype' class='ui-state-default ui-corner-all uibutton uileavetypebutton'>Stat Day in Lieu</div>
			<div id='PublicHolWorkedleavetype' class='ui-state-default ui-corner-all uibutton uileavetypebutton'>Public Holiday - Worked</div>
			<div id='PublicHolNotWorkedleavetype' class='ui-state-default ui-corner-all uibutton uileavetypebutton'>Public Holiday - Not Worked</div>
			<div id='Noneleavetype' class='ui-state-default ui-corner-all uibutton uileavetypebutton'>No Leave</div>
		</div>
    </div>
   </form>    
    <script>
        $(document).ready(function () {
            $('#sample1 input').ptTimeSelect();
        });
        $("#clearAll").click(function () {
            $('table input').each(function () {
                $(this).val('')
                $(this).removeAttr('disabled');
                
            });
            $("a.CopyHours").each(function () {
                if ($(this).attr('id') != "2dayCopyHours") {
                    $(this).removeAttr("style");
                }
            });
            $("table .uidayofleavebutton").each(function () {                
                    $(this).html("Enter Leave");                
            });
            $(".timeCol4").attr("class", "timeCol4 brdr-left-none");
            $("#WeekTotalHours").val('');
        });
    </script>
</asp:Content>