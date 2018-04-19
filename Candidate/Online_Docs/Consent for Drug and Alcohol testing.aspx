<%@ Page Language="VB" MasterPageFile="ODocs.master" AutoEventWireup="false" CodeFile="Consent for Drug and Alcohol testing.aspx.vb" Inherits="Consent_for_Drug_and_Alcohol_testing" %>
<%@ MasterType VirtualPath="~/Online_Docs/ODocs.master" %>
<%@ Reference VirtualPath="~/Portal.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Consent for Drug and Alcohol testing
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/style-online-docs.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="css/Styles-new-user.css" rel="stylesheet" type="text/css">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <div id="candidate-adhb" class="rel">
        <div id="printableArea">
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
				<h3 style="line-height: 3.3rem;font-size:2.6rem!important">CONSENT FOR WORKPLACE 4308 DRUG TESTING</h3> 
			</div>
		</section>
		<section class="margin-top-3rem rel" style="height: 100%;overflow: hidden;padding-bottom: 4rem;margin-left:5rem;margin-right:2.5rem">
			<div class="input-style w floatLeft">
                <div>
                <asp:Label runat="server" Text="Donor Name:"></asp:Label>
                <asp:TextBox runat="server" ID="Donor"></asp:TextBox>
                    </div>
                <div>
                <asp:Label runat="server" Text="Company Name:"></asp:Label>
                <asp:TextBox runat="server" ID="Company"></asp:TextBox>
                    </div>
				<div class="text-align-justify">
                    <p class="margin-top-3rem paragraph-style">
					    I have been requested to undergo a drug test (s), to be undertaken by a certified collector. I acknowledge this is for the purpose of determining whether I will be able to carry out required duties and have any level of illicit drugs present in my urine; or if prescribed drug (s) present in my urine higher than the accepted international standard; as defined by the Australian/New Zealand AS/NZS 4308:2008.    
                    </p>
                </div><div class="text-align-justify">
                    <p class="margin-top-3rem paragraph-style">
					    Testing involves me providing a urine sample which will be checked by using a verified test kit which gives instant readings. The test kit will identify cannabinoids, opiates, amphetamines, methamphetamine, cocaine and benzodiazepines (and others if applicable).    
                    </p>
                </div>
                <div class="text-align-justify">
                    <p class="margin-top-3rem paragraph-style">
                        I undertake to advise the certified collector conducting the test (s) of any prescription medication, over the counter medication or herbal products that I am taking.
                     </p>
                </div>
                <div class="text-align-justify">
                    <p class="margin-top-3rem paragraph-style">
					    I agree to provide proof of my identity, which could include my photograph, to the certified collector undertaking the drug test (s).    
                    </p>
                </div>
                <div class="text-align-justify">
                    <p class="margin-top-3rem paragraph-style">
					    I understand that I may be subject to undergo random drug testing onsite when placed in an Assignment by Alpha Recruitment.   
                    </p>
                </div>
                <div class="text-align-justify">
                    <p class="margin-top-3rem paragraph-style">
					    I consent to the results of the drug test (s) being communicated confidentially to Canterbury Health Laboratories and to the Approved Company Representative.   
                    </p>
                </div>
                <div class="text-align-justify">
                    <p class="margin-top-3rem paragraph-style">
					    If this test is a non negative for any of the drugs listed above the result may be sent to CHL as soon as possible on this day for laboratory analysis to confirm drug results.
                    </p>
                </div>
                <div class="text-align-justify">
                    <p class="margin-top-3rem paragraph-style">
					    Any collection, storage or exchange of medical information concerning any drug test results will be in accordance with the requirement of the Privacy Act. Results of the drug test (s) will only be used for the purposes for which they were obtained.
                    </p>
                </div>
                <div class="text-align-justify">
                    <p class="margin-top-3rem paragraph-style">
					    I have read, and had explained to me, the testing procedures and understand the terms of this consent form. I agree to undergo a drug test.
                    </p>
                </div>
                <div>
			<div class="sm-1of2 floatLeft" style="margin-top:7rem">
					<label>Signature of Donor:</label>
				</div>
			<div class="fr sm-1of2">
				<label style="width: 5rem!important;margin-top: 7rem;margin-left:7rem">Date:</label>
                <asp:TextBox runat="server" ID="Date" CssClass="input datepicker"  style="border-color:transparent;border-bottom: 1px dotted black !important;width:20rem" ></asp:TextBox>
				
				<%--<input id="input4" type="text" class="input" name="phonenumber"  data-index="4" style="border-color:transparent;border-bottom: 1px dotted black !important;width:20rem;float: right;"/>--%> 
			</div>		
                    </div>
                <div class="floatLeft sm-1of2">
				<label style="width: 10rem !important;">I. D:</label>
				<input id="input1" type="text" class="input" name="officialsurname"  data-index="1" style="border-color:transparent;border-bottom: 1px dotted black !important;width:20rem"/>
			</div>
                <div class="w floatLeft" style="margin-top:4rem">
					<label>Signature of Collector: </label>
				</div>
                <div class="floatLeft w">
                            <div class="floatLeft">
                                <div class="squaredFour border-declaration--checkbox" id="ch1">
							        <asp:CheckBox ID="CheckBox1" runat="server"/>
							        <label for="<%= CheckBox1.ClientID %>"></label>
						        </div>
                                <label style="width: 20rem !important;">I refuse to undergo a drug test</label>
                               
                                
                            </div>
                    </div>
                 <div class="floatLeft w" style="margin-top:4rem">
                            
                                
                                <label style="width: 20rem !important;">Signature:<img src="../img/signature-test.png" id="kiwisaver-signature-img" class="img-signature"></label>
                               
                                
                          
                    </div>
                </div>
		</section></div>
        <%--<section>
           <div class="w position-absolute" style="bottom:0;">
				<div class="img-area">
					<img src="img/logo_alpha.png" alt="alpha_logo" height="55">
					<img src="img/logo_triangle.png" alt="triangle_logo" height="40">
					<img src="img/logo_projectplus.png" alt="projectplus_logo" height="40">
					<img src="img/logo_healthwise.png" alt="healthwise_logo" height="40">
					<img src="img/logo_freightwise.png" alt="freightwise_logo" height="40">
				</div>
			</div>
        </section>--%>
	</div> 
    <div class="center ppd">
        <asp:Button Class="button btn" ID="buttonConvertToPdf" runat="server" Text="Submit" OnClick="buttonConvertCurrentPageToPdf_Click" />
    </div>
    <script src="js/onlineDocuments.js"></script>
    <script>$("#ConsentforDrugandAlcoholtesting").addClass("active");
        $('.datepicker').datepicker({ dateFormat: "dd/mm/yy" });
        $('#ui-datepicker-div').css('display', 'none');
        $('.datepicker').datepicker("setDate", new Date());
    </script>
</asp:Content>

