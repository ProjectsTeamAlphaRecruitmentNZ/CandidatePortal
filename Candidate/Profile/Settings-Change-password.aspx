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
		            <img src="../img/change_password.png" height="37" style="position: relative;top: 1rem;"><h3 class="form_title b-w2" style="display:inline-block;">Change Password</h3> 
	            </div>
            </section>
            <hr>
            <section>
	            <div class="resp3"></div>
	            <form onsubmit="return FormSubmission()">
		            <label class="req">Old Password</label>
		            <input class="form-control" id="oldPassword" name="oldPassword" value="" type="password">
		            <div class="field--required xs" style="position: relative;">
			            <label class="req">New Password</label>
			            <input class="form-control" id="newPassword" name="newPassword" value="" type="password">
			            <div class="qm-1">
				            <div class="tooltip">
					            <img id="theImage" src="http://image.flaticon.com/icons/svg/189/189865.svg" height="25">
					            <span class="tooltiptext">
						            <li>Password does not meet minimum strength requirement!<li>Use 6 to 64 characters.</li>
						            <li>Besides letters, include at least a number or symbol (!@#$%^&*-_+=).</li><li>Password is case sensitive.</li>
					            </span>
				            </div>
			            </div>	
			            <div class="qm-2">
				            <img id="theImage2" src="http://image.flaticon.com/icons/svg/148/148767.svg" height="25">
			            </div>  		  		  
			            <div class="resp4">
				            <meter max="4" id="password-strength-meter"></meter>	
			            </div>
			            <p id="password-strength-text"></p>	
		            </div>
		            <div class="field--required " style="position: relative;">
			            <label class="req w">Confirm Password</label>
			            <input class="form-control" id="confirmPassword" name="confirmPassword" value="" type="password">
			            <div class="qm-3">
				            <img id="theImage3" src="http://image.flaticon.com/icons/svg/148/148767.svg" height="25">
			            </div>
			            <div class="qm-4">
				            <img id="theImage4" src="http://image.flaticon.com/icons/svg/148/148766.svg" height="25">
			            </div>  
		            </div>	
		            <div class="center now-sp">
			            <button type="button" name="Submit" value="Save" class="btn button" id="next1">Save</button>
			            <button type="reset" name="Reset" value="Clear" class="btn button" id="clear-btn">Clear</button>
		            </div>
	            </form>
            </section>
          </div>
        </div>
    </form>
    <script type="text/javascript">   
        $("#ChangePassword").addClass("active");   
    </script>
</asp:Content>
