<%@ Page Language="vb" MasterPageFile="Timesheet.Master" AutoEventWireup="false" CodeFile="TimesheetPrint.aspx.vb" Inherits="Profile1" %>
<%@ MasterType VirtualPath="~/Profile/timesheet/Timesheet.Master" %>
<%@ Reference VirtualPath="~/Portal.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ProfileTitle" runat="server">
<title> JobsOnline Profile - Timesheet Details </title>
<link href="../../css/timesheet template.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ProfileContent" runat="server">
<form id="Form1" runat="server" method="post">
<div id="dvContents">
    <div class="col" class="rel">
        <div style="height: 16.6rem;overflow: hidden;" class="hide-print">
            <img src="../../img/1.jpg" style="width: 100%;">
        </div>
	    <div class="header-details center">
		    <div class="pad-04">	
			    <img src="../../img/timesheet.png" alt="" class="hide-print pos-img" width="30">
			    <h2 class="header--title">Timesheet Details</h2>
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
    <div class="col margin2">
        <table width="100%" id="table-timesheetprint" class="rwd-table">
            <thead>
                <tr>
                    <th>Date</th>
                    <th class="w5">Day</th>
                    <th>Start</th>
                    <th>Break Start</th>
                    <th>Break Finish</th>
                    <th>Finish</th>
                    <th class="w85">Day Total</th>
                    <th class="w20">Leave Reason</th>
                </tr>
            </thead>
            <tbody>
                <tr class='click-to-show'>
                    <td><asp:Literal ID="MondayDate" runat="server"/></td>
                    <td class="daybox">Mon</td>
                    <td class="col2"><asp:Literal ID="MondayStart" runat="server"/></td>
                    <td class="col3"><asp:Literal ID="MondayBreakStart" runat="server"/></td>
                    <td class="col4"><asp:Literal ID="MondayBreakFinish" runat="server"/></td>
                    <td class="col5"><asp:Literal ID="MondayFinish" runat="server"/></td>
                    <td class="rel col6">
                        <asp:Literal ID="MondayTotal" runat="server"/>
                        <span class='img-show-more--mobile sp-span'>
                            <img src='../../img/arrow-down-flat.png' width='10' class='id3a'>
                            <img src='../../img/arrow-up-flat.png' width='10' class='id4a'>
                        </span>
                    </td>
                    <td class="col2"><asp:Literal ID="MondayLeave" runat="server"/></td>
                </tr>
                <tr class='click-to-show'>
                    <td><asp:Literal ID="TuesdayDate" runat="server"></asp:Literal></td>
                    <td class="daybox">Tue</td>
                    <td class="col2"><asp:Literal ID="TuesdayStart" runat="server"/></td>
                    <td class="col3"><asp:Literal ID="TuesdayBreakStart" runat="server"/></td>
                    <td class="col4"><asp:Literal ID="TuesdayBreakFinish" runat="server"/></td>
                    <td class="col5"><asp:Literal ID="TuesdayFinish" runat="server"/></td>
                    <td class="rel col6">
                        <asp:Literal ID="TuesdayTotal" runat="server"/>
                        <span class='img-show-more--mobile sp-span'>
                            <img src='../../img/arrow-down-flat.png' width='10' class='id3a'>
                            <img src='../../img/arrow-up-flat.png' width='10' class='id4a'>
                        </span>
                    </td>
                    <td class="col2"><asp:Literal ID="TuesdayLeave" runat="server"/></td>
                </tr>
                <tr class='click-to-show'>
                    <td><asp:Literal ID="WednesdayDate" runat="server"></asp:Literal></td>
                    <td class="daybox">Wed</td>
                    <td class="col2"><asp:Literal ID="WednesdayStart" runat="server"/></td>
                    <td class="col3"><asp:Literal ID="WednesdayBreakStart" runat="server"/></td>
                    <td class="col4"><asp:Literal ID="WednesdayBreakFinish" runat="server"/></td>
                    <td class="col5"><asp:Literal ID="WednesdayFinish" runat="server"/></td>
                    <td class="col6 rel">
                        <asp:Literal ID="WednesdayTotal" runat="server"/>
                        <span class='img-show-more--mobile sp-span'>
                            <img src='../../img/arrow-down-flat.png' width='10' class='id3a'>
                            <img src='../../img/arrow-up-flat.png' width='10' class='id4a'>
                        </span>
                    </td>
                    <td class="col2"><asp:Literal ID="WednesdayLeave" runat="server"/></td>
                </tr>
                <tr class='click-to-show'>
                    <td><asp:Literal ID="ThursdayDate" runat="server"></asp:Literal></td>
                    <td class="daybox">Thu</td>
                    <td class="col2"><asp:Literal ID="ThursdayStart" runat="server"/></td>
                    <td class="col3"><asp:Literal ID="ThursdayBreakStart" runat="server"/></td>
                    <td class="col4"><asp:Literal ID="ThursdayBreakFinish" runat="server"/></td>
                    <td class="col5"><asp:Literal ID="ThursdayFinish" runat="server"/></td>
                    <td class="col6 rel">
                        <asp:Literal ID="ThursdayTotal" runat="server"/>
                        <span class='img-show-more--mobile sp-span'>
                            <img src='../../img/arrow-down-flat.png' width='10' class='id3a'>
                            <img src='../../img/arrow-up-flat.png' width='10' class='id4a'>
                        </span>
                    </td>
                    <td class="col2"><asp:Literal ID="ThursdayLeave" runat="server"/></td>
                </tr>
                <tr class='click-to-show'>
                    <td><asp:Literal ID="FridayDate" runat="server"/></td>
                    <td class="daybox">Fri</td>
                    <td class="col2"><asp:Literal ID="FridayStart" runat="server"/></td>
                    <td class="col3"><asp:Literal ID="FridayBreakStart" runat="server"/></td>
                    <td class="col4"><asp:Literal ID="FridayBreakFinish" runat="server"/></td>
                    <td class="col5"><asp:Literal ID="FridayFinish" runat="server"/></td>
                    <td class="col6 rel">
                        <asp:Literal ID="FridayTotal" runat="server"/>
                        <span class='img-show-more--mobile sp-span'>
                            <img src='../../img/arrow-down-flat.png' width='10' class='id3a'>
                            <img src='../../img/arrow-up-flat.png' width='10' class='id4a'>
                        </span>
                    </td>
                    <td class="col2"><asp:Literal ID="FridayLeave" runat="server"/></td>
                </tr>
                <tr class='click-to-show'>
                    <td><asp:Literal ID="SaturdayDate" runat="server"/></td>
                    <td class="daybox">Sat</td>
                    <td class="col2"><asp:Literal ID="SaturdayStart" runat="server"/></td>
                    <td class="col3"><asp:Literal ID="SaturdayBreakStart" runat="server"/></td>
                    <td class="col4"><asp:Literal ID="SaturdayBreakFinish" runat="server"/></td>
                    <td class="col5"><asp:Literal ID="SaturdayFinish" runat="server"/></td>
                    <td class="col6 rel">
                        <asp:Literal ID="SaturdayTotal" runat="server"/>
                        <span class='img-show-more--mobile sp-span'>
                            <img src='../../img/arrow-down-flat.png' width='10' class='id3a'>
                            <img src='../../img/arrow-up-flat.png' width='10' class='id4a'>
                        </span>
                    </td>
                    <td class="col2"><asp:Literal ID="SaturdayLeave" runat="server"/></td>
                </tr>
                <tr class='click-to-show'>
                    <td><asp:Literal ID="SundayDate" runat="server"/></td>
                    <td class="daybox">Sun</td>
                    <td class="col2"><asp:Literal ID="SundayStart" runat="server"/></td>
                    <td class="col3"><asp:Literal ID="SundayBreakStart" runat="server"/></td>
                    <td class="col4"><asp:Literal ID="SundayBreakFinish" runat="server"/></td>
                    <td class="col5"><asp:Literal ID="SundayFinish" runat="server"/></td>
                    <td class="col6 rel">
                        <asp:Literal ID="SundayTotal" runat="server"/>
                        <span class='img-show-more--mobile sp-span'>
                            <img src='../../img/arrow-down-flat.png' width='10' class='id3a'>
                            <img src='../../img/arrow-up-flat.png' width='10' class='id4a'>
                        </span>
                    </td>
                    <td class="col2"><asp:Literal ID="SundayLeave" runat="server"/></td>
                </tr>
           </tbody>
           <tfoot>
                <tr>
                    <td colspan="6" class="brdr-righ-none">
                        <div class="text-align-right text-align-mobile-center"><strong>Total Hours:</strong></div>
                    </td>
				    <td class="brdr-left-none brdr-righ-none">
				        <div class="center"><strong><asp:Literal ID="WeekTotal" runat="server"/></strong></div>
				    </td>
				    <td class="brdr-left-none"></td>
                </tr>
            </tfoot>
        </table>    
    </div>
    </div>
    <div class="center">
        <input class="btnTimesheet" type="button" value="Back to Timesheets" id="myButton"/>
        <input class="btnTimesheet border-button" value="Print Timesheet" type="button" onclick="PrintDiv()"/>
    </div>
   </form>
</asp:Content>