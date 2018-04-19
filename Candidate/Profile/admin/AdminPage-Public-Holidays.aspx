<%@ Page Language="vb" MasterPageFile="AdminPage.Master" AutoEventWireup="false" CodeFile="AdminPage-Templates.aspx.vb" Inherits="Profile1" %>
<%@ MasterType VirtualPath="~/Profile/admin/AdminPage.Master" %>
<%@ Reference VirtualPath="~/Portal.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ProfileTitle" runat="server">
<title> JobsOnline Admin - Public Holidays </title>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ProfileContent" runat="server">
    <form id="Form1" runat="server" method="post">
        <div id="main">
          <div class="info-1">
            <section class="center">
	            <div>
			        <img src="../../img/public-holidays.png" height="27" style="position: relative;top:0.5rem;"><h3 class="form_title b-w2" style="display:inline-block;margin-left:0.5rem;"> Public Holidays</h3> 
		        </div>
            </section>
            <hr>
            <section>
                <p><i> <i class="fa fa-info"></i> &nbsp;This page contains all NZ public holidays for the year. These dates may be modified as official changes are announced, so please check regularly for updates here: <a href="https://www.govt.nz/browse/work/public-holidays-and-work/public-holidays-and-anniversary-dates">Public holidays and Anniversary dates</a>.</i></p>
	            <div class="m-b">
		            <div class="gear flex db"> 
			            <label class="holiday-name">New Year's Day</label>
			            <input class="datepicker width--datepicker" id="new-year-day" disabled/>
			            <label style="width: 10% !important;"><!--<span class="reset-icon"></span>--></label>
			            <label id="holidayClass1"><div class="message1"></div></label>
		            </div>
		            <div class="gear flex db"> 
			            <label class="holiday-name">Day after New Year's Day</label>
			            <input class="datepicker width--datepicker" id="day-after-new-year" disabled/>
			            <label style="width: 10% !important;"><!--<span class="reset-icon"></span>--></label>
			            <label id="holidayClass2"><div class="message2"></div></label>
		            </div>
		            <div class="gear flex db"> 
			            <label class="holiday-name">Auckland anniversary day</label>
			            <input class="datepicker width--datepicker" id="aucklandAnniversary">
			            <label class="reset-icon-div"><span class="reset-icon"></span></label>
			            <label class="message"></label>	
		            </div>
		            <div class="gear flex db"> 
			            <label class="holiday-name">Waitangi Day</label>
			            <input class="datepicker width--datepicker" id="WaitangiDay" disabled/>	
			            <label style="width: 10% !important;"><!--<span class="reset-icon"></span>--></label>
			            <label id="holidayClass3"><div class="message3"></div></label>
		            </div>
		            <div class="gear flex db"> 
			            <label class="holiday-name">Good Friday</label>
			            <input class="datepicker width--datepicker" id="GoodFriday">
			            <label class="reset-icon-div"><span class="reset-icon"></span></label>
			            <label class="message"></label>	
		            </div>
		            <div class="gear flex db"> 
			            <label class="holiday-name">Easter Monday</label>
			            <input class="datepicker width--datepicker" id="EasterMonday">
			            <label class="reset-icon-div"><span class="reset-icon"></span></label>
			            <label class="message"></label>	
		            </div>
		            <div class="gear flex db"> 
			            <label class="holiday-name">ANZAC Day</label>
			            <input class="datepicker width--datepicker" id="ANZACDay" disabled>
			            <label style="width: 10% !important;"><!--<span class="reset-icon"></span>--></label>	
			            <label id="holidayClass4"><div class="message4"></div></label>
		            </div>
		            <div class="gear flex db"> 
			            <label class="holiday-name">Queen's Birthday</label>
			            <input class="datepicker width--datepicker" id="QueensBirthday">
			            <label class="reset-icon-div"><span class="reset-icon"></span></label>	
			            <label class="message"></label>	
		            </div>
		            <div class="gear flex db"> 
			            <label class="holiday-name">Labour Day</label>
			            <input class="datepicker width--datepicker" id="LabourDay">	
			            <label class="reset-icon-div"><span class="reset-icon"></span></label>
			            <label class="message"></label>
            			
		            </div>
		            <div class="gear flex db"> 
			            <label class="holiday-name">Christmas Day</label>
			            <input class="datepicker width--datepicker" id="ChristmasDay" disabled>
			            <label style="width: 10% !important;"><!--<span class="reset-icon"></span>--></label>	
			            <label id="holidayClass5"><div class="message5"></div></label>
		            </div>
		            <div class="gear flex db"> 
			            <label class="holiday-name">Boxing Day</label>
			            <input class="datepicker width--datepicker" id="BoxingDay" disabled>
			            <label style="width: 10% !important;"><!--<span class="reset-icon"></span>--></label>
			            <label id="holidayClass6"><div class="message6"></div></label>	
		            </div>
	            </div>
	            <div class="center">
		            <input class="btn button" type="button" value="Save">
		            <input class="btn button" type="button" value="Reset All" id="public-holidays-reset-btn">
	            </div>
            
	        </section>
          </div>
        </div>
    </form>
    <script type="text/javascript">   
        $("#PublicHolidays").addClass("active"); 
        
        
        
        
        
        
        
          
    </script>
</asp:Content>