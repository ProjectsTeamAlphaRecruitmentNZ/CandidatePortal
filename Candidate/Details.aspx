<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Details.aspx.vb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <sf:Connection ID="theConn" runat="server">
        </sf:Connection>
    </div>
    <sf:StayinFrontDataSource ID="AllCand" runat="server" 
        Connection="theConn" Item="Candidate" 
        Mode="TopLevelFolder">
        <Columns>
            <sf:KeyColumn Name="Key" />
            <sf:MemberColumn Member="Name.FirstName" Name="Name_FirstName" />
            <sf:MemberColumn Member="Name.LastName" Name="Name_LastName" />
            <sf:MemberColumn Member="eMailAddress.eMailAddress" 
                Name="eMailAddress_eMailAddress" />
        </Columns>
    </sf:StayinFrontDataSource>
    <asp:GridView ID="CandGrid" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Key" DataSourceID="AllCand">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Key" HeaderText="Key" ReadOnly="True" 
                SortExpression="Key" />
            <asp:BoundField DataField="Name_FirstName" HeaderText="Name_FirstName" 
                SortExpression="Name_FirstName" />
            <asp:BoundField DataField="Name_LastName" HeaderText="Name_LastName" 
                SortExpression="Name_LastName" />
            <asp:BoundField DataField="eMailAddress_eMailAddress" 
                HeaderText="eMailAddress_eMailAddress" 
                SortExpression="eMailAddress_eMailAddress" />
        </Columns>
    </asp:GridView>
    <sf:StayinFrontDataSource ID="theCandidate" runat="server" 
        ClassName="Candidate" Mode="Instance" Item="Candidate" 
        ValidationSummaryID="TheSummary">
        <Parameters>
            <asp:ControlParameter ControlID="CandGrid" Name="key" 
                PropertyName="SelectedValue" />
        </Parameters>
        <Columns>
            <sf:MemberColumn Member="Name.FirstName" Name="Name_FirstName" />
            <sf:MemberColumn Member="Name.LastName" Name="Name_LastName" />
            <sf:MemberColumn Member="Address.Address" Name="Address_Address" />
            <sf:MemberColumn Member="Address.City" Name="Address_City" />
            <sf:MemberColumn Member="eMailAddress.eMailAddress" 
                Name="eMailAddress_eMailAddress" />
            <sf:MemberColumn Member="SkypeName" Name="SkypeName" />
            <sf:MemberColumn Member="EmploymentDetail.IRDNo" 
                Name="EmploymentDetail_IRDNo" />
            <sf:MemberColumn Member="EmploymentDetail.BankAccountNo" 
                Name="EmploymentDetail_BankAccountNo" />
            <sf:KeyColumn Name="Key" />
        </Columns>
    </sf:StayinFrontDataSource>
    <asp:FormView ID="theCandidate_Form" runat="server" DataKeyNames="Key" 
        DataSourceID="theCandidate">
        <EditItemTemplate>
            <asp:Label ID="Name_FirstName_Ctl_Label" runat="server" 
                Text='<%# theCandidate.Columns("Name_FirstName").Title %>' />
            : &nbsp;
            <asp:TextBox ID="Name_FirstName_Ctl" runat="server" 
                Enabled='<%# theCandidate.Columns("Name_FirstName").CanUpdate %>' 
                Text='<%# Bind("Name_FirstName") %>' />
            <sf:MemberValidator ID="Name_FirstName_Ctl_Validator" runat="server" 
                ClassName="stdPersonName" Connection="" ControlToValidate="Name_FirstName_Ctl" 
                Enabled='<%# theCandidate.Columns("Name_FirstName").CanUpdate %>' 
                Member="FirstName" />
            <br />
            <asp:Label ID="Name_LastName_Ctl_Label" runat="server" 
                Text='<%# theCandidate.Columns("Name_LastName").Title %>' />
            : &nbsp;
            <asp:TextBox ID="Name_LastName_Ctl" runat="server" 
                Enabled='<%# theCandidate.Columns("Name_LastName").CanUpdate %>' 
                Text='<%# Bind("Name_LastName") %>' />
            <sf:MemberValidator ID="Name_LastName_Ctl_Validator" runat="server" 
                ClassName="stdPersonName" Connection="" ControlToValidate="Name_LastName_Ctl" 
                Enabled='<%# theCandidate.Columns("Name_LastName").CanUpdate %>' 
                Member="LastName" />
            <br />
            <asp:Label ID="Address_Address_Ctl_Label" runat="server" 
                Text='<%# theCandidate.Columns("Address_Address").Title %>' />
            : &nbsp;
            <asp:TextBox ID="Address_Address_Ctl" runat="server" 
                Enabled='<%# theCandidate.Columns("Address_Address").CanUpdate %>' 
                Text='<%# Bind("Address_Address") %>' />
            <sf:MemberValidator ID="Address_Address_Ctl_Validator" runat="server" 
                ClassName="stdAddress" Connection="" ControlToValidate="Address_Address_Ctl" 
                Enabled='<%# theCandidate.Columns("Address_Address").CanUpdate %>' 
                Member="Address" />
            <br />
            <asp:Label ID="Address_City_Ctl_Label" runat="server" 
                Text='<%# theCandidate.Columns("Address_City").Title %>' />
            : &nbsp;
            <asp:TextBox ID="Address_City_Ctl" runat="server" 
                Enabled='<%# theCandidate.Columns("Address_City").CanUpdate %>' 
                Text='<%# Bind("Address_City") %>' />
            <sf:MemberValidator ID="Address_City_Ctl_Validator" runat="server" 
                ClassName="stdAddress" Connection="" ControlToValidate="Address_City_Ctl" 
                Enabled='<%# theCandidate.Columns("Address_City").CanUpdate %>' Member="City" />
            <br />
            <asp:Label ID="eMailAddress_eMailAddress_Ctl_Label" runat="server" 
                Text='<%# theCandidate.Columns("eMailAddress_eMailAddress").Title %>' />
            : &nbsp;
            <asp:TextBox ID="eMailAddress_eMailAddress_Ctl" runat="server" 
                Enabled='<%# theCandidate.Columns("eMailAddress_eMailAddress").CanUpdate %>' 
                Text='<%# Bind("eMailAddress_eMailAddress") %>' />
            <sf:MemberValidator ID="eMailAddress_eMailAddress_Ctl_Validator" runat="server" 
                ClassName="stdeMailAddress" Connection="" 
                ControlToValidate="eMailAddress_eMailAddress_Ctl" 
                Enabled='<%# theCandidate.Columns("eMailAddress_eMailAddress").CanUpdate %>' 
                Member="eMailAddress" />
            <br />
            <asp:Label ID="SkypeName_Ctl_Label" runat="server" 
                Text='<%# theCandidate.Columns("SkypeName").Title %>' />
            : &nbsp;
            <asp:TextBox ID="SkypeName_Ctl" runat="server" 
                Enabled='<%# theCandidate.Columns("SkypeName").CanUpdate %>' 
                Text='<%# Bind("SkypeName") %>' />
            <sf:MemberValidator ID="SkypeName_Ctl_Validator" runat="server" 
                ClassName="Candidate" Connection="" ControlToValidate="SkypeName_Ctl" 
                Enabled='<%# theCandidate.Columns("SkypeName").CanUpdate %>' 
                Member="SkypeName" />
            <br />
            <asp:Label ID="EmploymentDetail_IRDNo_Ctl_Label" runat="server" 
                Text='<%# theCandidate.Columns("EmploymentDetail_IRDNo").Title %>' />
            : &nbsp;
            <asp:TextBox ID="EmploymentDetail_IRDNo_Ctl" runat="server" 
                Enabled='<%# theCandidate.Columns("EmploymentDetail_IRDNo").CanUpdate %>' 
                Text='<%# Bind("EmploymentDetail_IRDNo") %>' />
            <sf:MemberValidator ID="EmploymentDetail_IRDNo_Ctl_Validator" runat="server" 
                ClassName="EmploymentDetail" Connection="" 
                ControlToValidate="EmploymentDetail_IRDNo_Ctl" 
                Enabled='<%# theCandidate.Columns("EmploymentDetail_IRDNo").CanUpdate %>' 
                Member="IRDNo" />
            <br />
            <asp:Label ID="EmploymentDetail_BankAccountNo_Ctl_Label" runat="server" 
                Text='<%# theCandidate.Columns("EmploymentDetail_BankAccountNo").Title %>' />
            : &nbsp;
            <asp:TextBox ID="EmploymentDetail_BankAccountNo_Ctl" runat="server" 
                Enabled='<%# theCandidate.Columns("EmploymentDetail_BankAccountNo").CanUpdate %>' 
                Text='<%# Bind("EmploymentDetail_BankAccountNo") %>' />
            <sf:MemberValidator ID="EmploymentDetail_BankAccountNo_Ctl_Validator" 
                runat="server" ClassName="EmploymentDetail" Connection="" 
                ControlToValidate="EmploymentDetail_BankAccountNo_Ctl" 
                Enabled='<%# theCandidate.Columns("EmploymentDetail_BankAccountNo").CanUpdate %>' 
                Member="BankAccountNo" />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="update" Enabled="<%# theCandidate.DefaultView.CanUpdate %>" 
                Text="Update" />
            &nbsp;
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                CommandName="cancel" Enabled="true" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <asp:Label ID="Name_FirstName_Ctl_Label" runat="server" 
                Text='<%# theCandidate.Columns("Name_FirstName").Title %>' />
            : &nbsp;
            <asp:TextBox ID="Name_FirstName_Ctl" runat="server" 
                Enabled='<%# theCandidate.Columns("Name_FirstName").CanUpdate %>' 
                Text='<%# Bind("Name_FirstName") %>' />
            <sf:MemberValidator ID="Name_FirstName_Ctl_Validator" runat="server" 
                ClassName="stdPersonName" Connection="" ControlToValidate="Name_FirstName_Ctl" 
                Enabled='<%# theCandidate.Columns("Name_FirstName").CanUpdate %>' 
                Member="FirstName" />
            <br />
            <asp:Label ID="Name_LastName_Ctl_Label" runat="server" 
                Text='<%# theCandidate.Columns("Name_LastName").Title %>' />
            : &nbsp;
            <asp:TextBox ID="Name_LastName_Ctl" runat="server" 
                Enabled='<%# theCandidate.Columns("Name_LastName").CanUpdate %>' 
                Text='<%# Bind("Name_LastName") %>' />
            <sf:MemberValidator ID="Name_LastName_Ctl_Validator" runat="server" 
                ClassName="stdPersonName" Connection="" ControlToValidate="Name_LastName_Ctl" 
                Enabled='<%# theCandidate.Columns("Name_LastName").CanUpdate %>' 
                Member="LastName" />
            <br />
            <asp:Label ID="Address_Address_Ctl_Label" runat="server" 
                Text='<%# theCandidate.Columns("Address_Address").Title %>' />
            : &nbsp;
            <asp:TextBox ID="Address_Address_Ctl" runat="server" 
                Enabled='<%# theCandidate.Columns("Address_Address").CanUpdate %>' 
                Text='<%# Bind("Address_Address") %>' />
            <sf:MemberValidator ID="Address_Address_Ctl_Validator" runat="server" 
                ClassName="stdAddress" Connection="" ControlToValidate="Address_Address_Ctl" 
                Enabled='<%# theCandidate.Columns("Address_Address").CanUpdate %>' 
                Member="Address" />
            <br />
            <asp:Label ID="Address_City_Ctl_Label" runat="server" 
                Text='<%# theCandidate.Columns("Address_City").Title %>' />
            : &nbsp;
            <asp:TextBox ID="Address_City_Ctl" runat="server" 
                Enabled='<%# theCandidate.Columns("Address_City").CanUpdate %>' 
                Text='<%# Bind("Address_City") %>' />
            <sf:MemberValidator ID="Address_City_Ctl_Validator" runat="server" 
                ClassName="stdAddress" Connection="" ControlToValidate="Address_City_Ctl" 
                Enabled='<%# theCandidate.Columns("Address_City").CanUpdate %>' Member="City" />
            <br />
            <asp:Label ID="eMailAddress_eMailAddress_Ctl_Label" runat="server" 
                Text='<%# theCandidate.Columns("eMailAddress_eMailAddress").Title %>' />
            : &nbsp;
            <asp:TextBox ID="eMailAddress_eMailAddress_Ctl" runat="server" 
                Enabled='<%# theCandidate.Columns("eMailAddress_eMailAddress").CanUpdate %>' 
                Text='<%# Bind("eMailAddress_eMailAddress") %>' />
            <sf:MemberValidator ID="eMailAddress_eMailAddress_Ctl_Validator" runat="server" 
                ClassName="stdeMailAddress" Connection="" 
                ControlToValidate="eMailAddress_eMailAddress_Ctl" 
                Enabled='<%# theCandidate.Columns("eMailAddress_eMailAddress").CanUpdate %>' 
                Member="eMailAddress" />
            <br />
            <asp:Label ID="SkypeName_Ctl_Label" runat="server" 
                Text='<%# theCandidate.Columns("SkypeName").Title %>' />
            : &nbsp;
            <asp:TextBox ID="SkypeName_Ctl" runat="server" 
                Enabled='<%# theCandidate.Columns("SkypeName").CanUpdate %>' 
                Text='<%# Bind("SkypeName") %>' />
            <sf:MemberValidator ID="SkypeName_Ctl_Validator" runat="server" 
                ClassName="Candidate" Connection="" ControlToValidate="SkypeName_Ctl" 
                Enabled='<%# theCandidate.Columns("SkypeName").CanUpdate %>' 
                Member="SkypeName" />
            <br />
            <asp:Label ID="EmploymentDetail_IRDNo_Ctl_Label" runat="server" 
                Text='<%# theCandidate.Columns("EmploymentDetail_IRDNo").Title %>' />
            : &nbsp;
            <asp:TextBox ID="EmploymentDetail_IRDNo_Ctl" runat="server" 
                Enabled='<%# theCandidate.Columns("EmploymentDetail_IRDNo").CanUpdate %>' 
                Text='<%# Bind("EmploymentDetail_IRDNo") %>' />
            <sf:MemberValidator ID="EmploymentDetail_IRDNo_Ctl_Validator" runat="server" 
                ClassName="EmploymentDetail" Connection="" 
                ControlToValidate="EmploymentDetail_IRDNo_Ctl" 
                Enabled='<%# theCandidate.Columns("EmploymentDetail_IRDNo").CanUpdate %>' 
                Member="IRDNo" />
            <br />
            <asp:Label ID="EmploymentDetail_BankAccountNo_Ctl_Label" runat="server" 
                Text='<%# theCandidate.Columns("EmploymentDetail_BankAccountNo").Title %>' />
            : &nbsp;
            <asp:TextBox ID="EmploymentDetail_BankAccountNo_Ctl" runat="server" 
                Enabled='<%# theCandidate.Columns("EmploymentDetail_BankAccountNo").CanUpdate %>' 
                Text='<%# Bind("EmploymentDetail_BankAccountNo") %>' />
            <sf:MemberValidator ID="EmploymentDetail_BankAccountNo_Ctl_Validator" 
                runat="server" ClassName="EmploymentDetail" Connection="" 
                ControlToValidate="EmploymentDetail_BankAccountNo_Ctl" 
                Enabled='<%# theCandidate.Columns("EmploymentDetail_BankAccountNo").CanUpdate %>' 
                Member="BankAccountNo" />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="insert" Enabled="<%# theCandidate.DefaultView.CanInsert %>" 
                Text="Save" />
            &nbsp;
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                CommandName="cancel" Enabled="true" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Label ID="Name_FirstName_Ctl_Label" runat="server" 
                Text='<%# theCandidate.Columns("Name_FirstName").Title %>' />
            : &nbsp;
            <asp:Label ID="Name_FirstName_Ctl" runat="server" 
                Text='<%# Eval("Name_FirstName") %>' />
            <br />
            <asp:Label ID="Name_LastName_Ctl_Label" runat="server" 
                Text='<%# theCandidate.Columns("Name_LastName").Title %>' />
            : &nbsp;
            <asp:Label ID="Name_LastName_Ctl" runat="server" 
                Text='<%# Eval("Name_LastName") %>' />
            <br />
            <asp:Label ID="Address_Address_Ctl_Label" runat="server" 
                Text='<%# theCandidate.Columns("Address_Address").Title %>' />
            : &nbsp;
            <asp:Label ID="Address_Address_Ctl" runat="server" 
                Text='<%# Eval("Address_Address") %>' />
            <br />
            <asp:Label ID="Address_City_Ctl_Label" runat="server" 
                Text='<%# theCandidate.Columns("Address_City").Title %>' />
            : &nbsp;
            <asp:Label ID="Address_City_Ctl" runat="server" 
                Text='<%# Eval("Address_City") %>' />
            <br />
            <asp:Label ID="eMailAddress_eMailAddress_Ctl_Label" runat="server" 
                Text='<%# theCandidate.Columns("eMailAddress_eMailAddress").Title %>' />
            : &nbsp;
            <asp:Label ID="eMailAddress_eMailAddress_Ctl" runat="server" 
                Text='<%# Eval("eMailAddress_eMailAddress") %>' />
            <br />
            <asp:Label ID="SkypeName_Ctl_Label" runat="server" 
                Text='<%# theCandidate.Columns("SkypeName").Title %>' />
            : &nbsp;
            <asp:Label ID="SkypeName_Ctl" runat="server" Text='<%# Eval("SkypeName") %>' />
            <br />
            <asp:Label ID="EmploymentDetail_IRDNo_Ctl_Label" runat="server" 
                Text='<%# theCandidate.Columns("EmploymentDetail_IRDNo").Title %>' />
            : &nbsp;
            <asp:Label ID="EmploymentDetail_IRDNo_Ctl" runat="server" 
                Text='<%# Eval("EmploymentDetail_IRDNo") %>' />
            <br />
            <asp:Label ID="EmploymentDetail_BankAccountNo_Ctl_Label" runat="server" 
                Text='<%# theCandidate.Columns("EmploymentDetail_BankAccountNo").Title %>' />
            : &nbsp;
            <asp:Label ID="EmploymentDetail_BankAccountNo_Ctl" runat="server" 
                Text='<%# Eval("EmploymentDetail_BankAccountNo") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="edit" Enabled="<%# theCandidate.DefaultView.CanUpdate %>" 
                Text="Edit" />
            &nbsp;
            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="delete" Enabled="<%# theCandidate.DefaultView.CanDelete %>" 
                Text="Delete" />
            &nbsp;
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="new" Enabled="<%# theCandidate.DefaultView.CanInsert %>" 
                Text="Add New" />
        </ItemTemplate>
    </asp:FormView>
    <sf:StayinFrontDataSource ID="AllProfile" runat="server" 
        Item="CandidateProfiles" Mode="Subfolder" ClassName="Candidate" 
        ValidationSummaryID="TheSummary">
        <Parameters>
            <asp:ControlParameter ControlID="CandGrid" Name="key" 
                PropertyName="SelectedValue" />
        </Parameters>
        <Columns>
            <sf:KeyColumn Name="Key" />
            <sf:MemberColumn Member="ProfileCategory.ProfileCat" 
                Name="ProfileCategory_ProfileCat" />
            <sf:MemberColumn Member="ProfileValue.ProfileVal" 
                Name="ProfileValue_ProfileVal" />
            <sf:MemberColumn Member="Description" Name="Description" />
        </Columns>
    </sf:StayinFrontDataSource>
    
    <asp:GridView ID="ProfileGrid" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Key" DataSourceID="AllProfile">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Key" HeaderText="Key" ReadOnly="True" 
                SortExpression="Key" />
            <asp:BoundField DataField="ProfileCategory_ProfileCat" 
                HeaderText="ProfileCategory_ProfileCat" 
                SortExpression="ProfileCategory_ProfileCat" />
            <asp:BoundField DataField="ProfileValue_ProfileVal" 
                HeaderText="ProfileValue_ProfileVal" SortExpression="ProfileValue_ProfileVal" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
        </Columns>
    </asp:GridView>
    <sf:StayinFrontDataSourceValidationSummary ID="TheSummary" runat="server" />
    <sf:StayinFrontDataSource ID="StayinFrontDataSource1" runat="server" 
        ClassName="CandidateProfile" Item="ProfileValue" Mode="TargetFolder" 
        ValidationSummaryID="TheSummary">
        <Parameters>
            <asp:ControlParameter ControlID="CandGrid" Name="key" 
                PropertyName="SelectedValue" />
        </Parameters>
        <Columns>
            <sf:MemberColumn Member="ProfileVal" Name="ProfileVal" />
            <sf:MemberColumn Member="ProfileCategory" Name="ProfileCategory" />
            <sf:KeyColumn Name="Key" />
            <sf:ExpressionColumn Expression="ProfileCategory.Prompt" 
                Name="ProfileCategory_Display" />
        </Columns>
    </sf:StayinFrontDataSource>
    <asp:FormView ID="StayinFrontDataSource1_Form" runat="server" 
        DataKeyNames="Key" DataSourceID="StayinFrontDataSource1">
        <EditItemTemplate>
            <asp:Label ID="ProfileVal_Ctl_Label" runat="server" 
                Text='<%# StayinFrontDataSource1.Columns("ProfileVal").Title %>' />
            : &nbsp;
            <asp:TextBox ID="ProfileVal_Ctl" runat="server" 
                Enabled='<%# StayinFrontDataSource1.Columns("ProfileVal").CanUpdate %>' 
                Text='<%# Bind("ProfileVal") %>' />
            <sf:MemberValidator ID="ProfileVal_Ctl_Validator" runat="server" 
                ClassName="Prof_ProfileValue" Connection="" ControlToValidate="ProfileVal_Ctl" 
                Enabled='<%# StayinFrontDataSource1.Columns("ProfileVal").CanUpdate %>' 
                Member="ProfileVal" />
            <br />
            <asp:Label ID="ProfileCategory_Ctl_Label" runat="server" 
                Text='<%# StayinFrontDataSource1.Columns("ProfileCategory").Title %>' />
            : &nbsp;
            <sf:StayinFrontDataSource ID="ProfileCategory_Ctl_Source" runat="server" 
                Connection="" Item="ProfileCategory" Mode="TargetFolder" 
                PartnerDataSourceID="StayinFrontDataSource1">
                <Columns>
                    <sf:KeyColumn Name="Key" />
                    <sf:PromptColumn Name="Prompt" />
                </Columns>
            </sf:StayinFrontDataSource>
            <asp:DropDownList ID="ProfileCategory_Ctl" runat="server" 
                DataSourceID="ProfileCategory_Ctl_Source" DataTextField="Prompt" 
                DataValueField="Key" 
                Enabled='<%# StayinFrontDataSource1.Columns("ProfileCategory").CanUpdate %>' 
                SelectedValue='<%# Bind("ProfileCategory") %>' />
            <sf:MemberValidator ID="ProfileCategory_Ctl_Validator" runat="server" 
                ClassName="Prof_ProfileValue" Connection="" 
                ControlToValidate="ProfileCategory_Ctl" 
                Enabled='<%# StayinFrontDataSource1.Columns("ProfileCategory").CanUpdate %>' 
                Member="ProfileCategory" />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="update" 
                Enabled="<%# StayinFrontDataSource1.DefaultView.CanUpdate %>" Text="Update" />
            &nbsp;
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                CommandName="cancel" Enabled="true" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <asp:Label ID="ProfileVal_Ctl_Label" runat="server" 
                Text='<%# StayinFrontDataSource1.Columns("ProfileVal").Title %>' />
            : &nbsp;
            <asp:TextBox ID="ProfileVal_Ctl" runat="server" 
                Enabled='<%# StayinFrontDataSource1.Columns("ProfileVal").CanUpdate %>' 
                Text='<%# Bind("ProfileVal") %>' />
            <sf:MemberValidator ID="ProfileVal_Ctl_Validator" runat="server" 
                ClassName="Prof_ProfileValue" Connection="" ControlToValidate="ProfileVal_Ctl" 
                Enabled='<%# StayinFrontDataSource1.Columns("ProfileVal").CanUpdate %>' 
                Member="ProfileVal" />
            <br />
            <asp:Label ID="ProfileCategory_Ctl_Label" runat="server" 
                Text='<%# StayinFrontDataSource1.Columns("ProfileCategory").Title %>' />
            : &nbsp;
            <sf:StayinFrontDataSource ID="ProfileCategory_Ctl_Source" runat="server" 
                Connection="" Item="ProfileCategory" Mode="TargetFolder" 
                PartnerDataSourceID="StayinFrontDataSource1">
                <Columns>
                    <sf:KeyColumn Name="Key" />
                    <sf:PromptColumn Name="Prompt" />
                </Columns>
            </sf:StayinFrontDataSource>
            <asp:DropDownList ID="ProfileCategory_Ctl" runat="server" 
                DataSourceID="ProfileCategory_Ctl_Source" DataTextField="Prompt" 
                DataValueField="Key" 
                Enabled='<%# StayinFrontDataSource1.Columns("ProfileCategory").CanUpdate %>' 
                SelectedValue='<%# Bind("ProfileCategory") %>' />
            <sf:MemberValidator ID="ProfileCategory_Ctl_Validator" runat="server" 
                ClassName="Prof_ProfileValue" Connection="" 
                ControlToValidate="ProfileCategory_Ctl" 
                Enabled='<%# StayinFrontDataSource1.Columns("ProfileCategory").CanUpdate %>' 
                Member="ProfileCategory" />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="insert" 
                Enabled="<%# StayinFrontDataSource1.DefaultView.CanInsert %>" Text="Save" />
            &nbsp;
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                CommandName="cancel" Enabled="true" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Label ID="ProfileVal_Ctl_Label" runat="server" 
                Text='<%# StayinFrontDataSource1.Columns("ProfileVal").Title %>' />
            : &nbsp;
            <asp:Label ID="ProfileVal_Ctl" runat="server" 
                Text='<%# Eval("ProfileVal") %>' />
            <br />
            <asp:Label ID="ProfileCategory_Ctl_Label" runat="server" 
                Text='<%# StayinFrontDataSource1.Columns("ProfileCategory").Title %>' />
            : &nbsp;
            <asp:Label ID="ProfileCategory_Ctl" runat="server" 
                Text='<%# Eval("ProfileCategory_Display") %>' />
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
    <br />
    </form>
</body>
</html>
