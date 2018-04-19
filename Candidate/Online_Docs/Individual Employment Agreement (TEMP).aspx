<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="ODocs.master" CodeFile="Individual Employment Agreement (TEMP).aspx.vb" Inherits="Individual_Employment_Agreement__TEMP_" %>
<%@ MasterType VirtualPath="~/Online_Docs/ODocs.master" %>
<%@ Reference VirtualPath="~/Portal.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Individual Employment Agreement (TEMP)
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
				<h3 style="line-height: 3.3rem;font-size:2.6rem!important">INDIVIDUAL EMPLOYMENT AGREEMENT
(Temporary Staff)</h3> 
			</div>
		</section>
        <section class="margin-top-3rem rel" style="height: 100%;overflow: hidden;padding-bottom: 4rem;margin-left:5rem;margin-right:2.5rem">
			<div class="input-style w floatLeft">
                <div class="rel" style="background-color:#000;padding:0rem;padding-bottom:0">                   
                    <span class="agreement-w"><strong>PARTIES</strong></span>
                </div>
				<div class="text-align-justify">
                    <ol>
                    <li class="margin-left16 margin-top-3rem paragraph-style">
					    Alpha Personnel Recruitment Limited (“the Company”)    
                    </li>
                        <li class="margin-left16  paragraph-style">
					    <asp:TextBox runat="server" CssClass="input"  ID="FullName1" style="border-color:transparent;border-bottom: 1px solid black !important;width:25rem" ></asp:TextBox>
                            (“the Employee” or “I”) <br/>    (Collectively referred to as “the parties”)
                    </li>
                        </ol>
                </div>
                <ol id="agreementList">
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>BACKGROUND</strong></span>
                        </div>
                        <ol id="backgroundList">
                            <li>The Company is a personnel consultancy, which provides services to a third party (“Client”). The Company employs me on a temporary basis to work on Assignments (“Assignment” or “Assignments”) for the Client.</li>
                            <li>I, <asp:TextBox runat="server" CssClass="input" ID="FullName2" style="border-color:transparent;border-bottom: 1px solid black !important;width:25rem"></asp:TextBox> agree to be bound by the following employment terms and conditions (“Terms and Conditions”) of the Company and accept a position as a temporary employee of the Company, on the following Terms and Conditions:</li>
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel declHeader  margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>ASSIGNMENTS</strong></span>
                        </div>
                        <ol id="subList">
                            <li>I have the right to refuse or accept any Assignment offered by the Company.</li>
                            </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel declHeader  margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>NATURE OF AGREEMENT</strong></span>
                        </div>
                        <ol id="subList">
                            <li>This agreement establishes the nature of the relationship between the parties and includes the Terms and Conditions under which the Employee will be employed by the Company.</li>
                            <li>The Terms and Conditions of employment contained in this agreement will come into force at the commencement date of the Assignment and will continue until the termination of the Assignment unless sooner terminated in accordance with clause 6. I understand that the company has genuine reasons based on reasonable grounds for specifying that my employment will end in this way. The nature of my employment is that the Company employs me to work on individual Assignments for Clients in accordance with the Client’s requirements. My employment will therefore terminate on the earlier of:
                                <ol>
                                    <li>The date notified to me in the Confirmation of On-Hire Job Brief; or</li>
                                    <li>When the Client terminates the Assignment in accordance with clause 6 of this Agreement.</li>
                                </ol>
                            </li>
                            <li>
                                I understand and accept that the nature of my employment means that each Assignment is a separate period of employment. Once an Assignment is completed without any further Assignment having been agreed, the employment relationship terminates, and there is no continuing contractual relationship of employment. I understand there is no guarantee of continuous work.
                            </li>
                            <li>I understand and accept that upon the termination or early cessation of any Assignment, for any reason whatsoever, the Company shall not be under any obligation to offer me an alternative or additional Assignment.</li>
                            <li>I further acknowledge that nothing in this agreement, or conversation with the Company or Client, shall be interpreted or understood to give any expectation that this agreement will be renewed or that any subsequent agreement will be entered into unless a formal offer is made by the Company to extend the Assignment.</li>
                            <li>acceptance of an Assignment I agree to:
                                <ol>
                                    <li>report to work at the Client’s premises at the hours stipulated by the Company, and</li>
                                    <li>work to the best of my ability, and</li>
                                    <li>complete the entire Assignment (subject to clause 6 below)</li>
                                </ol>
                            </li>
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel declHeader  margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>CONFIDENTIALITY</strong></span>
                        </div>
                        <ol id="subList">

                            <li>I understand and accept that I am in a position of trust in relation to both the Client and the Company and agree that I will hold all Confidential Information in confidence and will not, without the written consent of the Client and/or Company, directly or indirectly at any time during an Assignment or following its termination (for so long as the information continues to be Confidential Information):
                                <ol>
                                    <li>use any Confidential Information;</li>
                                    <li>disclose any Confidential Information to any person, firm, company or entity;</li>
                                    <li>Copy any material containing Confidential Information for personal use or for use by any other unauthorised person, firm, company or entity; other than to the extent necessary to carry out an Assignment.</li>
                                </ol>
                            </li>
                            <li>
                                “Confidential Information” in clause 4 means: all confidential information which is not in the public domain and which is reasonably regarded by the Client and/or Company as confidential to it, which I have become aware of in the course of carrying out this agreement or an Assignment including, but not limited to, trade secrets, confidential business and technical information, business methods and management systems, detailed information and records relating to customers, suppliers, staff and parties with whom the Client and/or Company deals commercially, strategic information relating to marketing, advertising or any other aspect of business, computer software and data know-how not generally known to the public.
                            </li>
                            <li>Any breach of any of the above confidentiality clauses will be treated as serious misconduct.</li>
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>DIFFICULTY IN ASSIGNMENT</strong></span>
                        </div>
                        <ol id="subList">

                            <li>I will contact the Company immediately for assistance if I have difficulty in any Assignment.</li>
                            <li>If I am required by the Client to work in a place or on tasks/duties not agreed by the Company I will contact the Company immediately.</li>
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>EARLY CESSATION OF ASSIGNMENTS</strong></span>
                        </div>
                        <ol id="subList">

                            <li>If, for any reason whatsoever, I am unable to complete an Assignment I will advise the Company as soon as practicably possible and in any event, unless there are exceptional circumstances:
                                <ol>
                                    <li>where the Assignment is up to five working days duration, I will give the Company at least two (2) working days’ notice of my inability to complete the Assignment; or</li>
                                    <li>Where the Assignment is over five working days duration, I will give the Company at least five (5) working days’ notice of inability to complete the Assignment.</li>
                                    </ol>
                            </li>
                            <li>
                                If I do not give the notice set out in paragraph 6.1 above, the Company is entitled to deduct from any wages (including holiday pay) due to me the equivalent of the shortfall in notice.
                            </li>
                            <li>If, for any reason whatsoever, the Client reassesses its needs and terminates an Assignment earlier than originally indicated, my employment will terminate and the Company is under no obligation to offer me an alternative or additional Assignment.</li>
                            <li>I understand and accept that I am not entitled to receive any compensation in the event of redundancy or early termination of an Assignment.</li>
                            <li>The Company shall be entitled to terminate this Agreement without notice in the event of serious misconduct.</li>
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>INSURANCE</strong></span>
                        </div>
                        <ol id="subList">

                            <li>In the event the Client requests me to use a company vehicle, handle cheques, cash, valuables, documentation or equipment, whether on or off the Client’s premises, I shall advise the Company immediately to allow the Company to verify that the appropriate insurance arrangements have been made by the Client. If I fail to advise the Company, I accept that I may be personally responsible for any damage or loss incurred or suffered.
                            </li>
                            <li>
                                I accept sole responsibility for the safety and security of my own personal belongings and property during each Assignment and whilst travelling to and from Assignments.
                            </li>
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>PERSONAL BUSINESS</strong></span>
                        </div>
                        <ol id="subList">

                            <li>I accept that during each Assignment I will not undertake any other business of any nature, either personal or business (i.e. personal telephone calls, text messaging), without the Client’s prior approval and that I will reimburse the Client’s costs incurred by me in doing so.

                            </li>
                            <li>
                                I accept that I may only use the Client’s e- technology in the course of performing my work while on Assignment and not for any personal reasons. I agree to comply with any policies or procedures the Client may have in force from time to time relating to use of e-technology.

                            </li>
                            <li>I accept that I must turn off my personal mobile telephone when on Assignment.</li>
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>PUNCTUALITY</strong></span>
                        </div>
                        <ol id="subList">

                            <li>If I am late for an Assignment or unable to report for work for any reason whatsoever I will immediately advise the Company, to enable arrangements to be made for a suitable replacement. I acknowledge that in these circumstances, the Company may engage a replacement employee for such period of the Assignment as the Company sees fit.
                            </li>

                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>HOURS OF WORK</strong></span>
                        </div>
                        <ol id="subList">

                            <li>My hours of work shall be advised prior to the commencement of each Assignment
                            </li>
                            <li>If I am requested to work hours in excess of the standard hours of the Assignment I will immediately advise the Company before I commence such additional work.</li>
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>CATEGORY OF WORK</strong></span>
                        </div>
                        <ol id="subList">

                            <li>I am available for the following categories of work on Assignments:
                                <table id="agreementTable">
                                    <tr>
                                        <td><strong>Category</strong></td>
                                        <td><strong>Description</strong></td>
                                        <td><strong>Please Circle</strong></td>
                                    </tr>
                                    <tr>
                                        <td>Office Administration</td>
                                        <td>Administration, Clerical, PC-based work, Reception, Secretarial/PA, Customer Services, Accounts, Coordination etc.</td>
                                        <td>YES / NO</td>
                                    </tr>
                                    <tr>
                                        <td>Industrial Administration</td>
                                        <td>Dispatch Clerk, Inventory Control</td>
                                        <td>YES / NO</td>
                                    </tr>
                                    <tr>
                                        <td>Industrial</td>
                                        <td>Picker/Packer, Factory Worker, Fork hoist Operator</td>
                                        <td>YES / NO</td>
                                    </tr>
                                </table>   
                            </li>                            
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>PAYMENT</strong></span>
                        </div>
                        <ol id="subList">
                            <li>I agree that my wages shall be based solely on the hours worked on each Assignment. I am not entitled to remuneration when not working on an Assignment provided by the Company.
                            </li>
                            <li>No wages shall be paid to me unless I present to the Company a completed timesheet stating the hours worked, which have been agreed with the Client, and signed by both the Client and myself. Any falsification of such a document will be treated as serious misconduct.</li>
                            <li>I shall be paid at an hourly rate for the hours worked while on Assignment. My hourly rate shall be agreed with the Company prior to the commencement of the Assignment. This rate will remain fixed for the duration of the Assignment, unless otherwise agreed between the Company and I and where such agreement is recorded in writing. I agree not to discuss my hourly rate or employment terms and conditions with the Client or any Employee of the Client.</li>
                            <li>I understand that rates quoted and agreed may include or exclude penal rates and overtime payments. These factors shall be determined and agreed between the Company and I prior to acceptance of each Assignment.</li>
                            <li>I agree to complete all documentation necessary for the Company to comply with its income tax obligations in respect of employees.</li>
                            <li>Any payment for Annual Holidays, Sick or Bereavement Leave, Public Holidays or Alternative Holidays will be calculated in accordance with the Holidays Act 2003.</li>
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>ANNUAL HOLIDAYS</strong></span>
                        </div>
                        <ol id="subList">
                            <li>On the understanding that as an Employee, the nature of my employment means that I am unlikely to work for the Company for a continuous period of more than twelve (12) months on any one Assignment, my holiday entitlement will accrue at the rate of not less than 8% of my gross earnings. It will be paid to me within seven (7) days where I advise the Company in writing of both my resignation and that I do not want any further Assignments.

                            </li>
                            <li>I may alternatively use any accrued amount of holiday entitlement in advance of my actual entitlement, only with the prior agreement of the Company.

                            </li>
                            <li>Should I be employed by the Company on an Assignment/s for a continuous period of twelve (12) months, I will be entitled to take four (4) weeks’ annual holiday on pay, reduced by any holidays taken in advance.

                            </li>
                            <li>I can request in writing to be paid out up to one week of my minimum entitlement to annual holidays each year. This request may be declined and the Company is not required to provide a reason for their decision.

                            </li>
                            <li>I understand that if I become entitled to take annual holiday:
                                <ol>
                                    <li>The timing of when annual holidays may be taken is subject to agreement between me and the Company</li>
                                    <li>If no agreement can be reached, the Company must provide me with at least 14 days notice of a requirement to take annual holidays</li>
                                    <li>I agree to take any annual holiday entitlements within twelve (12) months of the date of the holidays falling due; and</li>
                                    <li>I may use any accrued amount of holiday entitlement in advance of my actual entitlement, only with the prior agreement of the Company</li>
                                </ol>
                            </li>
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>RELEVANT DAILY PAY</strong></span>
                        </div>
                        <ol id="subList">
                            <li>For the purposes of clauses 14, 15 and 16, “relevant daily pay” in accordance with the Holidays Act 2003, means:
                                <ol>
                                    <li>the amount of pay that I would have received had I worked on the day concerned; or</li>
                                    <li>If it is not possible for the Company to determine my relevant daily pay, it must be calculated in accordance with the formula set out in section 9(3) of the Holidays Act 2003.</li>
                                </ol>
                            </li>
                            </ol>
                    </li>
                     <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>PUBLIC HOLIDAY</strong></span>
                        </div>
                        <ol id="subList">
                            <li>I am entitled to public holidays in accordance with the Holidays Act 2003 and any amending or substituting Acts.</li>
                            <li>I am entitled to be paid for public holidays that fall on days which would otherwise have been working days for me during an Assignment. I will be paid not less than my relevant daily pay for that day. In instances where I am not on Assignment when a public holiday falls, I will not be entitled to be paid for public holidays occurring at that time.

                            </li>
                            <li>The Company may require me to work on a public holiday, which falls during the period of an Assignment and I agree I will only work if directed by the Company. Where I am required to work on this public holiday I will be paid for the hours I actually work at the rate of 1.5 times my relevant daily pay for the hours worked on that day. Where the holiday would otherwise be a working day for me, I will also receive a paid Alternative Holiday to be taken on a day agreed between the Company and I or as provided for in the Holidays Act 2003. An Alternative Holiday will be paid at the rate of my relevant daily pay on the day the Alternative Holiday is taken.

                            </li>
                            <li>The Company has a workplace policy that we do not transfer the observance of public holidays.</li>
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>SICK LEAVE</strong></span>
                        </div>
                        <ol id="subList">
                            <li>The following entitlements in this Clause 15 are instead of, and not in addition to the sick leave set out in the Holidays Act 2003 and any amending or substituting Acts.</li>
                            <li>If I have completed six (6) months’ current continuous employment with the Company or, over a period of six (6) months, I worked for the Company for:
                                <ol>
                                    <li>at least an average of ten (10) hours a week during that period; and</li>
                                    <li>no less than one (1) hour in every week during that period or no less than forty (40) hours in every month during that period;</li>
                                </ol>
                                I shall be entitled to five (5) days sick leave in each ensuing period of twelve (12) months.
                            </li>
                            <li>Sick leave may be taken on a day that would otherwise be a working day for me during an Assignment and provided:
                                <ol>
                                    <li>I am sick or injured; or</li>
                                    <li>my spouse (including de facto partner) is sick or injured; or</li>
                                    <li>a dependant is sick or injured</li>
                                </ol>
                            </li>
                            <li>I may carry over up to fifteen (15) days’ sick leave to a maximum of twenty (20) days’ current entitlement in any year. Any accumulated sick leave will not be paid out on termination of my employment with the Company or at the end of an Assignment.

                            </li>
                            <li>
                                If I intend to take sick leave, I must notify the Company as early as possible before I am due to start work on the day that leave is to be taken; or if that is not practicable, as early as possible after that time.
                            </li>
                            <li>
                                I may be required to produce proof of sickness or injury to support a claim for sick leave (at my own expense) if the sickness or injury is for a period of three (3) or more consecutive calendar days, whether or not the days would otherwise be working days for me. This does not prevent the Company from requesting proof to establish that there are no relevant health and safety reasons that would prevent me from working. If the company has reasonable grounds to suspect that the sick leave I am taking is not genuine, I understand that I may be required to produce proof of the illness or injury, in accordance with the Holidays Act 2003.
                            </li>
                            <li>
                                Payment for sick leave shall be at the rate of my relevant daily pay.
                            </li>
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>BEREAVEMENT LEAVE</strong></span>
                        </div>
                        <ol id="subList">
                            <li>
                                The following entitlements in this Clause 16 are instead of, and not in addition to the bereavement leave set out in the Holidays Act 2003 and any amending or substituting Acts.
                            </li>
                            <li>
                                In each ensuing period of twelve months I shall be entitled to bereavement leave if I have completed six (6) months current continuous employment with the Company or, over a period of six (6) months, I have worked for the Company for:
                                <ol>
                                    <li>At least an average of ten (10) hours a week during that period; and</li>
                                    <li>No less than one (1) hour in every week during that period or no less than forty (40) hours in every month during that period.</li>
                                </ol>
                            </li>
                            <li>
                                I will be entitled to three (3) days’ bereavement leave when these days fall on days that would otherwise be working days for me during an Assignment and the bereavement relates to the death of my:
                                <ol>
                                    <li>spouse</li>
                                    <li>parent</li>
                                    <li>child</li>
                                    <li>brother or sister</li>
                                    <li>grandparent</li>
                                    <li>grandchild</li>
                                    <li>spouse’s parent</li>
                                </ol>
                            </li>
                            <li>I am entitled to one (1) day’s bereavement leave on the death of any other person if the Company accepts that I have suffered bereavement as a result of the death. I will only be entitled to take this one (1) day’s bereavement leave if it falls on a day that would otherwise have been a working day for me during an Assignment. When deciding whether to accept that I have suffered a bereavement as a result of the death, the Company will consider such relevant factors as:
                                <ol>
                                    <li>my taking of significant responsibility for all or any of the arrangements for the ceremonies relating to the death;</li>
                                    <li>any cultural responsibilities I may have in relation to the death;</li>
                                    <li>The closeness of the association between the deceased person and myself.</li>
                                </ol>
                            </li>
                            <li>If I intend to take bereavement leave, I must notify the Company of that intention as early as possible before I am due to start work on the day that intended to be taken as bereavement leave; or if that is not practicable, as early as possible after that time.</li>
                            <li>Upon request by the Company, I will provide proof of bereavement to assist the Company in determining my entitlement to one (1) day’s paid bereavement leave in accordance with Clause 16.4 above.</li>
                            <li>Payment for bereavement leave shall be at the rate of my relevant daily pay.</li>
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>COMPANY PROPERTY/CLIENT PROPERTY</strong></span>
                        </div>
                        <ol id="subList">
                            <li>
                                If, during any assignment, I am provided with a uniform or equipment or am entrusted with any cash, cheques or other valuables, I will return the uniform or equipment undamaged and account for any cash, cheques or other valuables upon demand by the Client or upon completion of the Assignment. The value of any unreturned property or equipment may be deducted from my wages, including holiday pay.
                            </li>
                            <li>
                                I understand that for some Assignments, the use of protective equipment or clothing may be required. If so, this will be provided by the Company or the Client unless I notify the Company that I wish to provide my own equipment. I understand that if the Company or the Client provides equipment or clothing for me, I may be required to pay a bond that will be repaid in full once the equipment or clothing is returned in good condition at the end of the Assignment.
                            </li>
                            <li>
                                I understand that if at any time I wish stop providing my own equipment or clothing where such is required, and have the Company or Client provide me with protective clothing or equipment, I will tell the Company immediately.
                            </li>
                            <li>
                                I understand that I will be liable for any wilful or negligent actions or omissions by me causing damage or loss to the Client or Company during the Assignment.
                            </li>
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>INTELLECTUAL PROPERTY</strong></span>
                        </div>
                        <ol id="subList">
                            <li>
                                Any invention, improvement, design, process, patent, trade mark, copyright, system or other intellectual property right (collectively called “Creation(s)”) made or discovered by me during the fulfilment of any Assignment (whether capable of being patented or registered or not) shall forthwith belong to and be at the absolute disposal of the Company.                            </li>
                            <li>
                                Where the Creations are created by me as part of the Company providing services to the Client and the agreement between the Company and the Client provides that the Client shall own the rights in the Creation then the Company shall assign such rights in the Creation to the Client.
                            </li>
                            <li>
                                I agree that, if and whenever called upon to do so (whether during or after the termination of any Assignment), I will execute all instruments and do all things necessary for vesting the rights of the Creations in the Company (or its assignee) absolutely as sole beneficial owner.     
                            </li>
                            <li>
                                Notwithstanding this clause 19, should I be able to establish that any Creation was made prior to entering into these Terms and Conditions or created subsequently but for services unrelated to the services supplied pursuant to these Terms and Conditions, such Creation shall remain my property.
                            </li>
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>USE OF MATERIAL</strong></span>
                        </div>
                        <ol id="subList">
                            <li>
                                I confirm that all materials, ideas, systems or other creative and literary property conceived or furnished by me for the Company or any Client of the Company will be my own creating or be fully cleared by me for such use and that such material will not violate or infringe upon any rights of any third party (being a person, firm or corporation).
                            </li>
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>FURTHER EMPLOYMENT</strong></span>
                        </div>
                        <ol id="subList">
                            <li>
                                Should I make an approach to, or be approached by, the Client or any other person, firm or organisation where the introduction has resulted as a consequence of any Assignment or interview for an Assignment, to take on/consider employment or engagement as an independent contractor, whether on a permanent, part-time, fixed term, temporary or casual basis, I will immediately notify the Company before accepting any such employment or engagement. The Company will then act on my behalf in considering/accepting any such employment or engagement.
                            </li>
                            <li>
                                This requirement applies for six (6) months after completion of each assignment.
                            </li>
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>USE OF OWN VEHICLE</strong></span>
                        </div>
                        <ol id="subList">
                            <li>
                                I will not use my own vehicle for any business purposes of the Client without prior authority from the Company.
                            </li>
                            <li>
                                Where I do use my own vehicle, whether with prior authority from the Company or not, I will be entirely liable for any damage or loss arising out of or in connection with the use of my vehicle.
                            </li>
                            <li>
                                Where I have prior authority from the Company to use my vehicle for business travel whilst on Assignment, I will be reimbursed at rates set by the Company and advised to me by the Company and I accept responsibility for arranging business insurance cover on my vehicle.
                            </li>
                            <li>
                                I agree that I will not drive any Client or Company vehicle unless I hold the appropriate class of licence for that vehicle.
                            </li>
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>HEALTH AND SAFETY</strong></span>
                        </div>
                        <ol id="subList">
                            <li>
                                At the time of signing these Terms and Conditions I declare I am in good health and I am not suffering from any medical condition which would affect my ability to carry out Assignments.
                            </li>
                            <li>
                                I acknowledge that I will not accept any Assignment with any Client unless I am in good health at the time and unless I am not at that time suffering from any medical condition which may affect my ability to carry out the Assignment.
                            </li>
                            <li>
                                I will, upon reasonable requests by the Company, supply a medical certificate to confirm my ability to perform the requirements of the Assignment and will in particular supply the Company with evidence of my recovery from any accident or illness suffered by me during my employment upon request.
                            </li>
                            <li>
                                I acknowledge that I have been informed by the Company of my responsibilities under the Health and Safety at Work Act 2015. I undertake to take all practicable steps to ensure my own safety and to ensure that no action or inaction on my part at work causes harm to any other person. In particular, I agree that I will:
                                <ol>
                                    <li>Report to the Company and to the Client any safety issues of which I become aware;</li>
                                    <li>Wear all appropriate protective clothing and equipment required, whether this is provided to me or I choose to provide my own;</li>
                                    <li>Follow all of the Client’s instructions with regard to health and safety;</li>
                                    <li>Make myself aware of, and adhere to, all of the Client’s policies and procedures concerning health and safety;</li>
                                    <li>Not use any piece of equipment, with which I am unfamiliar, have not been trained in the use of, or am not qualified to use.</li>
                                    <li>Immediately inform the Company if I believe that the working conditions at the Client’s premises are for any reason unsafe;</li>
                                    <li>Advise the Company and the Client if I am feeling unduly stressed or fatigued as a result of my work. I understand and accept that in undertaking the Assignments provided by the Company a reasonable amount of pressure is to be expected and is accepted as a normal part of my employment; and</li>
                                    <li>Inform the Company and the Client as soon as practicable if I am involved in any accident or near miss at the Client’s premises.</li>
                                </ol>
                            </li>
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>RESOLUTION OF EMPLOYMENT RELATIONSHIP PROBLEMS</strong></span>
                        </div>
                        <ol id="subList">
                            <li>
                                Where I advise the Company of the existence of an employment relationship problem (“the problem”), the Company will discuss and attempt to resolve the problem directly with me in the first instance.
                            </li>
                            <li>
                                If the problem is not resolved, the Company or myself may request mediation assistance or determination of the problem under the Employment Relations Act 2000.
                            </li>
                            <li>
                                If I believe I have a personal grievance I must raise the grievance with the Company within ninety (90) days of the date of the alleged action giving rise to the grievance or coming to the notice of me, whichever is the latter.
                            </li>
                            <li>
                                A copy of the Act is available for my reference from the Company.
                            </li>
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>DURATION AND VARIATION OF CONDITIONS</strong></span>
                        </div>
                        <ol id="subList">
                            <li>
                                Subject to clause 25.2, these Terms and Conditions will apply to every Assignment that I undertake for the Company after the date recorded herein.

                            </li>
                            <li>
                               Notwithstanding the provisions of any clause in the agreement, the Terms and Conditions contained in this agreement may be varied by agreement between the Company and me; such agreement shall be recorded in writing.
                            </li>
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>COMPANY/CLIENT RULES AND POLICIES</strong></span>
                        </div>
                        <ol id="subList">
                            <li>
                                I agree to comply with all Company and Client rules, policies and procedures as notified by the Company/Client from time to time.
                            </li>
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>EMPLOYEE PROTECTION PROVISION</strong></span>
                        </div>
                        <ol id="subList">
                            <li>
                                If the Company proposes to restructure (as defined in section 69L(1) of the Employment Relations Act), and the proposal may result in your work being performed for a new employer, the Company will:
                                <ol>
                                    <li>discuss and negotiate with the new employer as to whether you may:
                                        <ol>
                                            <li>
                                                Transfer to the new employer on the terms and conditions of employment set out in this Employment Agreement; or
                                            </li>
                                            <li>
                                                transfer to the new employer on different and conditions of employment; or
                                            </li>
                                            <li>
                                                not transfer to the new employer; and
                                            </li>
                                        </ol>
                                    </li>
                                    <li>meet with you after discussion with the new employer to:
                                        <ol>
                                            <li>convey the outcome of the discussion and negotiation outlined in 27.1(a) above; and</li>
                                            <li>outline your entitlements as set out in this provision</li>
                                        </ol>
                                    </li>
                                </ol>
                            </li>
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>COMPLETENESS</strong></span>
                        </div>
                        <ol id="subList">
                            <li>
                                The Terms and Conditions set out in this agreement represent the entire agreement of the parties and replace any previous agreements and understandings
                            </li>
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>EMPLOYEE’S DECLARATIONS</strong></span>
                        </div>
                        <ol id="subList">
                            <li>
                                I, <asp:TextBox runat="server" CssClass="input" ID="FullName3"  style="border-color:transparent;border-bottom: 1px solid black !important;height: 2.3rem;width:25rem"></asp:TextBox> declare that:
29.1 I have read and fully understand the above Terms and Conditions and agree to be bound by them on each and every Assignment I undertake on behalf of the Company.
                            </li>
                        <li>
                            I agree and fully understand that, due to the nature of my employment and the fact that my Assignments will vary and generally be on short notice, that the Company may be unable to provide me with the following information in writing, prior to commencing the Assignment:
                            <ol>
                                <li>a description of the work to be performed by me; and</li>
                                <li>an indication of where I am to perform the work; and</li>
                                <li>an indication of the hours I will be required to work; and</li>
                                <li>the wages payable to me</li>
                            </ol>
                        </li>
                            <li>
                            I agree and fully understand that:
                                <ol>
                                <li>the Company’s offer(s) of Assignments may be intermittent and I cannot be guaranteed full time, ongoing employment by the Company; and</li>
                                <li>my employment with the Company terminates once an Assignment is completed without any further Assignment having been offered and agreed to be undertaken by me; and</li>
                                <li>prior to signing the above agreement I have been given a reasonable opportunity to seek independent advice; and</li>
                                <li>The Company will not always be able to give me a reasonable opportunity to seek independent advice before agreeing to undertake an Assignment due to the nature of the work being at short notice.</li>
                            </ol>
                        </li>
                            <li>I agree that should I receive a written Confirmation of Temporary Job Brief, I will return a signed copy as soon as practicable.</li>
                        </ol>
                    </li>
                    <li class="margin-left16 totalCount">
                        <div class="rel  declHeader margin-top2" style="background-color:#000;">                   
                            <span class="agreement-w"><strong>COMPANY’S DECLARATIONS</strong></span>
                        </div>
                        <ol id="subList">
                            <li>
                                The Company agrees that it will brief the Employee prior to the Employee accepting an Assignment and provide the following information to the Employee verbally before he/she commences the Assignment:
                                <ol>
                                    <li>A description of the work to be performed by the Employee; and</li>
                                    <li>an indication of where the Employee is to perform the work; and</li>
                                    <li>an indication of the hours the Employee will be required to work; and</li>
                                    <li>the date on which the Assignment commences, and the date on which it is, at the commencement of the Assignment, expected to end; and</li>
                                    <li>The wages payable to the Employee.</li>
                                </ol>
                            </li>
                            <li>
                                The Company will endeavour to provide the information set out in paragraphs 30.1 (a) – (e) above in writing, as soon as reasonably possible.
                            </li>
                        </ol>
                    </li>
                </ol>
			<div class="floatLeft sm-1of2">
				<label style="width: 10rem !important;">SIGNED by the Employee:</label>
                <%--<input id="input1" type="text" class="input" name="officialsurname"  data-index="1" style="border-color:transparent;border-bottom: 1px dotted black !important;width:20rem"/>--%>
			</div>
			<div class="fr sm-1of2">
				<label style="width: 5rem!important;margin-top: 2rem;margin-left:7rem">Date:</label>
                <asp:TextBox runat="server" ID="Date" CssClass="input datepicker"  style="border-color:transparent;border-bottom: 1px dotted black !important;width:20rem" ></asp:TextBox>
				<%--<input id="input4" type="text" class="input" name="phonenumber"  data-index="4" style="border-color:transparent;border-bottom: 1px dotted black !important;width:20rem;float: right;"/>--%> 
			</div>
			<div class="w floatLeft" style="margin-top:7rem">
					<label>SIGNED for and on behalf of the Company:</label>
				</div>
                </div>
		</section>
    </div>
    <div class="center ppd">
        <asp:Button Class="button btn" ID="buttonConvertToPdf" runat="server" Text="Submit" OnClick="buttonConvertCurrentPageToPdf_Click" />
    </div>
    <script src="js/onlineDocuments.js"></script>
    <script>$("#IndividualEmploymentAgreementTEMP").addClass("active");
        $('.datepicker').datepicker({ dateFormat: "dd/mm/yy" });
        $('#ui-datepicker-div').css('display', 'none');
        $('.datepicker').datepicker("setDate", new Date());
    </script>
</asp:Content>