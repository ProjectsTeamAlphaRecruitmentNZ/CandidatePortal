Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Web.Script.Services
Imports StayinFront.Engine
Imports System.Net
Imports System.Globalization
Imports System.Object
Imports System.Web.UI
Imports System.IO

Partial Public Class Profile1
    Inherits System.Web.UI.Page

    Protected Sub ProfileInfo1_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit

    End Sub

    Protected Sub ProfileInfo1_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        'If Session("Username") Is Nothing Then
        'Response.Redirect("http://localhost/candidateportal_1.0/portal1.3/portal_1.3/login.aspx?domain=portal_1.3&OriginalURL=%2Fportal_1.3%2F&Retry=0&Timeout=0&Lockout=0")
        'End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'SHowI.Text = CType(Master.Master, Portal).SIFSystem.ToString
        Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")
        Dim expenses = objCandidate.Folders("CandidateExpenses")
        Dim body As HtmlGenericControl = CType(Master.Master.FindControl("mainBody"), HtmlGenericControl)
        body.Attributes.Add("class", "profile")
        body.Attributes.Add("ng-app", "formController")

        '---------------------Expenses--------------
        Dim i = 1
        For Each expense In expenses
            Dim expRow As New TableRow()
            Dim Stage = GetValue(expense, "Stage")
            Dim ClaimedDate = GetValue(expense, "ClaimedDate")
            Dim Vendor = GetValue(expense, "SupplierName")
            Dim Amount = GetValue(expense, "ExpenseAmount")
            Dim Comment = GetValue(expense, "Description")


            Dim cell1 As New TableCell()
            Dim cell2 As New TableCell()
            Dim cell3 As New TableCell()
            Dim cell4 As New TableCell()
            Dim cell5 As New TableCell()

            cell1.Text = Stage
            cell2.Text = ClaimedDate

            cell3.Text = Vendor
            cell4.Text = Amount
            cell5.Text = Comment

            expRow.Cells.Add(cell1)
            expRow.Cells.Add(cell2)
            expRow.Cells.Add(cell3)
            expRow.Cells.Add(cell4)
            expRow.Cells.Add(cell5)

            expRow.Attributes("type") = "button"
            expRow.Attributes("data-toggle") = "modal"
            expRow.Attributes("data-target") = "#addExpenses" & i
            TableExp.Rows.Add(expRow)


            '---------------------- Add Expenses control ---------------
            Dim expenseControl As ExpensesControl
            Dim JobKey, JobResult As String
            expenseControl = LoadControl("~/Profile/Controls/ExpensesControl.ascx")
            If expenseControl IsNot Nothing Then
                expenseControl.keyVal = i
                expenseControl.ExpKey = expense.Key
                expenseControl.ExpDate = GetValue(expense, "ClaimedDate")
                ''assignment
                expenseControl.Amount = GetValue(expense, "ExpenseAmount")
                expenseControl.Vendor = GetValue(expense, "SupplierName")
                JobKey = GetJoinMemberKey(expense, "JobAssignment")
                JobResult = JobKey.Remove(JobKey.Length - 1).ToLower
                expenseControl.Assignment = JobResult.Remove(0, 1)


                expenseControl.Comment = GetValue(expense, "Description")
                ExpensesModals.Controls.Add(expenseControl)
            End If
            i = i + 1

        Next
        CandKey.Value = Session("Username")
    End Sub

    <WebMethod()> Public Shared Function SaveFile() As String
        Dim objSystem As New AeSystem
        objSystem.EnableDebugging()
        objSystem.Connect("", "Omega", "system", "")
        HttpContext.Current.Session("SIFSystem") = objSystem
        Dim objCandidate As IAeClassInst = GetInstance(objSystem, "Candidate", False, "Username='" + HttpContext.Current.Session("Username") + "'")

        For Each file In HttpContext.Current.Request.Files


            'Dim File As HttpPostedFile = files(i)
            Return "wwwwww"

        Next
        Return HttpContext.Current.Request.Files.ToString
        'Dim fname As String = context.Server.MapPath("C:\inetpub\wwwroot\savefiles\" + File.FileName)
        'File.SaveAs(fname)
        ' Next
        'Dim extension1 As String = System.IO.Path.GetExtension(file.PostedFile.FileName).ToLower()
        'Dim mimeType1 As String = Nothing
        'Select Case extension1
        '    Case ".jpeg"
        '        mimeType1 = "image/jpeg"
        '    Case ".jpg"
        '        mimeType1 = "image/jpg"
        '    Case ".bmp"
        '        mimeType1 = "image/bmp"
        '    Case ".png"
        '        mimeType1 = "image/png"
        '    Case ".tiff"
        '        mimeType1 = "image/tiff"
        '    Case Else
        '        'Invalid file type upload
        '        Return ("<script>alert(Not a valid file format. File extensions allowed: .jpg, .jpeg, .png, .bmp, .tiff</script>")
        'End Select
        'Dim savePath As String = "C:\inetpub\wwwroot\savefiles\"
        ''If file.HasFile Then

        'savePath += file.FileName
        'file.SaveAs(savePath)
        ''lblPhotoUpload.Text = "Your file was uploaded successfully."

        'Dim objMimeDocument As New Elk9Utils.MimeDocument
        'objMimeDocument.LoadFromFile(savePath, False)

        'Dim objDoc As IAeClassInst
        'objDoc = objCandidate.Folders("Documents").CreateNewInstance
        'SetValue(objDoc, "MimeType", file.PostedFile.ContentType)
        'SetValue(objDoc, "Name", file.PostedFile.FileName)
        'SetValue(objDoc, "FileSize", My.Computer.FileSystem.GetFileInfo(savePath).Length / 1024)
        'SetValue(objDoc, "DocumentDescription", file.PostedFile.FileName)
        'SetValue(objDoc, "CandidatePhoto", True)
        'SetValue(objDoc, "Compressed", True)
        'SetValue(objDoc, "Content", objMimeDocument.GetContent(True))
        'SetValue(objDoc, "VisibleOnWeb", True)
        'objDoc.Save()
        'objCandidate.Save()
        ''Else
        ''lblPhotoUpload.Text = "You did not specify a file to upload."
        ''End If

        'Dim file1 As FileInfo = New FileInfo(savePath)
        'If file1.Exists Then
        '    file1.Delete()
        'End If
        Return "Not WORKS"

    End Function
End Class