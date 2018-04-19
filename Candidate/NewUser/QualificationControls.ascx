<%@ Control Language="VB" AutoEventWireup="false" CodeFile="QualificationControls.ascx.vb" Inherits="QualificationControls" %>
<sf:Connection ID="SIFConn" runat="server"></sf:Connection>

<h2 style="font-size: 1.7rem;" class="pad_l m-b center">Qualification Details</h2>
<div class="layout layout--middle pnn1 pad_l">
    <div class="layout__item sm-1of2 ">

            <label class="a--pseudo " for="first_name-r' + id1 +'">Degree</label>
            <asp:TextBox id="DegreeField" class="required-entryq main-f inp--width" name="degree-r' + id1 +'" maxlength="50" runat="server" ></asp:TextBox>

    </div><div class="layout__item sm-1of2 fr">
        <label class="a--pseudo " for="first_name-r' + id1 +'">Field Of Study</label>
            <asp:TextBox id="FieldField" class="required-entryq main-f inp--width" name="field-r' + id1 +'" maxlength="50" runat="server" ></asp:TextBox>

        
            </div>

</div>
<div class="layout layout--middle pnn1 pad_l">
    <div class="layout__item sm-1of2 ">

             <label class="a--pseudo " for="last_name-r' + id1 +'">School Name</label>
            <asp:TextBox id="SchoolField" class="required-entryq main-f inp--width " name="school-r' + id1 +'" maxlength="50" runat="server" ></asp:TextBox>
        
    </div><div class="layout__item sm-1of2 fr">
        <div class="layout__item sm-1of2 ">

            <label class="a--pseudo " for="first_name-r' + id1 +'">From Year</label>
            <asp:DropdownList id="FromYearField" class="required-entryq main-f inp--width " name="fromYear-r' + id1 +'" maxlength="50" runat="server" ></asp:DropdownList>

    </div><div class="layout__item sm-1of2 fr">

            <label class="a--pseudo " for="last_name-r' + id1 +'">To Year</label>
            <asp:DropdownList id="ToYearField" class="required-entryq main-f inp--width " name="toYear-r' + id1 +'" maxlength="50" runat="server" ></asp:DropdownList>
        </div>
           </div>

</div>
<div class="layout layout--middle pnn1 pad_l">
    <div class="layout__item w">
    <label class="a--pseudo " for="last_name-r' + id1 +'">Description</label>
            <asp:TextBox id="DescriptionField" class="required-entryq main-f inp--width " name="description-r' + id1 +'" maxlength="50" runat="server" ></asp:TextBox>
        
    </div>
</div>
    