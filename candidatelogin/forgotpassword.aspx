<%@ Page language="VB" AutoEventWireup="false" Inherits="ForgotPassword" CodeFile="forgotpassword.aspx.vb"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="loginhead" runat="server">
    <title>JobsOnline Forgot Password</title>
    <link href="css/log_in.css" rel="Stylesheet" type="text/css" />
    <link rel="SHORTCUT ICON" href="favicon.ico"/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="HandheldFriendly" content="true">
</head>
<body id="resetP">
    <sf:Connection ID="SIFConnection" runat="server"></sf:Connection>
    <form id="form1" runat="server" class="new_user">
        <div class="content">
            <nav class=" navigationbar">
                <div class="container">
                    <div class="navigationbar__header"> 
                        <a class="navigationbar__header__logo" href="" target="_self">
                            <div id="Alpha-brand">
                                <image src="img/logo.png" alt="Jobs Online"></image>
                            </div>
                        </a> 
                    </div>
                </div>
            </nav>
            <div class="container container--paper">
                <div class="info-form xs-mt0 login sm-mar12" style="width: 70% !important;">
                    <section>
                        <h3 class="form_title">Let’s find your account</h3>
                    </section> 
                    <section class="xs-text-left" style="margin-top:-3rem">         
                        <asp:Label ID="lblMessage" runat="server" /><br /><br />
                        <div class="field field--required">
                            <asp:TextBox ID="txtUserName" runat="server" placeholder="Please enter your email address or username"/>
                        </div>
                        <div style="text-align:center">
                            <asp:Button Text="Submit" ID="btnSend" runat="server" OnClick="SendEmail" class="button buttonLogin"/>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </form>  
</body>
</html>
