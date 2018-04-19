<%@ Page language="VB" AutoEventWireup="false" Inherits="Login" CodeFile="login.aspx.vb"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="loginhead" runat="server">
    <title>JobsOnline Login</title>
    <link href="css/log_in.css" rel="Stylesheet" type="text/css" />
    <link rel="SHORTCUT ICON" href="favicon.ico"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="HandheldFriendly" content="true">
</head>
<body>
    <script type="text/javascript">
        function ValidateLogin() {
            var loginName = document.getElementById('Login1_UserName').value;
            if (!loginName) {
                asdas();
            }
        }
    </script>
    <sf:Connection ID="Connection2" runat="server">
    </sf:Connection>
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
            <div class="info-form xs-mt0 login sm-mar12">
                    <sf:Connection ID="Connection1" runat="server">
                    </sf:Connection>
                    <script language="javascript" type="text/javascript">
                        $(document).ready(function () {
                            doClear();
                        });

                        function doClear() {
                            setTimeout(doClear, 1000);
                            if (parseInt($get('<%=hfCountdown.Clientid %>').value) == 0) {
                                $get('<%=lblMessage.Clientid %>').innerHTML = "";
                            } else {
                                $get('<%=hfCountdown.Clientid %>').value = parseInt($get('<%=hfCountdown.Clientid %>').value) - 1;
                            }
                        }
                    </script>
                    <asp:HiddenField runat="server" id="hfCountdown" value="0" />
                     <section>
                          <h3 class="form_title">Log In</h3>    
                      </section> 
                        <div align="center" style="padding-top:8px;">
                            <asp:Label style="clear:both;display:inline; margin-top:20px;" ID="lblMessage" runat="server" ForeColor="Red"  Font-Size="13px" align="center"></asp:Label>
                        </div><br />
                      <section class="xs-text-left" style="margin-top:-3rem">               
                        <asp:Login ID="Login1" runat="server">
                            <LayoutTemplate>
                                
                                    <div class="field field--required ">
                                        <asp:TextBox ID="UserName" runat="server" class="text-input input--full" CssClass="loginName" placeholder="Username" name="username"></asp:TextBox>
                                    </div>
                                                                   
                                    <div class="field field--required ">
                                        <asp:TextBox ID="Password" runat="server" class="text-input input--full" placeholder="Password" TextMode="Password" name="user[password]"></asp:TextBox>
                                    </div> 
                                    <div class="layout">
                                        <div class="layout__item xs-6of12 xs-text-right mr2"><a class="xs-eta hover-link" href="forgotpassword.aspx">Forgot your password?</a></div>
                                    </div>
                                <asp:Button CommandName="Login" ID="btnLogin" runat="server" Text="Login" ValidationGroup="Login1" class="button buttonLogin"/>
                                <!--<asp:Button runat="server" CssClass="buttonLogin button button--primary" ID="next_btn" OnClick="Login1_Authenticate" Text="Login"/>-->
                                <!--<button type="submit" runat="server" class="buttonLogin button button--primary" id="next_btn1"  onclick="ValidateLogin();" onserverclick="Login1_Authenticate" Text="Login" ></button>-->
                            </LayoutTemplate>
                        </asp:Login>
                        </section>
                        
                <p id="support"><em>For Support phone <a href="tel:+6495242336">(09) 524 2336</a> or <a href="mailto:support@alphajobs.co.nz">support@alphajobs.co.nz</a></em></p>
            </div>
        </div>
    </div>
    <footer class="logo_area">
	            
	    <a href="http://www.alphajobs.co.nz/"  target="_blank"><img src="img/dl-alpha.png" alt="alpha_logo"></a>
	    <a href="http://www.trianglerecruitment.co.nz/"  target="_blank"><img src="img/dl-triangle.png" alt="triangle_logo"></a>
	    <a href="http://www.projectplus.co.nz/"  target="_blank"><img src="img/dl-projectplus.png" alt="projectplus_logo"></a>
	    <a href="http://www.healthwisepersonnel.co.nz/"  target="_blank"><img src="img/dl-healthwise.png" alt="healthwise_logo"></a>
	    <a href="http://www.freightwise.co.nz/index.php" class="mob-img-fr"  target="_blank"><img src="img/dl-freightwise.png" alt="freightwise_logo"></a>
        <a href="https://www.alphajobs.co.nz/clients/contractor-management/"  target="_blank"><img src="img/dl-alphacms.png" alt="alpha_cms_logo"></a>
        <br>
	    <div id="copyright"><p>© Copyright <%=DateTime.Now.Year%> Alpha Personnel Recriutment Ltd | <a  href="https://www.alphajobs.co.nz/privacy-policy" target="_blank" >Privacy Policy</a> | <a href="https://www.alphajobs.co.nz/terms-and-conditions" target="_blank">Terms & Condition</a></p></div>
    </footer>
                </form>
                </body>
</html>