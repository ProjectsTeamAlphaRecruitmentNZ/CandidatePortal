<%@ Page Language="VB"  MasterPageFile="ODocs.master" AutoEventWireup="false" CodeFile="Tax rate notification for contractors.aspx.vb" Inherits="Tax_rate_notification_for_contractors" %>
<%@ MasterType VirtualPath="~/Online_Docs/ODocs.master" %>
<%@ Reference VirtualPath="~/Portal.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">Tax rate notification for contractors
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/style-online-docs.css">
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
     <div id="tax-dec-form" >
         <div id="printableArea">
		<section class="tax-dec-c--header" style="background-color:#a2d9dd">
			<img src="../img/ir-logo-black.png"/>
			<div class="center">
				<h3>Tax rate notification for contractors</h3> 
			</div>
			<div class="tax-dec--info">
				<strong>IR330C</strong><br>
				<span>March 2017</span>
			</div>
		</section>
		<section class="ppd">
			<div class="mb2">
				<p><strong>
					Use this form if you're a contractor receiving schedular payments.<br/>
					Don't use this form if you're receiving salary or wages as an employee, you'll need to use the <i>Tax code declaration (IR330)</i> form. 
				</strong></p>	
			</div>
			<div class="main-section-c--header">

				<label><h2 class="font-s"><strong>Once completed:</strong></h2></label>
				<div class="tax-dec--explanation mb2">
					<label class="div1--left"><h2 class="font-s"><strong>Contractor</strong></h2> </label>
					<span class="div1--right"><strong>Give this form to the person paying you.</strong></span>
				</div>

				<div class="tax-dec--explanation">
					<label class="div1--left"><h2 class="font-s"><strong>Payer</strong></h2> </label>
					<span class="div1--right">
					<strong>Don't send this form to Inland Revenue. </strong> 
					<span class="cont-form-text1">You must keep this completed IR330C with your business records for seven years following the last schedular payment you make to the person or entity.</span></span>
				</div>

			</div>
			<div class="tax-dec--background-container contractors">
				<!-------1. Your DETAILS------>
				<div class="tax-dec-c--section">
					<strong>1. Your details</strong>
				</div>
				<div class="mt w floatleft margin-top2">
					<label class="label-left">Full Name</label>  
		            <asp:TextBox runat="server" id="FullName" class="tax-dec-c--input inp1 text-uppercase floatRight width80 margin-top-08"/>
				</div>					
				<div class="mb2 rel w floatleft margin-top2">
					<label>IRD number</label> 
					<span>
						(8 digit numbers start in the second box. 
						<div id="ird-number-example"><img src="../img/ird.jpg" id="img-ird330c"/></div>
						<span class="position-absolute" style="margin-left: 11rem;">)</span> 
					</span>
                    <div class="ird-number">
							<asp:TextBox id="TextBox2" runat="server" class="irc-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="TextBox3" runat="server" class="irc-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="TextBox4" runat="server" class="irc-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="TextBox5" runat="server" class="irc-input imf" maxlength="1" data-index="5"/>
							<asp:TextBox id="TextBox6" runat="server" class="irc-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="TextBox7" runat="server" class="irc-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="TextBox8" runat="server" class="irc-input imf" maxlength="1" data-index="8"/>
							<asp:TextBox id="TextBox9" runat="server" class="irc-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="TextBox10" runat="server" class="irc-input" maxlength="1" data-index="10"/>
						</div>
					<%--<div class="ird-number margin-top08">

						<asp:TextBox id="irdnumber" runat="server" class="ir-input-c" maxlength="9" Width="180"/>
					</div>--%>
				</div>			
				<span>
					<p class="pb">If you don't have:</p>
						
					<div>
						<div class="kiwisaver--bullet margin-top11"></div>
						<span class="kiwisaver-mar-l12">your IRD number you can find it on your myIR Secure Online Services account or on letters or statements from us.</span>
					</div>
					<div>
						<div class="kiwisaver--bullet margin-top11"></div>
						<span class="kiwisaver-mar-l12">an IRD number go to <strong><a href="http://www.ird.govt.nz" target="_blank">www.ird.govt.nz</a></strong> (search keywords: IRD number) to find out how to apply for one.</span>
					</div>
						     
				</span>
				<!---2. TAX RATE---->
				<div class="tax-dec-c--section mt margin-top2">
					<strong>2. Your tax rate</strong>
				</div>
				<div class="rel mt margin-bottom5">
					<div id="text-section">
						<span id="text--1"><p class="pb"><strong>You must complete a separate <i>Tax rate notification for contractors (IR330C)</i> for each source of contracting income.</strong></p></span>
					</div>
					<div class="w ohs">
						<p class="mt floatLeft">
							Refer to the flowchart on page 2 and enter your tax rate to one decimal point here.<br />
                             <a href="https://www.ird.govt.nz/resources/9/c/9c019ad0-9071-4f3d-babb-7aa37e954bb4/IR330C.pdf" target="_blank"><i>Open page 2</i></a>
						</p>
						<div class="floatLeft margin-left3 margin-top05rem">
							<%--<asp:TextBox runat="server" id="TaxRate1" class="   margin-top-08 ir-input-tr1" maxlength="2" />--%>
                            <%--<div class="ird-number">--%>
							<asp:TextBox id="TextBox11" runat="server" class="irc-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="TextBox12" runat="server" class="irc-input" maxlength="1" data-index="3"/>
							<%--</div>--%>
							<span class="dot">.</span>
                            <%--<div class="ird-number">--%>
							<asp:TextBox id="TextBox13" runat="server" class="irc-input" maxlength="1" data-index="2"/>
							<%--</div>--%>
							<%--<asp:TextBox runat="server" id="TaxRate2" class=" margin-top-08 ir-input-tr2" height="21" width="20"  maxlength="1"/>--%> 
							<span class="percent">%</span>
						</div>
					</div>
					<div class="w ohs margin-top-12">
						<p class="mt floatLeft">
							Refer to the table on page 3 and enter your schedular payment activity number here.
						</p>
						<asp:TextBox runat="server" id="PaymentActivityNumber" class="tax-dec--date tax-dec-c--input r margin-left16 text-uppercase" maxlength="3" height="30" Width="40"/> 
					</div>
					<div class="w">
						<p class="mt floatLeft">
							Your tax code will always be:
						</p>
						<div class="ird-number mt3" style="left: 17rem;">
							<div id="tax-code-c-input" class="transformed"><span>WT</span></div>
						</div>
					</div>
				</div>
				<!---3. DECLARATION---->
				<div class="tax-dec-c--section margin-top11">
					<strong>3. Declaration</strong>
				</div>
				<div class="margin-top2 w floatleft">
					<label class="label-left">Name</label>  
                    <asp:TextBox runat="server" id="DeclarationName" class="tax-dec-c--input inp1 text-uppercase floatRight width80 margin-top-08" />
				</div>
				<div class="margin-top2 w floatleft rel">
					<label class="label-left">Designation or title<br><span class="position-absolute top22">(if applicable)</span></label>  
					<asp:TextBox runat="server" id="DesignationOfTitle" class="tax-dec-c--input inp1 text-uppercase floatRight width80 margin-top-08"/>
				</div>
                <div class="w floatleft rel top08">
					<label class="label-left"></label>  
					<span class="font-size11">For example, director, partner, executive office holder, manager, duly authorised person</span>
				</div>
				<!---signature---->
				<div class="kiwisaver--col1-text floatLetf w rel" style="height:51rem">
                    <span class="margin-left14">Signature</span>
                    <asp:Image id="SignatureImg" runat="server"
                               AlternateText="No signature image"
                               ImageAlign="left"
                                CssClass="img-signature margin-top-35"
                                ImageSrc=""
                               />
                    <div class="top27 floatRight margin-top2 margin-right1" style="margin-right:1.5rem;">
                        <span class="kiwisaver--col1-text">Date</span>
                        <asp:TextBox ID="date1" runat="server" class="datepicker kiwisaver-date bc-blue" style="width:11rem;" Height="35"/>
                </div>
		        <div class="w floatLeft position-absolute margin-top11" style="bottom: 0;">
					<p class="pb"><strong>Please give this completed form to your payer. If you don't complete sections 1 and 3 your payer must deduct tax from your pay at the no-notification rate of 45%, except for non-resident contractor companies where it's 20%. </strong></p>
					<div class="tax-dec-c--section mt w" id="privacy">
						<strong>Privacy</strong>
						<p>Meeting your tax obligations means giving us accurate information so we can assess your liabilities or your entitlements under the Acts we administer. We may charge penalties if you don't. </p>
						<p>We may also exchange information about you with:</p>
						<div>
							<div class="kiwisaver--bullet margin-top11"></div>
							<span class="kiwisaver-mar-l12">some government agencies</span>
						</div>
						<div>
							<div class="kiwisaver--bullet margin-top11"></div>
							<span class="kiwisaver-mar-l12">another country, if we have an information supply agreement with them</span>
						</div>
						<div>
							<div class="kiwisaver--bullet margin-top11"></div>
							<span class="kiwisaver-mar-l12">Statistics New Zealand (for statistical purposes only).</span>
						</div>
						<p>
							If you ask to see the personal information we hold about you, we'll show you and correct any errors, unless we have a lawful reason not to. Call us on 0800 377 774 for more information. For full details of our privacy policy go to <strong>www.ird.govt.nz</strong> (keyword: privacy).
						</p>
					</div>
				</div>
			</div>
		</section>
             </div>
	</div> 
    <div class="center ppd">
        <asp:Button Class="button btn" ID="buttonConvertToPdf" runat="server" Text="Submit" OnClick="buttonConvertCurrentPageToPdf_Click" />
    </div>
    <script src="js/onlineDocuments.js"></script>
    <script>$("#IRD330C").addClass("active");
        $('.datepicker').datepicker({ dateFormat: "dd/mm/yy" });
        $('#ui-datepicker-div').css('display', 'none');
        $('.datepicker').datepicker("setDate", new Date());
    </script>
</asp:Content>

