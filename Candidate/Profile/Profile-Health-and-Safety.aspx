<%@ Page Language="vb" MasterPageFile="Profile.Master" AutoEventWireup="false" CodeFile="Profile-Health-and-Safety.aspx.vb" Inherits="ProfileHS" %>
<%@ Register TagPrefix="HSM" TagName="IncidentModal" Src="~/Profile/Controls/IncidentControl.ascx" %>
<%@ Register TagPrefix="HSM" TagName="DIIModal" Src="~/Profile/Controls/DIIControl.ascx" %>
<%@ MasterType VirtualPath="~/Profile/Profile.Master" %>
<%@ Reference VirtualPath="~/Portal.Master" %>
<%@ Reference Control="Controls/IncidentControl.ascx" %>
<%@ Reference Control="Controls/DIIControl.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ProfileTitle" runat="server">
<title> Alpha Jobs Profile - General </title>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ProfileContent" runat="server">
    <form runat="server" method="post">
         <sf:Connection ID="SIFConnection1" runat="server"></sf:Connection>
        <div id="main">
          <div class="info-1">
            <section class="center">
	            <div>
		            <img src="../img/H&amp;S.png" style="position: relative;top: 0.3rem;" height="30"> 
		            <h3 class="form_title b-w2"> Health and Safety</h3>
	            </div>
            </section>
            <hr>
            <section>
            <div class="text-align-justify">
                <i><i class="fa fa-info"></i> A notifiable event is when any of the following occurs as a result of work: a death, notifiable illness or injury, a notifiable incident.Under the Health and Safety at Work Act 2015 (HSWA) you must notify us when certain work-related events occur.</i>
		    </div>
			<div class="center slider pad-1 mt" id="incident-btn-set">
			    <button class="button health-and-safety-btn"  type="button" data-toggle="modal" data-target="#addIncident">+ Add Incident</button>
			    <button class="button health-and-safety-btn"  type="button" data-toggle="modal" data-target="#addDII">+ Add Death, Injury, Illness</button>
                <%--MODALS--%>
        <%--Add Incident--%>        
                            <HSM:IncidentModal ID="Incident" runat="server"></HSM:IncidentModal>                         
                <%--Add DII--%>        
                            <HSM:DIIModal ID="DII" runat="server"></HSM:DIIModal>                        
        <%--End Modals--%>
		    </div>	
                <asp:Table ID="TableHS" runat="server" CssClass="table-availability table-incident"> 
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell>Incident Type</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Added on</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Status:</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                </asp:Table>  
                <asp:PlaceHolder runat=server ID="PlaceHolder1" />
            </section>              
          </div>
        </div>        
    </form>
    <script type="text/javascript">   
        $("#ProfileHealthAndSafety").addClass("active");

        $('.timepicker').timepicker();
        /* -----------------------------------------------------------------------------
MENU
----------------------------------------------------------------------------- */
        $('#nav-icon2').click(function () {
            $(this).toggleClass('open');
            $('#nav--header ul').slideToggle();
        });
        $("div.infoToggler").click(function () {
            //$(this).find('img').toggle();
            //$('.profile-navigation__nav').slideToggle();
        });
        $("div.toggle-icon").click(function () {
            //$(this).next().slideToggle();
        });
        $('.div1').show();
        function setKeyOfModal() {
            $(".keyWrap input[type='hidden']").each(function () {
                var modalDiv = $(this);
                var key = parseInt($(this).val());
                if (key > 0) {
                    modalDiv.parent().parent().attr("id", "addIncident" + key);
                }
            });
            $(".keyDIIWrap input[type='hidden']").each(function () {
                var modalDiv = $(this);
                var key = parseInt($(this).val());
                if (key > 0) {
                    modalDiv.parent().parent().attr("id", "addEvent" + key);
                }
            });
        }
        $(document).ready(function () {
            setKeyOfModal();
        });
        $(function () {
            $(".dropdate").dateDropdowns({
                defaultDateFormat: 'dd/mm/yyyy',
                submitFormat: "dd/mm/yyyy",
                daySuffixes: false
            });
        });
    </script>    
</asp:Content>
