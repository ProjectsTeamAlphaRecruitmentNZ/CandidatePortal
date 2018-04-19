<%@ Page Language="vb" MasterPageFile="Settings.Master" AutoEventWireup="false" CodeFile="Settings-Change-password.aspx.vb" Inherits="Profile1" %>
<%@ MasterType VirtualPath="~/Profile/Settings.Master" %>
<%@ Reference VirtualPath="~/Portal.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ProfileTitle" runat="server">
<title> JobsOnline Profile - Jobs </title>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ProfileContent" runat="server">
    <form runat="server" method="post">
        <div id="main">
          <div class="info-1">
           <section class="center">
	            <div>
		            <img src="../img/mail.png" height="27" style="position: relative;top: 0.7rem;"><h3 class="form_title b-w2" style="display:inline-block;">Opt-out from emails</h3> 
	            </div>
            </section>
            <hr>
            <section>

            </section>
          </div>
        </div>
    </form>
    <script type="text/javascript">   
        $("#OptOut").addClass("active");   
    </script>
</asp:Content>
