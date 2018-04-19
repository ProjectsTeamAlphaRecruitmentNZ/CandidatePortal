<%@ Page Language="vb" MasterPageFile="AdminPage.Master" AutoEventWireup="false" CodeFile="AdminPage-Home.aspx.vb" Inherits="Profile1" %>
<%@ MasterType VirtualPath="~/Profile/admin/AdminPage.Master" %>
<%@ Reference VirtualPath="~/Portal.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ProfileTitle" runat="server">
<title> JobsOnline Admin - Home </title>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ProfileContent" runat="server">
    <form runat="server" method="post">
        <div id="main">
          <div class="info-1">
            <section class="center">
	            <div>
		            <h3 class="form_title b-w2" style="display:inline-block;margin-left:0.5rem;"> Welcome to<br> Admin Pannel!</h3>
	            </div>
            </section>
            <hr>
            <section>
		        <div class="mb7"></div>
		        <div class="center">
			        <a class="btn button" href="AdminPage-Templates.aspx">Templates</a>
			        <a class="btn button" href="AdminPage-public-holidays.aspx">Public Holidays</a>
		        </div>
		        <div class="mb7"></div>
            </section>
          </div>
        </div>
    </form>
    <script type="text/javascript">   
        $("#Home").addClass("active");   
    </script>
</asp:Content>
