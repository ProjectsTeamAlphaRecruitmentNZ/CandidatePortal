Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Web.Script.Services
Imports StayinFront.Engine
Imports System.Net
Imports System.Globalization
Imports System.Object
Imports System.Web.UI
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Net.Mail

Partial Public Class ProfileInfo6
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Dim objFolders As IAeFolders = CType(Master.Master, Portal).SIFSystem.Folders
        'If Not Page.IsPostBack Then

        'Set the logged in User

        Dim objUserName As String = Session("Username")
        Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")
        Dim Referees As IAeFolder = objCandidate.Folders("Referees")
        Dim intReferees As Integer = Referees.Count()
        Dim strHTML As String = ""
        Dim Companies As IAeFolder = objCandidate.Folders("CandidateApproachedCompanies")
        Dim intCompanies As Integer = Companies.Count()
        Dim stHTML As String = ""

        Dim Qualifications As IAeFolder = objCandidate.Folders("CandidateQualifications")
        Dim strHTMLq As String = ""

        Session("objCandidate") = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'").Key
        'Scan and fetch Skill Groups
        'If Not objCandidate Is Nothing Then

        '    Dim emp = GetValue(objCandidate, "EmploymentDetail.Organisation")
        '    If emp = "Alpha Recruitment" Or emp = "Alpha Wellington" Then
        '        CompanyLogo.ImageUrl = "../img/logo_alpha.png"
        '    ElseIf emp = "Triangle Recruitment" Then
        '        CompanyLogo.ImageUrl = "../img/logo_triangle.png"
        '    ElseIf emp = "Freightwise Personnel" Then
        '        CompanyLogo.ImageUrl = "../img/logo_freightwise.png"
        '    ElseIf emp = "Healthwise Personnel" Then
        '        CompanyLogo.ImageUrl = "../img/logo_healthwise.png"
        '    ElseIf emp = "Project Plus Limited" Then
        '        CompanyLogo.ImageUrl = "../img/logo_projectplus.png"
        '    Else
        '        emp = "Alpha Recruitment"
        '        CompanyLogo.ImageUrl = "../img/logo_alpha.png"
        '    End If

        '    CompanyName1.Text = emp
        '    CompanyName2.Text = emp
        '    CompanyName3.Text = emp
        '    'Dim Communications = objCandidate.Folders("Communications")
        '    'Dim count = 0
        '    'Dim numberOfCom = Communications.Count
        '    'For Each communication In Communications
        '    '    If count = Communications.Count - 1 Then
        '    '        test.Text = GetValue(communication, "Activity.User.eMailaddress.eMailaddress")
        '    '    End If
        '    '    count = count + 1
        '    'Next
        'End If

    End Sub


    Protected Sub next_btn_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim objUserName As String = Session("Username")
        Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")
        saved = False

        Dim objValidate As IAeValidate = Nothing
        Dim objTransaction As IAeTransaction = CType(Master.Master, Portal).SIFSystem.BeginTransaction
        If Not objCandidate Is Nothing Then

            '----Upload Photo
            If CVUpload.PostedFile Is Nothing OrElse String.IsNullOrEmpty(CVUpload.PostedFile.FileName) OrElse CVUpload.PostedFile.InputStream Is Nothing Then
            Else
                Dim extension1 As String = System.IO.Path.GetExtension(CVUpload.PostedFile.FileName).ToLower()
                Dim mimeType1 As String = CVUpload.PostedFile.ContentType
                Select Case extension1
                    Case ".pdf"
                        mimeType1 = "application/pdf"
                    Case ".doc"
                        mimeType1 = "application/msword"
                    Case ".docx"
                        mimeType1 = "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
                    Case Else
                        'Invalid file type upload
                        lblCVUpload.Text = "Not a valid file format. File extensions allowed: .doc, .docx, .pdf"
                        Exit Sub
                End Select
                Dim savePath As String = "C:\inetpub\wwwroot\savefiles\"
                If CVUpload.HasFile Then

                    savePath += CVUpload.FileName
                    CVUpload.SaveAs(savePath)
                    lblCVUpload.Text = "Your file was uploaded successfully."

                    Dim objMimeDocument As New Elk9Utils.MimeDocument
                    objMimeDocument.LoadFromFile(savePath, False)

                    Dim objDoc As IAeClassInst
                    objDoc = objCandidate.Folders("Documents").CreateNewInstance
                    SetValue(objDoc, "MimeType", CVUpload.PostedFile.ContentType)
                    SetValue(objDoc, "Name", CVUpload.PostedFile.FileName)
                    SetValue(objDoc, "FileSize", My.Computer.FileSystem.GetFileInfo(savePath).Length / 1024)
                    SetValue(objDoc, "DocumentDescription", CVUpload.PostedFile.FileName)
                    SetValue(objDoc, "CandidateCV", True)
                    SetValue(objDoc, "Compressed", True)
                    SetValue(objDoc, "Content", objMimeDocument.GetContent(True))
                    SetValue(objDoc, "VisibleOnWeb", True)
                    SetValue(objDoc, "Type", "Online")
                    objDoc.Save()
                    objCandidate.Save()
                Else
                    lblCVUpload.Text = "You did not specify a file to upload."
                End If

                Dim file1 As FileInfo = New FileInfo(savePath)
                If file1.Exists Then
                    file1.Delete()
                End If
            End If

            Dim decl As Boolean = True
            If Agree.Checked = False Then
                decl = False
            End If
            SetValue(objCandidate, "SignedCandidateDeclaration", 1)

            Dim res As Boolean = 1
            If creditcheck.SelectedValue = "No" Then
                res = 0
            End If
            SetValue(objCandidate, "SignedCreditCheck", res)
            objCandidate.Save(objTransaction)
            objValidate = objTransaction.Validate
            If objValidate.Status <> 3 Then
                objTransaction.Commit()
                saved = True
                SetValue(objCandidate, "IsNewUser", False)
                objCandidate.Save()
                Dim Communications = objCandidate.Folders("Communications")
                Dim count = 0
                Dim toEmail As String
                Dim recieverName As String
                Dim numberOfCom = Communications.Count
                For Each communication In Communications
                    If count = Communications.Count - 1 Then
                        toEmail = GetValue(communication, "Activity.User.eMailaddress.eMailaddress")
                        recieverName = GetValue(communication, "Activity.User.Name.FirstName") & " " & GetValue(communication, "Activity.User.Name.LastName")
                    End If
                    count = count + 1
                Next
                If Not String.IsNullOrEmpty(toEmail) Then
                    Using mm As New MailMessage("timesheets@alphajobs.co.nz", toEmail)
                        mm.Subject = "Registration completed -" & GetValue(objCandidate, "Name.FirstName") & " " & GetValue(objCandidate, "Name.LastName")
                        Dim bcc As MailAddress = New MailAddress("support@alphajobs.co.nz")
                        mm.Bcc.Add(bcc)
                        mm.IsBodyHtml = True
                        mm.Body = "<html><body style='font-family:Tahoma; font-size:14px; color:#333;'> Hi " & recieverName & ","
                        mm.Body &= "<br/><br/>" & objCandidate.Prompt & " has completed the registration.</body></html>"
                        'mm.Body &= "<br/>This candidate has not worked standard hours on one or more of the days in this week.  Please check, and if necessary edit the <b>Total Days</b> manually. </body></html>"

                        Dim smtp As New SmtpClient()
                        smtp.Host = "10.10.1.29"
                        'smtp.EnableSsl = True
                        'Dim NetworkCred As New NetworkCredential("sender@gamail.com", "password")
                        'smtp.UseDefaultCredentials = True
                        'smtp.Credentials = NetworkCred
                        smtp.Port = 25
                        smtp.Send(mm)
                    End Using

                End If
                Response.Redirect("~/NewUser/New User - thank-you.html")

            Else
                objTransaction = Nothing
                saved = False
            End If
            objTransaction = Nothing
            objValidate = Nothing

        End If
    End Sub


End Class