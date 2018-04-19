<%@ Page Language="vb" MasterPageFile="Profile.Master" AutoEventWireup="false" CodeFile="Profile - My Jobs.aspx.vb" Inherits="Profile1" %>
<%@ MasterType VirtualPath="~/Profile/Profile.Master" %>
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
		            <img src="../img/my-jobs.png" height="27" style="position: relative;top:0.5rem;"><h3 class="form_title b-w2" style="display:inline-block;margin-left:0.5rem;"> My Jobs</h3> 
	            </div>
            </section>
            <hr>
            <section>
	            <i><i class="fa fa-info"></i> Here you can see the upcoming assignments as well as the completed assignments. </i>
            </section>
            <section style="margin-top:-3rem">
	            <div id="my-jobs">
	                <asp:Label id="CandidateJobs" runat="server">
                                  
                    </asp:Label>     
		         </div>
		    </section>
          </div>
        </div>
    </form>
    <script type="text/javascript">   
        $("#ProfileMyJobs").addClass("active");   
    </script>
</asp:Content>
