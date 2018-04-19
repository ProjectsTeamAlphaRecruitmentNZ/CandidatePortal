<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SearchJob.aspx.vb"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <sf:Connection ID="SIF" runat="server">
        </sf:Connection>
    
        <sf:StayinFrontDataSource ID="StayinFrontDataSource1" runat="server" 
            Connection="SIF" Filter="Not IsNull(_SearchValue) And
(
(_Search = 'J' And _SearchValue $ JobTitle) Or
(_Search = 'I' And JobID @ _SearchValue) Or
(_Search = 'P' And JobPONum @ _SearchValue) Or
(_Search = 'R' And JobRate1 &gt; CCur(Iif(IsNumeric(_SearchValue), _SearchValue, 0)))
)" Item="Jobs" 
            Mode="TopLevelFolder">
            <Parameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="Search" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="SearchValue" Name="SearchValue" 
                    PropertyName="Text" />
            </Parameters>
            <Columns>
                <sf:MemberColumn Member="JobID" Name="JobID" />
                <sf:MemberColumn Member="JobTitle" Name="JobTitle" />
                <sf:IconColumn Mode="URLForSmall" Name="Icon" />
                <sf:ExpressionColumn Expression="class.Name" Name="JobPrompt" />
            </Columns>
        </sf:StayinFrontDataSource>
    
    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem Value="J">JobTitle contains</asp:ListItem>
        <asp:ListItem Value="I">JobID starts with</asp:ListItem>
        <asp:ListItem Value="P">PO# starts with</asp:ListItem>
        <asp:ListItem Value="R">Rate greater than</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="SearchValue" runat="server"></asp:TextBox>
        <br />
        <br />
    
    </div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" EmptyDataText="No results match your search"
        AllowSorting="True" AutoGenerateColumns="False" 
        DataSourceID="StayinFrontDataSource1">
        <Columns>
            <asp:BoundField DataField="JobID" HeaderText="JobID" SortExpression="JobID" />
            <asp:BoundField DataField="JobTitle" HeaderText="JobTitle" 
                SortExpression="JobTitle" />
            <asp:BoundField DataField="JobPrompt" HeaderText="JobPrompt" ReadOnly="True" 
                SortExpression="JobPrompt" />
            <asp:ImageField DataImageUrlField="Icon" 
                DataImageUrlFormatString="img/Icons/UserGroup.png">
            </asp:ImageField>
        </Columns>
    </asp:GridView>
    <br />
    </form>
</body>
</html>
