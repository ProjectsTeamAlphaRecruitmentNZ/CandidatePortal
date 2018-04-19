<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="New.aspx.vb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <sf:Connection ID="theConnection" runat="server">
        </sf:Connection>
        <sf:StayinFrontDataSource ID="AllActivities" runat="server" 
            Connection="theConnection" Item="Activities" Mode="TopLevelFolder">
            <Columns>
                <sf:KeyColumn Name="Key" />
                <sf:IconColumn Mode="URLForSmall" Name="Icon" />
                <sf:MemberColumn Member="stdRecordStamp.WhenAdd" 
                    Name="stdRecordStamp_WhenAdd" />
                <sf:MemberColumn Member="Notes" Name="Notes" />
                <sf:ExpressionColumn Expression="Organisation.Name" Name="Org" />
                <sf:ExpressionColumn Expression="Contact.Contact.Prompt" Name="Contact" />
            </Columns>
        </sf:StayinFrontDataSource>
        
        <asp:GridView ID="ActivitiesGrid" runat="server" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Key" 
            DataSourceID="AllActivities" AllowPaging="True">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Key" HeaderText="Key" ReadOnly="True" 
                    SortExpression="Key" />
                <asp:ImageField DataImageUrlField="Icon" 
                    DataImageUrlFormatString="img/Icons/UserGroup.png">
                </asp:ImageField>
                <asp:BoundField DataField="stdRecordStamp_WhenAdd" 
                    HeaderText="stdRecordStamp_WhenAdd" SortExpression="stdRecordStamp_WhenAdd" />
                <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                <asp:BoundField DataField="Org" HeaderText="Org" ReadOnly="True" 
                    SortExpression="Org" />
                <asp:BoundField DataField="Contact" HeaderText="Contact" ReadOnly="True" 
                    SortExpression="Contact" />
            </Columns>
        </asp:GridView>
        
    </div>
    <sf:StayinFrontDataSource ID="TheActivity" runat="server" 
        ClassName="stdActivity" Item="Activities" Mode="Instance">
        <Parameters>
            <asp:ControlParameter ControlID="ActivitiesGrid" Name="key" 
                PropertyName="SelectedValue" />
        </Parameters>
        <Columns>
            
            <sf:KeyColumn Name="Key" />
            <sf:MemberColumn Member="stdTimeStamp.Start" Name="stdTimeStamp_Start" />
            <sf:MemberColumn Member="stdTimeStamp.Finish" Name="stdTimeStamp_Finish" />
            <sf:MemberColumn Member="Notes" Name="Notes" />
            <sf:MemberColumn Member="Organisation" Name="Organisation" />
        </Columns>
    </sf:StayinFrontDataSource>
      
    <asp:FormView ID="TheActivity_Form" runat="server" DataKeyNames="Key" 
        DataSourceID="TheActivity">
        <EditItemTemplate>
            <asp:Label ID="stdTimeStamp_Start_Ctl_Label" runat="server" 
                Text='<%# TheActivity.Columns("stdTimeStamp_Start").Title %>' />
            : &nbsp;
            <asp:TextBox ID="stdTimeStamp_Start_Ctl" runat="server" 
                Enabled='<%# TheActivity.Columns("stdTimeStamp_Start").CanUpdate %>' 
                Text='<%# Bind("stdTimeStamp_Start") %>' />
            <sf:MemberValidator ID="stdTimeStamp_Start_Ctl_Validator" runat="server" 
                ClassName="stdTimeStamp" Connection="theConnection" 
                ControlToValidate="stdTimeStamp_Start_Ctl" 
                Enabled='<%# TheActivity.Columns("stdTimeStamp_Start").CanUpdate %>' 
                Member="Start" />
            <br />
            <asp:Label ID="stdTimeStamp_Finish_Ctl_Label" runat="server" 
                Text='<%# TheActivity.Columns("stdTimeStamp_Finish").Title %>' />
            : &nbsp;
            <asp:TextBox ID="stdTimeStamp_Finish_Ctl" runat="server" 
                Enabled='<%# TheActivity.Columns("stdTimeStamp_Finish").CanUpdate %>' 
                Text='<%# Bind("stdTimeStamp_Finish") %>' />
            <sf:MemberValidator ID="stdTimeStamp_Finish_Ctl_Validator" runat="server" 
                ClassName="stdTimeStamp" Connection="theConnection" 
                ControlToValidate="stdTimeStamp_Finish_Ctl" 
                Enabled='<%# TheActivity.Columns("stdTimeStamp_Finish").CanUpdate %>' 
                Member="Finish" />
            <br />
            <asp:Label ID="Notes_Ctl_Label" runat="server" 
                Text='<%# TheActivity.Columns("Notes").Title %>' />
            : &nbsp;
            <asp:TextBox ID="Notes_Ctl" runat="server" 
                Enabled='<%# TheActivity.Columns("Notes").CanUpdate %>' 
                Text='<%# Bind("Notes") %>' />
            <sf:MemberValidator ID="Notes_Ctl_Validator" runat="server" 
                ClassName="stdActivity" Connection="theConnection" 
                ControlToValidate="Notes_Ctl" 
                Enabled='<%# TheActivity.Columns("Notes").CanUpdate %>' Member="Notes" />
            <br />
            
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="update" Enabled="<%# TheActivity.DefaultView.CanUpdate %>" 
                Text="Update" />
            &nbsp;
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                CommandName="cancel" Enabled="true" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
           
            <asp:Label ID="stdTimeStamp_Start_Ctl_Label" runat="server" 
                Text='<%# TheActivity.Columns("stdTimeStamp_Start").Title %>' />
            : &nbsp;
            <asp:TextBox ID="stdTimeStamp_Start_Ctl" runat="server" 
                Enabled='<%# TheActivity.Columns("stdTimeStamp_Start").CanUpdate %>' 
                Text='<%# Bind("stdTimeStamp_Start") %>' />
            <sf:MemberValidator ID="stdTimeStamp_Start_Ctl_Validator" runat="server" 
                ClassName="stdTimeStamp" Connection="theConnection" 
                ControlToValidate="stdTimeStamp_Start_Ctl" 
                Enabled='<%# TheActivity.Columns("stdTimeStamp_Start").CanUpdate %>' 
                Member="Start" />
            <br />
            <asp:Label ID="stdTimeStamp_Finish_Ctl_Label" runat="server" 
                Text='<%# TheActivity.Columns("stdTimeStamp_Finish").Title %>' />
            : &nbsp;
            <asp:TextBox ID="stdTimeStamp_Finish_Ctl" runat="server" 
                Enabled='<%# TheActivity.Columns("stdTimeStamp_Finish").CanUpdate %>' 
                Text='<%# Bind("stdTimeStamp_Finish") %>' />
            <sf:MemberValidator ID="stdTimeStamp_Finish_Ctl_Validator" runat="server" 
                ClassName="stdTimeStamp" Connection="theConnection" 
                ControlToValidate="stdTimeStamp_Finish_Ctl" 
                Enabled='<%# TheActivity.Columns("stdTimeStamp_Finish").CanUpdate %>' 
                Member="Finish" />
            <br />
            <asp:Label ID="Notes_Ctl_Label" runat="server" 
                Text='<%# TheActivity.Columns("Notes").Title %>' />
            : &nbsp;
            <asp:TextBox ID="Notes_Ctl" runat="server" 
                Enabled='<%# TheActivity.Columns("Notes").CanUpdate %>' 
                Text='<%# Bind("Notes") %>' />
            <sf:MemberValidator ID="Notes_Ctl_Validator" runat="server" 
                ClassName="stdActivity" Connection="theConnection" 
                ControlToValidate="Notes_Ctl" 
                Enabled='<%# TheActivity.Columns("Notes").CanUpdate %>' Member="Notes" />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="insert" Enabled="<%# TheActivity.DefaultView.CanInsert %>" 
                Text="Save" />
            &nbsp;
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                CommandName="cancel" Enabled="true" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Label ID="stdTimeStamp_Start_Ctl_Label" runat="server" 
                Text='<%# TheActivity.Columns("stdTimeStamp_Start").Title %>' />
            : &nbsp;
            <asp:Label ID="stdTimeStamp_Start_Ctl" runat="server" 
                Text='<%# Eval("stdTimeStamp_Start") %>' />
            <br />
            <asp:Label ID="stdTimeStamp_Finish_Ctl_Label" runat="server" 
                Text='<%# TheActivity.Columns("stdTimeStamp_Finish").Title %>' />
            : &nbsp;
            <asp:Label ID="stdTimeStamp_Finish_Ctl" runat="server" 
                Text='<%# Eval("stdTimeStamp_Finish") %>' />
            <br />
            <asp:Label ID="Notes_Ctl_Label" runat="server" 
                Text='<%# TheActivity.Columns("Notes").Title %>' />
            : &nbsp;
            <asp:Label ID="Notes_Ctl" runat="server" Text='<%# Eval("Notes") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="edit" Enabled="<%# TheActivity.DefaultView.CanUpdate %>" 
                Text="Edit" />
            &nbsp;
            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="delete" Enabled="<%# TheActivity.DefaultView.CanDelete %>" 
                Text="Delete" />
            &nbsp;
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="new" Enabled="<%# TheActivity.DefaultView.CanInsert %>" 
                Text="Add New" />
        </ItemTemplate>
    </asp:FormView>
      
    </form>
</body>
</html>
