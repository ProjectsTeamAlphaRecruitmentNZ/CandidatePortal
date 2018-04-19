<%@ Page Language="vb" MasterPageFile="AdminPage.Master" AutoEventWireup="false" CodeFile="AdminPage-Templates.aspx.vb" Inherits="Profile1" %>
<%@ MasterType VirtualPath="~/Profile/admin/AdminPage.Master" %>
<%@ Reference VirtualPath="~/Portal.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ProfileTitle" runat="server">
<title> JobsOnline Admin - Templates </title>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ProfileContent" runat="server">
    <form id="Form1" runat="server" method="post">
        <div id="main">
          <div class="info-1">
            <section class="center">
	            <div>
			        <img src="../../img/templates-icon.png" height="35" style="position: relative;top:0.5rem;"><h3 class="form_title b-w2" style="display:inline-block;margin-left:0.5rem;"> Templates</h3> 
		        </div>
            </section>
            <hr>
            <section>
	            <p><i> <i class="fa fa-info"></i> &nbsp;You can create your new template here.</i></p>
		            <div class="center">
			            <input type="button" class="btn button" value="Add New Template" id="add-new-template-btn">
		            </div>
		            <form>
		            <div class="form" id="new-template-form">
			            <h2 class="center">Add New Template</h2>
			            <div class="req">Template Name</div><input id="template-name">
			            <div class="req">Template CSS Name (no spaces allowed) e.g. <i>templatename.css</i></div><input id="template-css-name">
			            <div class="req">Favicon</div><input id="template-favicon">
			            <div class="req">HTML Head Title</div><input id="template-head-title">
			            <div class="req">Header</div><textarea id="template-header"></textarea>
			            <div class="req">CSS</div><textarea id="template-css"></textarea>
			            <div class="req">Footer</div><textarea id="template-footer"></textarea>
			            <div class="gear1 m-b">
				            <label class="req">Attachment:</label>
				            <div>
					            <input type="file" id="myFile" multiple size="50" onChange="addFile()" style="display:none;" class="required-entry">
					            <label for="myFile" class="button btn" id="add-files">Add Files</label>
					            <input id="cancel-file" style="display:none;" type="button" value="Cancel Files" onChange="checkFile()" class="button btn">
				            </div>
				            <br>
				            <p id="demo"></p>				
			            </div>
			            <div class="center">
				            <input type="button" class="btn button" value="Save" id="new-template-save-btn">
				            <input type="button" class="btn button" value="Cancel" id="new-template-cancel-btn">
			            </div>		
		            </div>
		            </form>
            </section>
            	<section>
	<p><i> <i class="fa fa-info"></i> &nbsp;You can edit or delete existing templetes here.</i></p>
	<div class="m-b"></div>
		<div class="template-cell" id="tc1">
			Southern Cross 			
			<div class="icon-set--02">		  	  
				<a class="edit2" onclick="show('id2');">Edit</a>&nbsp;
				<a class="delete2">Delete</a>   		
			</div>
		</div>
		<form class="form" id="form-edit">
			<h2 class="center">Edit SOUTHERNCROSS Template</h2>
			<div class="req">Template Name</div><input class="template-name-edit" value="Southern Cross">
			<div class="req">Template CSS Name (no spaces allowed) e.g. <i>templatename.css</i></div><input id="template-css-name-edit" value="southerncross.css">
			<div class="req">Favicon</div><input class="template-favicon" value="<img>">
			<div class="req">HTML Head Title</div><input iclass="template-head-title" value="Southern Cross">
			<div class="req">Header</div><textarea class="template-header" rows="5">
<img alt="logo" src="../../img/logo-southerncross.png" id="logo">
			</textarea>
			<div class="req">CSS</div><textarea class="template-css-edit" rows="20">
#header {background: url('file:///C:/Users/annas/Desktop/Candidate%20Portal/FINAL/img/header-southerncross.jpg') no-repeat 50% 19%!important;height: 300px!important;width: 100%;}
#logo{margin-top: 0!important;height: 9rem!important;margin-left: 3%!important;}
.container--header{max-width: 100%!important;width: 100%!important;}
.profile-navigation__progress__bar, .profile-navigation__progress__bar{background-color: #3092cf!important;}
.percentage {color: #3092cf!important;}
.profile-navigation__item > a:hover, a:hover{color:#e4a700!important}
.btn:hover,.add-pos-btn:hover, .add-qual-btn:hover, .add-leave-btn:hover, .add-expenses-btn:hover, #incident-form-btn:hover, #dii-form-btn:hover, .bt:hover{background: #ff6230!important; color:#ffffff!important}
.color-skills:hover, #submitButton{background-color:#ff6230!important}
#submitButton:hover{background-color: #3092cf;border:1px solid grey}
.my-job-title, .t-and-q-title, .referee-title--01{color: #2eb8e9;}
.row.header,.col-labels{background:#3093cc!important}
.confirm{background-color:#3092cf!important}
.header--general-info{background-color: #e5e5e5 !important;}
.header--general-info h2{color:#6d6e71!important}
#nav-icon2 span{background: #7ebfe5!important;}
h6{color:#ffffff!important;}
#nav--header ul li{margin-top: 1.7rem;}

.radio-input-grid__column > input[type="checkbox"]:checked + label {background-color: #065e91 !important;}

.quick-link a, .text-details, .text-details a, .contact-details a{color:#b0e2fe!important;}
.quick-link a:hover{text-decoration: underline;}
.logo_area{height: 100%;overflow: hidden;}
.copyright{background-color: #3093cc!important;}
.footer--row{background: #3093cc;margin-top:-1.4rem}
.text-details{text-align: left!important;}


			</textarea>
			<div class="req">Footer</div><textarea class="template-footer-edit" rows="10">
<!----SOUTHERNCROSS start---->
<div class="site-map floatLeft col-ftr">
<ul class="site-map">
<li><h6>Quick Links</h6></li>
<li class="quick-link"> <a href="#"> Details</a></li>
<li class="quick-link"> <a href="#my-jobs">Jobs</a></li>
<li class="quick-link"> <a href="#timesheets">Timesheets</a></li>
<li class="quick-link"> <a href="#availability">Availability</a></li>
<li class="quick-link"> <a href="#leave">Leave</a></li>
<li class="quick-link"> <a href="#expenses">Expenses</a></li>
<li class="quick-link"> <a href="#health-and-safety">Health and Safety</a></li>
<li class="quick-link"> <a href="#training-and-qualification">Training and Qualification</a></li><br><br>
<h6 class="sml">Technical support</h6>
<p class="text-details">
Email: <a href="mailto:support@alphajobs.co.nz">support@alphajobs.co.nz</a><br>
Phone: (09) 524 2336<br><br>
</p>
</ul>

</div>
<div class="contact-details floatLeft col-ftr">
<h6>Contact Us</h6>
<h6 class="sml">Physical address </h6>
<p class="text-details">
Southern Cross Health Society, Level 1,Ernst & Young Building,<br> 
2 Takutai Square, Auckland 1010<br><br>
</p>
<h6 class="sml">Postal address </h6>
<p class="text-details">
Southern Cross Health Society Private Bag 99934,<br> 
Newmarket, Auckland 1149Freepost Authority 1440<br><br>
</p>
<h6 class="sml">Phone </h6>
<p class="text-details">
+64 9 379 7628<br><br>
</p>
</div>
<!----SOUTHERNCROSS end---->
			</textarea>
			<div class="gear1 m-b">
				<label class="req">Attachment:</label>
				<div>
					<input type="file" id="myFile1" multiple size="50" onChange="addFile1()" style="display:none;" class="required-entry">
					<label for="myFile1" class="button btn" id="Label1">Add Files</label>
					<input id="cancel-file1" type="button" value="Cancel Files" onChange="checkFile1()" class="button btn">
				</div>
				<br>
				<p id="demo1" style="display: block;">1. sandriwalsh-header.jpg<br>2. Untitledsddsdsdddddddd-1.jpg<br>3. Untitsdled-1.jpg<br></p>				
			</div>
			<div class="center">
				<input type="button" class="btn button" value="Save" id="new-template-save-btn-edit">
				<input type="button" class="btn button" value="Cancel" id="new-template-cancel-btn-edit">
			</div>
		</form>
		<div class="template-cell" id="tc1">
			SandriWalsh			
			<div class="icon-set--02">		  	  
				<a class="edit2" onclick="show('id2');">Edit</a>&nbsp;
				<a class="delete2">Delete</a>   		
			</div>
		</div>
		<div class="template-cell" id="tc1">
			Alpha			
			<div class="icon-set--02">		  	  
				<a class="edit2" onclick="show('id2');">Edit</a>&nbsp;
				<a class="delete2">Delete</a>   		
			</div>
		</div>
	</section>
          </div>
        </div>
    </form>
    <script type="text/javascript">   
        $("#Templates").addClass("active");   
    </script>
</asp:Content>