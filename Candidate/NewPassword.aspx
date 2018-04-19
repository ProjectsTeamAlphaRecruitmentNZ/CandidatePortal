<%@ Page Language="VB" AutoEventWireup="false" CodeFile="NewPassword.aspx.vb" Inherits="NewPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="loginhead" runat="server">
    <title>Jobs Online - New Password</title>
    <link href="css/log_in.css" rel="Stylesheet" type="text/css" />
    <link href="css/Style-new-user.css" rel="Stylesheet" type="text/css" /> 
    <link href="css/PopUp.css" rel="Stylesheet" type="text/css" /> 
        <link href="js/plugins/password_indicator/css/bootstrap.css" rel="stylesheet">
    <link href="js/plugins/password_indicator/css/signin.css" rel="stylesheet">
    
    <script
			  src="https://code.jquery.com/jquery-3.2.1.js"
			  integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
			  crossorigin="anonymous"></script>
    <script src="js/plugins/password_indicator/js/jaktutorial.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="HandheldFriendly" content="true">
    <script  src="js/nhpup_1.1.js" type="text/javascript"></script>    
</head>
<body>
    <sf:Connection ID="Connection2" runat="server">
    </sf:Connection>
   <form id="form1" runat="server" class="new_user">
    <div class="content">
        <nav class=" navigationbar">
            <div class="container">
                <div class="navigationbar__header"> 
                    <a class="navigationbar__header__logo" href="" target="_self">
                    <div id="Alpha-brand">
                    JOBS ONLINE
                    </div>
                    </a> 
                </div>
            </div>
        </nav>
        <div class="container container--paper">
            <div class="info-form xs-mt0 login sm-mar12">
                     <section>
                          <h3 class="form_title">New Password</h3>    
                      </section> 
                      <section class="xs-text-left" style="margin-top:-3rem">               
                                <div class="resp"></div>
	                            <div class="field field--required ">
		                            <input class="text-input input--full" placeholder="Email" name="email" id="user_email" type="text" onblur="validateEmail(this);" required/>
	                            </div>
	                            <div class="field--required xs">
		                            <input class="text-input input--full" placeholder="Password" id="user_password" type="password" name="password" required />	 		  		    		  		    		  		  		  
			                            <div class="progress progress-striped active">
          <div id="jak_pstrength" class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%"></div>
        </div>
	                            </div>
	                            <div class="field field--required ">
		                            <input class="text-input input--full" placeholder="Repeat Password" name="password_conf" id="user_password_confirm" type="password" required="required">
	                                
	                            </div>	
	                            <div class="actions">
		                            <input class="button button--primary log new-pass" id="next1" value="Next" type="button"/>
		                            <input class="button button--primary reset-btn" id="Text1" value="Reset" type="button"/>
	                            </div>
                        </section>
                        <div align="center" style="padding-top:8px;">
                            <asp:Label style="clear:both;display:inline; margin-top:20px;" ID="lblMessage" runat="server" ForeColor="Red"  Font-Size="13px" align="center"></asp:Label>
                        </div>
                <div id="support"><em>For Support phone <a href="tel:09 524 2336">(09) 524 2336</a> or <a href="mailto:support@alphajobs.co.nz">support@alphajobs.co.nz</a></em></div>
            </div>
        </div>
    </div>
    <footer class="logo_area">
	    <a href="http://www.alphajobs.co.nz/"><img src="http://www.alphaonline.co.nz/timesheets/images/logo_alpha-grey.png" alt="alpha_logo"></a>
	    <a href="http://www.trianglerecruitment.co.nz/"><img src="http://www.alphaonline.co.nz/timesheets/images/logo_triangle-grey.png" alt="triangle_logo"></a>
	    <a href="http://www.projectplus.co.nz/"><img src="http://www.alphaonline.co.nz/timesheets/images/logo_projectplus-grey.png" alt="projectplus_logo"></a>
	    <a href="http://www.healthwisepersonnel.co.nz/"><img src="http://www.alphaonline.co.nz/timesheets/images/logo_healthwise-grey.png" alt="healthwise_logo"></a>
	    <a href="http://www.freightwise.co.nz/index.php"><img src="http://www.alphaonline.co.nz/timesheets/images/logo_freightwise-grey.png" alt="freightwise_logo"></a><br>
	    <div id="copyright">© Copyright 2017 Alpha Personnel Recriutment Ltd </div>
    </footer>
    </form>   
    <script src="js/NewPassword.js" type="text/javascript"></script>
   </body>
</html>