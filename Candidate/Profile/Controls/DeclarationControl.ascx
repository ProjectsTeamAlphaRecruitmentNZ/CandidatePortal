<%@ Control Language="VB" AutoEventWireup="false" CodeFile="DeclarationControl.ascx.vb" Inherits="DeclarationControl" %>
<sf:Connection ID="SIFConn" runat="server"></sf:Connection>
<div class="modal fade" id="declare"  role="dialog" aria-labelledby="declarationModalLabel" aria-hidden="true">	
                      <div class="modal-dialog" id="declarationModalDialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header"> 
                            <div class="center w floatLeft">
				                <h3 style="line-height: 3.3rem;font-size:2.6rem!important">Candidate Declaration</h3> 
			                </div>
                          </div>
                          <div class="modal-body">
                            
                              <section>
			                        <div class="input-style w floatLeft">
                                        <div class="rel" id="declareHead" >
                                            <img src="../img/exclamation-sign-in-a-circle.png"/>
                                            <span class="agreement"><strong>Please read the following before signing this Declaration</strong></span>
                                        </div>
				                        <div class="text-align-justify">
                                            <p class="margin-top-3rem paragraph-style">
						                        "This application form is a source of information which will be used by Triangle Recruitment to assist in considering your suitability for the position for which you are applying.  If you are successful in obtaining a position, the information will be used by the company employing you to determine your eligibility for promotion (if any) or alternate positions (if any) and where the company is considering disciplinary action and/or termination in relation to you.  If you are unsuccessful Triangle Recruitment will retain the information (unless you object) for use in any future vacancies.
					                        </p>
					                        <p class="margin-top-3rem paragraph-style">
						                        By signing this declaration you endorse that all information provided by you is true and correct in all respects.  You authorise Triangle Recruitment to collect information from any third party including, but not limited to, your designated referees and educational institutes you have attended.  You understand that you are entitled to have access to the information contained in this form, except insofar as it relates to any exemption provided by the Privacy Act 1993."
					                        </p>
					                        <p class="margin-top-3rem paragraph-style">
						                        Your photograph will be taken and securely stored in our database for internal identification purposes only.
					                        </p>
                                            <div class="margin-top-3rem paragraph-style">
						                        Should our clients require a credit check to be carried out pertaining to a specific role that you have applied for; do you give <span style="color:red"><asp:Label runat="server" ID="OrganisationBox"></asp:Label></span> permission to conduct this process on your behalf?  
						                        <div class="mt w">
                                                    <div class="floatLeft">
                                                        <div class="squaredFour border-declaration--checkbox credit-yes" id="ch1">
							                                <asp:RadioButton  ID="CheckBox1" GroupName="creditGroup" runat="server"/>
							                                <%--<label for="<%= CheckBox1.ClientID %>"></label>--%>
						                                </div>
                                                        <label style="width: 10rem !important;">YES</label>
                                                    </div>
                                                    <div>
                                                        <div class="squaredFour border-declaration--checkbox credit-no" id="ch2">
							                                <asp:RadioButton  ID="CheckBox2" GroupName="creditGroup" runat="server"/>
							                                <%--<label for="<%= CheckBox2.ClientID %>"></label>--%>
						                                </div>
                                                        <label style="width: 10rem !important;">NO</label>
                                                    </div>
						                        </div>
					                        </div>
                                            <div class="margin-top-3rem paragraph-style">
						                        Do you have any criminal convictions or any criminal charges pending?  
						                        <div class="mt w">
                                                    <div class="floatLeft">
                                                        <div class="squaredFour border-declaration--checkbox criminal-yes" id="ch3">
							                                <asp:RadioButton  ID="CheckBox3" GroupName="criminalGroup" runat="server"/>
							                                <%--<label for="<%= CheckBox3.ClientID %>"></label>--%>
						                                </div>
                                                        <label style="width: 10rem !important;">YES</label>
                                                    </div>
                                                    <div>
                                                        <div class="squaredFour border-declaration--checkbox criminal-no" id="ch4">
							                                <asp:RadioButton  ID="CheckBox4" GroupName="criminalGroup" runat="server"/>
							                                <%--<label for="<%= CheckBox4.ClientID %>"></label>--%>
						                                </div>
                                                        <label style="width: 10rem !important;">NO</label>
                                                    </div>
						                        </div>
					                        </div>
				                        </div>	
                                        <div class="specify-if-yes margin-top-3rem">
				                            <span class="mt">If yes, please specify:</span>
					                        <textarea class="" style="border: 1px solid #9fa8a3;"></textarea>
				                        </div>
                                        
				                    <div class="img-area">
					                    <img src="../img/logo_alpha.png" alt="alpha_logo" height="55">
					                    <img src="../img/logo_triangle.png" alt="triangle_logo" height="40">
					                    <img src="../img/logo_projectplus.png" alt="projectplus_logo" height="40">
					                    <img src="../img/logo_healthwise.png" alt="healthwise_logo" height="40">
					                    <img src="../img/logo_freightwise.png" alt="freightwise_logo" height="40">
				                    </div>
			                   
			                        </div>      
                                   
		                        </section>

                         </div>

                          <div class="modal-footer">
                          <asp:Button ID="Derclare" runat="server" class="declare-button btn btn-primary" Text="Declare" />
                          </div>
                        </div>
                    </div>
</div>