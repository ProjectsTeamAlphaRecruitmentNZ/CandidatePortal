<%@ Page language="VB" AutoEventWireup="false" Inherits="ResetPassword" CodeFile="resetpassword.aspx.vb"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="loginhead" runat="server">
    <title>JobsOnline Reset Password</title>
    <link href="css/log_in.css" rel="Stylesheet" type="text/css" />
    <link rel="SHORTCUT ICON" href="favicon.ico"/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="HandheldFriendly" content="true">
    <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
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
                        <h3 class="form_title">Reset Password</h3>    
                    </section> 
                    <section class="xs-text-left" style="margin-top:-3rem">               
                        <div class="field field--required">
                            <asp:TextBox ID="newPass" runat="server" class="text-input input--full" placeholder="New Password" TextMode="Password" name="password"></asp:TextBox>              
                        </div>                                           
                        <div class="field field--required ">
                            <asp:TextBox ID="rePass" runat="server" class="text-input input--full" placeholder="Repeat Password" TextMode="Password" name="rePass"></asp:TextBox>
                        </div>
                        <div id="errors" class="well"></div><br />
                        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
                        <script type="text/javascript" src="js/jquery.min-password-validation.js"></script>
                        <script>
                            $(document).ready(function () {
                                $("#newPass").passwordValidation({ "confirmField": "#rePass" }, function (element, valid, match, failedCases) {
                                    $("#errors").html("<pre>" + failedCases.join("\n") + "</pre>");
                                    if (valid) $(element).css("border", "1px solid green");
                                    if (!valid) $(element).css("border", "1px solid red");
                                    if (valid && match) $("#rePass").css("border", "1px solid green");
                                    if (!valid || !match) $("#rePass").css("border", "1px solid red");
                                });
                            });
                        </script>
                        <script type="text/javascript">
                              var _gaq = _gaq || [];
                              _gaq.push(['_setAccount', 'UA-36251023-1']);
                              _gaq.push(['_setDomainName', 'jqueryscript.net']);
                              _gaq.push(['_trackPageview']);

                              (function () {
                                  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                                  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                                  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
                              })();
                        </script>
                        <div style="text-align:center">
                            <asp:Button CommandName="Save" ID="btnSave" runat="server" Text="Save" class="button buttonLogin"/>
                        </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>