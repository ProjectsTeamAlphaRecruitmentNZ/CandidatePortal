<%@ Page Language="vb" MasterPageFile="ODocs.master" AutoEventWireup="false" CodeFile="Health and Safety declaration.aspx.vb" Inherits="HandS" %>
<%@ MasterType VirtualPath="~/Online_Docs/ODocs.master" %>
<%@ Reference VirtualPath="~/Portal.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Health and Safety Declaration
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/style-online-docs.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="css/Styles-new-user.css" rel="stylesheet" type="text/css">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <div class="rel" id="printableArea">
    <sf:Connection ID="SIFConnection1" runat="server"></sf:Connection>
    <div class="media leftAlone center"><iframe src="https://www.youtube.com/embed/D1IdLccbz7Q?feature=oembed" gesture="media" allow="encrypted-media" allowfullscreen="" width="600" height="400" frameborder="0"></iframe></div>
    <div class="center ppd">
        <div class=" w">
                            <div class="">
                                <div class="squaredFour border-declaration--checkbox" id="ch1">
							        <asp:CheckBox ID="CheckBox1" runat="server"/>
							        <label for="<%= CheckBox1.ClientID %>"></label>
						        </div>
                                <label style="width: 90% !important;">I confirm that I have viewed the video on my individual responsibilities under the Health & Safety at Work Act 2015 and I accept that while on assignment as a representative of Alpha Personnel Recruitment Ltd, I will act in accordance with these responsibilities.</label>
                               
                                
                            </div>
                    </div>
        <asp:Button Class="button btn" ID="buttonConvertToPdf" runat="server" Text="Submit" OnClick="buttonConvertCurrentPageToPdf_Click" />
       
    </div>
        </div>
    <script src="js/onlineDocuments.js"></script>
    <script>$("#HealthAndSafetyDeclaration").addClass("active");</script>
</asp:Content>

