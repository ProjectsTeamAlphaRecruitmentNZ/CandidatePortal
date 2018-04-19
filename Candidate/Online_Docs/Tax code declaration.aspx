<%@ Page Language="VB"  MasterPageFile="ODocs.master" CodeFile="Tax code declaration.aspx.vb" Inherits="Tax_code_declaration" %>
<%@ MasterType VirtualPath="~/Online_Docs/ODocs.master" %>
<%@ Reference VirtualPath="~/Portal.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Tax code declaration
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/style-online-docs.css">
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css" rel="stylesheet" type="text/css" />
    <style>
        input[type="checkbox"]:checked + label::before {opacity:0!important}
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    							

    
    <div id="tax-dec-form"><asp:TextBox id="TestBox" runat="server"  ></asp:TextBox>
       <div id="printableArea">
		<section class="tax-dec--header" style="background-color:#d99e65">
			<img src="../img/ir-logo.png">
			<div class="center">
				<h3>Tax code declaration</h3> 
			</div>
			<div class="tax-dec--info">
				<strong>IR330</strong><br>
				<span>August 2017</span>
			</div>
		</section>
		<section class="ppd">
			<div class="mb2">
				<p><strong>
					Use this form if you're receiving salary or wages as an employee.
					Don't use this form if you're a contractor or use a WT tax code, you'll need to use the 
					<i>Tax rate notification for contractors (IR330C)</i> form.
				</strong></p>	
			</div>
			<div class="main-section--header">
				<label><h2 class="font-s"><strong>Once completed:</strong></h2></label>
				<div class="tax-dec--explanation mb2">
					<label class="div1--left"><h2 class="font-s"><strong>Employer</strong></h2> </label>
					<span class="div1--right"><strong>Give this form to your employer.</strong>If you receive a payment such as a benefit or superannuation, <strong>return this form to Work and Income.</strong></span>
				</div>
				<div class="tax-dec--explanation">
					<label class="div1--left"><h2 class="font-s"><strong>Employee</strong></h2> </label>
					<span class="div1--right"><strong>Do not send this form to Inland Revenue.</strong> You must keep this completed IR330 with your business records for seven years following the last wage payment you make to the employee. When an employee hands you this form you must change their tax code, even if you have received different advice in the past.</span>
				</div>
			</div>
			<div class="tax-dec--background-container">
				<div class="tax-dec--section">
					<strong>1 Your details</strong>
				</div>
				<div class="mt">
					<label class="label-left">Full name</label>  
				</div>
					<asp:TextBox id="FullName" runat="server" class="tax-dec--input text-uppercase focus-ird330"/>
					<div class="mb2 rel margin-top08">
						<label>IRD number</label> 
						<span>(8 digit numbers start in the second box. <div id="ird-number-example"><img src="../img/ird.jpg"></div>) </span>
						<div class="ird-number">
							<asp:TextBox id="TextBox2" runat="server" class="ir-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="TextBox3" runat="server" class="ir-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="TextBox4" runat="server" class="ir-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="TextBox5" runat="server" class="ir-input imf" maxlength="1" data-index="5"/>
							<asp:TextBox id="TextBox6" runat="server" class="ir-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="TextBox7" runat="server" class="ir-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="TextBox8" runat="server" class="ir-input imf" maxlength="1" data-index="8"/>
							<asp:TextBox id="TextBox9" runat="server" class="ir-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="TextBox10" runat="server" class="ir-input" maxlength="1" data-index="10"/>
						</div>
					</div>
					<span>
						<p class="pb">If you don't have your IRD number you can find it in your myIR Secure Online Services account or on letters or statements from us.</p>
						<p class="pb">If you want to pay your child support through your employer, talk to us on 0800 221 221 and we can set that up for you.</p>
						<p class="pb">Are you a KiwiSaver member? New employee - complete the KS2. Existing KiwiSaver member - complete the KS2 to start deductions.</p>
					</span>
					<div class="tax-dec--section mt">
						<strong>2 Your tax code</strong>
					</div>
					<div class="rel">
						<span id="tax-code">Tax code</span>
						<div class="ird-number mt3">
							<asp:TextBox runat="server" ID="taxcodeinput" class="transformed taxcodeinput focus-ird330" maxlength="5"  data-index="11"/>
						</div>
						<div id="text-section">
							<span id="text--1"><p class="pb line-height-2"><strong>You must complete a separate<i> Tax code declaration (IR330)</i> for each source of income<br>
							Choose only ONE tax code Refer to the flowchart on page 2 and then enter a tax code here.</strong></p></span>
							<span class="">If you're a <strong>casual agricultural worker, shearer, shearing shed hand, recognised seasonal worker, election day worker</strong> or have a <strong>special tax code</strong> refer to "Other tax code options" at the bottom of page 2, choose your tax code and enter it in the tax code circle.</span>
						</div>
					</div>
					<div class="tax-dec--section mt">
						<strong>3 Your entitlement to work</strong>
					</div>
					<p class="pb">I am entitled under the Immigration Act 2009 to do the work that this tax code declaration relates to (tick the box that applies to you).</p>
					<div class="display-block floatLeft">
						 <div class="squaredFour">
							<asp:CheckBox ID="CheckBox1" runat="server"/>
							<label for="<%= CheckBox1.ClientID %>"></label>
						</div>
						<span class="agreement-tax-dec">I  am a New Zealand or Australian citizen or am entitled to work indefinitely in New Zealand. </span>
					</div>
					<div class="display-block floatLeft">
						<div class="squaredFour">
							<asp:CheckBox ID="CheckBox2" runat="server"/>
							<label for="<%= CheckBox2.ClientID %>"></label>
						</div>
						<span class="agreement-tax-dec">I hold a valid visa with conditions allowing work in New Zealand.</span>
					</div>
					<p class="pb floatLeft mt">Find out whether you are entitled to work in New Zealand by calling 0508 558 855 or 09 914 4100.</p>
					<p class="pb floatLeft">Your employer can check your work entitlement status through VisaView <strong>www.immigration.govt.nz/visaview</strong> if they are registered for this 
					service, or by calling Immigration New Zealand on one of these numbers:</p>
					<p class="pb floatLeft w"><label class="w2">Auckland toll-free calling area </label>09 969 1458</p>
					<p class="pb floatLeft w"><label class="w2">Wellington</label> 04 910 9916</p>
					<p class="pb floatLeft w"><label class="w2">Other parts of New Zealand</label> 0508 WORK NZ</p>
					<p class="pb floatLeft w">Your employer may also ask you for additional evidence about your entitlement to work status.</p>
					<div class="tax-dec--section mt w  floatLeft" id="note-to-employer">
						<strong>Note to employers:</strong>
						 It is an offence to employ someone who is not entitled to work under the Immigration Act 2009. An employer has a defence if the employer did not know the person was not entitled to work, took reasonable precautions and exercised due diligence to ascertain whether the person was entitled to do the work. Relying solely on this IR330 form does not constitute reasonable precautions or due diligence. Instead, employers may check entitlements using the online VisaView service <strong>(www.immigration.govt.nz/visaview)</strong> or by contacting Immigration New Zealand or by seeking documentary evidence.
					</div>
					<div class="tax-dec--section mt  floatLeft">
						<strong>4 Declaration</strong>
					</div>
					<div class="display-block floatLeft w" style="height: 25rem;">
                        <div class="w">
                            <label class="w"><strong>Signature</strong></label>
                            <asp:Image id="SignatureImg" runat="server"
                               AlternateText="No signature image"
                               ImageAlign="left"
                                CssClass="img-signature margin-top-35"
                                ImageSrc=""
                               />

                        </div>
						<div id="tax-dec--date-div-right">
							<div class="fr">
								  <span class="kiwisaver--col1-text">Date</span>
                                  <asp:TextBox runat="server" class="datepicker kiwisaver-date focus-ird330" ID="dateird330" style="height:35px;"/>
							</div>
						</div>
					</div>
					<div style="width:100%;float:left;position: absolute;bottom:0">
						<p class="pb"><strong>Please give this completed form to your employer. </strong>If you don't complete Questions 1, 2 and 4, your employer must deduct tax from your pay at the no-notification rate of 45 cents (plus earners' levy).</p>
						<div class="tax-dec--section mt w" id="privacy">
							<strong>Privacy</strong>
							Meeting your tax obligations means giving us accurate information so we can assess your liabilities or your entitlements under the Acts we 
							administer. We may charge penalties if you don't.
							We may also exchange information about you with: 
							<div>
								<div class="kiwisaver--bullet"></div>
								<span class="kiwisaver-mar-l12">some government agencies</span>
							</div>
							<div>
								<div class="kiwisaver--bullet"></div>
								<span class="kiwisaver-mar-l12">another country, if we have an information supply agreement with them</span>
							</div>
							<div>
								<div class="kiwisaver--bullet"></div>
								<span class="kiwisaver-mar-l12">Statistics New Zealand (for statistical purposes only).</span>
							</div>
							<p style="margin-right: 2rem;">
								If you ask to see the personal information we hold about you, we'll show you and correct any errors, unless we have a lawful reason not to. 
								Call us on 0800 377 774 for more information. For full details of our privacy policy go to <strong>www.ird.govt.nz</strong> (keyword: privacy).
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
    <script>$("#IRD330").addClass("active");
        $('.datepicker').datepicker({ dateFormat: "dd/mm/yy" });
        $('#ui-datepicker-div').css('display', 'none');
        $('.datepicker').datepicker("setDate", new Date());
    </script>
</asp:Content>

