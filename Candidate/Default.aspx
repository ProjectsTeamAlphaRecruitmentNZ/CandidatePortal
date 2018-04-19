<%@ Register Assembly="StayinFront.Web, Version=12.0.6.5, Culture=neutral, PublicKeyToken=62c3274750c83f8a" Namespace="Stayinfront.Web.UI" TagPrefix="sf"%>
<%@ Page Language="vb" MasterPageFile="~/Portal.Master" AutoEventWireup="false" Inherits="_Default" CodeFile="Default.aspx.vb" %>
<asp:Content ID="con"  ContentPlaceHolderID="portalBody" Runat="Server">
    <sf:Connection ID="Connection1" runat="server">
    </sf:Connection>
    <sf:StayinFrontDataSource ID="StayinFrontDataSource1" runat="server" 
        ClassName="Candidate" Connection="Connection1" Mode="TopLevelFolder" 
        Filter="Username= _candusername" Item="Candidate" 
        ValidationSummaryID="TheSummary">
        <Parameters>
            <asp:QueryStringParameter Name="candusername" QueryStringField="userN" />
        </Parameters>
        <Columns>
            <sf:MemberColumn Member="Name.FirstName" Name="Name_FirstName" />
            <sf:MemberColumn Member="Name.LastName" Name="Name_LastName" />
            <sf:KeyColumn Name="Key" />
        </Columns>
    </sf:StayinFrontDataSource>
        
        <sf:StayinFrontDataSourceValidationSummary ID="TheSummary" runat="server" />
    <asp:FormView ID="StayinFrontDataSource1_Form" runat="server" 
        DataKeyNames="Key" DataSourceID="StayinFrontDataSource1">
        <EditItemTemplate>
            <asp:Label ID="Name_FirstName_Ctl_Label" runat="server" 
                Text='<%# StayinFrontDataSource1.Columns("Name_FirstName").Title %>' />
            : &nbsp;
            <asp:TextBox ID="Name_FirstName_Ctl" runat="server" 
                Enabled='<%# StayinFrontDataSource1.Columns("Name_FirstName").CanUpdate %>' 
                Text='<%# Bind("Name_FirstName") %>' />
            <sf:MemberValidator ID="Name_FirstName_Ctl_Validator" runat="server" 
                ClassName="stdPersonName" Connection="Connection1" 
                ControlToValidate="Name_FirstName_Ctl" 
                Enabled='<%# StayinFrontDataSource1.Columns("Name_FirstName").CanUpdate %>' 
                Member="FirstName" />
            <br />
            <asp:Label ID="Name_LastName_Ctl_Label" runat="server" 
                Text='<%# StayinFrontDataSource1.Columns("Name_LastName").Title %>' />
            : &nbsp;
            <asp:TextBox ID="Name_LastName_Ctl" runat="server" 
                Enabled='<%# StayinFrontDataSource1.Columns("Name_LastName").CanUpdate %>' 
                Text='<%# Bind("Name_LastName") %>' />
            <sf:MemberValidator ID="Name_LastName_Ctl_Validator" runat="server" 
                ClassName="stdPersonName" Connection="Connection1" 
                ControlToValidate="Name_LastName_Ctl" 
                Enabled='<%# StayinFrontDataSource1.Columns("Name_LastName").CanUpdate %>' 
                Member="LastName" />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="update" 
                Enabled="<%# StayinFrontDataSource1.DefaultView.CanUpdate %>" Text="Update" />
            &nbsp;
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                CommandName="cancel" Enabled="true" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <asp:Label ID="Name_FirstName_Ctl_Label" runat="server" 
                Text='<%# StayinFrontDataSource1.Columns("Name_FirstName").Title %>' />
            : &nbsp;
            <asp:TextBox ID="Name_FirstName_Ctl" runat="server" 
                Enabled='<%# StayinFrontDataSource1.Columns("Name_FirstName").CanUpdate %>' 
                Text='<%# Bind("Name_FirstName") %>' />
            <sf:MemberValidator ID="Name_FirstName_Ctl_Validator" runat="server" 
                ClassName="stdPersonName" Connection="Connection1" 
                ControlToValidate="Name_FirstName_Ctl" 
                Enabled='<%# StayinFrontDataSource1.Columns("Name_FirstName").CanUpdate %>' 
                Member="FirstName" />
            <br />
            <asp:Label ID="Name_LastName_Ctl_Label" runat="server" 
                Text='<%# StayinFrontDataSource1.Columns("Name_LastName").Title %>' />
            : &nbsp;
            <asp:TextBox ID="Name_LastName_Ctl" runat="server" 
                Enabled='<%# StayinFrontDataSource1.Columns("Name_LastName").CanUpdate %>' 
                Text='<%# Bind("Name_LastName") %>' />
            <sf:MemberValidator ID="Name_LastName_Ctl_Validator" runat="server" 
                ClassName="stdPersonName" Connection="Connection1" 
                ControlToValidate="Name_LastName_Ctl" 
                Enabled='<%# StayinFrontDataSource1.Columns("Name_LastName").CanUpdate %>' 
                Member="LastName" />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="insert" 
                Enabled="<%# StayinFrontDataSource1.DefaultView.CanInsert %>" Text="Save" />
            &nbsp;
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                CommandName="cancel" Enabled="true" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Label ID="Name_FirstName_Ctl_Label" runat="server" 
                Text='<%# StayinFrontDataSource1.Columns("Name_FirstName").Title %>' />
            : &nbsp;
            <asp:Label ID="Name_FirstName_Ctl" runat="server" 
                Text='<%# Eval("Name_FirstName") %>' />
            <br />
            <asp:Label ID="Name_LastName_Ctl_Label" runat="server" 
                Text='<%# StayinFrontDataSource1.Columns("Name_LastName").Title %>' />
            : &nbsp;
            <asp:Label ID="Name_LastName_Ctl" runat="server" 
                Text='<%# Eval("Name_LastName") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="edit" 
                Enabled="<%# StayinFrontDataSource1.DefaultView.CanUpdate %>" Text="Edit" />
            &nbsp;
            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="delete" 
                Enabled="<%# StayinFrontDataSource1.DefaultView.CanDelete %>" Text="Delete" />
            &nbsp;
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="new" Enabled="<%# StayinFrontDataSource1.DefaultView.CanInsert %>" 
                Text="Add New" />
        </ItemTemplate>
        
    </asp:FormView>
        <asp:TextBox ID="FName" runat="server"></asp:TextBox>
        <asp:TextBox ID="Moj" runat="server"></asp:TextBox>
        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btnAll btnSaveCancel"  />
        <asp:HiddenField runat="server" ID="IsNewCandidate" />
        <asp:HiddenField runat="server" ID="IsDocPackSent" />
        <asp:HiddenField runat="server" ID="userN" />
        <asp:HiddenField runat="server" ID="userKey" />
        
       <!-- FirstName
        
        LastName
        <asp:Label ID="LName" runat="server"></asp:Label><br />
        Email
        <asp:Label ID="email" runat="server"></asp:Label><br />
        username
        <asp:Label ID="username" runat="server"></asp:Label><br />-->
</asp:Content>