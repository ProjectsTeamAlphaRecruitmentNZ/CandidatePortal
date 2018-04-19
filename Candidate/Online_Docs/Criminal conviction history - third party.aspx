<%@ Page Language="VB"  MasterPageFile="ODocs.master" AutoEventWireup="false" CodeFile="Criminal conviction history - third party.aspx.vb" Inherits="Criminal_conviction_history___third_party" %>
<%@ MasterType VirtualPath="~/Online_Docs/ODocs.master" %>
<%@ Reference VirtualPath="~/Portal.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Criminal conviction history - third party
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/style-online-docs.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="css/Styles-new-user.css" rel="stylesheet" type="text/css">

    <style>
	.c2{font-size:1.4rem;line-height:2rem;color: black;}
	.c2 p{color:black;}
	.font-bold{font-weight:bold !important;}
	.font-bold2{font-weight:700!important;}
	
	#title--header-doc h2{color:#004288;font-size:3.3rem;line-height:3.3rem;}
	#ministry-of-justice{position:absolute;left:-2rem;top:2rem;border-right:1rem solid white;border-top:1rem solid white;border-bottom:1rem solid white;width:27rem}
	#pos-h2--header-doc{margin-left:35%}
	.color-blue{color:#004288!important;font-weight:600;}
	.color-background{background-color:#004288;}
	.color-white{color:white}
	.margin-both-sides{margin:0 3rem}
	.font--title-doc{position: absolute;padding: 2.5rem 0;margin-left: 3%;font-size: 1.6rem;font-weight: bold;}
	#police-check-info,	#police-check-excl{border-right: 0.5rem solid white;margin-bottom: -0.7rem;}

	.color-background-lb{background-color:#e8f3fb;}

	.padding-1a{padding:0.3rem 1rem}
	.smaller-font{font-size:2.5rem}
	.margin-left-1rem{margin-left:1rem}
	
	.border-bottom-blue{border-bottom:1px solid #004288}
	.shape1 {height: 15px;border-right: 1px solid #004288;-moz-transform: skew(45deg);-webkit-transform: skew(45deg);transform: skew(45deg);position: absolute;top: 4.3rem;left: -0.8rem;}
	.shape {height: 15px;border-right: 1px solid #004288;-moz-transform: skew(45deg);-webkit-transform: skew(45deg);transform: skew(45deg);position: absolute;top: 1.8rem;left: -0.8rem;}
	.color-background-lightgrey{background-color:#ececec;}
	.color-background-blb{background:#008aca}
	.padding-input{padding: 0.4rem 1rem !important;}
	.mt05{margin-top:0.5rem}
	#signature-third-party{position: absolute;top: -1.7rem;right: 0;width: 50rem;}
	.rt{display: inline;width: 50%;float: right;margin-top: -0.7rem;}
	.rt2{width: 83%;margin-top: -3.5rem;}
	.rt3{width: 83%;margin-top:-3rem}
	.mt22{margin-top:2.2rem}
	.page-number{position: absolute;color: #ececec;font-size: 4rem;font-weight: 600;right: -4rem;bottom: 0.1rem;}
	.d2{width: 45%;margin-top: -1rem;}
	.radio-gender{display: inline;width: 3rem;top: 0.6rem;}
	.birthday-cell{width: 3rem;top: 0.5rem;padding: 0.5rem 0 !important;text-align: center;}
	.birthday-cell:focus{border:1px solid lightgrey}
	.bc{margin-left:-0.7rem}
	.border-l, .border-l:focus{border-left: transparent;}
	.border-r, .border-r:focus{border-right: transparent;}
	.m-input{margin: 0.5rem 0.1rem 0 0.1rem!important;}
	
</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <sf:Connection ID="SIFConnection" runat="server"></sf:Connection>
   
    <div id="tax-dec-form" class="page-pdf c2">
        <div id="printableArea">
            <!-------------------------PAGE 1---------------------------------->
            <div class="page1 padding-1">
                <div style="border: 1rem solid #ececec;">
                    <section id="title--header-doc" class="rel">
                        <div id="pos-h2--header-doc" class="mt">
                            <h2>Request for <strong>Criminal Conviction
                                <br>
                                History – Third Party</strong></h2>
                        </div>
                        <img id="ministry-of-justice" src="../img/ministry-of-justice.PNG">
                    </section>
                    <section class="margin-both-sides ohs">
                        <div class="floatLeft w">
                            <span class="color-blue">Confidential when completed</span>
                            <p class="mt05">REQUEST BY THIRD PARTY UNDER THE PRIVACY ACT 1993 FOR A COPY OF AN INDIVIDUAL’S CRIMINAL CONVICTIONS HELD ON THE MINISTRY OF JUSTICE’S COMPUTER SYSTEMS.</p>
                        </div>
                        <div class="floatLeft w color-background mt">
                            <img id="police-check-info" src="../img/police-check-info.PNG">
                            <span class="color-white font--title-doc">How to fill out this form and the definitions used in this form</span>
                        </div>
                        <div class="floatLeft w color-background-lb mt padding-1">
                            <p class="font-bold">1. You will have been provided this form by a third party* to complete</p>
                            <p class="font-bold">2. Complete all the questions from Step 2 on – start with “Your details”</p>
                            <p class="font-bold">3. Please write as neatly as possible</p>
                            <p class="font-bold">4. Send back to the third party for them to check and send off.</p>
                            <p class="mt"><span class="font-bold color-blue">*Third party</span> is the person, potential employer or recruitment agency who has requested the criminal conviction check and will be sent the results. (The third party must complete the front page of this form).</p>
                        </div>
                        <div class="margin-top-3rem floatLeft w border-bottom-blue rel">
                            <div class="shape"></div>
                            <h2 class="smaller-font color-blue"><span>Step 1</span><span class="font-bold2 margin-left-1rem">Third party to complete this section</span></h2>
                        </div>
                        <div class="floatLeft w mt color-background-lightgrey padding-1">
                            <p class="color-blue">Third party name details</p>
                            <p>Full name of third party: </p>
                            <%--<input class="padding-input" readonly="readonly" value="Alpha Recruitment Ltd">--%>
                            <asp:TextBox runat="server" CssClass="padding-input" ID="ThirdParty" ReadOnly="true"></asp:TextBox>
                            <p>Full name of the person or organisation the third party <strong>is acting for</strong> (if applicable): </p>
                            <p>(i.e. the person or organisation who requested the third party to carry out a criminal conviction check).</p>
                            <asp:TextBox runat="server" CssClass="padding-input" ID="ThirdPartyPerson" ReadOnly="true"></asp:TextBox>
                            <%--<input class="padding-input" readonly="readonly" value="Alpha Recruitment Ltd">--%>
                            <p>Third party reference number (if applicable):</p>
                            <asp:TextBox runat="server" CssClass="padding-input" ID="RefNumber" ReadOnly="False"></asp:TextBox>
                            <%--<input class="padding-input">--%>
                        </div>
                        <div class="mt w floatLeft"></div>
                        <div class="floatLeft w mt color-background-lightgrey padding-1">
                            <p class="color-blue font-bold">Third party return address details</p>
                            <p>Name of the person to return request information to:
                                <asp:TextBox runat="server"  CssClass="padding-input rt "  ID="PersonName" ReadOnly="true"></asp:TextBox></p>
                            <p class="mt">PO Box or <span style="display: block; ">Street Address: 
                                <asp:TextBox runat="server" Style="bottom: 1rem" CssClass="padding-input rt rt2"  ID="Address" ReadOnly="true"></asp:TextBox>
                                <%--<input  style="bottom: 1rem" class="padding-input rt rt2" readonly="readonly" value="PO Box 99256">--%>

                                                    </span></p>
                            
                            <p class="mt22">Suburb: <asp:TextBox runat="server" CssClass="padding-input rt rt3" style="bottom: 1rem" ReadOnly="true" ID="OrgSuburb"></asp:TextBox></p>
                            
                            <p class="mt22">Town/City: <asp:TextBox  runat="server" CssClass="padding-input rt rt3" style="bottom: 1rem" ReadOnly="true" id="OrgCity"></asp:TextBox></p>
                            
                            <p class="mt22">State/Province: <input runat="server" style="bottom: 1rem" class="padding-input rt rt3" ></p>
                            
                            <div class="w floatLeft" style="display: inline;">
                                <div class="sm-1of2 floatLeft">
                                    <span>Post Code: <asp:TextBox  runat="server" ID="OrgPostCode" CssClass="padding-input" ReadOnly="true" style="width: 50%; margin-left: 4.2rem; bottom: 0.5rem;" ></asp:TextBox></span>
                                    
                                </div>
                                <div class="sm-1of2 fr rel">
                                    <span style="">Country: <asp:TextBox  runat="server" ID="OrgCountry" CssClass="padding-input" ReadOnly="true" style="width: 75%; float: right; bottom: 0.5rem"></asp:TextBox></span>
                                    
                                </div>
                            </div>
                            <div class="rel mt w floatLeft" style="min-height: 60px">
                                Signature of third party:
					
                                <img id="signature-third-party" src="../img/signature.JPG">
                            </div>
                        </div>
                        <div class="fr">
                            <img src="../img/office-use.JPG">
                        </div>
                        <div class="w floatLeft rel" style="/*margin-top: 2rem;*/">
                            <span style="font-size: 1.1rem; position: absolute; left: 0">Criminal Conviction Record – Third Party / May 2014</span>
                            <span class="page-number">1</span>
                        </div>
                    </section>
                </div>
            </div>
            <div class="hide-pdf" style="height:0rem; background: #EDF1F5; page-break-after: always;"></div>
            <!-------------------------PAGE 2---------------------------------->
            <div class="page2 padding-1">
                <div style="border: 1rem solid #ececec;">
                    <section class="margin-both-sides ohs">
                        <div class="margin-top-3rem floatLeft w"></div>
                        <div class="margin-top-3rem floatLeft w border-bottom-blue rel">
                            <div class="shape"></div>
                            <h2 class="smaller-font color-blue"><span>Step 2</span><span class="font-bold2 margin-left-1rem">Your details</span> <span style="font-size: 1.6rem; font-weight: 600; line-height: 1rem;">(please print)</span></h2>
                        </div>
                        <div class="floatLeft w color-background-blb mt">
                            <img id="police-check-excl" src="../img/exclamation-police-request.jpg">
                            <span class="color-white font--title-doc d2">Important: make sure the name and date of birth you write in here matches<br>
                                your identification in Step 3</span>
                        </div>
                        <div class="floatLeft w color-background-lb mt padding-1">
                            <p class="font-bold color-blue">Your Personal Details</p>
                            <div class="w floatLeft">
                                <div class="sm-1of2 floatLeft" style="width: 53%;">
                                    <span>Surname:</span>
                                    <asp:TextBox runat="server" Style="width: 80%; bottom: 0.5rem" CssClass="padding-input"  ID="LastName" ReadOnly="true"></asp:TextBox>
                                    <%--<input class="padding-input" data-index="1" style="width: 80%; bottom: 0.5rem">--%>
                                </div>
                                <div class="sm-1of2 fr" style="width: 44%;">
                                    <span>First name:</span>
                                    <asp:TextBox runat="server" Style="width: 74%; bottom: 0.5rem" CssClass="padding-input"  ID="FirstName" ReadOnly="true"></asp:TextBox>
                                    <%--<input class="padding-input" data-index="2" style="width: 74%; bottom: 0.5rem">--%>
                                </div>
                            </div>
                            <div class="w floatLeft">
                                <span>Middle names (separated by commas):</span>
                                <asp:TextBox runat="server" Style="width: 60%; float: right;  bottom: 0.5rem" CssClass="padding-input"  ID="MiddleName" ></asp:TextBox>
                                <%--<input class="padding-input" data-index="3" style="width: 60%; float: right;  bottom: 0.5rem">--%>
                            </div>
                            <div class="w floatLeft" style="/*margin-top: -3rem*/">
                                <div class="sm-1of2 floatLeft" ">
                                    <span>Date of birth:</span>
                                    
                                    <input runat="server" class="padding-input birthday-cell border-r"  data-index="4" maxlength="1" placeholder="D" runat="server" id="D1">
                                    <input runat="server" class="padding-input birthday-cell border-l bc" data-index="5" maxlength="1" placeholder="D" runat="server" id="D2">
                                    <input runat="server" class="padding-input birthday-cell border-r" data-index="6" maxlength="1" placeholder="M" runat="server" id="M1">
                                    <input runat="server" class="padding-input birthday-cell border-l bc" data-index="7" maxlength="1" placeholder="M" runat="server" id="M2">
                                    <input runat="server" class="padding-input birthday-cell border-r" data-index="8" maxlength="1" placeholder="Y" runat="server" id="Y1" />
                                    <input runat="server" class="padding-input birthday-cell border-r border-l bc" data-index="9" maxlength="1" placeholder="Y" runat="server" id="Y2">
                                    <input runat="server" class="padding-input birthday-cell border-r border-l bc" data-index="10" maxlength="1" placeholder="Y" runat="server" id="Y3">
                                    <input runat="server" class="padding-input birthday-cell border-l bc" data-index="11" maxlength="1" placeholder="Y" runat="server" id="Y4">
                                        
                                </div>
                                <div class="sm-1of2 fr" style="padding-left: 3.8rem; /*margin-top: 1rem;*/">
                                    <span>Male</span>
                                    <input class="radio-gender" name="gender" type="radio" runat="server" id="Male" />
                                    <span>Female</span>
                                    <input class="radio-gender" name="gender" type="radio" runat="server" id="Female"/>
                                </div>
                            </div>
                            <div class="w floatLeft" style="margin-top:0.5rem;">
                                <span>Place of birth:</span>
                                <asp:TextBox runat="server" Style="width: 85%; float: right;  bottom: 0.5rem" CssClass="padding-input"  ID="POB" ReadOnly="true"></asp:TextBox>
                                <%--<input class="padding-input" data-index="12" style="width: 85%; float: right;  bottom: 0.5rem" runat="server" id="POB">--%>
                            </div>
                            <div class="w floatLeft" style="/*margin-top: -3rem*/">
                                <div class="sm-1of2 floatLeft">
                                    <span>Telephone:</span>
                                    <asp:TextBox runat="server" Style="width: 74%;bottom: 0.5rem" CssClass="padding-input"  ID="LandLine" ></asp:TextBox>
                                    <%--<input class="padding-input" data-index="13" style="width: 74%;  bottom: 0.5rem">--%>
                                </div>
                                <div class="sm-1of2 fr">
                                    <span>Mobile:</span>
                                    <asp:TextBox runat="server" Style="width: 84%;bottom: 0.5rem" CssClass="padding-input"  ID="Mobile" ></asp:TextBox>
                                    <%--<input class="padding-input" data-index="14" style="width: 84%;  bottom: 0.5rem">--%>
                                </div>
                            </div>
                            <div class="w floatLeft">
                                <span>Email:</span>
                                <asp:TextBox runat="server" Style="width:92%; float: right; bottom: 1rem" CssClass="padding-input"  ID="Email" ></asp:TextBox>
                                <%--<input class="padding-input" data-index="15" style="width: 92%; float: right;  bottom: 1rem">--%>
                            </div>
                            <span class="w floatLeft mt"><strong>Previous names – Maiden names, other names you are known as, or have used</strong></span>
                            <div class="mt floatLeft w"></div>
                            <div class="w floatLeft mt">
                                <div style="width: 30%; float: left; margin-right: 1rem;">
                                    <span>Surname</span>
                                    <input runat="server" class="padding-input m-input" data-index="16">
                                    <input runat="server" class="padding-input m-input" data-index="19">
                                    <input runat="server" class="padding-input m-input" data-index="22">
                                    <input runat="server" class="padding-input m-input" data-index="25">
                                    <input runat="server" class="padding-input m-input" data-index="28">
                                </div>
                                <div style="width: 30%; float: left; margin-right: 1rem;">
                                    <span>First name</span>
                                    <input runat="server" class="padding-input m-input" data-index="17">
                                    <input runat="server" class="padding-input m-input" data-index="20">
                                    <input runat="server" class="padding-input m-input" data-index="23">
                                    <input runat="server" class="padding-input m-input" data-index="26">
                                    <input runat="server" class="padding-input m-input" data-index="29">
                                </div>
                                <div style="width: 36%; float: left;">
                                    <span>Middle names (separated by commas)</span>
                                    <input runat="server" class="padding-input m-input" data-index="18">
                                    <input runat="server" class="padding-input m-input" data-index="21">
                                    <input runat="server" class="padding-input m-input" data-index="24">
                                    <input runat="server" class="padding-input m-input" data-index="27">
                                    <input runat="server" class="padding-input m-input" data-index="30">
                                </div>
                            </div>
                        </div>
                        <div class="floatLeft w mt"></div>
                        <div class="floatLeft w color-background-lb mt padding-1">
                            <p class="font-bold color-blue">Your Postal Address</p>
                            <p class="mt">PO Box or <span style="display: block; margin-top: -0.5rem;">Street Address: 
                                <asp:TextBox runat="server" Style="bottom: 1rem" CssClass="padding-input rt rt2"  ID="CandAddress" ></asp:TextBox>
                                <%--<input class="padding-input rt rt2" style="bottom: 1rem;" data-index="31">--%>

                                                    </span></p>
                            
                            <div style="margin-top: -0.7rem;">
                                <p class="mt22">Suburb: 
                                    <%--<input class="padding-input rt rt3" style="bottom: 3rem;" data-index="32">--%>
                                    <asp:TextBox runat="server" Style="bottom: 3rem" CssClass="padding-input rt rt3"  ID="CandSuburb" ></asp:TextBox>
                                </p>
                                
                            </div>
                            <div style="margin-top: -0.7rem;">
                                <p class="mt22">Town/City: 
                                    <%--<input class="padding-input rt rt3" style="bottom: 3rem;" data-index="33">--%>
                                    <asp:TextBox runat="server" Style="bottom: 3rem" CssClass="padding-input rt rt3"  ID="CandCity" ></asp:TextBox>
                                </p>
                                
                            </div>
                            <div style="margin-top: -0.7rem;">
                                <p class="mt22">State/Province: 
                                    <%--<input class="padding-input rt rt3" style="bottom: 3rem;" data-index="34">--%>
                                    <asp:TextBox runat="server" Style="bottom: 3rem" CssClass="padding-input rt rt3"  ID="CandState" ></asp:TextBox>
                                </p>                                
                            </div>
                            <div class="w floatLeft" style="display: inline; ">
                                <div class="sm-1of2 floatLeft" style="width: 40%">
                                    <span>Post Code: 
                                        <%--<input class="padding-input" data-index="35"  style="width: 50%; margin-left: 4.2rem; top: 0.5rem;">--%>
                                        <asp:TextBox runat="server" Style="width: 50%; margin-left: 4.2rem; top: 0.5rem;" CssClass="padding-input"  ID="CandPostCode" ></asp:TextBox>
                                    </span>                                   
                                </div>
                                <div class="sm-1of2 fr rel" style="width: 60%">
                                    <span style="margin-top: 1.4rem; position: absolute;">Country:</span>
                                    <asp:TextBox runat="server" Style="width: 84%; float: right; top: 0.5rem" CssClass="padding-input "  ID="CandCountry" ></asp:TextBox>
                                    <%--<input class="padding-input" data-index="36" style="width: 84%; float: right; top: 0.5rem">--%>
                                </div>
                            </div>
                            <span class="w floatLeft margin-top-3rem"><strong>Current residential address if different to postal address</strong></span>
                            <div class="mt22 w floatLeft"></div>
                            <div style="margin-top: 15rem;">
                                <p class="mt22">Street address: <input runat="server" class="padding-input rt rt3" style="bottom: 1rem;"  data-index="37"></p>                           
                            </div>
                            <div style="margin-top: -0.7rem;">
                                <p class="mt22">Suburb: <input runat="server" class="padding-input rt rt3" style="bottom: 3rem;" data-index="38"></p>
                                
                            </div>
                            <div style="margin-top: -0.7rem;">
                                <p class="mt22">Town/City: <input runat="server" class="padding-input rt rt3" style="bottom: 3rem;" data-index="39"></p>
                                
                            </div>
                            <div style="margin-top: -0.7rem;">
                                <p class="mt22">State/Province:<input runat="server" class="padding-input rt rt3" style="bottom: 3rem;" data-index="40"></p>
                                
                            </div>
                            <div class="w floatLeft" style="display: inline; margin-top: -2.5rem;">
                                <div class="sm-1of2 floatLeft" style="width: 40%">
                                    <span>Post Code:<input runat="server" class="padding-input" data-index="41" style="width: 50%; margin-left: 4.2rem; bottom: 0.5rem;"></span>
                                    
                                </div>
                                <div class="sm-1of2 fr rel" style="width: 60%">
                                    <span style="margin-top: 1.4rem; position: absolute;">Country:</span>
                                    <input runat="server" class="padding-input" data-index="42" style="width: 84%; float: right; bottom: 0.5rem">
                                </div>
                            </div>
                        </div>
                        <div class="w floatLeft rel" style="margin-top: 6rem;">
                            <span style="font-size: 1.1rem; position: absolute; bottom: 0; left: 0; top: 0.2rem;">Criminal Conviction Record – Third Party / May 2014</span>
                            <span class="page-number">2</span>
                        </div>
                    </section>
                </div>
            </div>
            <div class="hide-pdf" style="height: 0rem; background: #EDF1F5; /*margin-top: -29rem;*/ page-break-after: always;"></div>

            <!-------------------------PAGE 3---------------------------------->
            <div class="page3 padding-1">
                <div style="border: 1rem solid #ececec;">
                    <section class="margin-both-sides ohs">
                        <div class="floatLeft w mt"></div>
                        <div class="floatLeft w color-background-lb mt padding-1" style="padding-bottom: 0">
                            <p class="font-bold">Please list any other New Zealand addresses you have lived at in the last 10 years</p>

                            <div>
                                <p class="mt22">Street address:<input runat="server" class="padding-input rt rt3" style="bottom:1rem;" data-index="43"></p>
                                
                            </div>
                            <div style="margin-top: -0.7rem;">
                                <p class="mt22">Suburb:<input runat="server" class="padding-input rt rt3" style="bottom:3rem;" data-index="44"></p>
                                
                            </div>
                            <div class="w floatLeft" style="display: inline; margin-top: -2.5rem;">
                                <div class="sm-1of2 floatLeft" style="width: 70%;">
                                    <span>Town/City: <input runat="server" class="padding-input" data-index="45" style="width: 70%; bottom: 0.5rem; margin-left: 4.8rem;"></span>
                                   
                                </div>
                                <div class="sm-1of2 fr rel" style="width: 30%;">
                                    <span style="margin-top: 1.4rem; position: absolute;">Post Code:</span>
                                    <input runat="server" class="padding-input" data-index="46" style="width: 50%; float: right; bottom: 0.5rem;">
                                </div>
                            </div>
                        </div>
                        <div class="floatLeft w color-background-lb mt padding-1" style="padding-bottom: 0">
                            <p class="mt22">Street address: <input runat="server" class="padding-input rt rt3"  style="bottom:1rem;"  data-index="47"></p>
                            
                            <div style="margin-top: -0.7rem;">
                                <p class="mt22">Suburb: <input runat="server" class="padding-input rt rt3"  style="bottom:3rem;"  data-index="48"></p>
                                
                            </div>
                            <div class="w floatLeft" style="display: inline; margin-top: -2.5rem;">
                                <div class="sm-1of2 floatLeft" style="width: 70%;">
                                    <span>Town/City: <input runat="server" class="padding-input" data-index="49" style="width: 70%; bottom: 0.5rem; margin-left: 4.8rem;"></span>
                                   
                                </div>
                                <div class="sm-1of2 fr rel" style="width: 30%;">
                                    <span style="margin-top: 1.4rem; position: absolute;">Post Code:</span>
                                    <input runat="server" class="padding-input" data-index="50" style="width: 50%; float: right; bottom: 0.5rem;">
                                </div>
                            </div>
                        </div>
                        <div class="floatLeft w color-background-lb mt padding-1" style="padding-bottom: 0">
                            <p class="mt22">Street address:  <input runat="server" class="padding-input rt rt3" style="bottom:1rem;" data-index="51"></p>
                           
                            <div style="margin-top: -0.7rem;">
                                <p class="mt22">Suburb: <input runat="server" class="padding-input rt rt3"  style="bottom:3rem;" data-index="52"></p>
                                
                            </div>
                            <div class="w floatLeft" style="display: inline; margin-top: -2.5rem;">
                                <div class="sm-1of2 floatLeft" style="width: 70%;">
                                    <span>Town/City:  <input runat="server" class="padding-input" data-index="53" style="width: 70%; bottom: 0.5rem; margin-left: 4.8rem;"></span>
                                   
                                </div>
                                <div class="sm-1of2 fr rel" style="width: 30%;">
                                    <span style="margin-top: 1.4rem; position: absolute;">Post Code:</span>
                                    <input runat="server" class="padding-input" data-index="54" style="width: 50%; float: right; bottom: 0.5rem;">
                                </div>
                            </div>
                        </div>
                        <!--Your identification--->
                        <div class="margin-top-3rem floatLeft w border-bottom-blue rel">
                            <div class="shape"></div>
                            <h2 class="smaller-font color-blue"><span>Step 3</span><span class="font-bold2 margin-left-1rem">Your identification</span></h2>
                        </div>
                        <div class="floatLeft w color-background-blb mt">
                            <img id="police-check-excl" src="../img/paper-clip.jpg">
                            <span class="color-white font--title-doc d2">Please attach a legible photocopy of your identification which must contain your signature. <u>This can be any one of the following:</u></span>
                        </div>
                        <div class="w floatLeft">
                            <div class="floatLeft w color-background-lb mt padding-1">
                                <div class="floatLeft" style="width: 3rem">
                                    <input type="checkbox" runat="server">
                                </div>
                                <div class="fr" style="width: 95%">
                                    <span><strong>New Zealand Driver Licence </strong>– can be current or expired within the last 2 years, but cannot be cancelled, defaced or a temporary licence.</span>
                                </div>
                            </div>
                        </div>
                        <div class="w floatLeft">
                            <div class="floatLeft w color-background-lb mt padding-1a">
                                <div class="floatLeft" style="width: 3rem">
                                    <input type="checkbox" runat="server">
                                </div>
                                <div class="fr" style="width: 95%">
                                    <span><strong>New Zealand Driver Licence </strong>– can be current or expired within the last 2 years, but cannot be cancelled, defaced or a temporary licence.</span>
                                </div>
                            </div>
                        </div>
                        <div class="w floatLeft">
                            <div class="floatLeft w color-background-lb mt padding-1a">
                                <div class="floatLeft" style="width: 3rem">
                                    <input type="checkbox" runat="server">
                                </div>
                                <div class="fr" style="width: 95%">
                                    <span><strong>New Zealand Passport </strong>–  can be current or expired within the last 2 years, but cannot be cancelled or defaced. Must show your signature.</span>
                                </div>
                            </div>
                        </div>
                        <div class="w floatLeft">
                            <div class="floatLeft w color-background-lb mt padding-1a">
                                <div class="floatLeft" style="width: 3rem">
                                    <input type="checkbox" runat="server">
                                </div>
                                <div class="fr" style="width: 95%">
                                    <span><strong>Overseas Passports </strong>–  must be current and cannot be expired, cancelled or defaced. Must show your signature.</span>
                                </div>
                            </div>
                        </div>
                        <div class="w floatLeft">
                            <div class="floatLeft w color-background-lb mt padding-1a">
                                <div class="floatLeft" style="width: 3rem; margin-top: 1rem; margin-bottom: -1rem;">
                                    <input type="checkbox" runat="server">
                                </div>
                                <div class="fr" style="width: 95%; margin-top: 1rem;">
                                    <span><strong>New Zealand Firearms Licence </strong>–  must be current and cannot be expired or defaced.</span>
                                </div>
                            </div>
                        </div>
                        <div class="w floatLeft">
                            <div class="floatLeft w color-background-lb mt padding-1a">
                                <div class="floatLeft" style="width: 3rem; margin-top: 1rem; margin-bottom: -1rem;">
                                    <input type="checkbox" runat="server">
                                </div>
                                <div class="fr" style="width: 95%; margin-top: 1rem;">
                                    <span>If you do not have any of these forms of identification, you will need to complete Step 5.</span>
                                </div>
                            </div>
                        </div>
                        <!--Your authority-->
                        <div class="margin-top-3rem floatLeft w border-bottom-blue rel">
                            <div class="shape"></div>
                            <h2 class="smaller-font color-blue"><span>Step 4</span><span class="font-bold2 margin-left-1rem">Your authority to release information to a third party</span></h2>
                        </div>
                        <div class="floatLeft w color-background-lb mt padding-1" style="padding-bottom: 0">
                            <span>I authorise the Criminal Records Unit, Ministry of Justice, to release a copy of my criminal convictions, subject to section 7 of the Criminal Records (Clean Slate) Act 2004, to the third party.</span>
                            <p class="font-bold color-blue">Tick the report required</p>
                            <div class="w floatLeft">
                                <div style="display: inline">
                                    <span>Criminal and traffic convictions report </span>
                                    <input runat="server" style=" margin-left: 0.5rem;" type="checkbox">
                                </div>
                                <div style="display: inline; margin-left: 2rem">
                                    <span>Traffic convictions report </span>
                                    <input runat="server" style=" margin-left: 0.5rem;" type="checkbox">
                                </div>
                            </div>
                            <span>I want a copy of the information provided to the third party</span>
                            <div style="display: inline; margin-left: 2rem">
                                <span>Yes</span>
                                <input runat="server" name="copy-of-info" style="display: inline; width: 1rem; " type="radio">
                            </div>
                            <div style="display: inline; margin-left: 2rem">
                                <span>No</span>
                                <input runat="server" name="copy-of-info" style="display: inline; width: 1rem; " type="radio">
                            </div>
                            <div class="w floatLeft">
                                <strong>Your signature:</strong>
                                <div class="display-block" style="height: 100px;">
                                    <div id="tax-dec-c--date-div-left">
                                        <div id="signature-pad" class="m-signature-pad" style="margin-left: 12rem !important; background-color: transparent!important; margin-top: -2.6rem !important; width: 84%;">
                                            <div class="m-signature-pad--body" style="border-color: transparent">
                                                <canvas></canvas>
                                                <div style="border: 2px solid #c00d0d; position: absolute; height: 70px; width: 105%; margin-left: 1.5%; z-index: 0; background-color: #ffffff; margin-left: -2rem; margin-top: -12rem;">
                                                    <img src="../img/sign-cross.JPG" style="">
                                                </div>
                                                <div class="m-signature-pad--footer">
                                                    <button id="clear-signature" class="button clear" data-action="clear" style="top: -29rem; left: 48.5rem; height: 3rem" type="button">x</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="w floatLeft" style="margin-top: -5rem; margin-bottom: -3rem;">
                                <span style="margin-right: 2rem">Date:</span>
                                <input runat="server" class="padding-input birthday-cell border-r" data-index="55" maxlength="1" placeholder="D">
                                <input runat="server" class="padding-input birthday-cell border-l bc" maxlength="1" placeholder="D">
                                <input runat="server" class="padding-input birthday-cell border-r" maxlength="1" placeholder="M">
                                <input runat="server" class="padding-input birthday-cell border-l bc" maxlength="1" placeholder="M">
                                <input runat="server" class="padding-input birthday-cell border-r" maxlength="1" placeholder="Y">
                                <input runat="server" class="padding-input birthday-cell border-r border-l bc" maxlength="1" placeholder="Y">
                                <input runat="server" class="padding-input birthday-cell border-r border-l bc" maxlength="1" placeholder="Y">
                                <input runat="server" class="padding-input birthday-cell border-l bc" maxlength="1" placeholder="Y">
                            </div>
                        </div>

                        <div class="w floatLeft rel" style="margin-top: 1.5rem;">
                            <span style="font-size: 1.1rem; position: absolute; bottom: 0; left: 0; top: 0.2rem;">Criminal Conviction Record – Third Party / May 2014</span>
                            <span class="page-number">3</span>
                        </div>
                    </section>
                </div>
            </div>
            <div class="hide-pdf" style="height: 0rem; background: #EDF1F5;page-break-after: always; "></div>

            <!-------------------------PAGE 4---------------------------------->
            <div class="page4 padding-1">
                <div style="border: 1rem solid #ececec;">
                    <section class="margin-both-sides ohs">
                        <div class="margin-top-3rem floatLeft w"></div>
                        <div class="margin-top-3rem floatLeft w border-bottom-blue rel">
                            <div class="shape"></div>
                            <h2 class="smaller-font color-blue"><span>Step 5</span><span class="font-bold2 margin-left-1rem">Proof of identity</span></h2>
                        </div>
                        <div class="floatLeft w color-blue mt">
                            Only complete if you do not have a driver licence, passport or firearms licence
			
                        </div>
                        <div class="floatLeft w mt color-background-lb padding-1">
                            <span>You will need to ask someone who can confirm your identity to fill in this section. If you are unable to get someone to complete Step 5, then you must complete a statutory declaration. The relevant form can be obtained from your local District Court or go to www.justice.govt.nz/services/criminal-records</span>
                        </div>
                        <div class="floatLeft w mt color-background-lb padding-1">
                            <span><strong>The person who identifies you must:</strong></span>
                            <p>
                                <img height="15" src="../img/tick.JPG" style="margin-right: 0.8rem;">Have known you for more than 12 months</p>
                            <p>
                                <img height="15" src="../img/tick.JPG" style="margin-right: 0.8rem;">Be aged 18 years or over</p>
                            <p>
                                <img height="15" src="../img/tick.JPG" style="margin-right: 0.8rem;">Have a day time phone number and be contactable during normal business hours</p>
                            <p>
                                <%--<img height="12" src="img/cross.JPG" style="margin-right: 0.8rem;">--%><span  style="margin-right: 0.8rem;"><strong>✗</strong></span> Not be a relative (a relative is a person connected by blood or marriage), and</p>
                            <p>
                                <span  style="margin-right: 0.8rem;"><strong>✗</strong></span> Not live at the same address.</p>
                        </div>
                        <!---Identifier to complete---->
                        <div class="floatLeft w color-background-lb mt padding-1">
                            <p class="font-bold color-blue">Identifier to complete</p>
                            <div class="mt">
                                <p class="mt">Identifier's <span style="display: block; margin-top: -0.5rem;">surname: <input runat="server" class="padding-input rt rt2" style="bottom:1.5rem;" data-index="56"></span></p>
                                
                            </div>
                            <div style="margin-top: -0.7rem;">
                                <p class="mt">Identifier's <span style="display: block; margin-top: -0.5rem;">first name: <input runat="server" class="padding-input rt rt2" style="bottom: 3.5rem;" data-index="57"></span></p>
                                
                            </div>
                            <div class="w floatLeft" style="margin-top: -0.7rem;">
                                Identifier’s middle names <i>(separated by commas)</i>:
						
                                <input runat="server" class="padding-input rt" data-index="58" style="width: 53%;bottom:1.5rem;">
                            </div>
                            <div class="w floatLeft" style="margin-top: -0.7rem;">
                                <p>PO Box or <span style="display: block; margin-top: -0.5rem;">Street address:<input runat="server" class="padding-input rt rt2" style="bottom: 1.5rem;" data-index="59"></span></p>
                                
                            </div>
                            <div style="margin-top:10rem;">
                                <p class="mt22">Suburb:<input runat="server" class="padding-input rt rt3" style="bottom: 1.5rem;"  data-index="60"></p>
                                
                            </div>
                            <div style="margin-top: -0.7rem;">
                                <p class="mt22">Town/City:<input runat="server" class="padding-input rt rt3"  style="bottom: 3.5rem;"  data-index="61"></p>
                                
                            </div>
                            <div style="margin-top: -0.7rem;">
                                <p class="mt22">State/Province:<input runat="server" class="padding-input rt rt3" style="bottom: 3.5rem;" data-index="62"></p>
                                
                            </div>
                            <div class="w floatLeft" style="display: inline; margin-top: -2.5rem;">
                                <div class="sm-1of2 floatLeft" style="width: 40%">
                                    <span>Post Code:<input runat="server" class="padding-input" data-index="63" style="width: 50%; margin-left: 4.2rem; top: 0.5rem;"></span>
                                    
                                </div>
                                <div class="sm-1of2 fr rel" style="width: 60%">
                                    <span style="margin-top: 1.4rem; position: absolute;">Country:</span>
                                    <input runat="server" class="padding-input" data-index="64" style="width: 84%; float: right; top: 0.5rem">
                                </div>
                            </div>
                            <div class="w floatLeft" >
                                <div class="sm-1of2 floatLeft" style="width: 60%">
                                    <span>Thelephone:<input runat="server" class="padding-input" data-index="65" style="width: 78%; top: 0.5rem; left: 3.1rem;"></span>
                                    
                                </div>
                                <div class="sm-1of2 fr rel" style="width: 40%">
                                    <span style="position: absolute; top: 1.5rem; left: 5rem;">Mobile:</span>
                                    <input runat="server" class="padding-input" data-index="66" style="width: 60%; top: 0.5rem; float: right">
                                </div>
                            </div>
                            <div style="margin-top: 11rem;">
                                <p class="mt22">Email:<input runat="server" class="padding-input rt rt3" style="bottom: 0.5rem;" data-index="67"></p>
                                
                            </div>
                        </div>
                        <div class="floatLeft w color-background-lb mt padding-1">
                            <span class="w floatLeft"><strong>I declare that I have personally known </strong></span>
                            <div class="mt22 w floatLeft"></div>
                            <div style="margin-top: -0.7rem;">
                                <p class="mt22">Surname:<input runat="server" class="padding-input rt rt3" style="bottom:1rem;" data-index="68"></p>
                                
                            </div>
                            <div style="margin-top: -0.7rem;">
                                <p class="mt22">First name:<input runat="server" class="padding-input rt rt3" style="bottom:3rem;"  data-index="69"></p>
                                
                            </div>
                            <div class="w floatLeft" style="margin-top: -0.7rem;">
                                Middle names <i>(separated by commas)</i>:
						
                                <input runat="server" class="padding-input rt" data-index="70" style="bottom:1rem;width: 63%;">
                            </div>
                            <div class="w floatLeft" style="margin-top: -0.7rem;">
                                <span>For</span>
                                <div style="display: inline">
                                    <input runat="server" class="padding-input" data-index="71" style="width: 4rem; top: 0.5rem;"></div>
                                <span>years and vouch for their identity.</span>
                            </div>
                        </div>
                        <div class="floatLeft w color-background-lb mt padding-1">
                            Signature of the identifier:
						
                            <div class="display-block" style="height: 50px;">
                                <div id="tax-dec-c--date-div-left">
                                    <div id="signature-pad-1" class="m-signature-pad" style="margin-left: 17rem !important; background-color: transparent!important; margin-top: -2.6rem !important; width: 77%;">
                                        <div class="m-signature-pad--body" style="border-color: transparent">
                                            <canvas height="318" style="touch-action: none;" width="533"></canvas>
                                            <div style="border: 2px solid #c00d0d; position: absolute; height: 70px; width: 105%; margin-left: 1.5%; z-index: 0; background-color: #ffffff; margin-left: -2rem; margin-top: -29rem;">
                                                <img src="../img/sign-cross.JPG" style="">
                                            </div>
                                            <div class="m-signature-pad--footer">
                                                <button id="clear-signature-1" class="button clear" data-action="clear" style="top: -28.7rem; left: 43.5rem; height: 3rem" type="button">x</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="w floatLeft rel" style="margin-top: 16.5rem;">
                            <span style="font-size: 1.1rem; position: absolute; bottom: 0; left: 0; top: 0.2rem;">Criminal Conviction Record – Third Party / May 2014</span>
                            <span class="page-number">4</span>
                        </div>
                    </section>
                </div>
            </div>
            <%--<div class="hide-pdf" style="height: 0rem; background: #EDF1F5; page-break-after: always; "></div>--%>

            <!-------------------------PAGE 5---------------------------------->
            <div class="padding-1" style="width: 100%!important; background-color: white; overflow: hidden;">
                <div style="border: 1rem solid #ececec;">
                    <section class="margin-both-sides ohs">
                        <div class="margin-top-3rem floatLeft w"></div>
                        <div class="margin-top-3rem floatLeft w border-bottom-blue rel">
                            <div class="shape"></div>
                            <h2 class="smaller-font color-blue"><span class="font-bold2 margin-left-1rem">Checklist for the third party</span></h2>
                        </div>
                        <div class="floatLeft w mt" style="background-color: #d0d0cf">
                            <img id="police-check-info" src="../img/tick-police-request.jpg">
                            <span class="color-blue font--title-doc" style="padding-top: 2rem;">Please ensure this form is fully completed to avoid processing delays.</span>
                        </div>


                        <div class="w floatLeft mt" style="display: flex">
                            <div class="floatLeft color-background-lightgrey" style="width: 15%">
                                <%--<asp:CheckBox runat="server" ID="Step1" CssClass="ChBoxPolice" />--%>
                                <input style="top: 2rem; left: 45%;" type="checkbox" runat="server">
                            </div>
                            <div class="fr color-background-lightgrey padding-1" style="width: 84%; margin-left: 1%">
                                <span class="color-blue">Step 1:</span>
                                <span>Third party contact name and address details are completed in full, otherwise we will return this request to the "individual" (person you sent the form to for completion).</span>
                            </div>
                        </div>
                        <div class="w floatLeft mt" style="display: flex">
                            <div class="floatLeft color-background-lightgrey" style="width: 15%">
                                <input style="top: 1rem; left: 45%;" type="checkbox" runat="server">
                            </div>
                            <div class="fr color-background-lightgrey padding-1" style="width: 84%; margin-left: 1%">
                                <span class="color-blue">Step 2:</span>
                                <span>Contains individual’s full name and date of birth.</span>
                            </div>
                        </div>
                        <div class="w floatLeft mt" style="display: flex">
                            <div class="floatLeft color-background-lightgrey" style="width: 15%">
                                <input style="top: 1rem; left: 45%;" type="checkbox" runat="server">
                            </div>
                            <div class="fr color-background-lightgrey padding-1" style="width: 84%; margin-left: 1%">
                                <span class="color-blue">Step 3:</span>
                                <span>Copy of individual's identification is attached to this request; and, the signature on the identification matches the individual’s signature in Step 4.</span>
                            </div>
                        </div>
                        <div class="w floatLeft mt" style="display: flex">
                            <div class="floatLeft color-background-lightgrey" style="width: 15%">
                                <input style="top: 1rem; left: 45%;" type="checkbox" runat="server">
                            </div>
                            <div class="fr color-background-lightgrey padding-1" style="width: 84%; margin-left: 1%">
                                <span class="color-blue">Step 4:</span>
                                <span>The individual has authorised this request by signing and dating the form.</span>
                            </div>
                        </div>
                        <div class="w floatLeft mt" style="display: flex">
                            <div class="floatLeft color-background-lightgrey" style="width: 15%">
                                <input style="top: 30%; left: 45%;" type="checkbox" runat="server">
                            </div>
                            <div class="fr color-background-lightgrey padding-1" style="width: 84%; margin-left: 1%">
                                <span class="color-blue">Step 5 (if applicable):</span>
                                <span>Confirmation of the individual's identity if they do not have a  valid identification.</span>
                            </div>
                        </div>
                        <div class="w mt floatLeft"></div>
                        <div class="w floatLeft color-background-lightgrey padding-1 mt">
                            <p class="color-blue"><strong>Sending your form to the Ministry</strong></p>
                            <p>Send this form and copy of identification to: </p>
                            <p>Criminal Records Unit, Ministry of Justice, National Office, SX 10161, Wellington.</p>
                            <p class="mt"><strong>Service standard</strong></p>
                            <p>The Ministry of Justice will process this request within the agreed service delivery times in your contract with the Ministry of Justice. If you do not hold a contract with the Ministry of Justice, we will endeavour to process this request within 20 working days of the date we receive this completed application.</p>
                        </div>
                        <div style="margin: 20rem 0; width: 100%; float: left;"></div>
                        <div class="w floatLeft rel">
                            <span style="font-size: 1.1rem; position: absolute; bottom: 0; left: 0; top: 0.2rem;">Criminal Conviction Record – Third Party / May 2014</span>
                            <span class="page-number">5</span>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
    <div class="center ppd">
        <asp:Button Class="button btn" ID="buttonConvertToPdf" runat="server" Text="Submit" OnClick="buttonConvertCurrentPageToPdf_Click" />
    </div>
    <script src="js/onlineDocuments.js"></script>
    <script>$("#requestForCriminalHistory").addClass("active");
        $('.datepicker').datepicker({ dateFormat: "dd/mm/yy" });
        $('#ui-datepicker-div').css('display', 'none');
        $('.datepicker').datepicker("setDate", new Date());
    </script>
</asp:Content>

