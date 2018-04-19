<%@ Page Language="vb" MasterPageFile="Profile.Master" AutoEventWireup="false" CodeFile="Profile-Qualification.aspx.vb" Inherits="Profile1" %>
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
		            <img src="../img/qualification.png" style="position: relative;top: 1.2rem;" height="40">
		            <h3 class="form_title b-w2"> Training and Qualification</h3>
	            </div>
            </section>
            <hr>
            <section>
	            <i><i class="fa fa-info"></i> Here you can see all your trainings and qualifications gained. </i>
            </section>
            <section style="margin-top:-3rem">
                <div id="training-and-qualification">
			        <div class="t-and-q-template">
				        <div class="t-and-q-col1">
					        <h3 class="t-and-q-title">Ntec Tertiary Group, New Zealand</h3>
					        <h4 class="t-and-q-gained"><span>Graduate Diploma in IT Level 7, Information Technology</span></h4>
					        <div class="toggle-icon t-and-q-description">
						        <div class="infoToggler">
							        <span><i>Description show</i></span><img src="../img/arrow-down-flat.png" class="toggle-icon-img">
							        <span class="hidden"><i>Description hide</i></span><img src="../img/arrow-up-flat.png" class="toggle-icon-img hidden">
						        </div>
					        </div>
					        <div class="toggle-p pad-l mv1 t-and-q-description" style="display: none;">
						        <span>During this time I have undertake a number applied learning projects including, Online Assessment and Event Management Website Projects for a NZ Consulting business.</span>
					        </div>
				        </div>
				        <div class="t-and-q-col2">
					        <span class="grey-color"> 2015 - 2016 </span>
				        </div>
			        </div>
		        </div>
		    </section>
          </div>
        </div>
    </form>
    <script type="text/javascript">   
        $("#ProfileTrainingAndQualification").addClass("active");   
    </script>
</asp:Content>
