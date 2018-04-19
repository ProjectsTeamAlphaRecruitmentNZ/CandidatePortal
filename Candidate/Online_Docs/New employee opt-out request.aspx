<%@ Page Language="VB" MasterPageFile="ODocs.master" AutoEventWireup="false" CodeFile="New employee opt-out request.aspx.vb" Inherits="New_employee_opt_out_request" %>
<%@ MasterType VirtualPath="~/Online_Docs/ODocs.master" %>
<%@ Reference VirtualPath="~/Portal.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
      New employee opt-out request
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/style-online-docs.css">
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
       <div id="kiwisaver-form">	
          <div id="printableArea">
			<section class="kiwisaver--header">
				<img src="../img/ir-logo-black.png"  alt="logo" style="width:250px;">
				<div class="center">
					<h3></h3> 
				</div>
				<div class="kiwisaver--info">
					<img src="../img/ks.png" alt="ks" style="width:200px;">
					<img src="../img/ks10-0509.jpg" alt="ks10" id="ks20509" style="width:170px;">
					<label class="kiwisaver-act">KiwiSaver Act 2006</label>
				</div>
				<div class="kiwisaver-code"><strong>KS10</strong><p class="act-subtitle-font">March 2017</p></div>
			</section>
			<section class="ppd">
				<div class="mb2 new-margin">
						<h2 class="kiwisaver-title">Opt-out request </h2>
                </div>
				<div class="kiwisaver--background-container">
					<div class="kiwisaver--explanation">
						Use this form to opt out if you have been automatically enrolled, are a minor who was incorrectly enrolled, and you don't want to be a member of KiwiSaver. Or go to <span class="font-weight-800">www.kiwisaver.govt.nz</span>  to complete our online form. <span class="font-weight-800">Please read the notes on the back to help you fill in this form.</span>
					</div>					
					<!---section a--->
					<div class="kiwisaver-dec--section rel">
						<div class="kiwisaver--element1"></div>
						<span class="element1--text"><strong>Section A</strong></span>
						<span class="st-el1"><span class="st-el1--text">Personal details</span> Please use</span><div class="margin-left-05 display-inline position-absolute"><img src="../img/blockletters.jpg" alt="BLOCK"></div>
					</div>
					<!----IRD---->
					<div class="mt w margin-bottom-5">
						<div class="kiwisaver--col1">
								<span class="kiwisaver--col1-text">3. Your IRD number</span>
								
						</div>
						<div class="kiwisaver-input-field">
                            <asp:TextBox id="IRD1" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="IRD2" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="IRD3" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="IRD4" runat="server" class="ks-input" maxlength="1" data-index="5" style="margin-left:0.2rem !important;"/>
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
					<!----name--->
					<div class="mt w ohs margin-top-3rem">
						<div class="kiwisaver--col1">
							<span class="kiwisaver--col1-text">2. Your name</span> 
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
								<div class="checkbox" id="ch6">
                                    <asp:CheckBox ID="CheckBox6" runat="server"/>
                                    <label for ="<%= CheckBox6.ClientID %>">
                                        <div class="kiwisaver--line-left"></div>
								        <div class="kiwisaver--line-right"></div>
                                    </label>
                                </div>
								<span class="kiwisaver--ml34 fsw">Mrs</span> 
							</div>
							<div class="di">
								<div class="checkbox" id="ch7">
                                    <asp:CheckBox ID="CheckBox7" runat="server"/>
                                    <label for ="<%= CheckBox7.ClientID %>">
                                        <div class="kiwisaver--line-left"></div>
								        <div class="kiwisaver--line-right"></div>
                                    </label>
                                </div>
								<span class="kiwisaver--ml34 fsw">Miss</span> 
							</div>
							<div class="di">
								<div class="checkbox" id="ch8">
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
								<div id="other-title">
                                    <asp:TextBox id="Other1" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="Other2" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="Other3" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="Other4" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="Other5" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="Other6" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="Other7" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="Other8" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="Other9" runat="server" class="ks-input" maxlength="1" data-index="10"/>
									<%--<asp:TextBox ID="TextBox2" runat="server" class="kiwisaver-input ks1" maxlength="9" data-index="3"/>--%>
								</div>
							</div>
							<div class="margin-top-08"><span class="kiwisaver--col1-text font-size11 line-height-2">Put a dash to indicate your title</span></div>
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
							<asp:TextBox id="FN37" runat="server" class="ks-input" maxlength="1" data-index="10"/>
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
							<span class="kiwisaver--col1-text">3. Your postal<span class="new-line">address </span></span> 
						</div>
						<div class="margin-left16 position-absolute left13">
                            <asp:TextBox id="Street1" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="Street2" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="Street3" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="Street4" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="Street5" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="Street6" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<%--<asp:TextBox ID="TextBox5" runat="server" class="kiwisaver-input width120" maxlength="6" data-index="6"/>--%>
						</div>
					</div>
					<div class="rel">
						<span class="kiwisaver--col1-text w font-size11 position-absolute line-height-2 top25  left134">Street number</span>
					</div>
					<div class="margin-left16 position-absolute left27">
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
						<%--<asp:TextBox ID="TextBox6" runat="server" class="kiwisaver-input width340" maxlength="17" data-index="7"/>--%>
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
					</div>
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
							<span class="kiwisaver--col1-text">4. Your contact <span class="new-line"> numbers</span> </span> 
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
							<span class="kiwisaver--col1-text">5. Your email <span class="new-line">address</span> </span> 
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
							<asp:TextBox id="Email30" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="Email31" runat="server" class="ks-input" maxlength="1" data-index="5"/>
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
					<!---bank account--->
					<div class="mt w margin-top105">
						<div class="kiwisaver--col1">
							<span class="kiwisaver--col1-text">6. Bank account <span class="new-line">details</span></span> 
						</div>
						<div class="margin-left16 position-absolute left13">
                            <asp:TextBox id="Bank1" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="Bank2" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="Bank3" runat="server" class="ks-input" maxlength="1" data-index="4" style="margin-left:0.2rem !important;"/>
							<asp:TextBox id="Bank4" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="Bank5" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="Bank6" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="Bank7" runat="server" class="ks-input" maxlength="1" data-index="8" style="margin-left:0.2rem !important;"/>
							<asp:TextBox id="Bank8" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="Bank9" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="Bank10" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="Bank11" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="Bank12" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="Bank13" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="Bank14" runat="server" class="ks-input" maxlength="1" data-index="10" style="margin-left:0.2rem !important;"/>
                            <asp:TextBox id="Bank15" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="Bank16" runat="server" class="ks-input" maxlength="1" data-index="10"/>
							<%--<asp:TextBox ID="TextBox13" runat="server" class="kiwisaver-input" maxlength="16" data-index="14" Width="314"/>--%>
						</div>
					</div>
					<div class="rel kiwisaver--col1-text w font-size11 line-height-2 top25">
						<div class="position-absolute left134">
                            <span class="margin-left-05">Bank</span>
                            <span class="margin-left35">Branch</span>
                            <span class="margin-left6">Account number</span>
                            <span class="margin-left45">Suffix</span>
						</div>
					</div>
					<div class="mt w floatLeft">
						<div class="margin-left16 position-absolute left13 ">
                            <asp:TextBox id="AccName1" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="AccName2" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="AccName3" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="AccName4" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="AccName5" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="AccName6" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="AccName7" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="AccName8" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="AccName9" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="AccName10" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="AccName11" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="AccName12" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="AccName13" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="AccName14" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="AccName15" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="AccName16" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="AccName17" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="AccName18" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="AccName19" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="AccName20" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="AccName21" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="AccName22" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="AccName23" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="AccName24" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="AccName25" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="AccName26" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="AccName27" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="AccName28" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="AccName29" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="AccName30" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="AccName31" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<%--<asp:TextBox ID="TextBox14" runat="server" class="kiwisaver-input width83" maxlength="20" data-index="15" Style="margin-left:1rem!important"/>--%>
						</div>
					</div>
					<div class="rel">
						<span class="kiwisaver--col1-text w left134 line-height-2 position-absolute font-size11 top71">Name of account holder</span>
					</div>
					<!---opt-out signature--->
					<div class="mt w floatLeft margin-top8">
						<div class="kiwisaver--col1">
							<span class="kiwisaver--col1-text">7. I wish to opt out <span class="new-line">of KiwiSaver</span></span> 
						</div>
						<div class="position-absolute right-5rem">
							 <span class="kiwisaver--col1-text">Date</span>
                             <asp:TextBox ID="TextBox15" runat="server" class="datepicker kiwisaver-date"/>
						</div>
                        <div class="signatureDiv ">
                            <span class="position-absolute ">Signature</span>
                            <asp:Image id="SignatureImg" runat="server"
                               AlternateText="No signature image"
                               ImageAlign="left"
                                CssClass="img-signature margin-top-35"
                                ImageSrc=""
                               />
                        </div>
					</div>
					<!--------SECTION B------------------------------->
					<div class="kiwisaver-dec--section rel floatLeft">
						<div class="kiwisaver--element1"></div>
						<span class="element1--text"><strong>Section B</strong></span>
						<span class="st-el1"><span class="st-el1--text">Employment details</span> Please use</span>
						<div class="display-inline position-absolute margin-left-05"><img src="../img/blockletters.jpg" alt="block"/></div>
					</div>
					<!--employment ird--->
					<div class="mt w floatLeft margin-bottom-1rem">
						<div class="kiwisaver--col1">
							<span class="kiwisaver--col1-text">8. Employer's IRD <span class="new-line">number</span></span> 	
						</div>
						<div class="sec-6">
                            <asp:TextBox id="EmpIRD1" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="EmpIRD2" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="EmpIRD3" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="EmpIRD4" runat="server" class="ks-input" maxlength="1" data-index="5" style="margin-left:0.2rem !important;"/>
							<asp:TextBox id="EmpIRD5" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="EmpIRD6" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="EmpIRD7" runat="server" class="ks-input" maxlength="1" data-index="8" style="margin-left:0.2rem !important;"/>
							<asp:TextBox id="EmpIRD8" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="EmpIRD9" runat="server" class="ks-input" maxlength="1" data-index="10"/>
							 <%--<asp:TextBox ID="TextBox16" runat="server" class="kiwisaver-input" maxlength="9" data-index="16"/>--%>
						</div>
						<div class="display-inline margin-left15">
							<span class="kiwisaver--col1-text margin-top05rem">If you don't have your employer's IRD number ask them for it.</span>
						</div>
					</div>
					<!-----Employers business name -->
					<div class="mt w floatLeft margin-bottom-3rem">
						<div class="kiwisaver--col1">
								<span class="kiwisaver--col1-text">9. Employer's <span class="new-line">business name</span></span> 
						</div>
						<div class="sec-6 width83">
                            <asp:TextBox id="BusinessName1" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="BusinessName2" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="BusinessName3" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="BusinessName4" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="BusinessName5" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="BusinessName6" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="BusinessName7" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="BusinessName8" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="BusinessName9" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="BusinessName10" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="BusinessName11" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="BusinessName12" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="BusinessName13" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="BusinessName14" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="BusinessName15" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="BusinessName16" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="BusinessName17" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="BusinessName18" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="BusinessName19" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="BusinessName20" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="BusinessName21" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="BusinessName22" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="BusinessName23" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="BusinessName24" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="BusinessName25" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="BusinessName26" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="BusinessName27" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="BusinessName28" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="BusinessName29" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="BusinessName30" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="BusinessName31" runat="server" class="ks-input" maxlength="1" data-index="5"/>
                            <br />
                            <asp:TextBox id="BusinessName32" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="BusinessName33" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="BusinessName34" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="BusinessName35" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="BusinessName36" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="BusinessName37" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="BusinessName38" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="BusinessName39" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="BusinessName40" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="BusinessName41" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="BusinessName42" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="BusinessName43" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="BusinessName44" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="BusinessName45" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="BusinessName46" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="BusinessName47" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="BusinessName48" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="BusinessName49" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="BusinessName50" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="BusinessName51" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="BusinessName52" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="BusinessName53" runat="server" class="ks-input" maxlength="1" data-index="5"/>
							<asp:TextBox id="BusinessName54" runat="server" class="ks-input" maxlength="1" data-index="6"/>
							<asp:TextBox id="BusinessName55" runat="server" class="ks-input" maxlength="1" data-index="7"/>
							<asp:TextBox id="BusinessName56" runat="server" class="ks-input" maxlength="1" data-index="8"/>
							<asp:TextBox id="BusinessName57" runat="server" class="ks-input" maxlength="1" data-index="9"/>
							<asp:TextBox id="BusinessName58" runat="server" class="ks-input" maxlength="1" data-index="10"/>
                            <asp:TextBox id="BusinessName59" runat="server" class="ks-input" maxlength="1" data-index="2"/>
							<asp:TextBox id="BusinessName60" runat="server" class="ks-input" maxlength="1" data-index="3"/>
							<asp:TextBox id="BusinessName61" runat="server" class="ks-input" maxlength="1" data-index="4"/>
							<asp:TextBox id="BusinessName62" runat="server" class="ks-input" maxlength="1" data-index="5"/>
						</div>
					</div>
					<!-----Employers start date -->
					<div class="mt w floatleft margin-bottom-1rem">
						<div class="kiwisaver--col1">
								<span class="kiwisaver--col1-text">10. Employer's <span class="new-line">start date</span></span> 
						</div>
						<div class="sec-6">
                             <asp:TextBox ID="TextBox19" runat="server" class="datepicker kiwisaver-date"/>
						</div>
						<div class="margin-top08">
							<span class="kiwisaver--col1-text margin-left5">Give this form to your employer or send it to Inland Revenue.</span>
						</div>
					</div>
					<!--------SECTION C------------------------------->
					<div class="kiwisaver-dec--section rel floatLeft">
						<div class="kiwisaver--element1"></div>
						<span class="element1--text"><strong>Section C</strong></span>
						<span class="st-el1"><span class="st-el1--text">Late opt-out</span> Please read the notes on the back of this form</span>
						<div class="display-inline position-absolute margin-left-05"><img src="../img/blockletters.jpg" alt="Block"></div>
					</div>
					<!--late opt-out--->
					<div class="mt w rel floatLeft">
						<div>
							<span class="kiwisaver--col1-text w">11. If your request to opt out is more than eight weeks after you started employment, or you are a minor who was incorrectly enrolled, <span class="new-line">please give a reason for your late opt-out request.</span></span> 	
						</div>
						<div>
							 <asp:TextBox ID="TextBox20" runat="server" TextMode="MultiLine" CssClass="margin-left16 width98"/>
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
    <script>$("#newemployeeoptoutrequest").addClass("active");
        $('.datepicker').datepicker({ dateFormat: "dd/mm/yy" });
        $('#ui-datepicker-div').css('display', 'none');
        $('.datepicker').datepicker("setDate", new Date());
    </script>
</asp:Content>

