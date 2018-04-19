<%@ Page Language="VB" MasterPageFile="ODocs.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Online_Docs_Default" %>
<%@ MasterType VirtualPath="~/Online_Docs/ODocs.master" %>
<%@ Reference VirtualPath="~/Portal.Master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="title" runat="server">
    JobsOnline Registration - Documents
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="PortalBody" runat="server">
    <form class="new_candidates_onboarding_job_info section--m1" id="new_candidates_onboarding_job_info" runat="server" method="post" data-ng-click="save(model)">
      <section id="sectionHeadIntro">
          <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    <Scripts><asp:ScriptReference Path="../js/new-user-form-handler.js"/></Scripts></asp:ScriptManager>
        <h3 class="form_title">Document Library <asp:Literal ID="litFName" runat="server"></asp:Literal></h3>
        <p class="form_subtitle">Fill out below forms</p>     
        <div class="left" id="DocPack">
                <asp:Label id="DocumentList" runat="server">
                    
                </asp:Label>
              
        </div>
      </section>
    </form>
</asp:Content>