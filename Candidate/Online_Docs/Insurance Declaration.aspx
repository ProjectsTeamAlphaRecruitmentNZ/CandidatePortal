<%@ Page Language="VB"  MasterPageFile="ODocs.master"AutoEventWireup="false" CodeFile="Insurance Declaration.aspx.vb" Inherits="Insurance_Declaration" %>
<%@ MasterType VirtualPath="~/Online_Docs/ODocs.master" %>
<%@ Reference VirtualPath="~/Portal.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Insurance declaration
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/style-online-docs.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="css/Styles-new-user.css" rel="stylesheet" type="text/css">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <div class="rel" id="printableArea">
        <section class="ppd">
            <div class="  floatLeft" style="display:block;margin-left:20%;">
            <img src="../img/logo_alpha.png" alt="alpha_logo" width="300px"/>
            </div>
            <div class="headList"  style="margin-left:60%;display:block;">
                <p>Alpha Personnel Recruitment Limited</p>
                <p>Suite 1, Level 3, 27 Gillies Avenue</p>
                <p>PO Box 99256, Newmarket Auckland</p>
                <p>T: 64 9 524 2336</p>
                <p>F: 64 9 524 2794</p>
                <p>E: info@alphajobs.co.nz</p>
                <p><strong>Suite 1, Level 3, 27 Gillies Avenue</strong></p>
            </div>
        </section>
        <section class="ppd" style="background-color:#c5d5cb">
			<div class="center w floatLeft">
				<h3 style="line-height: 3.3rem;font-size:2.6rem!important">Insurance Declaraton</h3> 
			</div>
		</section>
        <section class="margin-top-3rem rel" style="height: 100%;overflow: hidden;padding-bottom: 4rem;margin-left:5rem;margin-right:2.5rem">
			<div class="input-style w floatLeft">
                <div>
                <asp:Label runat="server" Text="Contractor Name:"></asp:Label>
                <asp:TextBox runat="server" ID="Name"></asp:TextBox>
                    </div>
                <div>
                <asp:Label runat="server" Text="Address:"></asp:Label>
                <asp:TextBox runat="server" ID="Address"></asp:TextBox>
                    </div>
                <div>
                <asp:Label runat="server" Text="Phone Number:"></asp:Label>
                <asp:TextBox runat="server" ID="Phone"></asp:TextBox>
                    </div>
				<div class="text-align-justify">
                    <p class="margin-top-3rem paragraph-style">
					    I, <asp:TextBox runat="server" ID="FullName" style="width:30rem;"></asp:TextBox> on behalf of the Contractor hereby declare that I have
been made aware by Alpha that the Contractor must have current Public Liability and
Professional Indemnity insurance while engaged on contract roles with Alpha’s clients to
the sum of $2 million for each event and that I have arranged/am arranging such
insurance as below: (please tick appropriate box)

                    </p>
                </div>
                
                <div>
                    <div class="floatLeft" style="margin-top:2rem;">
                                <div class="squaredFour border-declaration--checkbox" id="ch1">
							        <asp:CheckBox ID="CheckBox1" runat="server"/>
							        <label for="<%= CheckBox1.ClientID %>"></label>
						        </div>
                                <label style="width: 90%">I have organised my own PL and PI insurance and my insurer(s) are</label>
                               <asp:TextBox runat="server" ID="Insurer1"></asp:TextBox>
                        <asp:TextBox runat="server" ID="Insurer2"></asp:TextBox>
                                
                            </div>
                    <div class="floatLeft" style="margin-top:2rem;">
                                <div class="squaredFour border-declaration--checkbox" id="ch1">
							        <asp:CheckBox ID="CheckBox2" runat="server"/>
							        <label for="<%= CheckBox1.ClientID %>"></label>
						        </div>
                                <label style="width: 90%;margin-top:1rem;">I will take advantage of Alpha’s insurance cover at the hourly rate quoted to me
and authorise Alpha to deduct the insurance from any hours worked for Alpha on
its client engagements.</label>
                              
                            </div>
                    <div class="floatLeft" style="margin-top:2rem;">
                                <div class="squaredFour border-declaration--checkbox" id="ch1">
							        <asp:CheckBox ID="CheckBox3" runat="server"/>
							        <label for="<%= CheckBox1.ClientID %>"></label>
						        </div>
                                <label style="width: 90%;margin-top:1rem;">I will organise my own PL and PI insurance and will advise Alpha of the details
prior to the start of any engagement with Alpha on its client engagements.</label>
                              
                            </div>
                    <div class=" floatLeft" style="margin-top:2rem">
					<p>I acknowledge that Alpha has the right to ask to sight my current insurance certificates
where I have arranged my own insurances.</p>
				</div>
			<div class="sm-1of2 floatLeft" style="margin-top:7rem">
					<label>Signature:</label>
				</div>
			<div class="fr sm-1of2">
				<label style="width: 5rem!important;margin-top: 7rem;margin-left:7rem">Date:</label>
                <asp:TextBox runat="server" ID="Date" CssClass="input datepicker"  style="border-color:transparent;border-bottom: 1px dotted black !important;width:20rem" ></asp:TextBox>
				
				<%--<input id="input4" type="text" class="input" name="phonenumber"  data-index="4" style="border-color:transparent;border-bottom: 1px dotted black !important;width:20rem;float: right;"/>--%> 
			</div>		
                    </div>
                
                </div>
		</section>
    </div>
    <div class="center ppd">
        <asp:Button Class="button btn" ID="buttonConvertToPdf" runat="server" Text="Submit" OnClick="buttonConvertCurrentPageToPdf_Click" />
    </div>
    <script src="js/onlineDocuments.js"></script>
    <script>$("#InsuranceDeclaration").addClass("active");
        $('.datepicker').datepicker({ dateFormat: "dd/mm/yy" });
        $('#ui-datepicker-div').css('display', 'none');
        $('.datepicker').datepicker("setDate", new Date());
    </script>
</asp:Content>