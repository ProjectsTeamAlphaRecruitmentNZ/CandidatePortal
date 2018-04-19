<%@ Page Language="vb" MasterPageFile="Profile.Master" AutoEventWireup="false"  EnableEventValidation="false" CodeFile="Profile - Expenses.aspx.vb" Inherits="Profile1" %>
<%@ MasterType VirtualPath="~/Profile/Profile.Master" %>
<%@ Reference VirtualPath="~/Portal.Master" %>
<%@ Register TagPrefix="EM" TagName="ExpensesModal" Src="~/Profile/Controls/ExpensesControl.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ProfileTitle" runat="server">
<title> Alpha Jobs Profile - General </title>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ProfileContent" runat="server">
    <form runat="server" method="post">
        <sf:Connection ID="SIFConnection" runat="server"></sf:Connection>
        
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <div id="main">
          <div class="info-1">
            <section class="center">
	            <div>
		            <img src="../img/expenses.png" height="26" style="position: relative;top: 0.3rem;"> <h3 class="form_title b-w2"> Expenses</h3> 
	            </div>
            </section>
            <hr>
            <section>
            <div>
                <i><i class="fa fa-info"></i> You can add expenses here if the end date of your job assignment is not older than 6 months.</i>
		    </div>
			<div class="center mt">
			    <button id="add-expenses-btn" class="button btn" type="button" data-toggle="modal" data-target="#addExpenses">Add Expenses</button>
		    </div>				

			<!--------------------------------------------------------------
				ADD EXPENSES
			---------------------------------------------------------------->
                <EM:ExpensesModal ID="Expenses" runat="server"></EM:ExpensesModal>

			<!--------------------------------------------------------------
				FINISH of Add EXPENSES
			---------------------------------------------------------------->					
			<div class="mt">
                <asp:Table ID="TableExp" runat="server" CssClass="table-availability table-expenses"> 
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell>Status</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Claimed Date</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Vendor</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Amount ($)</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Comment</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                </asp:Table>  
			            <asp:Label runat="server" ID="ExpensesModals">
			            
			            </asp:Label> 
			       <asp:HiddenField runat="server" ID="CandKey"></asp:HiddenField>
			   
		     </div>   
            </section>

          </div>
        </div>
    </form>
    <script type="text/javascript">   
        //FILE UPLOADER
        var handlerurl = "uploaderBackEnd.aspx.vb"

        var fileArray = [];
        var fileNos = 0;
        document.addEventListener("DOMContentLoaded", function () {
            var fileUploader = $("#attach1");
            fileUploader.change( function () {
                CuteWebUI_AjaxUploader_OnPostback();
            });
        }, false);
        function CreateAjaxRequest(val, typeOfReq) {
            var xh;
            if (window.XMLHttpRequest)
                xh = new window.XMLHttpRequest();
            else
                xh = new ActiveXObject("Microsoft.XMLHTTP");
            if (typeOfReq === "upload") {
                xh.open("POST", handlerurl + "?op=SaveFile", false, null, null);
                xh.setRequestHeader("Content-Type", "multipart/form-data");
            } else {
                xh.open("POST", handlerurl + val, false, null, null);
                xh.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=utf-8");
            }
            return xh;
        }
        function AppendToFileList(list) {
            var table = $("#fileList");
            table.innerHTML = table.innerHTML + list

        }

        function onSubmitForm() {
            $("#attach1").click();

        }
        function CuteWebUI_AjaxUploader_OnPostback() {
            var uploader = $("#attach1");
            var guidlist = uploader.val();
            var candidate = "<%= CandKey.Value  %>";
            var uploadVals = guidlist.split("\\")
            var uploadVal = uploadVals.slice(-1)[0]
            var file = $("#attach1").get(0);
            console.log(file)

            /* Create a FormData instance */
            var fd = new FormData();
            /* Add the file */
            
            
            for (var value of file.files) {
                fd.append(value.name, value);
            }

            var options = {};
            options.url = "/Profile - Expenses.aspx.vb/SaveFile";
            options.type = "POST";
            options.data = fd;
            options.contentType = false;
            options.processData = false;
            options.success = function (result) { console.log(result); };
            options.error = function (err) { alert(err.statusText);console.log(err) };

            $.ajax(options);
            //console.log(fd.get("file"))
            //PageMethods.SaveFile(candidate, fd, onSucess, onError);

            //function onSucess(result) {
            //    console.log("RESULT:")
            //    console.log(result);
                
            //}

            //function onError(error) {
            //    console.log(error);

            //    console.log("Error: " + error.get_message());
            //}
            //var list = xh.responseText;

            //AppendToFileList(list);

            return;
        }

        function RemoveFile(elem) {
            var file = elem.getAttribute("fileName");

            if (!confirm("Are you sure you want to delete '" + file + "'?"))
                return;

            var xh = CreateAjaxRequest("?delete=" + file, "delete");
            xh.send("delete=" + file);

            var table = $("#fileList");
            if (xh.status != 200) {
                alert("http error " + xh.status);
                console.log(xh)
                return;
            }
            do {
                $("#"+file).remove();
            }
            while ($("#" +file) != null);

            return;
        }

        $("#ProfileExpenses").addClass("active");
        function setKeyOfModal() {
            $(".keyWrap input[type='hidden']").each(function () {
                var modalDiv = $(this);
                var key = parseInt($(this).val());
                if (key > 0) {
                    console.log(modalDiv.parent().parent())
                    modalDiv.parent().parent().attr("id", "addExpenses" + key);
                }
            });
        }
        $(document).ready(function () {

            setKeyOfModal();
        });
    </script>
</asp:Content>
