<%@ Page Language="vb" MasterPageFile="Profile.Master" AutoEventWireup="false" CodeFile="Profile - Timesheets.aspx.vb" Inherits="Profile1" %>
<%@ Register TagPrefix="TM" TagName="TimesheetModal" Src="~/Profile/Controls/TimesheetControl.ascx" %>
<%@ MasterType VirtualPath="~/Profile/Profile.Master" %>
<%@ Reference VirtualPath="~/Portal.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ProfileTitle" runat="server">
<title> JobsOnline Profile - Timesheets </title>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ProfileContent" runat="server">
    <form runat="server" method="post">
        <div id="main"> 
          <div class="info-1 timesheet-section"> 
            <div class="center mr2b">
	            <img src="../img/timesheet.png" height="32" style="position: relative;top: 0.8rem;"><h2 class="b-w2">Timesheets</h2>
            </div>
            <hr/>
	        <div class="mt ml2">
		        <a href="../docs/Online Timesheet Instructions New April 2014.pdf" target="_blank"><i><i class="fa fa-info"></i> Online Timesheet Instruction</i></a>
	        </div>
              <div class="center mt">
			        
			        <input id="add-leave-btn" class="button btn button-action" value="+ Add Timesheet"  data-toggle="modal" data-target="#timesheet" type="button">
                  
		        </div>
              <TM:TimesheetModal ID="TimesheetControl" runat="server"></TM:TimesheetModal>
            <section class="sp2">
                <h2 class="center">Outstanding Timesheets</h2>
			    <div class="timesheet timesheet1">
				    <table class="stripesInvert border shadow tableReady timesheet-t" cellspacing="0" cellpadding="0">
			            <thead>
				            <tr class="col-labels odd">
					            <th class="col1">Did not work?</th>
					            <th class="col2">Status</th>
					            <th class="col3">Client</th>
					            <th class="col4">Department</th>
					            <th class="col5">Job Title</th>
					            <th class="col6 brdr-right-none">Week Ending</th>
				            </tr>
			            </thead>
			            <tbody>
                            <asp:Label id="CandidateTimesheets" runat="server">                                        
                            </asp:Label> 
			            </tbody>
    		        </table>	
    		    </div>  
		    </section>
		    <section>
		        <div>
			        <h2 class="center">Confirmed Timesheets (Last 12 months)</h2>
		        </div>
		        <div class="timesheet timesheet2">
				    <table class="stripesInvert border shadow tableReady timesheet-t" cellspacing="0" cellpadding="0">
				        <thead>
					        <tr class="col-labels odd">
						        <th class="col2">Status</th>
						        <th class="col3">Client</th>
						        <th class="col4">Department</th>
						        <th class="col5">Job Title</th>
						        <th class="col6 brdr-right-none">Week Ending</th>
					        </tr>
				        </thead>
				        <tbody>
		                    <asp:Label id="CandidateComfirmedTimesheets" runat="server">                                             
                            </asp:Label> 
                        </tbody>
                     </table>
			    </div>
		    </section>
          </div>
        </div>
    </form>
    <script type="text/javascript">   
        $("#ProfileTimesheets").addClass("active"); 
        
        $('a:contains("Approved by Client")').text('Confirmed').addClass('black-text');
        $('a:contains("Submitted by Temp")').text('Submitted').addClass('grey-text');
        $('.timesheet-t a').addClass('bold-text');
        
        /* Timesheet details MOBILE */
        if ($(window).width() <600) {
            $('.img-show-more--mobile').show();$('.col1').hide();$('.col2').hide();$('.col3').hide();$('.col4').hide();$('.col5').hide();
            $('.click-to-show').on("click", function(){
              var $clicktoshow = $(this);
               $col1 = $(".col1", $clicktoshow);
               $col2 = $(".col2", $clicktoshow);
               $col3 = $(".col3", $clicktoshow);
               $col4 = $(".col4", $clicktoshow);
               $col5 = $(".col5", $clicktoshow);
               $col1.slideToggle();$col2.slideToggle();$col3.slideToggle();$col4.slideToggle();$col5.slideToggle();
               $(this).find('img').toggle();
            });
        } 
        
        
 
    </script>
</asp:Content>
