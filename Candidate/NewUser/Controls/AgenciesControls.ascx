<%@ Control Language="vb" AutoEventWireup="false" CodeFile="AgenciesControls.ascx.vb" Inherits="AgenciesControls" %>
<sf:Connection ID="SIFConn" runat="server"></sf:Connection>
<div class="add-qualification-form m-b" style="overflow: hidden;padding-bottom: 2rem;">
    <asp:HiddenField runat="server" ID="Key" />
                <div class="cornerNum"><p runat="server" id="CornerNum"></p></div>
<h2 style="font-size: 1.7rem;" class="pad_l m-b center">Agency <span runat="server" id="TextNum"></span> Details</h2>
<div class="layout layout--middle pnn1 pad_l ">
    <div class="layout__item pad_1 w">
            <label class="a--pseudo " for="nameOfContact">Name of Contact</label>
            <asp:TextBox id="name_of_contact" class="required-entryc w-xxl" name="nameOfContact" maxlength="50" runat="server" ></asp:TextBox>
        
    </div>
    <div class="layout__item pad_1 w">
       
            <label class="a--pseudo " for="contacts-position">Position of Contact</label>
            <asp:TextBox id="contacts_position" class="required-entryc w-xxl" maxlength="50" runat="server" ></asp:TextBox>
      
    </div>
    <div class="layout__item pad_1 w">
            <label class="a--pseudo " for="company-name">Agency Name</label>
            <asp:TextBox id="company_name" class="required-entryc w-xxl"  maxlength="50" runat="server" ></asp:TextBox>
    </div>
    <div class="layout__item sm-1of2 ">
        <label class="a--pseudo  w" for="start_date">Date applied</label>
        <asp:TextBox id="start_date" class="w-xxl required-entryc datepicker" maxlength="50" runat="server"></asp:TextBox>
    </div>
    <div class="layout__item sm-1of2 ">
        <label class="a--pseudo   w" for="role_applied">Role Applied For</label>
        <asp:TextBox id="role_applied" class="w-xxl required-entryc" maxlength="50" runat="server"></asp:TextBox>
    </div>
</div>
         <br />
                <div class="layout layout--middle pnn1 pad_l">
                    <div class="layout__item sm-1of2 ">
                    <asp:Button ID="updateCompany" runat="server" class=" w-xxl button updateCompany" Text="Update"/> </div>
                    <div class="layout__item sm-1of2 fr">
                    <asp:Button ID="removeCompany" runat="server" class=" w-xxl button removeCompany" Text="Remove"/> </div>
                    
                </div>
            </div>