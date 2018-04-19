<%@ Page Language="VB" MasterPageFile="ODocs.master" AutoEventWireup="false" CodeFile="KiwiSaver deduction form.aspx.vb" Inherits="KiwiSaver_deduction_form" %>
<%@ MasterType VirtualPath="~/Online_Docs/ODocs.master" %>
<%@ Reference VirtualPath="~/Portal.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    KiwiSaver deduction form
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/style-online-docs.css">
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <div id="printableArea">
    	<div id="kiwisaver-form">
			<section class="kiwisaver--header">
				<img src="../img/ir-logo-black.png" style="width:250px;">
				<div class="center">
					<h3></h3>
				</div> 
				<div class="kiwisaver--info">
					<img src="../img/ks.png" style="width:200px;">
					<img src="../img/ks2-0509.jpg" id="ks20509" style="width:170px;">
					<label class="kiwisaver-act">KiwiSaver Act 2006</label>
				</div>
				<div class="kiwisaver-code"><strong>KS2</strong><p class="act-subtitle-font">May 2016</p></div>
			</section>
			<section class="ppd">
				<div class="mb2 new-margin">
						<h2 class="kiwisaver-title">KiwiSaver deduction form </h2><span class="kiwisaver-title2"><strong>(employee to complete and give to employer)</strong></span>
				</div>
				<div class="kiwisaver--background-container">
					<div class="kiwisaver--explanation">
							Use this form to provide your details to your employer if you are:<br>
							<div>
								<div class="kiwisaver--bullet"></div>
								<span class="kiwisaver-mar-l12">starting new employment</span>
							</div>
							<div>
								<div class="kiwisaver--bullet"></div>
								<span class="kiwisaver-mar-l12">an existing employee and want to opt into KiwiSaver</span>
							</div>
							<div>
								<div class="kiwisaver--bullet"></div>
								<span class="kiwisaver-mar-l12">a KiwiSaver member and want to change your contribution rate.</span>
							</div>
							You are not eligible to join KiwiSaver if:
							<div>	
								<div class="kiwisaver--bullet"></div>
								<span class="kiwisaver-mar-l12">You are not a New Zealand citizen, or are not entitled to stay in New Zealand indefinitely, or</span>
							</div>
							<div>	
								<div class="kiwisaver--bullet"></div>
								<span class="kiwisaver-mar-l12">You are over the age of eligibility for New Zealand Superannuation (NZ Super: 65 years and over).</span>
							</div>
							<span class="font-weight-800">Please read the notes on the back to help you fill in this form</span>	
					</div>
					<div class="kiwisaver-dec--section rel">
						<div class="kiwisaver--element1"></div>
						<span class="element1--text"><strong>Section A</strong></span>
						<span class="st-el1"><span class="st-el1--text">General</span> Please put a dash to indicate your situation eg</span>
						<div class="kiwisaver--line">
							<div class="kiwisaver--element2"></div>
						</div>
					</div>
					<div class="mt w">
						<div class="kiwisaver--col1">
							<span class="kiwisaver--col1-text">1. Are you a KiwiSaver member?</span> 
						</div>
						<div class="kiwisaver--col2">
							<div class="checkbox" id="ch1">
                                <asp:CheckBox ID="CheckBox1" runat="server"/>
                                <label for ="<%= CheckBox1.ClientID %>">
                                    <div class="kiwisaver--line-left"></div>
								    <div class="kiwisaver--line-right"></div>
                                </label>
                            </div>
							<span class="kiwisaver--ml34 fsw">Yes. Go to Question 2</span> 
						</div>
						<div class="kiwisaver--col3" id="ch2">
							<div class="checkbox">
                                <asp:CheckBox ID="CheckBox2" runat="server"/>
                                <label for ="<%= CheckBox2.ClientID %>">
                                    <div class="kiwisaver--line-left"></div>
								    <div class="kiwisaver--line-right"></div>
                                </label>
                            </div>
							<span class="kiwisaver--ml34 fsw">No. Go to Question 3</span> 
						</div>
					</div>
                    <br />
					<div class="mt w">
						<div class="kiwisaver--col1 line-height-2">
							<span class="kiwisaver--col1-text">2. Are you on a contributions <span class="new-line">holiday?</span></span> 
						</div>
						<div class="kiwisaver--col2" id="ch3">
							<div class="checkbox">
                                <asp:CheckBox ID="CheckBox3" runat="server"/>
                                <label for ="<%= CheckBox3.ClientID %>">
                                    <div class="kiwisaver--line-left"></div>
								    <div class="kiwisaver--line-right"></div>
                                </label>
                            </div>
							<span class="kiwisaver--ml34 fsw">Yes. See note below</span> 
						</div>
						<div class="kiwisaver--col3" id="ch4">
							<div class="checkbox">
                                <asp:CheckBox ID="CheckBox4" runat="server"/>
                                <label for ="<%= CheckBox4.ClientID %>">
                                    <div class="kiwisaver--line-left"></div>
								    <div class="kiwisaver--line-right"></div>
                                </label>
                            </div>
							<span class="kiwisaver--ml34 fsw">No. Go to Question 3</span> 
						</div> 
					</div>
					<div class="mt w st kiwisaver-mar-l12 ohs">
						If you have a contributions holiday notice you must show it to your employer to prevent them making KiwiSaver deductions.<br>
						If you have lost your notice, you can get a replacement by calling us on 0800 549 472
					</div>
					<div class="kiwisaver-dec--section rel mb3">
						<div class="kiwisaver--element1"></div>
						<span class="element1--text"><strong>Section B</strong></span>
						<span class="st-el1"><span class="st-el1--text">Personal details</span> Please use</span>
						<div class="margin-left-05 position-absolute display-inline"><img src="../img/blockletters.jpg"></div><br>
						<span class="st-el1 line-height-2 margin-left-06">You must provide your IRD, name and address.</span>
					</div>
					<div class="mt w margin-bottom-5">
						<div class="kiwisaver--col1">
								<span class="kiwisaver--col1-text">3. Your IRD number</span>
								
						</div>
						<div class="kiwisaver-input-field">
                            <asp:TextBox id="IRD1" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="IRD2" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="IRD3" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="IRD4" runat="server" class="ks-input" maxlength="1" data-index="5"  style="margin-left:0.2rem !important;"/>
							<asp:TextBox id="IRD5" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="IRD6" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="IRD7" runat="server" class="ks-input" maxlength="1" data-index="8" style="margin-left:0.2rem !important;"/>
							<asp:TextBox id="IRD8" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="IRD9" runat="server" class="ks-input" maxlength="1" data-index="10"/>
							<%--<asp:TextBox ID="TextBox1" runat="server" class="kiwisaver-input" maxlength="9" data-index="2"></asp:TextBox>--%>
						</div>
						<div>
							<span class="kiwisaver--col1-text floatRight font-size11">If you don't know your IRD number or you don't have one, call us on 0800 549 472</span>
						</div>
					</div>
					<div class="mt w ohs margin-top-3rem">
						<div class="kiwisaver--col1">
							<span class="kiwisaver--col1-text">4. Your name</span> 
						</div>
						<div class="kiwisaver-input-field margin-top0">
							<div class="di">
						        <div class="checkbox" id="ch5">
                                    <asp:CheckBox ID="CheckBox5" runat="server"/>
                                    <label for ="<%= CheckBox5.ClientID %>">
                                        <div class="kiwisaver--line-left"></div>
								        <div class="kiwisaver--line-right"></div>
                                    </label>
                                </div>
								<span class="kiwisaver--ml34 fsw">Mr</span> 
							</div>
							<div class="di">
								<div class="checkbox"  id="ch6">
                                <asp:CheckBox ID="CheckBox6" runat="server"/>
                                <label for ="<%= CheckBox6.ClientID %>">
                                    <div class="kiwisaver--line-left"></div>
								    <div class="kiwisaver--line-right"></div>
                                </label>
                            </div>
								<span class="kiwisaver--ml34 fsw">Mrs</span> 
							</div>
							<div class="di">
							    <div class="checkbox"  id="ch7">
                                    <asp:CheckBox ID="CheckBox7" runat="server"/>
                                    <label for ="<%= CheckBox7.ClientID %>">
                                        <div class="kiwisaver--line-left"></div>
								        <div class="kiwisaver--line-right"></div>
                                    </label>
                                </div>
								<span class="kiwisaver--ml34 fsw">Miss</span> 
							</div>
							<div class="di">
							    <div class="checkbox"  id="ch8">
                                    <asp:CheckBox ID="CheckBox8" runat="server"/>
                                    <label for ="<%= CheckBox8.ClientID %>">
                                        <div class="kiwisaver--line-left"></div>
								        <div class="kiwisaver--line-right"></div>
                                    </label>
                                </div> 
								<span class="kiwisaver--ml34 fsw">Ms</span>
							</div>
							<div class="di">
								<span class="fsw">Other</span>  
								<div id="other-title" >
                                    <asp:TextBox id="Other1" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="Other2" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="Other3" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="Other4" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="Other5" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="Other6" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="Other7" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="Other8" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="Other9" runat="server" class="ks-input" maxlength="1" data-index="10"/>
									<%--<asp:TextBox ID="TextBox2" runat="server" class="kiwisaver-input ks1" MaxLength="9" data-index="3"/>--%>
								</div>
							</div>
							<div class="margin-top-04"><span class="kiwisaver--col1-text font-size11">Put a dash to indicate your title</span></div>
						</div>
					</div>
					<div class="mt w ohs margin-top-3rem">
						<div class="margin-left16">
                            <asp:Panel runat="server" ID="FNPanel">
                            <asp:TextBox id="FN1" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="FN2" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="FN3" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="FN4" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="FN5" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="FN6" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="FN7" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="FN8" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="FN9" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="FN10" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="FN11" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="FN12" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="FN13" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="FN14" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="FN15" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="FN16" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="FN17" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="FN18" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="FN19" runat="server" class="ks-input" maxlength="1" data-index="2"/>
                            <asp:TextBox id="FN20" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="FN21" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="FN22" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="FN23" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="FN24" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="FN25" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="FN26" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="FN27" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="FN28" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="FN29" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="FN30" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="FN31" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="FN32" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="FN33" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="FN34" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="FN35" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="FN36" runat="server" class="ks-input" maxlength="1" data-index="9"/>
                                <asp:TextBox id="FN37" runat="server" class="ks-input" maxlength="1" data-index="9"/>
                                </asp:Panel>
						</div>
						<div class="margin-left16"><span class="kiwisaver--col1-text font-size11 margin-top04">First names</span></div>
					</div>
					<div class="w ohs">
						<div class="margin-left16">
                            <asp:Panel runat="server" ID="LNPanel">
                            <asp:TextBox id="LN1" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="LN2" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="LN3" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="LN4" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="LN5" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="LN6" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="LN7" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="LN8" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="LN9" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="LN10" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="LN11" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="LN12" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="LN13" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="LN14" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="LN15" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="LN16" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="LN17" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="LN18" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="LN19" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="LN20" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="LN21" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="LN22" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="LN23" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="LN24" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="LN25" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="LN26" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="LN27" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="LN28" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="LN29" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="LN30" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="LN31" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="LN32" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="LN33" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="LN34" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="LN35" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="LN36" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                                <asp:TextBox id="LN37" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                                </asp:Panel>
						</div>
						<div class="margin-top04 margin-left16"><span class="kiwisaver--col1-text font-size11">Surname</span></div>
					</div>
					<div class="mt w">
						<div class="kiwisaver--col1">
							<span class="kiwisaver--col1-text">5. Your postal<span class="new-line">address </span></span> 
						</div>
						<div class="margin-left16 position-absolute left13">
                            <asp:Panel runat="server" ID="StreetNumPanel">
                            <asp:TextBox id="Street1" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="Street2" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="Street3" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="Street4" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="Street5" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="Street6" runat="server" class="ks-input" maxlength="1" data-index="7"/>
                                </asp:Panel>
							<%--<asp:TextBox ID="TextBox5" runat="server" class="kiwisaver-input width120" maxlength="6" data-index="6"/>--%>
						</div>
					</div>
					<div class="rel">
						<span class="kiwisaver--col1-text w font-size11 position-absolute line-height-2 top25 left134">Street number</span>
					</div>
					<div class="margin-left16 position-absolute left27">
                        <asp:Panel runat="server" ID="StreeAddrPanel">
                        <asp:TextBox id="StreeAddr1" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="StreeAddr2" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="StreeAddr3" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="StreeAddr4" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="StreeAddr5" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="StreeAddr6" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="StreeAddr7" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="StreeAddr8" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="StreeAddr9" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="StreeAddr10" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="StreeAddr11" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="StreeAddr12" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="StreeAddr13" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="StreeAddr14" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="StreeAddr15" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="StreeAddr16" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="StreeAddr17" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="StreeAddr18" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="StreeAddr19" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="StreeAddr20" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="StreeAddr21" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="StreeAddr22" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="StreeAddr23" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="StreeAddr24" runat="server" class="ks-input" maxlength="1" data-index="7"/>
                            </asp:Panel>
					</div>
					<div class="rel">
						<span class="kiwisaver--col1-text w font-size11 position-absolute line-height-2 top25 left274">Street address or PO Box number</span>
					</div>
					<div class="margin-left16 position-absolute left13 margin-top42">
                        <asp:Panel runat="server" ID="SuburbPanel">
                            <asp:TextBox id="Suburb1" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="Suburb2" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="Suburb3" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="Suburb4" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="Suburb5" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="Suburb6" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="Suburb7" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="Suburb8" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="Suburb9" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="Suburb10" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="Suburb11" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="Suburb12" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="Suburb13" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="Suburb14" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="Suburb15" runat="server" class="ks-input" maxlength="1" data-index="7"/>
                            </asp:Panel>
					</div>
					<div class="rel">
						<span class="kiwisaver--col1-text w position-absolute font-size11 line-height-2 left134 top68">Suburb, box lobby or RD</span>
					</div>
                    <div class="mt ohs">
					<div class="margin-left16 position-absolute left13 margin-top85">
                        <asp:Panel runat="server" ID="CityPanel">
                            <asp:TextBox id="City1" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="City2" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="City3" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="City4" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="City5" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="City6" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="City7" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="City8" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="City9" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="City10" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="City11" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="City12" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="City13" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="City14" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="City15" runat="server" class="ks-input" maxlength="1" data-index="7"/>
                             </asp:Panel>
					</div></div>
					<div class="rel">
						<span class="kiwisaver--col1-text w font-size11 position-absolute line-height-2 left134 top11">Town or city</span>
					</div>
					<div class="margin-left-16 position-absolute margin-top85 left472">
                        <asp:Panel runat="server" ID="PostCodePanel">
                        <asp:TextBox id="PostCode1" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="PostCode2" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="PostCode3" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="PostCode4" runat="server" class="ks-input" maxlength="1" data-index="5"/>
                            </asp:Panel>
					</div>
					<div class="rel">
						<span class="kiwisaver--col1-text w font-size11 position-absolute line-height-2 left462 top11">Postcode </span>
					</div>
					<div class="mt w ohs margin-top-15rem">
						<div class="kiwisaver--col1">
							<span class="kiwisaver--col1-text">6. Your contact <span class="new-line"> numbers</span> </span> 
						</div>
						<div class="sec-6 margin-top--10">
                            <asp:TextBox id="Phone1" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="Phone2" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="Phone3" runat="server" class="ks-input" maxlength="1" data-index="4" style="margin-left:0.2rem !important;"/>
							<asp:TextBox id="Phone4" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="Phone5" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="Phone6" runat="server" class="ks-input" maxlength="1" data-index="7" style="margin-left:0.2rem !important;"/>
							<asp:TextBox id="Phone7" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="Phone8" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="Phone9" runat="server" class="ks-input" maxlength="1" data-index="10"/>
							<%--<asp:TextBox ID="TextBox10" runat="server" class="kiwisaver-input width200" maxlength="10" data-index="11"/>--%>
						</div>
					</div>
					<div class="rel top03 left02">
						<span class="kiwisaver--col1-text w day" >Day </span>
					</div>
					<div class="margin-left16 position-absolute margin-top-35 left396">
						<asp:TextBox id="Mobile1" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="Mobile2" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="Mobile3" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="Mobile4" runat="server" class="ks-input" maxlength="1" data-index="6" style="margin-left:0.2rem !important;"/>
							<asp:TextBox id="Mobile5" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="Mobile6" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="Mobile7" runat="server" class="ks-input" maxlength="1" data-index="9" style="margin-left:0.2rem !important;"/>
							<asp:TextBox id="Mobile8" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="Mobile9" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="Mobile10" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="Mobile11" runat="server" class="ks-input" maxlength="1" data-index="4"/>	
                        <%--<asp:TextBox ID="TextBox11" runat="server" class="kiwisaver-input width200" maxlength="10" data-index="12"/>--%>
					</div>
					<div class="rel top03 left02">
						<span class="kiwisaver--col1-text w font-size11 position-absolute line-height-2 top05 left40">Mobile </span>
					</div>
					<div class="mt w rel margin-top-3rem">
						<div class="kiwisaver--col1">
							<span class="kiwisaver--col1-text">7. Your email <span class="new-line">address</span></span> 
						</div>
						<div class="margin-left16 position-absolute left12 width83">
                            <asp:Panel runat="server" ID="EmailPanel">
							 <asp:TextBox id="Email1" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="Email2" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="Email3" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="Email4" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="Email5" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="Email6" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="Email7" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="Email8" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="Email9" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="Email10" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="Email11" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="Email12" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="Email13" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="Email14" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="Email15" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="Email16" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="Email17" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="Email18" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="Email19" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="Email20" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="Email21" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="Email22" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="Email23" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="Email24" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="Email25" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="Email26" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="Email27" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="Email28" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="Email29" runat="server" class="ks-input" maxlength="1" data-index="3"/>
                                <asp:TextBox id="Email30" runat="server" class="ks-input" maxlength="1" data-index="3"/>
                                <asp:TextBox id="Email31" runat="server" class="ks-input" maxlength="1" data-index="3"/>
                                <br />
                                <asp:TextBox id="Email32" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="Email33" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="Email34" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="Email35" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="Email36" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="Email37" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="Email38" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="Email39" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="Email40" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="Email41" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="Email42" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="Email43" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="Email44" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="Email45" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="Email46" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="Email47" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="Email48" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="Email49" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="Email50" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="Email51" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="Email52" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="Email53" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="Email54" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="Email55" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="Email56" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="Email57" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="Email58" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="Email59" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="Email60" runat="server" class="ks-input" maxlength="1" data-index="3"/>
                                <asp:TextBox id="Email61" runat="server" class="ks-input" maxlength="1" data-index="3"/>
                                <asp:TextBox id="Email62" runat="server" class="ks-input" maxlength="1" data-index="3"/>
                                </asp:Panel>
						</div>
					</div>
					<div class="rel">
						<span class="kiwisaver--col1-text w font-size11 position-absolute line-height-2 top58 left134">If you give an email address you may receive KiwiSaver information by email</span>
					</div>
					
					<!--------SECTION C-------------------------------->
					<div class="kiwisaver-dec--section rel margin-top105">
						<div class="kiwisaver--element1"></div>
						<span class="element1--text"><strong>Section C</strong></span>
						<span class="st-el1 st-el1--text">Contributions</span>

					</div>
					<div class="mt w rel">
						<div class="kiwisaver--col1">
							<span class="kiwisaver--col1-text">8. Choose a contribution rate:</span> 
						</div>
						<div  class="di">
							<div class="checkbox"  id="ch9">
                                <asp:CheckBox ID="CheckBox9" runat="server"/>
                                <label for ="<%= CheckBox9.ClientID %>">
                                    <div class="kiwisaver--line-left"></div>
								    <div class="kiwisaver--line-right"></div>
                                </label>
                            </div>
							<span class="kiwisaver--ml34 fsw">3%</span> 
						</div>
						<div  class="di">
							<div class="checkbox"  id="ch10">
                                <asp:CheckBox ID="CheckBox10" runat="server"/>
                                <label for ="<%= CheckBox10.ClientID %>">
                                    <div class="kiwisaver--line-left"></div>
								    <div class="kiwisaver--line-right"></div>
                                </label>
                            </div>
							<span class="kiwisaver--ml34 fsw">4%</span> 
						</div>	
						<div  class="di">
							<div class="checkbox"  id="ch11">
                                <asp:CheckBox ID="CheckBox11" runat="server"/>
                                <label for ="<%= CheckBox11.ClientID %>">
                                    <div class="kiwisaver--line-left"></div>
								    <div class="kiwisaver--line-right"></div>
                                </label>
                            </div>
							<span class="kiwisaver--ml34 fsw">8%</span> 
						</div>
						<div class="kiwisaver--col1-text w kiwisaver-mar-l12 line-height-2">
							You can only choose 3%, 4% or 8%. If you don't choose a rate, the default rate of 3% will be deducted.
						</div>
					</div>
					<div class="mt w height10">
						<div class="kiwisaver--col1 w rel">

							<span class="kiwisaver--col1-text">9. I declare that the information I have provided on this form is true and correct.</span> 
						    <div class="kiwisaver--col1-text signatureDiv" style="height:16rem">
                                <span class="position-absolute margin-left14">Signature</span>
                               
                                <asp:Image id="SignatureImg" runat="server"
                               AlternateText="No signature image"
                               ImageAlign="left"
                                CssClass="img-signature "
                                ImageSrc=""
                               />

                            </div>
                            <div class="position-absolute top4 left80 ">
                                <span class="kiwisaver--col1-text">Date</span>
                                <asp:TextBox ID="TextBox13" runat="server" class="datepicker kiwisaver-date"/>
                            </div>
                        </div>
					</div>
					<div class="kiwisaver-dec--section w position-absolute bottom05">
					<span class="kiwisaver--col1-text">Please give this completed form to your employer</span>
					</div>
				</div>
			</section>
	    </div> 
        </div>
        <div class="center ppd">
            <asp:Button Class="button btn" ID="buttonConvertToPdf" runat="server" Text="Submit" OnClick="buttonConvertCurrentPageToPdf_Click" />
        </div>
   
    <script src="js/onlineDocuments.js"></script>
    <script>$("#kiwisaverdeductionform").addClass("active");
        $('.datepicker').datepicker({ dateFormat: "dd/mm/yy" });
        $('#ui-datepicker-div').css('display', 'none');
        $('.datepicker').datepicker("setDate", new Date());
    </script>
</asp:Content>

