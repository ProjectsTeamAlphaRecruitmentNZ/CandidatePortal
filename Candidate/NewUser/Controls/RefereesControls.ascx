<%@ Control Language="vb" AutoEventWireup="false" CodeFile="RefereesControls.ascx.vb" Inherits="RefereesControls" %>
<sf:Connection ID="SIFConn" runat="server"></sf:Connection>

<div class="add-referees-form m-b" style="overflow: hidden;padding-bottom: 2rem;">
    <asp:HiddenField runat="server" ID="Key" />
                <div  class='cornerNum'><p runat="server" id="CornerNum"></p></div>
<h2 style="font-size: 1.7rem;" class="pad_l m-b center">Referee <span runat="server" id="TextNum"></span> Details</h2>

<div class="layout layout--middle pnn1 pad_l">
    <div class="layout__item sm-1of2 ">

            <label class="a--pseudo req" for="first_name-r' + id1 +'">First Name</label>
            <asp:TextBox id="first_names" class="required-entryr main-f inp--width" name="first_name-r' + id1 +'" maxlength="20" runat="server" required></asp:TextBox>

    </div><div class="layout__item sm-1of2 fr">

            <label class="a--pseudo req" for="last_name-r' + id1 +'">Last Name</label>
            <asp:TextBox id="last_names" class="required-entryr main-f inp--width" name="last_name-r' + id1 +'" maxlength="20" runat="server" required></asp:TextBox>
        </div>

</div>
<div class="layout layout--middle pnn1 pad_l">
    <div class="layout__item sm-1of2">
            <label class="a--pseudo" for="phone_l_a-r' + id1 +'">Landline Phone</label>
            <div class="w">
                <asp:TextBox id="lands" class=" inp--width" name="alt_phone_l" placeholder="000 0000000 or 0000000000" pattern ="[0-9\s -]{6,16}" runat="server"></asp:TextBox>
					    
			</div>
    </div>
    <div class="layout__item sm-1of2 fr">
            <label class="a--pseudo req" for="phone_l_a2-r' + id1 +'">Mobile Phone</label>
            <div class="w">
                <asp:TextBox id="mobiles" class="required-entry inp--width" name="alt_phone_l" placeholder="000 0000000 or 0000000000" pattern ="[0-9\s -]{6,16}" runat="server"  required ></asp:TextBox>
				</div>
    </div>
</div>
<div class="layout layout--middle pnn1 pad_l">
  
    <div class="layout__item sm-1of2">
        <label class="a--pseudo w" for="email">Referee Email</label>
        <asp:TextBox id="emails" class="required-entryr main-f  inp--width"  name="email_r" maxlength="50" runat="server" ></asp:TextBox>
    </div>
     <div class="layout__item sm-1of2 fr">
        <label class="a--pseudo req w" for="referee_position">Referee Position</label>
        <asp:TextBox id="referee_positions" class=" required-entryr inp--width" name="referee-position" maxlength="50" runat="server" required></asp:TextBox>
    </div>
</div>
<div class="layout layout--middle pnn1 pad_l">
    <div class="layout__item sm-1of2">
        <label class="a--pseudo req w" for="referee_company">Referee Company</label>
        <asp:TextBox id="referee_companys" class="required-entryr  inp--width"  name="referee-company" maxlength="50" runat="server" required></asp:TextBox>
    </div>
    <div class="layout__item sm-1of2 fr">
        <label class="a--pseudo w" for="reporting_relationship">Reporting Relationship</label>
        <asp:TextBox id="reporting_relationships" class=" inp--width" maxlength="50" runat="server"></asp:TextBox>
    </div>
</div>
<div class="layout layout--middle pnn1 pad_l">
    <div class='layout__item ' id='timeToC1'>
        <label class="a--pseudo w" for="times_to_contact">Times to Contact</label>
        <asp:TextBox id="times_to_contacts" class=" inp--width" maxlength="50" runat="server"></asp:TextBox>
    </div>
</div>
    <br />
                <div class="layout layout--middle pnn1 pad_l">
                    <div class='layout__item sm-1of2'>
                    <asp:Button ID="updateReferee"  runat="server" class="updateReferee w-xxl button" Text="Update"/></div>
                    <div class='layout__item sm-1of2'>
                    <button  class="removeReferee w-xxl button" type="button" >Remove</button></div>
                </div>
            </div>
